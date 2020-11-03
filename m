Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kZumr-0000mD-04
	for mharc-qemu-trivial@gnu.org; Tue, 03 Nov 2020 06:47:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhangxinhao1@huawei.com>)
 id 1kZumo-0000gq-Ri; Tue, 03 Nov 2020 06:47:38 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:2072)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhangxinhao1@huawei.com>)
 id 1kZumm-0005XA-QL; Tue, 03 Nov 2020 06:47:38 -0500
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4CQSh16GWgzhcss;
 Tue,  3 Nov 2020 19:47:29 +0800 (CST)
Received: from huawei.com (10.175.101.6) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.487.0; Tue, 3 Nov 2020
 19:47:19 +0800
From: Xinhao Zhang <zhangxinhao1@huawei.com>
To: <qemu-devel@nongnu.org>
CC: <peter.maydell@linaro.org>, <qemu-arm@nongnu.org>, <dengkai1@huawei.com>, 
 <alex.chen@huawei.com>, <qemu-trivial@nongnu.org>
Subject: [PATCH 2/3] target/arm: Don't use '#' flag of printf format
Date: Tue, 3 Nov 2020 19:45:28 +0800
Message-ID: <20201103114529.638233-2-zhangxinhao1@huawei.com>
X-Mailer: git-send-email 2.29.0-rc1
In-Reply-To: <20201103114529.638233-1-zhangxinhao1@huawei.com>
References: <20201103114529.638233-1-zhangxinhao1@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.101.6]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32;
 envelope-from=zhangxinhao1@huawei.com; helo=szxga06-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/03 05:28:30
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Tue, 03 Nov 2020 11:47:39 -0000

Fix code style. Don't use '#' flag of printf format ('%#') in
format strings, use '0x' prefix instead

Signed-off-by: Xinhao Zhang <zhangxinhao1@huawei.com>
Signed-off-by: Kai Deng <dengkai1@huawei.com>
---
 target/arm/translate-a64.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 072754fa24..1867ec293f 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -12114,7 +12114,7 @@ static void disas_simd_three_reg_same_fp16(DisasContext *s, uint32_t insn)
                 gen_helper_advsimd_acgt_f16(tcg_res, tcg_op1, tcg_op2, fpst);
                 break;
             default:
-                fprintf(stderr, "%s: insn %#04x, fpop %#2x @ %#" PRIx64 "\n",
+                fprintf(stderr, "%s: insn 0x%04x, fpop 0x%2x @ 0x%" PRIx64 "\n",
                         __func__, insn, fpopcode, s->pc_curr);
                 g_assert_not_reached();
             }
@@ -13121,7 +13121,7 @@ static void disas_simd_two_reg_misc_fp16(DisasContext *s, uint32_t insn)
     case 0x7f: /* FSQRT (vector) */
         break;
     default:
-        fprintf(stderr, "%s: insn %#04x fpop %#2x\n", __func__, insn, fpop);
+        fprintf(stderr, "%s: insn 0x%04x fpop 0x%2x\n", __func__, insn, fpop);
         g_assert_not_reached();
     }
 
-- 
2.29.0-rc1


