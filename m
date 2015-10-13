Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZmqZZ-0005Jr-67
	for mharc-qemu-trivial@gnu.org; Thu, 15 Oct 2015 18:00:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32988)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1ZluAs-0008CJ-15
	for qemu-trivial@nongnu.org; Tue, 13 Oct 2015 03:39:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1ZluAr-0006Hh-2P
	for qemu-trivial@nongnu.org; Tue, 13 Oct 2015 03:39:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48342)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>)
	id 1ZluAl-0006GB-0a; Tue, 13 Oct 2015 03:38:59 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id A27318EA3A;
	Tue, 13 Oct 2015 07:38:58 +0000 (UTC)
Received: from noname.str.redhat.com (dhcp-192-197.str.redhat.com
	[10.33.192.197])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t9D7cvYT027601; Tue, 13 Oct 2015 03:38:57 -0400
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 13 Oct 2015 09:38:50 +0200
Message-Id: <1444721930-5121-1-git-send-email-kwolf@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: kwolf@redhat.com, qemu-trivial@nongnu.org, qemu-stable@nongnu.org
Subject: [Qemu-trivial] [PATCH] gdbstub: Fix buffer overflows in
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
X-List-Received-Date: Tue, 13 Oct 2015 07:39:07 -0000

Some places in gdb_handle_packet() can get an arbitrary length (most
times directly from the client) and either didn't check it at all or
checked against the wrong value, potentially causing buffer overflows.

Cc: qemu-stable@nongnu.org
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
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
1.8.3.1


