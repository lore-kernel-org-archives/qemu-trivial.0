Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TOrdc-00034q-Kb
	for mharc-qemu-trivial@gnu.org; Thu, 18 Oct 2012 11:03:56 -0400
Received: from eggs.gnu.org ([208.118.235.92]:49229)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1TOrdW-0002lZ-Am
	for qemu-trivial@nongnu.org; Thu, 18 Oct 2012 11:03:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1TOrdR-0004iC-LQ
	for qemu-trivial@nongnu.org; Thu, 18 Oct 2012 11:03:50 -0400
Received: from 38.0.169.217.in-addr.arpa ([217.169.0.38]:44423
	helo=mnementh.archaic.org.uk) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1TOrdH-0004bu-B5; Thu, 18 Oct 2012 11:03:35 -0400
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.72)
	(envelope-from <pm215@archaic.org.uk>)
	id 1TOrdE-0006Jr-HZ; Thu, 18 Oct 2012 16:03:32 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Thu, 18 Oct 2012 16:03:32 +0100
Message-Id: <1350572612-24268-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 217.169.0.38
Cc: qemu-trivial@nongnu.org, patches@linaro.org
Subject: [Qemu-trivial] [PATCH] ui/vnc-jobs.c: Fix minor typos in comments
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
X-List-Received-Date: Thu, 18 Oct 2012 15:03:54 -0000

Fix some minor typos/grammar errors in comments.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 ui/vnc-jobs.c |   16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/ui/vnc-jobs.c b/ui/vnc-jobs.c
index 087b84d..84b074e 100644
--- a/ui/vnc-jobs.c
+++ b/ui/vnc-jobs.c
@@ -33,21 +33,21 @@
 /*
  * Locking:
  *
- * There is three levels of locking:
+ * There are three levels of locking:
  * - jobs queue lock: for each operation on the queue (push, pop, isEmpty?)
  * - VncDisplay global lock: mainly used for framebuffer updates to avoid
  *                      screen corruption if the framebuffer is updated
- *			while the worker is doing something.
+ *                      while the worker is doing something.
  * - VncState::output lock: used to make sure the output buffer is not corrupted
- * 		   	 if two threads try to write on it at the same time
+ *                          two threads try to write on it at the same time
  *
- * While the VNC worker thread is working, the VncDisplay global lock is hold
- * to avoid screen corruptions (this does not block vnc_refresh() because it
- * uses trylock()) but the output lock is not hold because the thread work on
+ * While the VNC worker thread is working, the VncDisplay global lock is held
+ * to avoid screen corruption (this does not block vnc_refresh() because it
+ * uses trylock()) but the output lock is not held because the thread works on
  * its own output buffer.
  * When the encoding job is done, the worker thread will hold the output lock
  * and copy its output buffer in vs->output.
-*/
+ */
 
 struct VncJobQueue {
     QemuCond cond;
@@ -62,7 +62,7 @@ typedef struct VncJobQueue VncJobQueue;
 
 /*
  * We use a single global queue, but most of the functions are
- * already reetrant, so we can easilly add more than one encoding thread
+ * already reentrant, so we can easily add more than one encoding thread
  */
 static VncJobQueue *queue;
 
-- 
1.7.9.5


