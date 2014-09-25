Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XX5e2-0006Wm-3l
	for mharc-qemu-trivial@gnu.org; Thu, 25 Sep 2014 05:47:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53530)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XX5dv-0006L9-4Z
	for qemu-trivial@nongnu.org; Thu, 25 Sep 2014 05:47:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XX5dq-0004FI-6x
	for qemu-trivial@nongnu.org; Thu, 25 Sep 2014 05:47:19 -0400
Received: from szxga01-in.huawei.com ([119.145.14.64]:20126)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1XX5df-00049j-7x; Thu, 25 Sep 2014 05:47:03 -0400
Received: from 172.24.2.119 (EHLO szxeml411-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CCD43667; Thu, 25 Sep 2014 17:46:43 +0800 (CST)
Received: from localhost (10.177.19.102) by szxeml411-hub.china.huawei.com
	(10.82.67.138) with Microsoft SMTP Server id 14.3.158.1;
	Thu, 25 Sep 2014 17:46:35 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 25 Sep 2014 17:46:24 +0800
Message-ID: <1411638384-5844-5-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
In-Reply-To: <1411638384-5844-1-git-send-email-arei.gonglei@huawei.com>
References: <1411638384-5844-1-git-send-email-arei.gonglei@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.64
Cc: peter.maydell@linaro.org, weidong.huang@huawei.com, qemu-trivial@nongnu.org,
	luonengjun@huawei.com, mjt@tls.msk.ru, armbru@redhat.com,
	peter.huangpeng@huawei.com, Gonglei <arei.gonglei@huawei.com>,
	pbonzini@redhat.com
Subject: [Qemu-trivial] [PATCH 4/4] oslib-posix/win32: convert
	fprintf/perror to error_report
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
X-List-Received-Date: Thu, 25 Sep 2014 09:47:24 -0000

From: Gonglei <arei.gonglei@huawei.com>

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
---
 util/oslib-posix.c | 8 ++++----
 util/oslib-win32.c | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/util/oslib-posix.c b/util/oslib-posix.c
index 016a047..00310f6 100644
--- a/util/oslib-posix.c
+++ b/util/oslib-posix.c
@@ -88,7 +88,7 @@ int qemu_daemon(int nochdir, int noclose)
 void *qemu_oom_check(void *ptr)
 {
     if (ptr == NULL) {
-        fprintf(stderr, "Failed to allocate memory: %s\n", strerror(errno));
+        error_report("Failed to allocate memory: %s", strerror(errno));
         abort();
     }
     return ptr;
@@ -380,7 +380,7 @@ void os_mem_prealloc(int fd, char *area, size_t memory)
 
     ret = sigaction(SIGBUS, &act, &oldact);
     if (ret) {
-        perror("os_mem_prealloc: failed to install signal handler");
+        error_report("os_mem_prealloc: failed to install signal handler");
         exit(1);
     }
 
@@ -390,7 +390,7 @@ void os_mem_prealloc(int fd, char *area, size_t memory)
     pthread_sigmask(SIG_UNBLOCK, &set, &oldset);
 
     if (sigsetjmp(sigjump, 1)) {
-        fprintf(stderr, "os_mem_prealloc: failed to preallocate pages\n");
+        error_report("os_mem_prealloc: failed to preallocate pages");
         exit(1);
     } else {
         int i;
@@ -404,7 +404,7 @@ void os_mem_prealloc(int fd, char *area, size_t memory)
 
         ret = sigaction(SIGBUS, &oldact, NULL);
         if (ret) {
-            perror("os_mem_prealloc: failed to reinstall signal handler");
+            error_report("os_mem_prealloc: failed to reinstall signal handler");
             exit(1);
         }
 
diff --git a/util/oslib-win32.c b/util/oslib-win32.c
index a3eab4a..47a0df7 100644
--- a/util/oslib-win32.c
+++ b/util/oslib-win32.c
@@ -44,7 +44,7 @@
 void *qemu_oom_check(void *ptr)
 {
     if (ptr == NULL) {
-        fprintf(stderr, "Failed to allocate memory: %lu\n", GetLastError());
+        error_report("Failed to allocate memory: %lu", GetLastError());
         abort();
     }
     return ptr;
-- 
1.7.12.4



