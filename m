Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jtvEa-0005eA-46
	for mharc-qemu-trivial@gnu.org; Fri, 10 Jul 2020 11:46:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wentong.wu@intel.com>)
 id 1jtvEV-0005bh-Le; Fri, 10 Jul 2020 11:46:39 -0400
Received: from mga06.intel.com ([134.134.136.31]:41018)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wentong.wu@intel.com>)
 id 1jtvET-0008Qq-2L; Fri, 10 Jul 2020 11:46:39 -0400
IronPort-SDR: Iv8Ru4CMog5ZsfQgUuHPnzxu3bqrznBqdnCHT5UIE+HnLDzehmWIY+ko2028B2g17LyrMRW3vj
 BXKs5kxmJS7Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9678"; a="209754753"
X-IronPort-AV: E=Sophos;i="5.75,336,1589266800"; d="scan'208";a="209754753"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2020 08:46:34 -0700
IronPort-SDR: TQRhjWwWId/AWMmXjERSCPjmdXHso115aC8naLI78bJsJlzur2rABZgZ1ZFDubgQfaf+s0OBuh
 YRQkRYqRHhUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,336,1589266800"; d="scan'208";a="484686394"
Received: from unknown (HELO localhost.localdomain.sh.intel.com)
 ([10.239.153.142])
 by fmsmga005.fm.intel.com with ESMTP; 10 Jul 2020 08:46:32 -0700
From: Wentong Wu <wentong.wu@intel.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: qemu-trivial@nongnu.org, crwulff@gmail.com, marex@denx.de,
 Wentong Wu <wentong.wu@intel.com>
Subject: [PATCH v2 4/4] hw/nios2: exit to main CPU loop only when unmasking
 interrupts
Date: Fri, 10 Jul 2020 19:34:33 -0400
Message-Id: <20200710233433.19729-4-wentong.wu@intel.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200710233433.19729-1-wentong.wu@intel.com>
References: <20200710233433.19729-1-wentong.wu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.31; envelope-from=wentong.wu@intel.com;
 helo=mga06.intel.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/10 11:46:35
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DATE_IN_FUTURE_06_12=1.947,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 10 Jul 2020 15:46:40 -0000

Only when guest code is unmasking interrupts, terminate the excution
of translated code and exit to the main CPU loop to handle previous
pended interrupts because of the interrupts mask by guest code.

Signed-off-by: Wentong Wu <wentong.wu@intel.com>
---
 hw/nios2/cpu_pic.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/nios2/cpu_pic.c b/hw/nios2/cpu_pic.c
index 1c1989d5..5ea7e52a 100644
--- a/hw/nios2/cpu_pic.c
+++ b/hw/nios2/cpu_pic.c
@@ -54,7 +54,8 @@ static void nios2_pic_cpu_handler(void *opaque, int irq, int level)
 
 void nios2_check_interrupts(CPUNios2State *env)
 {
-    if (env->irq_pending) {
+    if (env->irq_pending &&
+        (env->regs[CR_STATUS] & CR_STATUS_PIE)) {
         env->irq_pending = 0;
         cpu_interrupt(env_cpu(env), CPU_INTERRUPT_HARD);
     }
-- 
2.21.3


