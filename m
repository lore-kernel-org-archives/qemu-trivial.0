Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c1wNo-0001F2-B4
	for mharc-qemu-trivial@gnu.org; Wed, 02 Nov 2016 10:19:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50068)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1c1wNg-00019h-9m
	for qemu-trivial@nongnu.org; Wed, 02 Nov 2016 10:19:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1c1wNf-0007xW-GG
	for qemu-trivial@nongnu.org; Wed, 02 Nov 2016 10:19:08 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:40757)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1c1wNb-0007rv-4U; Wed, 02 Nov 2016 10:19:03 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id C4D9A4036B;
	Wed,  2 Nov 2016 17:18:54 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id BFD94B2C;
	Wed,  2 Nov 2016 17:18:53 +0300 (MSK)
Received: (nullmailer pid 18122 invoked by uid 1000);
	Wed, 02 Nov 2016 14:18:53 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Markus Armbruster <armbru@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Wed,  2 Nov 2016 17:18:50 +0300
Message-Id: <1478096330-18081-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PATCH v2] vl.c: move pidfile creation up the line
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
X-List-Received-Date: Wed, 02 Nov 2016 14:19:14 -0000

With current code, pid file is open after various
sockets, chardevs, fsdevs and the like.  This causes
interesting effects, for example when monitor is a
unix-socket, and another qemu instance is already
running, new qemu first "damages" the socket and
next complain that it can't acquire the pid file and
exits, making running qemu unreachable.

Move pid file creation earlier, right after the call
to os_daemonize(), where we know our process id (pid).

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 vl.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

v2: move the pid file creation even earlier, as per
comment by Markus Armbruster

diff --git a/vl.c b/vl.c
index 368510f..ce7e998 100644
--- a/vl.c
+++ b/vl.c
@@ -4058,6 +4058,11 @@ int main(int argc, char **argv, char **envp)
 
     os_daemonize();
 
+    if (pid_file && qemu_create_pidfile(pid_file) != 0) {
+        error_report("could not acquire pid file: %s", strerror(errno));
+        exit(1);
+    }
+
     if (qemu_init_main_loop(&main_loop_err)) {
         error_report_err(main_loop_err);
         exit(1);
@@ -4335,11 +4340,6 @@ int main(int argc, char **argv, char **envp)
     }
 #endif
 
-    if (pid_file && qemu_create_pidfile(pid_file) != 0) {
-        error_report("could not acquire pid file: %s", strerror(errno));
-        exit(1);
-    }
-
     if (qemu_opts_foreach(qemu_find_opts("device"),
                           device_help_func, NULL, NULL)) {
         exit(0);
-- 
2.1.4


