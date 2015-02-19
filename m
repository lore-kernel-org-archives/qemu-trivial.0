Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YOUei-0005xm-J1
	for mharc-qemu-trivial@gnu.org; Thu, 19 Feb 2015 12:12:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37117)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1YOUeb-0005kq-7C
	for qemu-trivial@nongnu.org; Thu, 19 Feb 2015 12:12:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1YOUeM-0007Ln-Pj
	for qemu-trivial@nongnu.org; Thu, 19 Feb 2015 12:12:45 -0500
Received: from e06smtp10.uk.ibm.com ([195.75.94.106]:55663)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1YOUeM-0007Kp-HC
	for qemu-trivial@nongnu.org; Thu, 19 Feb 2015 12:12:30 -0500
Received: from /spool/local
	by e06smtp10.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <thuth@linux.vnet.ibm.com>;
	Thu, 19 Feb 2015 17:12:29 -0000
Received: from d06dlp03.portsmouth.uk.ibm.com (9.149.20.15)
	by e06smtp10.uk.ibm.com (192.168.101.140) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Thu, 19 Feb 2015 17:12:26 -0000
Received: from b06cxnps4075.portsmouth.uk.ibm.com
	(d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
	by d06dlp03.portsmouth.uk.ibm.com (Postfix) with ESMTP id 5F8141B08069; 
	Thu, 19 Feb 2015 17:12:39 +0000 (GMT)
Received: from d06av04.portsmouth.uk.ibm.com (d06av04.portsmouth.uk.ibm.com
	[9.149.37.216])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id t1JHCQmm10486038; Thu, 19 Feb 2015 17:12:26 GMT
Received: from d06av04.portsmouth.uk.ibm.com (localhost [127.0.0.1])
	by d06av04.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with
	ESMTP id t1JHCPRT013672; Thu, 19 Feb 2015 10:12:25 -0700
Received: from oc7435384737.ibm.com (dyn-9-152-224-69.boeblingen.de.ibm.com
	[9.152.224.69])
	by d06av04.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with
	ESMTP id t1JHCNs6013629; Thu, 19 Feb 2015 10:12:24 -0700
From: Thomas Huth <thuth@linux.vnet.ibm.com>
To: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Date: Thu, 19 Feb 2015 18:12:21 +0100
Message-Id: <1424365943-27563-4-git-send-email-thuth@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1424365943-27563-1-git-send-email-thuth@linux.vnet.ibm.com>
References: <1424365943-27563-1-git-send-email-thuth@linux.vnet.ibm.com>
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 15021917-0041-0000-0000-0000034F13C1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.75.94.106
Cc: Thomas Huth <thuth@linux.vnet.ibm.com>,
	Anthony Liguori <aliguori@amazon.com>, Gerd Hoffmann <kraxel@redhat.com>
Subject: [Qemu-trivial] [PATCH 3/5] ui/vnc: Remove vnc_stop_worker_thread()
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
X-List-Received-Date: Thu, 19 Feb 2015 17:12:48 -0000

This function is not used anymore, let's remove it.

Signed-off-by: Thomas Huth <thuth@linux.vnet.ibm.com>
Cc: Anthony Liguori <aliguori@amazon.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
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


