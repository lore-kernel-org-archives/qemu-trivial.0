Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RoeW8-0003Q2-8Z
	for mharc-qemu-trivial@gnu.org; Sat, 21 Jan 2012 12:14:16 -0500
Received: from eggs.gnu.org ([140.186.70.92]:57117)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdroth@linux.vnet.ibm.com>) id 1RoeW5-0003Pu-B2
	for qemu-trivial@nongnu.org; Sat, 21 Jan 2012 12:14:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mdroth@linux.vnet.ibm.com>) id 1RoeW3-0003mZ-VA
	for qemu-trivial@nongnu.org; Sat, 21 Jan 2012 12:14:13 -0500
Received: from mout.perfora.net ([74.208.4.195]:61985)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdroth@linux.vnet.ibm.com>)
	id 1RoeW3-0003mP-L9; Sat, 21 Jan 2012 12:14:11 -0500
Received: from illuin.morrigu.org (adsl-99-62-40-129.dsl.aus2tx.sbcglobal.net
	[99.62.40.129])
	by mrelay.perfora.net (node=mrus2) with ESMTP (Nemesis)
	id 0MOOMv-1RlcEr43k5-005nfI; Sat, 21 Jan 2012 12:14:09 -0500
From: Michael Roth <mdroth@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Date: Sat, 21 Jan 2012 11:13:53 -0600
Message-Id: <1327166033-17922-1-git-send-email-mdroth@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1327108107-16600-1-git-send-email-mdroth@linux.vnet.ibm.com>
References: <1327108107-16600-1-git-send-email-mdroth@linux.vnet.ibm.com>
X-Provags-ID: V02:K0:FA9I5r+6AbFzaa+cd1bhPyNMyHnAUd2wJHqZsSOeHYW
	D96lWyvqUU0E34c63Hyz4GVR4tW/vmVwWAUmfvBFBL1cMljt09
	yIgpcttXkDesLE7deRUKWjAdwIvGkYHI/VD25tHtsjeBaIGJkP
	Oz1HsxVWphAJ+XOr1AqFh+wW8d18UfpGVzvrIQSydqsVp2/PIn
	WI/0shLB3YiJ+tAuJai97ZfEX5iCfhPF+wT9tmH4lCK78yHQRh
	9JHanNqV8YI5wUi6Q5oHfypFlLAKMuBgbFMKEuKdLbo1Yi8KG+
	FM27FCN9hHaL2hAQ3LYWcEvgHIOHOim6RN2S9ObRH9w4NVZ+aX
	Vo/eLyqy8YrfCS59SAoiuwsVdT5PPaxkRiFTdOb8nUONfSLugK
	M7T7Q4rYH/TYastRnwMIA3BfDGyd40X/mo=
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 74.208.4.195
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com
Subject: [Qemu-trivial] [PATCH] main-loop: For tools,
	initialize timers as part of qemu_init_main_loop()
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
X-List-Received-Date: Sat, 21 Jan 2012 17:14:14 -0000

In some cases initializing the alarm timers can lead to non-negligable
overhead from programs that link against qemu-tool.o. At least,
setting a max-resolution WinMM alarm timer via mm_start_timer() (the
current default for Windows) can increase the "tick rate" on Windows
OSs and affect frequency scaling, and in the case of tools that run
in guest OSs such has qemu-ga, the impact can be fairly dramatic
(+20%/20% user/sys time on a core 2 processor was observed from an idle
Windows XP guest).

This patch doesn't address the issue directly (not sure what a good
solution would be for Windows, or what other situations it might be
noticeable), but it at least limits the scope of the issue to programs
that "opt-in" to using the main-loop.c functions by only enabling alarm
timers when qemu_init_main_loop() is called, which is already required
to make use of those facilities, so existing users shouldn't be
affected.

Signed-off-by: Michael Roth <mdroth@linux.vnet.ibm.com>
---
 main-loop.c |    2 +-
 main-loop.h |   12 ++++++++++++
 qemu-tool.c |    3 ++-
 vl.c        |    5 +++++
 4 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/main-loop.c b/main-loop.c
index 62d95b9..db23de0 100644
--- a/main-loop.c
+++ b/main-loop.c
@@ -199,7 +199,7 @@ static int qemu_signal_init(void)
 }
 #endif
 
-int qemu_init_main_loop(void)
+int main_loop_init(void)
 {
     int ret;
 
diff --git a/main-loop.h b/main-loop.h
index f971013..4987041 100644
--- a/main-loop.h
+++ b/main-loop.h
@@ -41,10 +41,22 @@
  * SIGUSR2, thread signals (SIGFPE, SIGILL, SIGSEGV, SIGBUS) and real-time
  * signals if available.  Remember that Windows in practice does not have
  * signals, though.
+ *
+ * In the case of QEMU tools, this will also start/initialize timers.
  */
 int qemu_init_main_loop(void);
 
 /**
+ * main_loop_init: Initializes main loop
+ *
+ * Internal (but shared for compatibility reasons) initialization routine
+ * for the main loop. This should not be used by applications directly,
+ * use qemu_init_main_loop() instead.
+ *
+ */
+int main_loop_init(void);
+
+/**
  * main_loop_wait: Run one iteration of the main loop.
  *
  * If @nonblocking is true, poll for events, otherwise suspend until
diff --git a/qemu-tool.c b/qemu-tool.c
index 6b69668..183a583 100644
--- a/qemu-tool.c
+++ b/qemu-tool.c
@@ -83,11 +83,12 @@ void qemu_clock_warp(QEMUClock *clock)
 {
 }
 
-static void __attribute__((constructor)) init_main_loop(void)
+int qemu_init_main_loop(void)
 {
     init_clocks();
     init_timer_alarm();
     qemu_clock_enable(vm_clock, false);
+    return main_loop_init();
 }
 
 void slirp_select_fill(int *pnfds, fd_set *readfds,
diff --git a/vl.c b/vl.c
index ba55b35..74a47e6 100644
--- a/vl.c
+++ b/vl.c
@@ -2136,6 +2136,11 @@ static void free_and_trace(gpointer mem)
     free(mem);
 }
 
+int qemu_init_main_loop(void)
+{
+    return main_loop_init();
+}
+
 int main(int argc, char **argv, char **envp)
 {
     const char *gdbstub_dev = NULL;
-- 
1.7.4.1


