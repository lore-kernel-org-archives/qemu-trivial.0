Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bkteT-00049E-4U
	for mharc-qemu-trivial@gnu.org; Fri, 16 Sep 2016 09:58:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58863)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1bkteM-00042p-Ny
	for qemu-trivial@nongnu.org; Fri, 16 Sep 2016 09:57:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1bkteH-0007Zv-1M
	for qemu-trivial@nongnu.org; Fri, 16 Sep 2016 09:57:53 -0400
Received: from mx1.redhat.com ([209.132.183.28]:12033)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>)
	id 1bktdu-0007ER-S3; Fri, 16 Sep 2016 09:57:35 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EFF6E7F77B;
	Fri, 16 Sep 2016 13:56:56 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-112-33.ams2.redhat.com [10.36.112.33])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u8GDuHkK024127; Fri, 16 Sep 2016 09:56:55 -0400
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>
Date: Fri, 16 Sep 2016 15:56:09 +0200
Message-Id: <1474034177-17663-19-git-send-email-lvivier@redhat.com>
In-Reply-To: <1474034177-17663-1-git-send-email-lvivier@redhat.com>
References: <1474034177-17663-1-git-send-email-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Fri, 16 Sep 2016 13:56:57 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 18/26] posix: use exit(EXIT_SUCCESS) and
 exit(EXIT_FAILURE)
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
X-List-Received-Date: Fri, 16 Sep 2016 13:57:59 -0000

This patch is the result of coccinelle script
scripts/coccinelle/exit.cocci

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 os-posix.c         | 34 +++++++++++++++++-----------------
 util/oslib-posix.c |  2 +-
 2 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/os-posix.c b/os-posix.c
index c6ddb7d..c4137ba 100644
--- a/os-posix.c
+++ b/os-posix.c
@@ -121,11 +121,11 @@ void os_set_proc_name(const char *s)
        This simple way is enough for `top'. */
     if (prctl(PR_SET_NAME, name)) {
         perror("unable to change process name");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 #else
     fprintf(stderr, "Change of process name not supported by your OS\n");
-    exit(1);
+    exit(EXIT_FAILURE);
 #endif
 }
 
@@ -141,14 +141,14 @@ void os_parse_cmd_args(int index, const char *optarg)
         error_report("The -smb option is deprecated. "
                      "Please use '-netdev user,smb=...' instead.");
         if (net_slirp_smb(optarg) < 0)
-            exit(1);
+            exit(EXIT_FAILURE);
         break;
 #endif
     case QEMU_OPTION_runas:
         user_pwd = getpwnam(optarg);
         if (!user_pwd) {
             fprintf(stderr, "User \"%s\" doesn't exist\n", optarg);
-            exit(1);
+            exit(EXIT_FAILURE);
         }
         break;
     case QEMU_OPTION_chroot:
@@ -170,20 +170,20 @@ static void change_process_uid(void)
     if (user_pwd) {
         if (setgid(user_pwd->pw_gid) < 0) {
             fprintf(stderr, "Failed to setgid(%d)\n", user_pwd->pw_gid);
-            exit(1);
+            exit(EXIT_FAILURE);
         }
         if (initgroups(user_pwd->pw_name, user_pwd->pw_gid) < 0) {
             fprintf(stderr, "Failed to initgroups(\"%s\", %d)\n",
                     user_pwd->pw_name, user_pwd->pw_gid);
-            exit(1);
+            exit(EXIT_FAILURE);
         }
         if (setuid(user_pwd->pw_uid) < 0) {
             fprintf(stderr, "Failed to setuid(%d)\n", user_pwd->pw_uid);
-            exit(1);
+            exit(EXIT_FAILURE);
         }
         if (setuid(0) != -1) {
             fprintf(stderr, "Dropping privileges failed\n");
-            exit(1);
+            exit(EXIT_FAILURE);
         }
     }
 }
@@ -193,11 +193,11 @@ static void change_root(void)
     if (chroot_dir) {
         if (chroot(chroot_dir) < 0) {
             fprintf(stderr, "chroot failed\n");
-            exit(1);
+            exit(EXIT_FAILURE);
         }
         if (chdir("/")) {
             perror("not able to chdir to /");
-            exit(1);
+            exit(EXIT_FAILURE);
         }
     }
 
@@ -210,7 +210,7 @@ void os_daemonize(void)
         int fds[2];
 
         if (pipe(fds) == -1) {
-            exit(1);
+            exit(EXIT_FAILURE);
         }
 
         pid = fork();
@@ -229,7 +229,7 @@ void os_daemonize(void)
             exit(len == 1 && status == 0 ? 0 : 1);
 
         } else if (pid < 0) {
-            exit(1);
+            exit(EXIT_FAILURE);
         }
 
         close(fds[0]);
@@ -240,9 +240,9 @@ void os_daemonize(void)
 
         pid = fork();
         if (pid > 0) {
-            exit(0);
+            exit(EXIT_SUCCESS);
         } else if (pid < 0) {
-            exit(1);
+            exit(EXIT_FAILURE);
         }
         umask(027);
 
@@ -260,11 +260,11 @@ void os_setup_post(void)
     if (daemonize) {
         if (chdir("/")) {
             perror("not able to chdir to /");
-            exit(1);
+            exit(EXIT_FAILURE);
         }
         TFR(fd = qemu_open("/dev/null", O_RDWR));
         if (fd == -1) {
-            exit(1);
+            exit(EXIT_FAILURE);
         }
     }
 
@@ -288,7 +288,7 @@ void os_setup_post(void)
             len = write(daemon_pipe, &status, 1);
         } while (len < 0 && errno == EINTR);
         if (len != 1) {
-            exit(1);
+            exit(EXIT_FAILURE);
         }
     }
 }
diff --git a/util/oslib-posix.c b/util/oslib-posix.c
index f2d4e9e..026fd1c 100644
--- a/util/oslib-posix.c
+++ b/util/oslib-posix.c
@@ -358,7 +358,7 @@ void os_mem_prealloc(int fd, char *area, size_t memory, Error **errp)
     if (ret) {
         /* Terminate QEMU since it can't recover from error */
         perror("os_mem_prealloc: failed to reinstall signal handler");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
     pthread_sigmask(SIG_SETMASK, &oldset, NULL);
 }
-- 
2.5.5


