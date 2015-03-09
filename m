Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YV1WD-0003kr-Rk
	for mharc-qemu-trivial@gnu.org; Mon, 09 Mar 2015 13:31:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36132)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1YV1W2-0003IF-Os
	for qemu-trivial@nongnu.org; Mon, 09 Mar 2015 13:30:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1YV1Vx-0005p9-5p
	for qemu-trivial@nongnu.org; Mon, 09 Mar 2015 13:30:54 -0400
Received: from e06smtp10.uk.ibm.com ([195.75.94.106]:33121)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1YV1Vw-0005o5-UH
	for qemu-trivial@nongnu.org; Mon, 09 Mar 2015 13:30:49 -0400
Received: from /spool/local
	by e06smtp10.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <thuth@linux.vnet.ibm.com>;
	Mon, 9 Mar 2015 17:30:47 -0000
Received: from d06dlp01.portsmouth.uk.ibm.com (9.149.20.13)
	by e06smtp10.uk.ibm.com (192.168.101.140) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Mon, 9 Mar 2015 17:30:44 -0000
Received: from b06cxnps4075.portsmouth.uk.ibm.com
	(d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
	by d06dlp01.portsmouth.uk.ibm.com (Postfix) with ESMTP id 1075E17D805A; 
	Mon,  9 Mar 2015 17:31:05 +0000 (GMT)
Received: from d06av02.portsmouth.uk.ibm.com (d06av02.portsmouth.uk.ibm.com
	[9.149.37.228])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id t29HUho751511380; Mon, 9 Mar 2015 17:30:43 GMT
Received: from d06av02.portsmouth.uk.ibm.com (localhost [127.0.0.1])
	by d06av02.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with
	ESMTP id t29HUhKH025103; Mon, 9 Mar 2015 11:30:43 -0600
Received: from oc7435384737.ibm.com (sig-9-81-34-230.evts.uk.ibm.com
	[9.81.34.230])
	by d06av02.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with
	ESMTP id t29HUF7s024224; Mon, 9 Mar 2015 11:30:42 -0600
From: Thomas Huth <thuth@linux.vnet.ibm.com>
To: qemu-trivial@nongnu.org
Date: Mon,  9 Mar 2015 18:30:14 +0100
Message-Id: <1425922215-20819-8-git-send-email-thuth@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1425922215-20819-1-git-send-email-thuth@linux.vnet.ibm.com>
References: <1425922215-20819-1-git-send-email-thuth@linux.vnet.ibm.com>
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 15030917-0041-0000-0000-00000382B269
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.75.94.106
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
	Thomas Huth <thuth@linux.vnet.ibm.com>
Subject: [Qemu-trivial] [PATCH 7/8] util: Remove unused functions
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
X-List-Received-Date: Mon, 09 Mar 2015 17:30:59 -0000

Delete the unused functions qemu_signalfd_available(),
qemu_send_full() and qemu_recv_full().

Signed-off-by: Thomas Huth <thuth@linux.vnet.ibm.com>
Cc: Markus Armbruster <armbru@redhat.com>
---
 include/qemu-common.h   |    4 ---
 include/qemu/compatfd.h |    1 -
 util/compatfd.c         |   19 -------------
 util/osdep.c            |   66 -----------------------------------------------
 4 files changed, 0 insertions(+), 90 deletions(-)

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
1.7.1


