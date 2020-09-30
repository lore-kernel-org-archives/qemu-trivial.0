Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kNYoq-0007e6-VM
	for mharc-qemu-trivial@gnu.org; Wed, 30 Sep 2020 05:54:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhaolichang@huawei.com>)
 id 1kNYon-0007Vq-RV; Wed, 30 Sep 2020 05:54:37 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:4772 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhaolichang@huawei.com>)
 id 1kNYoc-0004Oq-4l; Wed, 30 Sep 2020 05:54:37 -0400
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 57167C8363A03AE6E38D;
 Wed, 30 Sep 2020 17:54:20 +0800 (CST)
Received: from localhost (10.174.185.186) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.487.0; Wed, 30 Sep 2020
 17:54:11 +0800
From: zhaolichang <zhaolichang@huawei.com>
To: <qemu-trivial@nongnu.org>
CC: <qemu-devel@nongnu.org>, zhaolichang <zhaolichang@huawei.com>
Subject: [PATCH RFC 04/14] rx/: fix some comment spelling errors
Date: Wed, 30 Sep 2020 17:53:11 +0800
Message-ID: <20200930095321.2006-5-zhaolichang@huawei.com>
X-Mailer: git-send-email 2.26.2.windows.1
In-Reply-To: <20200930095321.2006-1-zhaolichang@huawei.com>
References: <20200930095321.2006-1-zhaolichang@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.185.186]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=zhaolichang@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/30 05:54:20
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Wed, 30 Sep 2020 09:54:38 -0000

I found that there are many spelling errors in the comments of qemu/target/rx.
I used spellcheck to check the spelling errors and found some errors in the folder.

Signed-off-by: zhaolichang <zhaolichang@huawei.com>
---
 target/rx/op_helper.c | 2 +-
 target/rx/translate.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/rx/op_helper.c b/target/rx/op_helper.c
index f89d294..59389f4 100644
--- a/target/rx/op_helper.c
+++ b/target/rx/op_helper.c
@@ -318,7 +318,7 @@ void helper_swhile(CPURXState *env, uint32_t sz)
     env->psw_c = (tmp <= env->regs[2]);
 }
 
-/* accumlator operations */
+/* accumulator operations */
 void helper_rmpa(CPURXState *env, uint32_t sz)
 {
     uint64_t result_l, prev;
diff --git a/target/rx/translate.c b/target/rx/translate.c
index 482278e..9ea941c 100644
--- a/target/rx/translate.c
+++ b/target/rx/translate.c
@@ -1089,7 +1089,7 @@ static void rx_sub(TCGv ret, TCGv arg1, TCGv arg2)
     tcg_gen_xor_i32(temp, arg1, arg2);
     tcg_gen_and_i32(cpu_psw_o, cpu_psw_o, temp);
     tcg_temp_free_i32(temp);
-    /* CMP not requred return */
+    /* CMP not required return */
     if (ret) {
         tcg_gen_mov_i32(ret, cpu_psw_s);
     }
-- 
2.26.2.windows.1


