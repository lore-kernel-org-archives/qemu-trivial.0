Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XX5e0-0006TD-7Z
	for mharc-qemu-trivial@gnu.org; Thu, 25 Sep 2014 05:47:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53517)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XX5dt-0006HG-Cb
	for qemu-trivial@nongnu.org; Thu, 25 Sep 2014 05:47:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XX5do-0004Ee-Io
	for qemu-trivial@nongnu.org; Thu, 25 Sep 2014 05:47:17 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:43659)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1XX5de-00049y-3G; Thu, 25 Sep 2014 05:47:02 -0400
Received: from 172.24.2.119 (EHLO szxeml412-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id BZY43905; Thu, 25 Sep 2014 17:46:44 +0800 (CST)
Received: from localhost (10.177.19.102) by szxeml412-hub.china.huawei.com
	(10.82.67.91) with Microsoft SMTP Server id 14.3.158.1; Thu, 25 Sep 2014
	17:46:35 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 25 Sep 2014 17:46:21 +0800
Message-ID: <1411638384-5844-2-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
In-Reply-To: <1411638384-5844-1-git-send-email-arei.gonglei@huawei.com>
References: <1411638384-5844-1-git-send-email-arei.gonglei@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: peter.maydell@linaro.org, weidong.huang@huawei.com, qemu-trivial@nongnu.org,
	luonengjun@huawei.com, mjt@tls.msk.ru, armbru@redhat.com,
	peter.huangpeng@huawei.com, Gonglei <arei.gonglei@huawei.com>,
	pbonzini@redhat.com
Subject: [Qemu-trivial] [PATCH 1/4] os-posix/win32: convert fprintf/perror
	to error_report
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
X-List-Received-Date: Thu, 25 Sep 2014 09:47:22 -0000

From: Gonglei <arei.gonglei@huawei.com>

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
---
 os-posix.c | 34 ++++++++++++++++++----------------
 os-win32.c |  3 ++-
 2 files changed, 20 insertions(+), 17 deletions(-)

diff --git a/os-posix.c b/os-posix.c
index cb2a7f7..9d5ae70 100644
--- a/os-posix.c
+++ b/os-posix.c
@@ -39,6 +39,7 @@
 #include "sysemu/sysemu.h"
 #include "net/slirp.h"
 #include "qemu-options.h"
+#include "qemu/error-report.h"
 
 #ifdef CONFIG_LINUX
 #include <sys/prctl.h>
@@ -120,11 +121,11 @@ void os_set_proc_name(const char *s)
     /* Could rewrite argv[0] too, but that's a bit more complicated.
        This simple way is enough for `top'. */
     if (prctl(PR_SET_NAME, name)) {
-        perror("unable to change process name");
+        error_report("unable to change process name");
         exit(1);
     }
 #else
-    fprintf(stderr, "Change of process name not supported by your OS\n");
+    error_report("Change of process name not supported by your OS");
     exit(1);
 #endif
 }
@@ -145,7 +146,7 @@ void os_parse_cmd_args(int index, const char *optarg)
     case QEMU_OPTION_runas:
         user_pwd = getpwnam(optarg);
         if (!user_pwd) {
-            fprintf(stderr, "User \"%s\" doesn't exist\n", optarg);
+            error_report("User \"%s\" doesn't exist", optarg);
             exit(1);
         }
         break;
@@ -167,20 +168,20 @@ static void change_process_uid(void)
 {
     if (user_pwd) {
         if (setgid(user_pwd->pw_gid) < 0) {
-            fprintf(stderr, "Failed to setgid(%d)\n", user_pwd->pw_gid);
+            error_report("Failed to setgid(%d)\n", user_pwd->pw_gid);
             exit(1);
         }
         if (initgroups(user_pwd->pw_name, user_pwd->pw_gid) < 0) {
-            fprintf(stderr, "Failed to initgroups(\"%s\", %d)\n",
-                    user_pwd->pw_name, user_pwd->pw_gid);
+            error_report("Failed to initgroups(\"%s\", %d)",
+                         user_pwd->pw_name, user_pwd->pw_gid);
             exit(1);
         }
         if (setuid(user_pwd->pw_uid) < 0) {
-            fprintf(stderr, "Failed to setuid(%d)\n", user_pwd->pw_uid);
+            error_report("Failed to setuid(%d)", user_pwd->pw_uid);
             exit(1);
         }
         if (setuid(0) != -1) {
-            fprintf(stderr, "Dropping privileges failed\n");
+            error_report("Dropping privileges failed");
             exit(1);
         }
     }
@@ -190,11 +191,11 @@ static void change_root(void)
 {
     if (chroot_dir) {
         if (chroot(chroot_dir) < 0) {
-            fprintf(stderr, "chroot failed\n");
+            error_report("chroot failed");
             exit(1);
         }
         if (chdir("/")) {
-            perror("not able to chdir to /");
+            error_report("not able to chdir to /");
             exit(1);
         }
     }
@@ -224,7 +225,7 @@ void os_daemonize(void)
             if (len != 1)
                 exit(1);
             else if (status == 1) {
-                fprintf(stderr, "Could not acquire pidfile: %s\n", strerror(errno));
+                error_report("Could not acquire pidfile: %s", strerror(errno));
                 exit(1);
             } else
                 exit(0);
@@ -267,7 +268,7 @@ void os_setup_post(void)
 	    exit(1);
 
         if (chdir("/")) {
-            perror("not able to chdir to /");
+            error_report("not able to chdir to /");
             exit(1);
         }
 	TFR(fd = qemu_open("/dev/null", O_RDWR));
@@ -292,10 +293,11 @@ void os_pidfile_error(void)
     if (daemonize) {
         uint8_t status = 1;
         if (write(fds[1], &status, 1) != 1) {
-            perror("daemonize. Writing to pipe\n");
+            error_report("daemonize. Writing to pipe");
         }
-    } else
-        fprintf(stderr, "Could not acquire pid file: %s\n", strerror(errno));
+    } else {
+        error_report("Could not acquire pid file: %s", strerror(errno));
+    }
 }
 
 void os_set_line_buffering(void)
@@ -338,7 +340,7 @@ int os_mlock(void)
 
     ret = mlockall(MCL_CURRENT | MCL_FUTURE);
     if (ret < 0) {
-        perror("mlockall");
+        error_report("mlockall");
     }
 
     return ret;
diff --git a/os-win32.c b/os-win32.c
index 5f95caa..28877b3 100644
--- a/os-win32.c
+++ b/os-win32.c
@@ -33,6 +33,7 @@
 #include "config-host.h"
 #include "sysemu/sysemu.h"
 #include "qemu-options.h"
+#include "qemu/error-report.h"
 
 /***********************************************************/
 /* Functions missing in mingw */
@@ -106,7 +107,7 @@ void os_parse_cmd_args(int index, const char *optarg)
 
 void os_pidfile_error(void)
 {
-    fprintf(stderr, "Could not acquire pid file: %s\n", strerror(errno));
+    error_report("Could not acquire pid file: %s", strerror(errno));
 }
 
 int qemu_create_pidfile(const char *filename)
-- 
1.7.12.4



