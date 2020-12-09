Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kn1Hb-0007VH-6w
	for mharc-qemu-trivial@gnu.org; Wed, 09 Dec 2020 10:21:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stephane.duverger@free.fr>)
 id 1kmvtS-0000uI-P9; Wed, 09 Dec 2020 04:36:18 -0500
Received: from smtp5-g21.free.fr ([212.27.42.5]:16968)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stephane.duverger@free.fr>)
 id 1kmvtQ-00031x-3R; Wed, 09 Dec 2020 04:36:18 -0500
Received: from wise (unknown [77.159.208.71])
 (Authenticated sender: stephane.duverger@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 2D5705FF9E;
 Wed,  9 Dec 2020 10:36:03 +0100 (CET)
Date: Wed, 9 Dec 2020 10:35:44 +0100
From: Stephane Duverger <stephane.duverger@free.fr>
To: qemu-devel@nongnu.org
Cc: David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-trivial@nongnu.org
Subject: [PATCH] ppc/translate: Fix need_access_type for non MMU_64
Message-ID: <20201209093544.GA58577@wise>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: none client-ip=212.27.42.5;
 envelope-from=stephane.duverger@free.fr; helo=smtp5-g21.free.fr
X-Spam_score_int: 1
X-Spam_score: 0.1
X-Spam_bar: /
X-Spam_report: (0.1 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, SPOOFED_FREEMAIL=1.973 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 09 Dec 2020 10:21:29 -0500
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
X-List-Received-Date: Wed, 09 Dec 2020 09:36:19 -0000

The 64bits MMU variants have POWERPC_MMU_64 flag and POWERPC_MMU_64B
is a specific one (POWERPC_MMU_32B with flag POWERPC_MMU_64). As a
consequence, the original test ignored POWERPC_MMU_32B too.

The commit 5f2a625452 targeted hash64 mmu version. And indeed the
'mmu-hash64.c' does not use access_type. But 'mmu-hash32.c' does.

Signed-off-by: Stephane Duverger <stephane.duverger@free.fr>
---
 target/ppc/translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 54cac0e6a7..b4d0699ce3 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -7892,7 +7892,7 @@ static void ppc_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->insns_flags = env->insns_flags;
     ctx->insns_flags2 = env->insns_flags2;
     ctx->access_type = -1;
-    ctx->need_access_type = !(env->mmu_model & POWERPC_MMU_64B);
+    ctx->need_access_type = !(env->mmu_model & POWERPC_MMU_64);
     ctx->le_mode = !!(env->hflags & (1 << MSR_LE));
     ctx->default_tcg_memop_mask = ctx->le_mode ? MO_LE : MO_BE;
     ctx->flags = env->flags;
-- 
2.25.1


