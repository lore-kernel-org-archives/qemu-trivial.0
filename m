Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YngqW-0000UQ-GP
	for mharc-qemu-trivial@gnu.org; Thu, 30 Apr 2015 01:17:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47661)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YngqQ-0000EO-1y
	for qemu-trivial@nongnu.org; Thu, 30 Apr 2015 01:17:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YngqP-0006EQ-20
	for qemu-trivial@nongnu.org; Thu, 30 Apr 2015 01:17:06 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:51987)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YngqH-0006Bn-Qr; Thu, 30 Apr 2015 01:16:58 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id E90BF42B8B;
	Thu, 30 Apr 2015 08:16:56 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id D31E1954;
	Thu, 30 Apr 2015 08:08:58 +0300 (MSK)
Received: (nullmailer pid 4329 invoked by uid 1000);
	Thu, 30 Apr 2015 05:08:57 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 30 Apr 2015 08:08:31 +0300
Message-Id: <4f3fafc3e5c2515b480596d8d1e783dbb3afb500.1430370396.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1430370396.git.mjt@msgid.tls.msk.ru>
References: <cover.1430370396.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Thomas Huth <thuth@linux.vnet.ibm.com>
Subject: [Qemu-trivial] [PULL 18/42] util: Remove unused functions
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
X-List-Received-Date: Thu, 30 Apr 2015 05:17:07 -0000

From: Thomas Huth <thuth@linux.vnet.ibm.com>

Delete the unused functions qemu_signalfd_available(),
qemu_send_full() and qemu_recv_full().

Signed-off-by: Thomas Huth <thuth@linux.vnet.ibm.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 include/qemu-common.h   |  4 ---
 include/qemu/compatfd.h |  1 -
 util/compatfd.c         | 19 --------------
 util/osdep.c            | 66 -------------------------------------------------
 4 files changed, 90 deletions(-)

diff --git a/include/qemu-common.h b/include/qemu-common.h
index 1b5cffb..6b373ff 100644
--- a/include/qemu-common.h
+++ b/include/qemu-common.h
@@ -217,10 +217,6 @@ void *qemu_oom_check(void *ptr);
 
 ssize_t qemu_write_full(int fd, const void *buf, size_t count)
     QEMU_WARN_UNUSED_RESULT;
-ssize_t qemu_send_full(int fd, const void *buf, size_t count, int flags)
-    QEMU_WARN_UNUSED_RESULT;
-ssize_t qemu_recv_full(int fd, void *buf, size_t count, int flags)
-    QEMU_WARN_UNUSED_RESULT;
 
 #ifndef _WIN32
 int qemu_pipe(int pipefd[2]);
diff --git a/include/qemu/compatfd.h b/include/qemu/compatfd.h
index 6b04877..fc37915 100644
--- a/include/qemu/compatfd.h
+++ b/include/qemu/compatfd.h
@@ -39,6 +39,5 @@ struct qemu_signalfd_siginfo {
 };
 
 int qemu_signalfd(const sigset_t *mask);
-bool qemu_signalfd_available(void);
 
 #endif
diff --git a/util/compatfd.c b/util/compatfd.c
index 341ada6..e857150 100644
--- a/util/compatfd.c
+++ b/util/compatfd.c
@@ -108,22 +108,3 @@ int qemu_signalfd(const sigset_t *mask)
 
     return qemu_signalfd_compat(mask);
 }
-
-bool qemu_signalfd_available(void)
-{
-#ifdef CONFIG_SIGNALFD
-    sigset_t mask;
-    int fd;
-    bool ok;
-    sigemptyset(&mask);
-    errno = 0;
-    fd = syscall(SYS_signalfd, -1, &mask, _NSIG / 8);
-    ok = (errno != ENOSYS);
-    if (fd >= 0) {
-        close(fd);
-    }
-    return ok;
-#else
-    return false;
-#endif
-}
diff --git a/util/osdep.c b/util/osdep.c
index b2bd154..f938b69 100644
--- a/util/osdep.c
+++ b/util/osdep.c
@@ -310,72 +310,6 @@ int qemu_accept(int s, struct sockaddr *addr, socklen_t *addrlen)
     return ret;
 }
 
-/*
- * A variant of send(2) which handles partial write.
- *
- * Return the number of bytes transferred, which is only
- * smaller than `count' if there is an error.
- *
- * This function won't work with non-blocking fd's.
- * Any of the possibilities with non-bloking fd's is bad:
- *   - return a short write (then name is wrong)
- *   - busy wait adding (errno == EAGAIN) to the loop
- */
-ssize_t qemu_send_full(int fd, const void *buf, size_t count, int flags)
-{
-    ssize_t ret = 0;
-    ssize_t total = 0;
-
-    while (count) {
-        ret = send(fd, buf, count, flags);
-        if (ret < 0) {
-            if (errno == EINTR) {
-                continue;
-            }
-            break;
-        }
-
-        count -= ret;
-        buf += ret;
-        total += ret;
-    }
-
-    return total;
-}
-
-/*
- * A variant of recv(2) which handles partial write.
- *
- * Return the number of bytes transferred, which is only
- * smaller than `count' if there is an error.
- *
- * This function won't work with non-blocking fd's.
- * Any of the possibilities with non-bloking fd's is bad:
- *   - return a short write (then name is wrong)
- *   - busy wait adding (errno == EAGAIN) to the loop
- */
-ssize_t qemu_recv_full(int fd, void *buf, size_t count, int flags)
-{
-    ssize_t ret = 0;
-    ssize_t total = 0;
-
-    while (count) {
-        ret = qemu_recv(fd, buf, count, flags);
-        if (ret <= 0) {
-            if (ret < 0 && errno == EINTR) {
-                continue;
-            }
-            break;
-        }
-
-        count -= ret;
-        buf += ret;
-        total += ret;
-    }
-
-    return total;
-}
-
 void qemu_set_version(const char *version)
 {
     qemu_version = version;
-- 
2.1.4


