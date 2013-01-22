Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Txaxn-0005Ka-IW
	for mharc-qemu-trivial@gnu.org; Tue, 22 Jan 2013 05:20:19 -0500
Received: from eggs.gnu.org ([208.118.235.92]:36860)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1TxamP-0008Mc-7q
	for qemu-trivial@nongnu.org; Tue, 22 Jan 2013 05:08:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1TxamE-0000F4-RF
	for qemu-trivial@nongnu.org; Tue, 22 Jan 2013 05:08:33 -0500
Received: from oxygen.pond.sub.org ([2a01:4f8:121:10e4::3]:48335)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>)
	id 1Txam7-0000BY-2p; Tue, 22 Jan 2013 05:08:15 -0500
Received: from blackfin.pond.sub.org (p5B329A82.dip.t-dialin.net
	[91.50.154.130])
	by oxygen.pond.sub.org (Postfix) with ESMTPA id 8CB7CA2C87;
	Tue, 22 Jan 2013 11:08:10 +0100 (CET)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 8E12B200B3; Tue, 22 Jan 2013 11:08:07 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 22 Jan 2013 11:08:03 +0100
Message-Id: <1358849286-24750-9-git-send-email-armbru@redhat.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <1358849286-24750-1-git-send-email-armbru@redhat.com>
References: <1358849286-24750-1-git-send-email-armbru@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a01:4f8:121:10e4::3
Cc: qemu-trivial@nongnu.org, eblake@redhat.com
Subject: [Qemu-trivial] [PATCH v3 08/11] qemu-log: Plug trivial memory leak
	in cpu_set_log_filename()
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
X-List-Received-Date: Tue, 22 Jan 2013 10:20:18 -0000


Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 qemu-log.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/qemu-log.c b/qemu-log.c
index 64a1b88..30c9ab0 100644
--- a/qemu-log.c
+++ b/qemu-log.c
@@ -21,10 +21,12 @@
 #include "qemu/log.h"
 
 #ifdef WIN32
-static const char *logfilename = "qemu.log";
+#define DEFAULT_LOGFILENAME "qemu.log"
 #else
-static const char *logfilename = "/tmp/qemu.log";
+#define DEFAULT_LOGFILENAME "/tmp/qemu.log"
 #endif
+
+static char *logfilename;
 FILE *qemu_logfile;
 int qemu_loglevel;
 static int log_append = 0;
@@ -54,11 +56,13 @@ void qemu_log_mask(int mask, const char *fmt, ...)
 /* enable or disable low levels log */
 void qemu_set_log(int log_flags, bool use_own_buffers)
 {
+    const char *fname = logfilename ?: DEFAULT_LOGFILENAME;
+
     qemu_loglevel = log_flags;
     if (qemu_loglevel && !qemu_logfile) {
-        qemu_logfile = fopen(logfilename, log_append ? "a" : "w");
+        qemu_logfile = fopen(fname, log_append ? "a" : "w");
         if (!qemu_logfile) {
-            perror(logfilename);
+            perror(fname);
             _exit(1);
         }
         /* must avoid mmap() usage of glibc by setting a buffer "by hand" */
@@ -84,6 +88,7 @@ void qemu_set_log(int log_flags, bool use_own_buffers)
 
 void cpu_set_log_filename(const char *filename)
 {
+    g_free(logfilename);
     logfilename = g_strdup(filename);
     if (qemu_logfile) {
         fclose(qemu_logfile);
-- 
1.7.11.7


