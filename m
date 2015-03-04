Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YTHHk-0002Gm-3G
	for mharc-qemu-trivial@gnu.org; Wed, 04 Mar 2015 16:56:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39871)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YTHHd-00022T-8b
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 16:56:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YTHHY-0008PY-Pw
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 16:56:49 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:58924)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YTHHM-0008LH-Ns; Wed, 04 Mar 2015 16:56:32 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 4EC834095E;
	Thu,  5 Mar 2015 00:56:31 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 8B7FB950;
	Wed,  4 Mar 2015 20:07:08 +0300 (MSK)
Received: (nullmailer pid 17532 invoked by uid 1000);
	Wed, 04 Mar 2015 17:07:05 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Wed,  4 Mar 2015 20:06:41 +0300
Message-Id: <712534385e5357818e4ff8a92b8b9156547b4576.1425488753.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1425488753.git.mjt@msgid.tls.msk.ru>
References: <cover.1425488753.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Thomas Huth <thuth@linux.vnet.ibm.com>
Subject: [Qemu-trivial] [PULL 24/47] ui/vnc: Remove vnc_stop_worker_thread()
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
X-List-Received-Date: Wed, 04 Mar 2015 21:56:54 -0000

From: Thomas Huth <thuth@linux.vnet.ibm.com>

This function is not used anymore, let's remove it.

Signed-off-by: Thomas Huth <thuth@linux.vnet.ibm.com>
Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 ui/vnc-jobs.c | 13 -------------
 ui/vnc-jobs.h |  1 -
 2 files changed, 14 deletions(-)

diff --git a/ui/vnc-jobs.c b/ui/vnc-jobs.c
index 68f3d77..c8ee203 100644
--- a/ui/vnc-jobs.c
+++ b/ui/vnc-jobs.c
@@ -342,16 +342,3 @@ void vnc_start_worker_thread(void)
                        QEMU_THREAD_DETACHED);
     queue = q; /* Set global queue */
 }
-
-void vnc_stop_worker_thread(void)
-{
-    if (!vnc_worker_thread_running())
-        return ;
-
-    /* Remove all jobs and wake up the thread */
-    vnc_lock_queue(queue);
-    queue->exit = true;
-    vnc_unlock_queue(queue);
-    vnc_jobs_clear(NULL);
-    qemu_cond_broadcast(&queue->cond);
-}
diff --git a/ui/vnc-jobs.h b/ui/vnc-jobs.h
index 31da103..044bf9f 100644
--- a/ui/vnc-jobs.h
+++ b/ui/vnc-jobs.h
@@ -40,7 +40,6 @@ void vnc_jobs_join(VncState *vs);
 
 void vnc_jobs_consume_buffer(VncState *vs);
 void vnc_start_worker_thread(void);
-void vnc_stop_worker_thread(void);
 
 /* Locks */
 static inline int vnc_trylock_display(VncDisplay *vd)
-- 
2.1.4


