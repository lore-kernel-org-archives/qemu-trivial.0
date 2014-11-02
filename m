Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XktoN-0005yv-Pr
	for mharc-qemu-trivial@gnu.org; Sun, 02 Nov 2014 06:59:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51478)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XktoI-0005oE-4b
	for qemu-trivial@nongnu.org; Sun, 02 Nov 2014 06:59:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XktoD-0002Tt-0D
	for qemu-trivial@nongnu.org; Sun, 02 Nov 2014 06:59:06 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:42879)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Xkto0-0002RH-Sk; Sun, 02 Nov 2014 06:58:49 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 11DF2402BB;
	Sun,  2 Nov 2014 14:58:48 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id C25B0706;
	Sun,  2 Nov 2014 14:58:47 +0300 (MSK)
Received: (nullmailer pid 14984 invoked by uid 1000);
	Sun, 02 Nov 2014 11:58:47 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Sun,  2 Nov 2014 14:57:29 +0300
Message-Id: <fee78fd6d2f8dfdfd447a33c34323dd5bd3193a2.1414929285.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1414929284.git.mjt@msgid.tls.msk.ru>
References: <cover.1414929284.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1414929284.git.mjt@msgid.tls.msk.ru>
References: <cover.1414929284.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 17/23] pidfile: stop making pidfile error a
	special case
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
X-List-Received-Date: Sun, 02 Nov 2014 11:59:11 -0000

In case of -daemonize, we write non-zero to the daemon
pipe only if pidfile creation failed, so the parent will
report error about pidfile problem.  There's no need to
make special case for this, since all other errors are
reported by the child just fine.  Let the parent report
error and simplify logic in os_daemonize().

This way, we don't need os_pidfile_error() function, since
it only prints error now, so put the error reporting printf
into the only place where qemu_create_pidfile() is called,
in vl.c.

While at it, fix wrong indentation in os_daemonize().

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 include/qemu-common.h |    1 -
 os-posix.c            |   31 ++++++++-----------------------
 os-win32.c            |    5 -----
 vl.c                  |    2 +-
 4 files changed, 9 insertions(+), 30 deletions(-)

diff --git a/include/qemu-common.h b/include/qemu-common.h
index b87e9c2..f862214 100644
--- a/include/qemu-common.h
+++ b/include/qemu-common.h
@@ -357,7 +357,6 @@ char *qemu_find_file(int type, const char *name);
 void os_setup_early_signal_handling(void);
 char *os_find_datadir(void);
 void os_parse_cmd_args(int index, const char *optarg);
-void os_pidfile_error(void);
 
 /* Convert a byte between binary and BCD.  */
 static inline uint8_t to_bcd(uint8_t val)
diff --git a/os-posix.c b/os-posix.c
index eada8d4..52e9897 100644
--- a/os-posix.c
+++ b/os-posix.c
@@ -221,18 +221,14 @@ void os_daemonize(void)
             do {
                 len = read(fds[0], &status, 1);
             } while (len < 0 && errno == EINTR);
-            if (len != 1) {
-                exit(1);
-            }
-            else if (status == 1) {
-                fprintf(stderr, "Could not acquire pidfile\n");
-                exit(1);
-            } else {
-                exit(0);
-            }
-            } else if (pid < 0) {
-                exit(1);
-            }
+
+            /* only exit successfully if our child actually wrote
+             * a one-byte zero to our pipe, upon successful init */
+            exit(len == 1 && status == 0 ? 0 : 1);
+
+        } else if (pid < 0) {
+            exit(1);
+        }
 
         close(fds[0]);
         daemon_pipe = fds[1];
@@ -290,17 +286,6 @@ void os_setup_post(void)
     }
 }
 
-void os_pidfile_error(void)
-{
-    if (daemonize) {
-        uint8_t status = 1;
-        if (write(daemon_pipe, &status, 1) != 1) {
-            perror("daemonize. Writing to pipe\n");
-        }
-    } else
-        fprintf(stderr, "Could not acquire pid file: %s\n", strerror(errno));
-}
-
 void os_set_line_buffering(void)
 {
     setvbuf(stdout, NULL, _IOLBF, 0);
diff --git a/os-win32.c b/os-win32.c
index 5f95caa..c0daf8e 100644
--- a/os-win32.c
+++ b/os-win32.c
@@ -104,11 +104,6 @@ void os_parse_cmd_args(int index, const char *optarg)
     return;
 }
 
-void os_pidfile_error(void)
-{
-    fprintf(stderr, "Could not acquire pid file: %s\n", strerror(errno));
-}
-
 int qemu_create_pidfile(const char *filename)
 {
     char buffer[128];
diff --git a/vl.c b/vl.c
index f6b3546..150524c 100644
--- a/vl.c
+++ b/vl.c
@@ -3999,7 +3999,7 @@ int main(int argc, char **argv, char **envp)
 #endif
 
     if (pid_file && qemu_create_pidfile(pid_file) != 0) {
-        os_pidfile_error();
+        fprintf(stderr, "Could not acquire pid file: %s\n", strerror(errno));
         exit(1);
     }
 
-- 
1.7.10.4


