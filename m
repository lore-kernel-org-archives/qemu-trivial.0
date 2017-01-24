Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cVy7u-0002pP-IY
	for mharc-qemu-trivial@gnu.org; Tue, 24 Jan 2017 05:14:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50756)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cVy7q-0002kZ-6G
	for qemu-trivial@nongnu.org; Tue, 24 Jan 2017 05:14:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cVy7p-0002cA-CS
	for qemu-trivial@nongnu.org; Tue, 24 Jan 2017 05:14:54 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:42926)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1cVy7l-0002Zo-At; Tue, 24 Jan 2017 05:14:49 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id A176A4210D;
	Tue, 24 Jan 2017 13:14:48 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 7F87C56E;
	Tue, 24 Jan 2017 12:39:43 +0300 (MSK)
Received: (nullmailer pid 12667 invoked by uid 1000);
	Tue, 24 Jan 2017 09:39:41 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Ziyue Yang <yzylivezh@hotmail.com>, qemu-trivial@nongnu.org,
	Ziyue Yang <skiver.cloud.yzy@gmail.com>, Michael Tokarev <mjt@tls.msk.ru>
Date: Tue, 24 Jan 2017 12:39:33 +0300
Message-Id: <9a5bfc35921a1060c5596e7cd0dfda6a30093d49.1485250702.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1485250702.git.mjt@msgid.tls.msk.ru>
References: <cover.1485250702.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1485250702.git.mjt@msgid.tls.msk.ru>
References: <cover.1485250702.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 29/31] gdbstub.c: update old error report
 statements
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 24 Jan 2017 10:14:55 -0000

From: Ziyue Yang <yzylivezh@hotmail.com>

Some updates from fprintf(stderr, ...) to error_report.

Signed-off-by: Ziyue Yang <skiver.cloud.yzy@gmail.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 gdbstub.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/gdbstub.c b/gdbstub.c
index 27e0923..2d18ed7 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -638,8 +638,8 @@ void gdb_register_coprocessor(CPUState *cpu,
     *p = s;
     if (g_pos) {
         if (g_pos != s->base_reg) {
-            fprintf(stderr, "Error: Bad gdb register numbering for '%s'\n"
-                    "Expected %d got %d\n", xml, g_pos, s->base_reg);
+            error_report("Error: Bad gdb register numbering for '%s', "
+                         "expected %d got %d", xml, g_pos, s->base_reg);
         } else {
             cpu->gdb_num_g_regs = cpu->gdb_num_regs;
         }
@@ -891,7 +891,7 @@ static int gdb_handle_packet(GDBState *s, const char *line_buf)
         }
     case 'k':
         /* Kill the target */
-        fprintf(stderr, "\nQEMU: Terminated via GDBstub\n");
+        error_report("QEMU: Terminated via GDBstub");
         exit(0);
     case 'D':
         /* Detach packet */
@@ -1359,8 +1359,8 @@ void gdb_do_syscallv(gdb_syscall_complete_cb cb, const char *fmt, va_list va)
                 break;
             default:
             bad_format:
-                fprintf(stderr, "gdbstub: Bad syscall format string '%s'\n",
-                        fmt - 1);
+                error_report("gdbstub: Bad syscall format string '%s'",
+                             fmt - 1);
                 break;
             }
         } else {
-- 
2.1.4


