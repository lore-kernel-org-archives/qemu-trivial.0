Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TvUdD-0001NH-CX
	for mharc-qemu-trivial@gnu.org; Wed, 16 Jan 2013 10:10:23 -0500
Received: from eggs.gnu.org ([208.118.235.92]:49468)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1TvUd9-0001AZ-Dw
	for qemu-trivial@nongnu.org; Wed, 16 Jan 2013 10:10:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1TvU6q-0002Bs-Iy
	for qemu-trivial@nongnu.org; Wed, 16 Jan 2013 09:37:04 -0500
Received: from oxygen.pond.sub.org ([2a01:4f8:121:10e4::3]:41690)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>)
	id 1TvU6b-00025E-Sf; Wed, 16 Jan 2013 09:36:42 -0500
Received: from blackfin.pond.sub.org (p5B32B5E9.dip.t-dialin.net
	[91.50.181.233])
	by oxygen.pond.sub.org (Postfix) with ESMTPA id B113BA247C;
	Wed, 16 Jan 2013 15:36:39 +0100 (CET)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id D9934200B0; Wed, 16 Jan 2013 15:36:38 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 16 Jan 2013 15:36:35 +0100
Message-Id: <1358346998-26328-9-git-send-email-armbru@redhat.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <1358346998-26328-1-git-send-email-armbru@redhat.com>
References: <1358346998-26328-1-git-send-email-armbru@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a01:4f8:121:10e4::3
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH 08/11] qemu-log: Plug trivial memory leak in
	cpu_set_log_filename()
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
X-List-Received-Date: Wed, 16 Jan 2013 15:10:21 -0000


Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 qemu-log.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/qemu-log.c b/qemu-log.c
index 64a1b88..1eadf1b 100644
--- a/qemu-log.c
+++ b/qemu-log.c
@@ -21,10 +21,12 @@
 #include "qemu/log.h"
 
 #ifdef WIN32
-static const char *logfilename = "qemu.log";
+#define DEFAULT_LOGFILENAME = "qemu.log"
 #else
-static const char *logfilename = "/tmp/qemu.log";
+#define DEFAULT_LOGFILENAME "/tmp/qemu.log"
 #endif
+
+static const char *logfilename;
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
+    g_free((void *)logfilename);
     logfilename = g_strdup(filename);
     if (qemu_logfile) {
         fclose(qemu_logfile);
-- 
1.7.11.7


