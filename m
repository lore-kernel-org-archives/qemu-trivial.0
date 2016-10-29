Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c0OgG-0000i0-4y
	for mharc-qemu-trivial@gnu.org; Sat, 29 Oct 2016 04:07:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54715)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1c0OgE-0000gh-In
	for qemu-trivial@nongnu.org; Sat, 29 Oct 2016 04:07:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1c0OgD-0004IK-NQ
	for qemu-trivial@nongnu.org; Sat, 29 Oct 2016 04:07:54 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:38413)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1c0Og9-0004HV-E8; Sat, 29 Oct 2016 04:07:49 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 94A9E437B5;
	Sat, 29 Oct 2016 11:07:44 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 16C5F9B2;
	Sat, 29 Oct 2016 11:07:44 +0300 (MSK)
Received: (nullmailer pid 16816 invoked by uid 1000);
	Sat, 29 Oct 2016 08:07:44 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Date: Sat, 29 Oct 2016 11:07:42 +0300
Message-Id: <1477728462-16774-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PATCH] vl.c: move pidfile creation up
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
X-List-Received-Date: Sat, 29 Oct 2016 08:07:55 -0000

With current code, pid file is open after various
sockets, chardevs, fsdevs and the like.  This causes
interesting effects, for example when monitor is a
unix-socket, and another qemu instance is already
running, new qemu first "damages" the socket and
next complain that it can't acquire the pid file and
exits, making running qemu unreachable.

Move pid file creation a bit earlier.

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 vl.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/vl.c b/vl.c
index 55763f7..7989f75 100644
--- a/vl.c
+++ b/vl.c
@@ -4305,6 +4305,11 @@ int main(int argc, char **argv, char **envp)
         exit(1);
     }
 
+    if (pid_file && qemu_create_pidfile(pid_file) != 0) {
+        error_report("could not acquire pid file: %s", strerror(errno));
+        exit(1);
+    }
+
     page_size_init();
     socket_init();
 
@@ -4326,11 +4331,6 @@ int main(int argc, char **argv, char **envp)
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


