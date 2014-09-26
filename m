Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XXQhw-0004W4-QI
	for mharc-qemu-trivial@gnu.org; Fri, 26 Sep 2014 04:16:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38557)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XXQhp-0004Jq-VB
	for qemu-trivial@nongnu.org; Fri, 26 Sep 2014 04:16:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XXQhl-0004xQ-4V
	for qemu-trivial@nongnu.org; Fri, 26 Sep 2014 04:16:45 -0400
Received: from szxga01-in.huawei.com ([119.145.14.64]:43337)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1XXQha-0004vU-64; Fri, 26 Sep 2014 04:16:31 -0400
Received: from 172.24.2.119 (EHLO szxeml415-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CCE51072; Fri, 26 Sep 2014 16:14:51 +0800 (CST)
Received: from localhost (10.177.19.102) by szxeml415-hub.china.huawei.com
	(10.82.67.154) with Microsoft SMTP Server id 14.3.158.1;
	Fri, 26 Sep 2014 16:14:43 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Fri, 26 Sep 2014 16:14:30 +0800
Message-ID: <1411719272-9788-2-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
In-Reply-To: <1411719272-9788-1-git-send-email-arei.gonglei@huawei.com>
References: <1411719272-9788-1-git-send-email-arei.gonglei@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.64
Cc: peter.maydell@linaro.org, weidong.huang@huawei.com, qemu-trivial@nongnu.org,
	mjt@tls.msk.ru, armbru@redhat.com,
	Gonglei <arei.gonglei@huawei.com>, pbonzini@redhat.com, eblake@redhat.com
Subject: [Qemu-trivial] [PATCH 1/3] os-posix: change tab to space avoid
	violating coding style
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
X-List-Received-Date: Fri, 26 Sep 2014 08:16:51 -0000

From: Gonglei <arei.gonglei@huawei.com>

Cc: Eric Blake <eblake@redhat.com>
Signed-off-by: Gonglei <arei.gonglei@huawei.com>
---
 os-posix.c | 79 +++++++++++++++++++++++++++++++++-----------------------------
 1 file changed, 42 insertions(+), 37 deletions(-)

diff --git a/os-posix.c b/os-posix.c
index cb2a7f7..f0564ef 100644
--- a/os-posix.c
+++ b/os-posix.c
@@ -204,45 +204,49 @@ static void change_root(void)
 void os_daemonize(void)
 {
     if (daemonize) {
-	pid_t pid;
+        pid_t pid;
 
-	if (pipe(fds) == -1)
-	    exit(1);
+        if (pipe(fds) == -1) {
+            exit(1);
+        }
 
-	pid = fork();
-	if (pid > 0) {
-	    uint8_t status;
-	    ssize_t len;
+        pid = fork();
+        if (pid > 0) {
+            uint8_t status;
+            ssize_t len;
 
-	    close(fds[1]);
+            close(fds[1]);
 
-	again:
+        again:
             len = read(fds[0], &status, 1);
-            if (len == -1 && (errno == EINTR))
+            if (len == -1 && (errno == EINTR)) {
                 goto again;
-
-            if (len != 1)
+            }
+            if (len != 1) {
                 exit(1);
+            }
             else if (status == 1) {
                 fprintf(stderr, "Could not acquire pidfile: %s\n", strerror(errno));
                 exit(1);
-            } else
+            } else {
                 exit(0);
-	} else if (pid < 0)
-            exit(1);
-
-	close(fds[0]);
-	qemu_set_cloexec(fds[1]);
+            }
+            } else if (pid < 0) {
+                exit(1);
+            }
 
-	setsid();
+        close(fds[0]);
+        qemu_set_cloexec(fds[1]);
 
-	pid = fork();
-	if (pid > 0)
-	    exit(0);
-	else if (pid < 0)
-	    exit(1);
+        setsid();
 
-	umask(027);
+        pid = fork();
+        if (pid > 0) {
+            exit(0);
+        } else if (pid < 0) {
+            exit(1);
+        }
+        umask(027);
 
         signal(SIGTSTP, SIG_IGN);
         signal(SIGTTOU, SIG_IGN);
@@ -255,24 +259,25 @@ void os_setup_post(void)
     int fd = 0;
 
     if (daemonize) {
-	uint8_t status = 0;
-	ssize_t len;
+        uint8_t status = 0;
+        ssize_t len;
 
     again1:
-	len = write(fds[1], &status, 1);
-	if (len == -1 && (errno == EINTR))
-	    goto again1;
-
-	if (len != 1)
-	    exit(1);
-
+        len = write(fds[1], &status, 1);
+        if (len == -1 && (errno == EINTR)) {
+            goto again1;
+        }
+        if (len != 1) {
+            exit(1);
+        }
         if (chdir("/")) {
             perror("not able to chdir to /");
             exit(1);
         }
-	TFR(fd = qemu_open("/dev/null", O_RDWR));
-	if (fd == -1)
-	    exit(1);
+        TFR(fd = qemu_open("/dev/null", O_RDWR));
+        if (fd == -1) {
+            exit(1);
+        }
     }
 
     change_root();
-- 
1.7.12.4



