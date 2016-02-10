Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aTVQA-0004Vx-Vc
	for mharc-qemu-trivial@gnu.org; Wed, 10 Feb 2016 09:07:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58425)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cov@codeaurora.org>) id 1aTVQ4-0004Nq-9z
	for qemu-trivial@nongnu.org; Wed, 10 Feb 2016 09:07:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cov@codeaurora.org>) id 1aTVPw-0001Bz-DG
	for qemu-trivial@nongnu.org; Wed, 10 Feb 2016 09:07:00 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:33883)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cov@codeaurora.org>)
	id 1aTVPq-0001BK-6c; Wed, 10 Feb 2016 09:06:46 -0500
Received: from smtp.codeaurora.org (localhost [127.0.0.1])
	by smtp.codeaurora.org (Postfix) with ESMTP id 7DE0D60246;
	Wed, 10 Feb 2016 14:06:45 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id 4F2E260351; Wed, 10 Feb 2016 14:06:45 +0000 (UTC)
Received: from keeshans.qualcomm.com (global_nat1_iad_fw.qualcomm.com
	[129.46.232.65])
	(using TLSv1.1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: cov@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 087A760246;
	Wed, 10 Feb 2016 14:06:40 +0000 (UTC)
From: Christopher Covington <cov@codeaurora.org>
To: 
Date: Wed, 10 Feb 2016 09:06:32 -0500
Message-Id: <1455113192-27139-1-git-send-email-cov@codeaurora.org>
X-Mailer: git-send-email 1.8.1.1
X-Virus-Scanned: ClamAV using ClamSMTP
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 198.145.29.96
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Aaron Lindsay <alindsay@codeaurora.org>, qemu-trivial@nongnu.org,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>, qemu-devel@nongnu.org,
	Alistair Francis <alistair.francis@xilinx.com>,
	Christopher Covington <cov@codeaurora.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Subject: [Qemu-trivial] [PATCH] Rename cpu_get_icount_{locked,biased}
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
X-List-Received-Date: Wed, 10 Feb 2016 14:07:06 -0000

The function does not provide locking but rather adds a bias value.

Signed-off-by: Christopher Covington <cov@codeaurora.org>
---
 cpus.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/cpus.c b/cpus.c
index 898426c..50403c4 100644
--- a/cpus.c
+++ b/cpus.c
@@ -164,7 +164,7 @@ int64_t cpu_get_icount_raw(void)
 }
 
 /* Return the virtual CPU time, based on the instruction counter.  */
-static int64_t cpu_get_icount_locked(void)
+static int64_t cpu_get_icount_biased(void)
 {
     int64_t icount = cpu_get_icount_raw();
     return timers_state.qemu_icount_bias + cpu_icount_to_ns(icount);
@@ -177,7 +177,7 @@ int64_t cpu_get_icount(void)
 
     do {
         start = seqlock_read_begin(&timers_state.vm_clock_seqlock);
-        icount = cpu_get_icount_locked();
+        icount = cpu_get_icount_biased();
     } while (seqlock_read_retry(&timers_state.vm_clock_seqlock, start));
 
     return icount;
@@ -293,7 +293,7 @@ static void icount_adjust(void)
 
     seqlock_write_lock(&timers_state.vm_clock_seqlock);
     cur_time = cpu_get_clock_locked();
-    cur_icount = cpu_get_icount_locked();
+    cur_icount = cpu_get_icount_biased();
 
     delta = cur_icount - cur_time;
     /* FIXME: This is a very crude algorithm, somewhat prone to oscillation.  */
@@ -356,7 +356,7 @@ static void icount_warp_rt(void)
              * In adaptive mode, do not let QEMU_CLOCK_VIRTUAL run too
              * far ahead of real time.
              */
-            int64_t cur_icount = cpu_get_icount_locked();
+            int64_t cur_icount = cpu_get_icount_biased();
             int64_t delta = clock - cur_icount;
             warp_delta = MIN(warp_delta, delta);
         }
-- 
Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project


