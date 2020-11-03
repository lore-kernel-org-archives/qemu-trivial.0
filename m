Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kZr1U-0007VI-Qe
	for mharc-qemu-trivial@gnu.org; Tue, 03 Nov 2020 02:46:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kZr1S-0007Ur-PA; Tue, 03 Nov 2020 02:46:30 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kZr1N-0006Ty-Hs; Tue, 03 Nov 2020 02:46:30 -0500
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CQMKX00fgzLqYl;
 Tue,  3 Nov 2020 15:46:07 +0800 (CST)
Received: from [10.174.187.138] (10.174.187.138) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.487.0; Tue, 3 Nov 2020 15:46:03 +0800
Message-ID: <5FA10ABA.1080109@huawei.com>
Date: Tue, 3 Nov 2020 15:46:02 +0800
From: AlexChen <alex.chen@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.2; WOW64;
 rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: <edgar.iglesias@gmail.com>
CC: <qemu-devel@nongnu.org>, QEMU Trivial <qemu-trivial@nongnu.org>,
 <zhang.zhanghailiang@huawei.com>
Subject: [PATCH] target/microblaze: Fix possible array out of bounds in
 mmu_write()
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.187.138]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191; envelope-from=alex.chen@huawei.com;
 helo=szxga05-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/02 20:52:53
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Tue, 03 Nov 2020 07:46:31 -0000

The size of env->mmu.regs is 3, but the range of 'rn' is [0, 5].
To avoid data access out of bounds, only if 'rn' is less than 3, we
can print env->mmu.regs[rn]. In other cases, we can print
env->mmu.regs[MMU_R_TLBX].

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Alex Chen <alex.chen@huawei.com>
---
 target/microblaze/mmu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/microblaze/mmu.c b/target/microblaze/mmu.c
index 1dbbb271c4..917ad6d69e 100644
--- a/target/microblaze/mmu.c
+++ b/target/microblaze/mmu.c
@@ -234,7 +234,8 @@ void mmu_write(CPUMBState *env, bool ext, uint32_t rn, uint32_t v)
     unsigned int i;

     qemu_log_mask(CPU_LOG_MMU,
-                  "%s rn=%d=%x old=%x\n", __func__, rn, v, env->mmu.regs[rn]);
+                  "%s rn=%d=%x old=%x\n", __func__, rn, v,
+                  rn < 3 ? env->mmu.regs[rn] : env->mmu.regs[MMU_R_TLBX]);

     if (cpu->cfg.mmu < 2 || !cpu->cfg.mmu_tlb_access) {
         qemu_log_mask(LOG_GUEST_ERROR, "MMU access on MMU-less system\n");
-- 
2.19.1

