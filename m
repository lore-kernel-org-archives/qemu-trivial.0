Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YL8sc-0007sD-7h
	for mharc-qemu-trivial@gnu.org; Tue, 10 Feb 2015 06:21:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38221)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YL8sZ-0007mt-Iz
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 06:21:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YL8sU-0007Pw-Dw
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 06:21:19 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:55314)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YL8sL-0007MC-03; Tue, 10 Feb 2015 06:21:05 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id ABA4A418E2;
	Tue, 10 Feb 2015 14:21:03 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id E0C12949;
	Tue, 10 Feb 2015 09:34:45 +0300 (MSK)
Received: (nullmailer pid 9365 invoked by uid 1000);
	Tue, 10 Feb 2015 06:34:43 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue, 10 Feb 2015 09:34:05 +0300
Message-Id: <b658c53d2b87c1e9e0ade887a70ecb0de1474a7b.1423549659.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1423549659.git.mjt@msgid.tls.msk.ru>
References: <cover.1423549659.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 16/46] qemu-sockets: improve error reporting
	in unix_listen_opts
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
X-List-Received-Date: Tue, 10 Feb 2015 11:21:20 -0000

From: Paolo Bonzini <pbonzini@redhat.com>

Coverity complains about not checking the returned value of mkstemp.  While
at it, also improve error checking for snprintf, and refine error messages
in general.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 util/qemu-sockets.c | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
index a76bb3c..cf4b91f 100644
--- a/util/qemu-sockets.c
+++ b/util/qemu-sockets.c
@@ -694,7 +694,7 @@ int unix_listen_opts(QemuOpts *opts, Error **errp)
 
     sock = qemu_socket(PF_UNIX, SOCK_STREAM, 0);
     if (sock < 0) {
-        error_setg_errno(errp, errno, "Failed to create socket");
+        error_setg_errno(errp, errno, "Failed to create Unix socket");
         return -1;
     }
 
@@ -703,9 +703,15 @@ int unix_listen_opts(QemuOpts *opts, Error **errp)
     if (path && strlen(path)) {
         snprintf(un.sun_path, sizeof(un.sun_path), "%s", path);
     } else {
-        char *tmpdir = getenv("TMPDIR");
-        snprintf(un.sun_path, sizeof(un.sun_path), "%s/qemu-socket-XXXXXX",
-                 tmpdir ? tmpdir : "/tmp");
+        const char *tmpdir = getenv("TMPDIR");
+        tmpdir = tmpdir ? tmpdir : "/tmp";
+        if (snprintf(un.sun_path, sizeof(un.sun_path), "%s/qemu-socket-XXXXXX",
+                     tmpdir) >= sizeof(un.sun_path)) {
+            error_setg_errno(errp, errno,
+                             "TMPDIR environment variable (%s) too large", tmpdir);
+            goto err;
+        }
+
         /*
          * This dummy fd usage silences the mktemp() unsecure warning.
          * Using mkstemp() doesn't make things more secure here
@@ -713,13 +719,19 @@ int unix_listen_opts(QemuOpts *opts, Error **errp)
          * to unlink first and thus re-open the race window.  The
          * worst case possible is bind() failing, i.e. a DoS attack.
          */
-        fd = mkstemp(un.sun_path); close(fd);
+        fd = mkstemp(un.sun_path);
+        if (fd < 0) {
+            error_setg_errno(errp, errno,
+                             "Failed to make a temporary socket name in %s", tmpdir);
+            goto err;
+        }
+        close(fd);
         qemu_opt_set(opts, "path", un.sun_path);
     }
 
     unlink(un.sun_path);
     if (bind(sock, (struct sockaddr*) &un, sizeof(un)) < 0) {
-        error_setg_errno(errp, errno, "Failed to bind socket");
+        error_setg_errno(errp, errno, "Failed to bind socket to %s", un.sun_path);
         goto err;
     }
     if (listen(sock, 1) < 0) {
-- 
2.1.4


