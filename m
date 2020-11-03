Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kZlWt-0002Jp-TU
	for mharc-qemu-trivial@gnu.org; Mon, 02 Nov 2020 20:54:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1kZlWo-00027N-Gg; Mon, 02 Nov 2020 20:54:30 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2495)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1kZlVM-0001md-Iv; Mon, 02 Nov 2020 20:54:30 -0500
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CQCTv1DNmzhdWD;
 Tue,  3 Nov 2020 09:52:51 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.487.0; Tue, 3 Nov 2020
 09:52:45 +0800
From: Chen Qun <kuhn.chenqun@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
CC: <zhang.zhanghailiang@huawei.com>, <ganqixin@huawei.com>, Chen Qun
 <kuhn.chenqun@huawei.com>, Euler Robot <euler.robot@huawei.com>, Max Filippov
 <jcmvbkbc@gmail.com>
Subject: [PATCH 1/6] target/xtensa: fix uninitialized variable warning
Date: Tue, 3 Nov 2020 09:52:23 +0800
Message-ID: <20201103015228.2250547-2-kuhn.chenqun@huawei.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201103015228.2250547-1-kuhn.chenqun@huawei.com>
References: <20201103015228.2250547-1-kuhn.chenqun@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=kuhn.chenqun@huawei.com; helo=szxga05-in.huawei.com
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
X-List-Received-Date: Tue, 03 Nov 2020 01:54:31 -0000

The compiler cannot determine whether the return values of the xtensa_operand_is_register(isa, opc, opnd)
 and xtensa_operand_is_visible(isa, opc, opnd) functions are the same.
So,it assumes that 'rf' is not assigned, but it's used.

The compiler showed warning:
target/xtensa/translate.c: In function ‘disas_xtensa_insn’:
target/xtensa/translate.c:985:43: warning: ‘rf’ may be used uninitialized in this function [-Wmaybe-uninitialized]
  985 |                     arg[vopnd].num_bits = xtensa_regfile_num_bits(isa, rf);
      |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Add a default value for 'rf' to prevented the warning.

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
---
Cc: Max Filippov <jcmvbkbc@gmail.com>
---
 target/xtensa/translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
index 944a157747..eea851bbe7 100644
--- a/target/xtensa/translate.c
+++ b/target/xtensa/translate.c
@@ -953,7 +953,7 @@ static void disas_xtensa_insn(CPUXtensaState *env, DisasContext *dc)
 
         for (opnd = vopnd = 0; opnd < opnds; ++opnd) {
             void **register_file = NULL;
-            xtensa_regfile rf;
+            xtensa_regfile rf = -1;
 
             if (xtensa_operand_is_register(isa, opc, opnd)) {
                 rf = xtensa_operand_regfile(isa, opc, opnd);
-- 
2.27.0


