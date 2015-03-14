Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YWfQZ-0006kO-TP
	for mharc-qemu-trivial@gnu.org; Sat, 14 Mar 2015 02:20:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48614)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1YWfQN-0006K5-1t
	for qemu-trivial@nongnu.org; Sat, 14 Mar 2015 02:19:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1YWfQF-0004Cv-EZ
	for qemu-trivial@nongnu.org; Sat, 14 Mar 2015 02:19:50 -0400
Received: from e06smtp11.uk.ibm.com ([195.75.94.107]:60951)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1YWfQF-0004Cb-6T
	for qemu-trivial@nongnu.org; Sat, 14 Mar 2015 02:19:43 -0400
Received: from /spool/local
	by e06smtp11.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <thuth@linux.vnet.ibm.com>;
	Sat, 14 Mar 2015 06:19:42 -0000
Received: from d06dlp01.portsmouth.uk.ibm.com (9.149.20.13)
	by e06smtp11.uk.ibm.com (192.168.101.141) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Sat, 14 Mar 2015 06:19:38 -0000
Received: from b06cxnps4074.portsmouth.uk.ibm.com
	(d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
	by d06dlp01.portsmouth.uk.ibm.com (Postfix) with ESMTP id A796017D805A; 
	Sat, 14 Mar 2015 06:20:01 +0000 (GMT)
Received: from d06av07.portsmouth.uk.ibm.com (d06av07.portsmouth.uk.ibm.com
	[9.149.37.248])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id t2E6Jckw3211592; Sat, 14 Mar 2015 06:19:38 GMT
Received: from d06av07.portsmouth.uk.ibm.com (localhost [127.0.0.1])
	by d06av07.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with
	ESMTP id t2E6JcM1013450; Sat, 14 Mar 2015 02:19:38 -0400
Received: from oc7435384737.ibm.com (sig-9-84-84-76.evts.de.ibm.com
	[9.84.84.76])
	by d06av07.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with
	ESMTP id t2E6JYkY013361; Sat, 14 Mar 2015 02:19:37 -0400
From: Thomas Huth <thuth@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Sat, 14 Mar 2015 07:19:33 +0100
Message-Id: <1426313974-25607-7-git-send-email-thuth@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1426313974-25607-1-git-send-email-thuth@linux.vnet.ibm.com>
References: <1426313974-25607-1-git-send-email-thuth@linux.vnet.ibm.com>
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 15031406-0041-0000-0000-000003B69E6D
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.75.94.107
Cc: Thomas Huth <thuth@linux.vnet.ibm.com>
Subject: [Qemu-trivial] [PATCH v2 6/7] util: Remove unused functions
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
X-List-Received-Date: Sat, 14 Mar 2015 06:19:59 -0000

Delete the unused functions qemu_signalfd_available(),
qemu_send_full() and qemu_recv_full().

Signed-off-by: Thomas Huth <thuth@linux.vnet.ibm.com>
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


