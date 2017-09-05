Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dpCpO-0002yL-JA
	for mharc-qemu-trivial@gnu.org; Tue, 05 Sep 2017 08:19:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45120)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dpCpI-0002vs-8s
	for qemu-trivial@nongnu.org; Tue, 05 Sep 2017 08:19:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dpCpD-0001Wm-Aw
	for qemu-trivial@nongnu.org; Tue, 05 Sep 2017 08:19:32 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:37156)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1dpCp3-0001Ry-9r; Tue, 05 Sep 2017 08:19:17 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1dpCp0-0006zf-CH; Tue, 05 Sep 2017 13:19:14 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: patches@linaro.org
Date: Tue,  5 Sep 2017 13:19:32 +0100
Message-Id: <1504613972-15847-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-trivial] [PATCH] util/qemu-thread-posix.c: Replace OS ifdefs
 with CONFIG_HAVE_SEM_TIMEDWAIT
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
X-List-Received-Date: Tue, 05 Sep 2017 12:19:37 -0000

In qemu-thread-posix.c we have two implementations of the
various qemu_sem_* functions, one of which uses native POSIX
sem_* and the other of which emulates them with pthread conditions.
This is necessary because not all our host OSes support
sem_timedwait().

Instead of a hard-coded list of OSes which don't implement
sem_timedwait(), which gets out of date, make configure
test for the presence of the function and set a new
CONFIG_HAVE_SEM_TIMEDWAIT appropriately.

In particular, newer NetBSDs have sem_timedwait(), so this
commit will switch them over to using it. OSX still does
not have an implementation.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
It would be nice to gradually reduce the number of places
we do per-OS ifdeffery in favour of checking for the specific
feature we care about in each case...
Tested on Linux, NetBSD, OSX.

 configure                   | 15 +++++++++++++++
 include/qemu/thread-posix.h |  2 +-
 util/qemu-thread-posix.c    | 10 +++++-----
 3 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/configure b/configure
index fb7e34a..aa8d4d9 100755
--- a/configure
+++ b/configure
@@ -4448,6 +4448,18 @@ if compile_prog "" "" ; then
 fi
 
 ##########################################
+# check if we have sem_timedwait
+
+sem_timedwait=no
+cat > $TMPC << EOF
+#include <semaphore.h>
+int main(void) { return sem_timedwait(0, 0); }
+EOF
+if compile_prog "" "" ; then
+    sem_timedwait=yes
+fi
+
+##########################################
 # check if trace backend exists
 
 $python "$source_path/scripts/tracetool.py" "--backends=$trace_backends" --check-backends  > /dev/null 2> /dev/null
@@ -5680,6 +5692,9 @@ fi
 if test "$inotify1" = "yes" ; then
   echo "CONFIG_INOTIFY1=y" >> $config_host_mak
 fi
+if test "$sem_timedwait" = "yes" ; then
+  echo "CONFIG_SEM_TIMEDWAIT=y" >> $config_host_mak
+fi
 if test "$byteswap_h" = "yes" ; then
   echo "CONFIG_BYTESWAP_H=y" >> $config_host_mak
 fi
diff --git a/include/qemu/thread-posix.h b/include/qemu/thread-posix.h
index e5e3a0f..f4296d3 100644
--- a/include/qemu/thread-posix.h
+++ b/include/qemu/thread-posix.h
@@ -21,7 +21,7 @@ struct QemuCond {
 };
 
 struct QemuSemaphore {
-#if defined(__APPLE__) || defined(__NetBSD__)
+#ifndef CONFIG_SEM_TIMEDWAIT
     pthread_mutex_t lock;
     pthread_cond_t cond;
     unsigned int count;
diff --git a/util/qemu-thread-posix.c b/util/qemu-thread-posix.c
index 4e95d27..7306475 100644
--- a/util/qemu-thread-posix.c
+++ b/util/qemu-thread-posix.c
@@ -168,7 +168,7 @@ void qemu_sem_init(QemuSemaphore *sem, int init)
 {
     int rc;
 
-#if defined(__APPLE__) || defined(__NetBSD__)
+#ifndef CONFIG_SEM_TIMEDWAIT
     rc = pthread_mutex_init(&sem->lock, NULL);
     if (rc != 0) {
         error_exit(rc, __func__);
@@ -196,7 +196,7 @@ void qemu_sem_destroy(QemuSemaphore *sem)
 
     assert(sem->initialized);
     sem->initialized = false;
-#if defined(__APPLE__) || defined(__NetBSD__)
+#ifndef CONFIG_SEM_TIMEDWAIT
     rc = pthread_cond_destroy(&sem->cond);
     if (rc < 0) {
         error_exit(rc, __func__);
@@ -218,7 +218,7 @@ void qemu_sem_post(QemuSemaphore *sem)
     int rc;
 
     assert(sem->initialized);
-#if defined(__APPLE__) || defined(__NetBSD__)
+#ifndef CONFIG_SEM_TIMEDWAIT
     pthread_mutex_lock(&sem->lock);
     if (sem->count == UINT_MAX) {
         rc = EINVAL;
@@ -256,7 +256,7 @@ int qemu_sem_timedwait(QemuSemaphore *sem, int ms)
     struct timespec ts;
 
     assert(sem->initialized);
-#if defined(__APPLE__) || defined(__NetBSD__)
+#ifndef CONFIG_SEM_TIMEDWAIT
     rc = 0;
     compute_abs_deadline(&ts, ms);
     pthread_mutex_lock(&sem->lock);
@@ -304,7 +304,7 @@ void qemu_sem_wait(QemuSemaphore *sem)
     int rc;
 
     assert(sem->initialized);
-#if defined(__APPLE__) || defined(__NetBSD__)
+#ifndef CONFIG_SEM_TIMEDWAIT
     pthread_mutex_lock(&sem->lock);
     while (sem->count == 0) {
         rc = pthread_cond_wait(&sem->cond, &sem->lock);
-- 
2.7.4


