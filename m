Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YQyUX-00020J-7E
	for mharc-qemu-trivial@gnu.org; Thu, 26 Feb 2015 08:28:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57150)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1YQyUN-0001eM-HB
	for qemu-trivial@nongnu.org; Thu, 26 Feb 2015 08:28:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1YQyUC-0007dz-A7
	for qemu-trivial@nongnu.org; Thu, 26 Feb 2015 08:28:27 -0500
Received: from e06smtp15.uk.ibm.com ([195.75.94.111]:41639)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1YQyUC-0007cj-1S
	for qemu-trivial@nongnu.org; Thu, 26 Feb 2015 08:28:16 -0500
Received: from /spool/local
	by e06smtp15.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <thuth@linux.vnet.ibm.com>;
	Thu, 26 Feb 2015 13:28:14 -0000
Received: from d06dlp03.portsmouth.uk.ibm.com (9.149.20.15)
	by e06smtp15.uk.ibm.com (192.168.101.145) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Thu, 26 Feb 2015 13:28:11 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com
	(d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
	by d06dlp03.portsmouth.uk.ibm.com (Postfix) with ESMTP id 01A7E1B08074; 
	Thu, 26 Feb 2015 13:28:27 +0000 (GMT)
Received: from d06av04.portsmouth.uk.ibm.com (d06av04.portsmouth.uk.ibm.com
	[9.149.37.216])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id t1QDSBlj11796882; Thu, 26 Feb 2015 13:28:11 GMT
Received: from d06av04.portsmouth.uk.ibm.com (localhost [127.0.0.1])
	by d06av04.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with
	ESMTP id t1QDSAge032688; Thu, 26 Feb 2015 06:28:10 -0700
Received: from oc7435384737.ibm.com (sig-9-79-14-249.uk.ibm.com [9.79.14.249])
	by d06av04.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with
	ESMTP id t1QDS8Wt032630; Thu, 26 Feb 2015 06:28:10 -0700
From: Thomas Huth <thuth@linux.vnet.ibm.com>
To: qemu-trivial@nongnu.org
Date: Thu, 26 Feb 2015 14:28:07 +0100
Message-Id: <1424957288-24408-3-git-send-email-thuth@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1424957288-24408-1-git-send-email-thuth@linux.vnet.ibm.com>
References: <1424957288-24408-1-git-send-email-thuth@linux.vnet.ibm.com>
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 15022613-0021-0000-0000-00000306B630
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.75.94.111
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@linux.vnet.ibm.com>
Subject: [Qemu-trivial] [PATCH 2/3] ui/vnc: Remove vnc_stop_worker_thread()
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
X-List-Received-Date: Thu, 26 Feb 2015 13:28:35 -0000

This function is not used anymore, let's remove it.

Signed-off-by: Thomas Huth <thuth@linux.vnet.ibm.com>
Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/vnc-jobs.c |   13 -------------
 ui/vnc-jobs.h |    1 -
 2 files changed, 0 insertions(+), 14 deletions(-)

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
1.7.1


