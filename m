Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aJNhs-0002aI-D8
	for mharc-qemu-trivial@gnu.org; Wed, 13 Jan 2016 10:51:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35013)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <nutaro@gmail.com>) id 1aJNST-0002v7-Ou
	for qemu-trivial@nongnu.org; Wed, 13 Jan 2016 10:35:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <nutaro@gmail.com>) id 1aJNSN-0007b2-KH
	for qemu-trivial@nongnu.org; Wed, 13 Jan 2016 10:35:37 -0500
Received: from mail-io0-x230.google.com ([2607:f8b0:4001:c06::230]:33939)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <nutaro@gmail.com>) id 1aJNSN-0007a8-Af
	for qemu-trivial@nongnu.org; Wed, 13 Jan 2016 10:35:31 -0500
Received: by mail-io0-x230.google.com with SMTP id 1so374814980ion.1
	for <qemu-trivial@nongnu.org>; Wed, 13 Jan 2016 07:35:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=7GPAVCa1k4icl1Bh1MIcXQ1TU3rpAOEr9f1do15+/0M=;
	b=gCGvSse/TI6xzaB/bWcbA8A8RkkfXPWL0XKIaRLcRYfwUo+MnQyiC1UOYPXXeT5e0q
	oRdyxNfkWZ65F221TUpPIvxvWZbH/r+Y7hFsPgbcyil4yJs36q2m+rDMmvGMJC5oDtw7
	E1L5i/KaK/jzJau++xuAe01rJN9Wu6TEZZS7VzurNDMgXKOXOKSVTpkQdr4SytSX23dr
	F41XLnY8q10CHvgI8sKVvbBCZJZSM0b6u9q8QdMx9vqyvKjBg6WtipDub7OSFLBVKsFq
	bh8YWNhkuWpIWrR5jvNtKhgAo7FlL1oqrnM8Q7eqkwmk3/AcHrw3bqpuqEmjHlC7M5ku
	mocQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to
	:content-type;
	bh=7GPAVCa1k4icl1Bh1MIcXQ1TU3rpAOEr9f1do15+/0M=;
	b=liEkEWnu0eJfur1cwkmD16gzm9kooTeI7Fal6kv7PTJBKEf/NFj9u7EhL/EEyPPIgO
	/0b1ySv7sQeoRlYe8nKhL2pPnhaxsUCcdQgYoXZx0eYP3AOGMi1bPBOxAaZL20ZlNQjO
	oWHksO9i5JatkpSPfK+LsFZuhP0V1D5ddv7ebDF54UE/dB/KZgzYq+hgCNCYfPdYk0Ht
	UA4k8Mq/3LMlIEKLKmySsHTHdp5XdiywRRn4q2kfCno1bGWvtwmNJOzPrXOmkgptj/2a
	cBYg0txWXBxFehURGQFC0R1vdZz+qGJnfJPzIFncA2R8MoalYDTiRBFh8isjTmPGN72/
	LPSA==
X-Gm-Message-State: ALoCoQm5X6fRC3LfOPrvFUFGrhpKTiv7BUSQ05be8zGyFm5IHqaAOPO1/a3SvVA54bpi4J8zDyXCIgLn1zpBvA1Npu59bEhlzg==
MIME-Version: 1.0
X-Received: by 10.107.32.209 with SMTP id g200mr114485246iog.39.1452699330539; 
	Wed, 13 Jan 2016 07:35:30 -0800 (PST)
Received: by 10.36.8.66 with HTTP; Wed, 13 Jan 2016 07:35:30 -0800 (PST)
Date: Wed, 13 Jan 2016 10:35:30 -0500
Message-ID: <CANVkX9HFRVH1n4WpHbZ23EGH6UFtrTCrh2r_CDHMPNtmU3w5_A@mail.gmail.com>
From: James Nutaro <nutaro@gmail.com>
To: qemu-trivial@nongnu.org
Content-Type: multipart/alternative; boundary=001a1140cd068ffb61052938eb5a
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4001:c06::230
X-Mailman-Approved-At: Wed, 13 Jan 2016 10:51:30 -0500
Subject: [Qemu-trivial] [PATCH] Added code for synchronzing the internal
 simulation clock with an external simulation clock
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
X-List-Received-Date: Wed, 13 Jan 2016 15:35:40 -0000

--001a1140cd068ffb61052938eb5a
Content-Type: text/plain; charset=UTF-8

This patch adds an interface via UNIX shared memory for pacing the
execution of QEMU to match an external simulation clock. The aim is to
allow QEMU to be used as a module inside of a larger simulation system.

The body of the patch is below.

Jim Nutaro (nutaro@gmail.com)

From 0e0d352be2f91ed2df3526bc55753acfa97509e9 Mon Sep 17 00:00:00 2001
From: "James J. Nutaro" <nutarojj@ornl.gov>
Date: Mon, 9 Nov 2015 12:36:06 -0500
Subject: [PATCH] QQQ is a module for pacing the rate of advance of the
 computer clock in reference to an external simulation clock. The basic
 approach used here is adapted from QBox from Green Socs (hence the name, Q?
 Q? Q? - qqq!). Its intended use is to incorporate a complete software stack
 into constructive simulation models. The solution proposed here assumes
that
 devices (NIC cards, serial ports, and other low level hardware) will be
 modeled within QEMU and connected to via a UNIX socket or some other
 appropriate mechanism. Other pieces of equipment (e.g., electric motors,
 communication networks, quad coptors, robotic arms, ...) would be modeled
in
 some other simulation tool. Hence, I assume that the problem of exchanging
 data can be solved using existing mechanisms within QEMU and that the only
 remaining problem is time synchronization. This module addresses the time
 synchronization problem.

There is an example of how to use this module in the
adevs simulation package at http://sourceforge.net/projects/adevs/

The mode of operation is as follows:

The simulator creates a shared memory of size sizeof(int) that will be
used to exchange time advance information and writes a negative value
to that shared memory segment. Then the simulator forks a process
to execute qemu. Qemu attaches to this shared memory segment using
a key that includes the PID of the forked child (see qqq.c for the
expected shared memory key).

Qemu waits for a positive value to appear in the shared memory. Meanwhile
the simulator writes a positive value to indicate the maximum time
advance that it allows to qemu. When qemu receives this positive value
it schedules a timer event for time advance microseconds in the future.
A value of zero indicates that qemu should exit.

Now the simulator spins on the shared memory value waiting for it to become
negative. When qemu executes the scheduled timer event, qemu writes a
negative value indicating the actual time advanced. At this time, the
simulator
is able to run again and this cycle is repeated until the simulation ends.

Authors:
  James Nutaro <nutarojj@ornl.gov>
---
 Makefile.target          |   2 +-
 cpus.c                   |   9 ++++-
 include/qemu/thread.h    |   8 ++++
 qqq.c                    | 101
+++++++++++++++++++++++++++++++++++++++++++++++
 qqq.h                    |  67 +++++++++++++++++++++++++++++++
 util/qemu-thread-posix.c |  14 +++++++
 vl.c                     |   5 +++
 7 files changed, 204 insertions(+), 2 deletions(-)
 create mode 100644 qqq.c
 create mode 100644 qqq.h

diff --git a/Makefile.target b/Makefile.target
index 962d004..8956afe 100644
--- a/Makefile.target
+++ b/Makefile.target
@@ -131,7 +131,7 @@ endif #CONFIG_BSD_USER
 #########################################################
 # System emulator target
 ifdef CONFIG_SOFTMMU
-obj-y += arch_init.o cpus.o monitor.o gdbstub.o balloon.o ioport.o numa.o
+obj-y += arch_init.o qqq.o cpus.o monitor.o gdbstub.o balloon.o ioport.o
numa.o
 obj-y += qtest.o bootdevice.o
 obj-y += hw/
 obj-$(CONFIG_KVM) += kvm-all.o
diff --git a/cpus.c b/cpus.c
index 877bd70..b040285 100644
--- a/cpus.c
+++ b/cpus.c
@@ -44,6 +44,8 @@
 #include "hw/nmi.h"
 #include "sysemu/replay.h"

+#include "qqq.h"
+
 #ifndef _WIN32
 #include "qemu/compatfd.h"
 #endif
@@ -998,7 +1000,12 @@ static void qemu_tcg_wait_io_event(CPUState *cpu)
        /* Start accounting real time to the virtual clock if the CPUs
           are idle.  */
         qemu_clock_warp(QEMU_CLOCK_VIRTUAL);
-        qemu_cond_wait(cpu->halt_cond, &qemu_global_mutex);
+       /* If qqq is running then this wait must timeout so that the
+        * simulation does not become stuck when the cpu idles */
+        if (qqq_enabled())
+            qemu_cond_wait_timeout_ns(cpu->halt_cond, &qemu_global_mutex,
10000);
+        else
+            qemu_cond_wait(cpu->halt_cond, &qemu_global_mutex);
     }

     while (iothread_requesting_mutex) {
diff --git a/include/qemu/thread.h b/include/qemu/thread.h
index 5114ec8..c0f6009 100644
--- a/include/qemu/thread.h
+++ b/include/qemu/thread.h
@@ -36,6 +36,14 @@ void qemu_cond_destroy(QemuCond *cond);
 void qemu_cond_signal(QemuCond *cond);
 void qemu_cond_broadcast(QemuCond *cond);
 void qemu_cond_wait(QemuCond *cond, QemuMutex *mutex);
+/* This defaults to qemu_cond_wait() on Windows */
+#ifndef _WIN32
+void qemu_cond_wait_timeout_ns(QemuCond *cond, QemuMutex *mutex, int64_t
timeout_ns);
+#else
+void qemu_cond_wait_timeout_ns(QemuCond *cond, QemuMutex *mutex, int64_t
timeout_ns) {
+  qemu_cond_wait(cond,mutex);
+}
+#endif

 void qemu_sem_init(QemuSemaphore *sem, int init);
 void qemu_sem_post(QemuSemaphore *sem);
diff --git a/qqq.c b/qqq.c
new file mode 100644
index 0000000..5c2a786
--- /dev/null
+++ b/qqq.c
@@ -0,0 +1,101 @@
+
+/* This is a Linux only feature */
+
+#ifndef _WIN32
+
+#include "qemu/main-loop.h"
+#include "qemu/timer.h"
+#include "qemu/thread.h"
+#include "sysemu/cpus.h"
+#include <stdio.h>
+#include <errno.h>
+#include <sys/mman.h>
+#include <sys/stat.h>
+#include <sys/types.h>
+#include <fcntl.h>
+#include <assert.h>
+#include <unistd.h>
+#include <pthread.h>
+#include "qqq.h"
+
+/* Shared memory data */
+static void* shm = NULL;
+static int64_t t = 0;
+static QEMUTimer* sync_timer = NULL;
+
+static void write_mem_value(int val)
+{
+  /* I AM ASSUMING THE MEMORY WRITE WILL BE ATOMIC AND WILL
+   * NOT BE CACHED */
+  (*((volatile int*)shm)) = val;
+}
+
+static int read_mem_value(void)
+{
+  /* I AM ASSUMING THE MEMORY READ WILL BE ATOMIC AND WILL
+   * NOT BE CACHED */
+  return (*((volatile int*)shm));
+}
+
+static void schedule_next_event(void)
+{
+  int time_advance;
+  /* Get the time advance allowed by the simulator. This is provided
+   * as a positive value that is written by the simulator to the
+   * shared memory location. */
+  while ((time_advance = read_mem_value()) < 0);
+  /* A zero time advance is an instruction to shutdown */
+  if (time_advance == 0)
+  {
+    munmap(shm,sizeof(int));
+    exit(0);
+  }
+  /* Schedule the next syncronization point */
+  timer_mod(sync_timer,t+time_advance);
+}
+
+static void sync_func(void* data)
+{
+  /* Report the actual elapsed time. The value written will be
+   * -(elapsed time), and the simulator will recognized the negative
+   * value as a signal that the write has been done. */
+  int64_t tnow = qemu_clock_get_us(QEMU_CLOCK_VIRTUAL);
+  int usecs = tnow-t;
+  write_mem_value((usecs > 0) ? -usecs : -1);
+  /* Update our time of last event */
+  t = tnow;
+  /* Schedule the next event */
+  schedule_next_event();
+}
+
+bool qqq_enabled(void) { return (shm != NULL); }
+
+void setup_qqq(void)
+{
+  char shm_key[100];
+  /* Attach to the shared memory region */
+  sprintf(shm_key,"/qemu_%d",getpid());
+  errno = 0;
+  int fd = shm_open(shm_key,O_RDWR,S_IRWXU);
+  if (fd == -1)
+  {
+    perror("Could not open shared memory, qqq not enabled");
+    return;
+  }
+  shm = mmap(NULL,sizeof(int),PROT_READ|PROT_WRITE,MAP_SHARED,fd,0);
+  if (shm == NULL)
+  {
+    perror("Could not map shared memory, qqq not enabled");
+    shm_unlink(shm_key);
+    return;
+  }
+  /* Done with the shared memory file handle */
+  close(fd);
+  shm_unlink(shm_key);
+  /* Start the timer to ensure time warps advance the clock */
+  sync_timer = timer_new_us(QEMU_CLOCK_VIRTUAL,sync_func,NULL);
+  /* Get the time advance that is requested by the simulation */
+  schedule_next_event();
+}
+
+#endif
diff --git a/qqq.h b/qqq.h
new file mode 100644
index 0000000..687a9f3
--- /dev/null
+++ b/qqq.h
@@ -0,0 +1,67 @@
+/*
+ * A module for pacing the rate of advance of the computer clock
+ * in reference to an external simulation clock. The basic approach
+ * used here is adapted from QBox from Green Socs (hence the name, Q?
+ * Q? Q? - qqq!). The basic mode of operation is as follows:
+ *
+ * The simulator creates a shared memory of size sizeof(int) that will be
+ * used to exchange time advance information, writes a negative value
+ * to that shared memory segment, and then forks a process
+ * to execute qemu. Qemu attaches to this shared memory segment using
+ * a key that includes the PID of the forked child (see qqq.c for the
+ * expected shared memory key).
+ *
+ * Qemu waits for a positive to appear in the shared memory. Meanwhile
+ * the simulator writes a positive value to indicate the maximum time
+ * advance that it allows to qemu. When qemu receives this positive value
+ * it schedules a timer event for time advance microseconds in the future.
+ *
+ * Now the simulator spins on the shared memory value waiting for it to
become
+ * negative. When qemu executes the scheduled timer event, qemu writes a
+ * negative value indicating the actual time advanced. At this time, the
simulator
+ * is able to run again and this cycle is repeated until the simulation
ends.
+ *
+ * Authors:
+ *   James Nutaro <nutarojj@ornl.gov>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ *
+ */
+#ifndef QQQ_H
+#define QQQ_H
+
+/* This is a Linux only feature */
+
+#ifdef _WIN32
+
+/* Windows functions that do nothing */
+static inline bool qqq_enabled(void) { return false; }
+static inline void setup_qqq(void){}
+
+#else
+
+/* The Linux implementation */
+
+#include "qemu/main-loop.h"
+#include "qemu/timer.h"
+#include "qemu/thread.h"
+#include "sysemu/cpus.h"
+#include <stdio.h>
+#include <errno.h>
+#include <sys/mman.h>
+#include <sys/stat.h>
+#include <sys/types.h>
+#include <fcntl.h>
+#include <assert.h>
+#include <unistd.h>
+#include <pthread.h>
+
+void setup_qqq(void);
+/* Returns true if qqq is enabled and false otherwise.
+ * It will be enabled only if setup_qqq() is able to
+ * attach to the shared memory segment. */
+bool qqq_enabled(void);
+
+#endif
+#endif
diff --git a/util/qemu-thread-posix.c b/util/qemu-thread-posix.c
index dbd8094..c6396c4 100644
--- a/util/qemu-thread-posix.c
+++ b/util/qemu-thread-posix.c
@@ -134,6 +134,20 @@ void qemu_cond_wait(QemuCond *cond, QemuMutex *mutex)
         error_exit(err, __func__);
 }

+void qemu_cond_wait_timeout_ns(QemuCond *cond, QemuMutex *mutex, int64_t
timeout_ns)
+{
+    static const long ns_sec = 1000000000LL;
+    struct timeval tv;
+    struct timespec ts;
+    int err;
+    gettimeofday(&tv, NULL);
+    ts.tv_sec = tv.tv_sec + (timeout_ns + tv.tv_usec*1000) / ns_sec;
+    ts.tv_nsec = (timeout_ns + tv.tv_usec*1000) % ns_sec;
+    err = pthread_cond_timedwait(&cond->cond, &mutex->lock, &ts);
+    if (err != 0 && err != ETIMEDOUT)
+        error_exit(err, __func__);
+}
+
 void qemu_sem_init(QemuSemaphore *sem, int init)
 {
     int rc;
diff --git a/vl.c b/vl.c
index 21e8876..8a2facc 100644
--- a/vl.c
+++ b/vl.c
@@ -125,6 +125,8 @@ int main(int argc, char **argv)
 #include "sysemu/replay.h"
 #include "qapi/qmp/qerror.h"

+#include "qqq.h"
+
 #define MAX_VIRTIO_CONSOLES 1
 #define MAX_SCLP_CONSOLES 1

@@ -4402,6 +4404,9 @@ int main(int argc, char **argv, char **envp)
     /* spice needs the timers to be initialized by this point */
     qemu_spice_init();
 #endif
+    /* try to setup the qqq interface for syncing advance of the virtual
clock
+     * with an external simulator */
+    setup_qqq();

     cpu_ticks_init();
     if (icount_opts) {
-- 
1.9.1

--001a1140cd068ffb61052938eb5a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><br></div>This patch adds an interface via =
UNIX shared memory for pacing the execution of QEMU to match an external si=
mulation clock. The aim is to allow QEMU to be used as a module inside of a=
 larger simulation system. <br><br></div>The body of the patch is below.<br=
><br></div>Jim Nutaro (<a href=3D"mailto:nutaro@gmail.com">nutaro@gmail.com=
</a>)<br><div><br><div>From 0e0d352be2f91ed2df3526bc55753acfa97509e9 Mon Se=
p 17 00:00:00 2001<br>From: &quot;James J. Nutaro&quot; &lt;<a href=3D"mail=
to:nutarojj@ornl.gov">nutarojj@ornl.gov</a>&gt;<br>Date: Mon, 9 Nov 2015 12=
:36:06 -0500<br>Subject: [PATCH] QQQ is a module for pacing the rate of adv=
ance of the<br>=C2=A0computer clock in reference to an external simulation =
clock. The basic<br>=C2=A0approach used here is adapted from QBox from Gree=
n Socs (hence the name, Q?<br>=C2=A0Q? Q? - qqq!). Its intended use is to i=
ncorporate a complete software stack<br>=C2=A0into constructive simulation =
models. The solution proposed here assumes that<br>=C2=A0devices (NIC cards=
, serial ports, and other low level hardware) will be<br>=C2=A0modeled with=
in QEMU and connected to via a UNIX socket or some other<br>=C2=A0appropria=
te mechanism. Other pieces of equipment (e.g., electric motors,<br>=C2=A0co=
mmunication networks, quad coptors, robotic arms, ...) would be modeled in<=
br>=C2=A0some other simulation tool. Hence, I assume that the problem of ex=
changing<br>=C2=A0data can be solved using existing mechanisms within QEMU =
and that the only<br>=C2=A0remaining problem is time synchronization. This =
module addresses the time<br>=C2=A0synchronization problem.<br><br>There is=
 an example of how to use this module in the<br>adevs simulation package at=
 <a href=3D"http://sourceforge.net/projects/adevs/">http://sourceforge.net/=
projects/adevs/</a><br><br>The mode of operation is as follows:<br><br>The =
simulator creates a shared memory of size sizeof(int) that will be<br>used =
to exchange time advance information and writes a negative value<br>to that=
 shared memory segment. Then the simulator forks a process<br>to execute qe=
mu. Qemu attaches to this shared memory segment using<br>a key that include=
s the PID of the forked child (see qqq.c for the<br>expected shared memory =
key).<br><br>Qemu waits for a positive value to appear in the shared memory=
. Meanwhile<br>the simulator writes a positive value to indicate the maximu=
m time<br>advance that it allows to qemu. When qemu receives this positive =
value<br>it schedules a timer event for time advance microseconds in the fu=
ture.<br>A value of zero indicates that qemu should exit.<br><br>Now the si=
mulator spins on the shared memory value waiting for it to become<br>negati=
ve. When qemu executes the scheduled timer event, qemu writes a<br>negative=
 value indicating the actual time advanced. At this time, the simulator<br>=
is able to run again and this cycle is repeated until the simulation ends.<=
br><br>Authors:<br>=C2=A0 James Nutaro &lt;<a href=3D"mailto:nutarojj@ornl.=
gov">nutarojj@ornl.gov</a>&gt;<br>---<br>=C2=A0Makefile.target=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-<br>=C2=A0cpus=
.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 9 ++++-<br>=C2=A0include=
/qemu/thread.h=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 8 ++++<br>=C2=A0qqq.c=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 101 +++++++++++++++++++++++++++++++++++=
++++++++++++<br>=C2=A0qqq.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 =
67 +++++++++++++++++++++++++++++++<br>=C2=A0util/qemu-thread-posix.c |=C2=
=A0 14 +++++++<br>=C2=A0vl.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0=C2=A0 5 +++<br>=C2=A07 files changed, 204 insertions(+), 2 deletio=
ns(-)<br>=C2=A0create mode 100644 qqq.c<br>=C2=A0create mode 100644 qqq.h<b=
r><br>diff --git a/Makefile.target b/Makefile.target<br>index 962d004..8956=
afe 100644<br>--- a/Makefile.target<br>+++ b/Makefile.target<br>@@ -131,7 +=
131,7 @@ endif #CONFIG_BSD_USER<br>=C2=A0##################################=
#######################<br>=C2=A0# System emulator target<br>=C2=A0ifdef CO=
NFIG_SOFTMMU<br>-obj-y +=3D arch_init.o cpus.o monitor.o gdbstub.o balloon.=
o ioport.o numa.o<br>+obj-y +=3D arch_init.o qqq.o cpus.o monitor.o gdbstub=
.o balloon.o ioport.o numa.o<br>=C2=A0obj-y +=3D qtest.o bootdevice.o<br>=
=C2=A0obj-y +=3D hw/<br>=C2=A0obj-$(CONFIG_KVM) +=3D kvm-all.o<br>diff --gi=
t a/cpus.c b/cpus.c<br>index 877bd70..b040285 100644<br>--- a/cpus.c<br>+++=
 b/cpus.c<br>@@ -44,6 +44,8 @@<br>=C2=A0#include &quot;hw/nmi.h&quot;<br>=
=C2=A0#include &quot;sysemu/replay.h&quot;<br>=C2=A0<br>+#include &quot;qqq=
.h&quot;<br>+<br>=C2=A0#ifndef _WIN32<br>=C2=A0#include &quot;qemu/compatfd=
.h&quot;<br>=C2=A0#endif<br>@@ -998,7 +1000,12 @@ static void qemu_tcg_wait=
_io_event(CPUState *cpu)<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* S=
tart accounting real time to the virtual clock if the CPUs<br>=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 are idle.=C2=A0 */<br>=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qemu_clock_warp(QEMU_CLOCK_VI=
RTUAL);<br>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qemu_cond_wait(cpu-&=
gt;halt_cond, &amp;qemu_global_mutex);<br>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 /* If qqq is running then this wait must timeout so that the<br>+=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * simulation does not become stuck =
when the cpu idles */<br>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (qq=
q_enabled())<br>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 qemu_cond_wait_timeout_ns(cpu-&gt;halt_cond, &amp;qemu_global_mut=
ex, 10000);<br>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else<br>+=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qemu_cond_wait=
(cpu-&gt;halt_cond, &amp;qemu_global_mutex);<br>=C2=A0=C2=A0=C2=A0=C2=A0 }<=
br>=C2=A0<br>=C2=A0=C2=A0=C2=A0=C2=A0 while (iothread_requesting_mutex) {<b=
r>diff --git a/include/qemu/thread.h b/include/qemu/thread.h<br>index 5114e=
c8..c0f6009 100644<br>--- a/include/qemu/thread.h<br>+++ b/include/qemu/thr=
ead.h<br>@@ -36,6 +36,14 @@ void qemu_cond_destroy(QemuCond *cond);<br>=C2=
=A0void qemu_cond_signal(QemuCond *cond);<br>=C2=A0void qemu_cond_broadcast=
(QemuCond *cond);<br>=C2=A0void qemu_cond_wait(QemuCond *cond, QemuMutex *m=
utex);<br>+/* This defaults to qemu_cond_wait() on Windows */<br>+#ifndef _=
WIN32<br>+void qemu_cond_wait_timeout_ns(QemuCond *cond, QemuMutex *mutex, =
int64_t timeout_ns);<br>+#else<br>+void qemu_cond_wait_timeout_ns(QemuCond =
*cond, QemuMutex *mutex, int64_t timeout_ns) {<br>+=C2=A0 qemu_cond_wait(co=
nd,mutex);<br>+}<br>+#endif<br>=C2=A0<br>=C2=A0void qemu_sem_init(QemuSemap=
hore *sem, int init);<br>=C2=A0void qemu_sem_post(QemuSemaphore *sem);<br>d=
iff --git a/qqq.c b/qqq.c<br>new file mode 100644<br>index 0000000..5c2a786=
<br>--- /dev/null<br>+++ b/qqq.c<br>@@ -0,0 +1,101 @@<br>+<br>+/* This is a=
 Linux only feature */<br>+<br>+#ifndef _WIN32<br>+ <br>+#include &quot;qem=
u/main-loop.h&quot;<br>+#include &quot;qemu/timer.h&quot;<br>+#include &quo=
t;qemu/thread.h&quot;<br>+#include &quot;sysemu/cpus.h&quot;<br>+#include &=
lt;stdio.h&gt;<br>+#include &lt;errno.h&gt;<br>+#include &lt;sys/mman.h&gt;=
<br>+#include &lt;sys/stat.h&gt; <br>+#include &lt;sys/types.h&gt;<br>+#inc=
lude &lt;fcntl.h&gt;<br>+#include &lt;assert.h&gt;<br>+#include &lt;unistd.=
h&gt;<br>+#include &lt;pthread.h&gt;<br>+#include &quot;qqq.h&quot;<br>+<br=
>+/* Shared memory data */<br>+static void* shm =3D NULL;<br>+static int64_=
t t =3D 0;<br>+static QEMUTimer* sync_timer =3D NULL;<br>+<br>+static void =
write_mem_value(int val)<br>+{<br>+=C2=A0 /* I AM ASSUMING THE MEMORY WRITE=
 WILL BE ATOMIC AND WILL<br>+=C2=A0=C2=A0 * NOT BE CACHED */<br>+=C2=A0 (*(=
(volatile int*)shm)) =3D val;<br>+}<br>+<br>+static int read_mem_value(void=
)<br>+{<br>+=C2=A0 /* I AM ASSUMING THE MEMORY READ WILL BE ATOMIC AND WILL=
<br>+=C2=A0=C2=A0 * NOT BE CACHED */<br>+=C2=A0 return (*((volatile int*)sh=
m));<br>+}<br>+<br>+static void schedule_next_event(void)<br>+{<br>+=C2=A0 =
int time_advance;<br>+=C2=A0 /* Get the time advance allowed by the simulat=
or. This is provided<br>+=C2=A0=C2=A0 * as a positive value that is written=
 by the simulator to the<br>+=C2=A0=C2=A0 * shared memory location. */<br>+=
=C2=A0 while ((time_advance =3D read_mem_value()) &lt; 0);<br>+=C2=A0 /* A =
zero time advance is an instruction to shutdown */<br>+=C2=A0 if (time_adva=
nce =3D=3D 0)<br>+=C2=A0 {<br>+=C2=A0=C2=A0=C2=A0 munmap(shm,sizeof(int));<=
br>+=C2=A0=C2=A0=C2=A0 exit(0);<br>+=C2=A0 }<br>+=C2=A0 /* Schedule the nex=
t syncronization point */<br>+=C2=A0 timer_mod(sync_timer,t+time_advance);<=
br>+}<br>+<br>+static void sync_func(void* data)<br>+{<br>+=C2=A0 /* Report=
 the actual elapsed time. The value written will be<br>+=C2=A0=C2=A0 * -(el=
apsed time), and the simulator will recognized the negative<br>+=C2=A0=C2=
=A0 * value as a signal that the write has been done. */<br>+=C2=A0 int64_t=
 tnow =3D qemu_clock_get_us(QEMU_CLOCK_VIRTUAL);<br>+=C2=A0 int usecs =3D t=
now-t;<br>+=C2=A0 write_mem_value((usecs &gt; 0) ? -usecs : -1);<br>+=C2=A0=
 /* Update our time of last event */<br>+=C2=A0 t =3D tnow;<br>+=C2=A0 /* S=
chedule the next event */<br>+=C2=A0 schedule_next_event();<br>+}<br>+<br>+=
bool qqq_enabled(void) { return (shm !=3D NULL); }<br>+<br>+void setup_qqq(=
void)<br>+{<br>+=C2=A0 char shm_key[100];<br>+=C2=A0 /* Attach to the share=
d memory region */<br>+=C2=A0 sprintf(shm_key,&quot;/qemu_%d&quot;,getpid()=
);<br>+=C2=A0 errno =3D 0;<br>+=C2=A0 int fd =3D shm_open(shm_key,O_RDWR,S_=
IRWXU);<br>+=C2=A0 if (fd =3D=3D -1)<br>+=C2=A0 {<br>+=C2=A0=C2=A0=C2=A0 pe=
rror(&quot;Could not open shared memory, qqq not enabled&quot;);<br>+=C2=A0=
=C2=A0=C2=A0 return;<br>+=C2=A0 }<br>+=C2=A0 shm =3D mmap(NULL,sizeof(int),=
PROT_READ|PROT_WRITE,MAP_SHARED,fd,0);<br>+=C2=A0 if (shm =3D=3D NULL)<br>+=
=C2=A0 {<br>+=C2=A0=C2=A0=C2=A0 perror(&quot;Could not map shared memory, q=
qq not enabled&quot;);<br>+=C2=A0=C2=A0=C2=A0 shm_unlink(shm_key);<br>+=C2=
=A0=C2=A0=C2=A0 return;<br>+=C2=A0 }<br>+=C2=A0 /* Done with the shared mem=
ory file handle */<br>+=C2=A0 close(fd);<br>+=C2=A0 shm_unlink(shm_key);<br=
>+=C2=A0 /* Start the timer to ensure time warps advance the clock */<br>+=
=C2=A0 sync_timer =3D timer_new_us(QEMU_CLOCK_VIRTUAL,sync_func,NULL);<br>+=
=C2=A0 /* Get the time advance that is requested by the simulation */<br>+=
=C2=A0 schedule_next_event();<br>+}<br>+<br>+#endif<br>diff --git a/qqq.h b=
/qqq.h<br>new file mode 100644<br>index 0000000..687a9f3<br>--- /dev/null<b=
r>+++ b/qqq.h<br>@@ -0,0 +1,67 @@<br>+/*<br>+ * A module for pacing the rat=
e of advance of the computer clock<br>+ * in reference to an external simul=
ation clock. The basic approach<br>+ * used here is adapted from QBox from =
Green Socs (hence the name, Q?<br>+ * Q? Q? - qqq!). The basic mode of oper=
ation is as follows:<br>+ *<br>+ * The simulator creates a shared memory of=
 size sizeof(int) that will be<br>+ * used to exchange time advance informa=
tion, writes a negative value<br>+ * to that shared memory segment, and the=
n forks a process<br>+ * to execute qemu. Qemu attaches to this shared memo=
ry segment using<br>+ * a key that includes the PID of the forked child (se=
e qqq.c for the<br>+ * expected shared memory key).<br>+ *<br>+ * Qemu wait=
s for a positive to appear in the shared memory. Meanwhile<br>+ * the simul=
ator writes a positive value to indicate the maximum time<br>+ * advance th=
at it allows to qemu. When qemu receives this positive value<br>+ * it sche=
dules a timer event for time advance microseconds in the future.<br>+ * <br=
>+ * Now the simulator spins on the shared memory value waiting for it to b=
ecome <br>+ * negative. When qemu executes the scheduled timer event, qemu =
writes a <br>+ * negative value indicating the actual time advanced. At thi=
s time, the simulator<br>+ * is able to run again and this cycle is repeate=
d until the simulation ends.<br>+ *<br>+ * Authors:<br>+ *=C2=A0=C2=A0 Jame=
s Nutaro &lt;<a href=3D"mailto:nutarojj@ornl.gov">nutarojj@ornl.gov</a>&gt;=
<br>+ *<br>+ * This work is licensed under the terms of the GNU GPL, versio=
n 2.=C2=A0 See<br>+ * the COPYING file in the top-level directory.<br>+ *=
=C2=A0=C2=A0 <br>+ */<br>+#ifndef QQQ_H<br>+#define QQQ_H<br>+<br>+/* This =
is a Linux only feature */<br>+<br>+#ifdef _WIN32<br>+<br>+/* Windows funct=
ions that do nothing */<br>+static inline bool qqq_enabled(void) { return f=
alse; }<br>+static inline void setup_qqq(void){}<br>+<br>+#else<br>+<br>+/*=
 The Linux implementation */<br>+ <br>+#include &quot;qemu/main-loop.h&quot=
;<br>+#include &quot;qemu/timer.h&quot;<br>+#include &quot;qemu/thread.h&qu=
ot;<br>+#include &quot;sysemu/cpus.h&quot;<br>+#include &lt;stdio.h&gt;<br>=
+#include &lt;errno.h&gt;<br>+#include &lt;sys/mman.h&gt;<br>+#include &lt;=
sys/stat.h&gt; <br>+#include &lt;sys/types.h&gt;<br>+#include &lt;fcntl.h&g=
t;<br>+#include &lt;assert.h&gt;<br>+#include &lt;unistd.h&gt;<br>+#include=
 &lt;pthread.h&gt;<br>+<br>+void setup_qqq(void);<br>+/* Returns true if qq=
q is enabled and false otherwise.<br>+ * It will be enabled only if setup_q=
qq() is able to<br>+ * attach to the shared memory segment. */<br>+bool qqq=
_enabled(void);<br>+<br>+#endif<br>+#endif<br>diff --git a/util/qemu-thread=
-posix.c b/util/qemu-thread-posix.c<br>index dbd8094..c6396c4 100644<br>---=
 a/util/qemu-thread-posix.c<br>+++ b/util/qemu-thread-posix.c<br>@@ -134,6 =
+134,20 @@ void qemu_cond_wait(QemuCond *cond, QemuMutex *mutex)<br>=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 error_exit(err, __func__);<br>=
=C2=A0}<br>=C2=A0<br>+void qemu_cond_wait_timeout_ns(QemuCond *cond, QemuMu=
tex *mutex, int64_t timeout_ns)<br>+{<br>+=C2=A0=C2=A0=C2=A0 static const l=
ong ns_sec =3D 1000000000LL;<br>+=C2=A0=C2=A0=C2=A0 struct timeval tv;<br>+=
=C2=A0=C2=A0=C2=A0 struct timespec ts;<br>+=C2=A0=C2=A0=C2=A0 int err;<br>+=
=C2=A0=C2=A0=C2=A0 gettimeofday(&amp;tv, NULL);<br>+=C2=A0=C2=A0=C2=A0 ts.t=
v_sec =3D tv.tv_sec + (timeout_ns + tv.tv_usec*1000) / ns_sec;<br>+=C2=A0=
=C2=A0=C2=A0 ts.tv_nsec =3D (timeout_ns + tv.tv_usec*1000) % ns_sec;<br>+=
=C2=A0=C2=A0=C2=A0 err =3D pthread_cond_timedwait(&amp;cond-&gt;cond, &amp;=
mutex-&gt;lock, &amp;ts);<br>+=C2=A0=C2=A0=C2=A0 if (err !=3D 0 &amp;&amp; =
err !=3D ETIMEDOUT)<br>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 error_ex=
it(err, __func__);<br>+}<br>+<br>=C2=A0void qemu_sem_init(QemuSemaphore *se=
m, int init)<br>=C2=A0{<br>=C2=A0=C2=A0=C2=A0=C2=A0 int rc;<br>diff --git a=
/vl.c b/vl.c<br>index 21e8876..8a2facc 100644<br>--- a/vl.c<br>+++ b/vl.c<b=
r>@@ -125,6 +125,8 @@ int main(int argc, char **argv)<br>=C2=A0#include &qu=
ot;sysemu/replay.h&quot;<br>=C2=A0#include &quot;qapi/qmp/qerror.h&quot;<br=
>=C2=A0<br>+#include &quot;qqq.h&quot;<br>+<br>=C2=A0#define MAX_VIRTIO_CON=
SOLES 1<br>=C2=A0#define MAX_SCLP_CONSOLES 1<br>=C2=A0<br>@@ -4402,6 +4404,=
9 @@ int main(int argc, char **argv, char **envp)<br>=C2=A0=C2=A0=C2=A0=C2=
=A0 /* spice needs the timers to be initialized by this point */<br>=C2=A0=
=C2=A0=C2=A0=C2=A0 qemu_spice_init();<br>=C2=A0#endif<br>+=C2=A0=C2=A0=C2=
=A0 /* try to setup the qqq interface for syncing advance of the virtual cl=
ock<br>+=C2=A0=C2=A0=C2=A0=C2=A0 * with an external simulator */<br>+=C2=A0=
=C2=A0=C2=A0 setup_qqq();<br>=C2=A0<br>=C2=A0=C2=A0=C2=A0=C2=A0 cpu_ticks_i=
nit();<br>=C2=A0=C2=A0=C2=A0=C2=A0 if (icount_opts) {<br>-- <br>1.9.1<br><b=
r><br><br></div></div></div>

--001a1140cd068ffb61052938eb5a--

