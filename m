Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZugSo-0005Yc-5z
	for mharc-qemu-trivial@gnu.org; Fri, 06 Nov 2015 07:49:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59483)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZugSj-0005Pk-J8
	for qemu-trivial@nongnu.org; Fri, 06 Nov 2015 07:49:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZugSi-0001YB-6r
	for qemu-trivial@nongnu.org; Fri, 06 Nov 2015 07:49:49 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:51596)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZugSa-0001S4-IO; Fri, 06 Nov 2015 07:49:40 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 2D94140DD3;
	Fri,  6 Nov 2015 15:49:39 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id AF31AABD;
	Fri,  6 Nov 2015 15:44:04 +0300 (MSK)
Received: (nullmailer pid 31676 invoked by uid 1000);
	Fri, 06 Nov 2015 12:44:03 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Fri,  6 Nov 2015 15:43:39 +0300
Message-Id: <5accecb3a6b49d8ca79684179610583e9c7c1bf5.1446813769.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1446813768.git.mjt@msgid.tls.msk.ru>
References: <cover.1446813768.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-stable@nongnu.org
Subject: [Qemu-trivial] [PULL 02/24] gdbstub: Fix buffer overflows in
	gdb_handle_packet()
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 06 Nov 2015 12:49:51 -0000

From: Kevin Wolf <kwolf@redhat.com>

Some places in gdb_handle_packet() can get an arbitrary length (most
times directly from the client) and either didn't check it at all or
checked against the wrong value, potentially causing buffer overflows.

Cc: qemu-stable@nongnu.org
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 gdbstub.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/gdbstub.c b/gdbstub.c
index d2c95b5..9c29aa0 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -956,6 +956,13 @@ static int gdb_handle_packet(GDBState *s, const char *line_buf)
         if (*p == ',')
             p++;
         len = strtoull(p, NULL, 16);
+
+        /* memtohex() doubles the required space */
+        if (len > MAX_PACKET_LENGTH / 2) {
+            put_packet (s, "E22");
+            break;
+        }
+
         if (target_memory_rw_debug(s->g_cpu, addr, mem_buf, len, false) != 0) {
             put_packet (s, "E14");
         } else {
@@ -970,6 +977,12 @@ static int gdb_handle_packet(GDBState *s, const char *line_buf)
         len = strtoull(p, (char **)&p, 16);
         if (*p == ':')
             p++;
+
+        /* hextomem() reads 2*len bytes */
+        if (len > strlen(p) / 2) {
+            put_packet (s, "E22");
+            break;
+        }
         hextomem(mem_buf, p, len);
         if (target_memory_rw_debug(s->g_cpu, addr, mem_buf, len,
                                    true) != 0) {
@@ -1107,7 +1120,8 @@ static int gdb_handle_packet(GDBState *s, const char *line_buf)
             cpu = find_cpu(thread);
             if (cpu != NULL) {
                 cpu_synchronize_state(cpu);
-                len = snprintf((char *)mem_buf, sizeof(mem_buf),
+                /* memtohex() doubles the required space */
+                len = snprintf((char *)mem_buf, sizeof(buf) / 2,
                                "CPU#%d [%s]", cpu->cpu_index,
                                cpu->halted ? "halted " : "running");
                 memtohex(buf, mem_buf, len);
@@ -1136,8 +1150,8 @@ static int gdb_handle_packet(GDBState *s, const char *line_buf)
                 put_packet(s, "E01");
                 break;
             }
-            hextomem(mem_buf, p + 5, len);
             len = len / 2;
+            hextomem(mem_buf, p + 5, len);
             mem_buf[len++] = 0;
             qemu_chr_be_write(s->mon_chr, mem_buf, len);
             put_packet(s, "OK");
-- 
2.1.4


