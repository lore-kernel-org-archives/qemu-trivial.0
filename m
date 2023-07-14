Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qKH8i-0000PN-Oq
	for mharc-qemu-trivial@gnu.org; Fri, 14 Jul 2023 07:39:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1qKH8e-0000NG-Qb; Fri, 14 Jul 2023 07:39:09 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1qKH8d-0004Eu-2b; Fri, 14 Jul 2023 07:39:08 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 5AFB713D96;
 Fri, 14 Jul 2023 14:38:56 +0300 (MSK)
Received: from tls.msk.ru (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with SMTP id 5BA1114BA5;
 Fri, 14 Jul 2023 14:38:40 +0300 (MSK)
Received: (nullmailer pid 1186225 invoked by uid 1000);
 Fri, 14 Jul 2023 11:38:38 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Subject: [PATCH, trivial 10/29] tree-wide spelling fixes in comments and some
 messages: mips
Date: Fri, 14 Jul 2023 14:38:15 +0300
Message-Id: <20230714113834.1186117-12-mjt@tls.msk.ru>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230714113834.1186117-1-mjt@tls.msk.ru>
References: <20230714113834.1186117-1-mjt@tls.msk.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 14 Jul 2023 11:39:09 -0000

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/mips/malta.c                 |  2 +-
 target/mips/cpu-defs.c.inc      |  2 +-
 target/mips/tcg/msa_helper.c    | 12 ++++++------
 target/mips/tcg/mxu_translate.c |  6 +++---
 4 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index f9618fa5f5..16e9c4773f 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -629,3 +629,3 @@ static void bl_setup_gt64120_jump_kernel(void **p, uint64_t run_addr,
 
-    /* Bus endianess is always reversed */
+    /* Bus endianness is always reversed */
 #if TARGET_BIG_ENDIAN
diff --git a/target/mips/cpu-defs.c.inc b/target/mips/cpu-defs.c.inc
index 03185d9aa0..c0c389c59a 100644
--- a/target/mips/cpu-defs.c.inc
+++ b/target/mips/cpu-defs.c.inc
@@ -1047,3 +1047,3 @@ static void mvp_init(CPUMIPSState *env)
 
-    /* MVPConf1 implemented, TLB sharable, no gating storage support,
+    /* MVPConf1 implemented, TLB shareable, no gating storage support,
        programmable cache partitioning implemented, number of allocatable
diff --git a/target/mips/tcg/msa_helper.c b/target/mips/tcg/msa_helper.c
index 29b31d70fe..6e93a19a93 100644
--- a/target/mips/tcg/msa_helper.c
+++ b/target/mips/tcg/msa_helper.c
@@ -804,5 +804,5 @@ void helper_msa_bset_d(CPUMIPSState *env, uint32_t wd, uint32_t ws, uint32_t wt)
  * | HADD_S.D      | Vector Signed Horizontal Add (doubleword)                |
- * | HADD_U.H      | Vector Unigned Horizontal Add (halfword)                 |
- * | HADD_U.W      | Vector Unigned Horizontal Add (word)                     |
- * | HADD_U.D      | Vector Unigned Horizontal Add (doubleword)               |
+ * | HADD_U.H      | Vector Unsigned Horizontal Add (halfword)                |
+ * | HADD_U.W      | Vector Unsigned Horizontal Add (word)                    |
+ * | HADD_U.D      | Vector Unsigned Horizontal Add (doubleword)              |
  * +---------------+----------------------------------------------------------+
@@ -3453,5 +3453,5 @@ void helper_msa_mulv_d(CPUMIPSState *env,
  * | HSUB_S.D      | Vector Signed Horizontal Subtract (doubleword)           |
- * | HSUB_U.H      | Vector Unigned Horizontal Subtract (halfword)            |
- * | HSUB_U.W      | Vector Unigned Horizontal Subtract (word)                |
- * | HSUB_U.D      | Vector Unigned Horizontal Subtract (doubleword)          |
+ * | HSUB_U.H      | Vector Unsigned Horizontal Subtract (halfword)           |
+ * | HSUB_U.W      | Vector Unsigned Horizontal Subtract (word)               |
+ * | HSUB_U.D      | Vector Unsigned Horizontal Subtract (doubleword)         |
  * | SUBS_S.B      | Vector Signed Saturated Subtract (of Signed) (byte)      |
diff --git a/target/mips/tcg/mxu_translate.c b/target/mips/tcg/mxu_translate.c
index deb8060a17..993e1fca05 100644
--- a/target/mips/tcg/mxu_translate.c
+++ b/target/mips/tcg/mxu_translate.c
@@ -2965,3 +2965,3 @@ static void gen_mxu_Q8ADD(DisasContext *ctx)
  *    into XRa and XRd.
- *    aptn2 manages action add or subract of pairs of data.
+ *    aptn2 manages action add or subtract of pairs of data.
  *
@@ -2972,3 +2972,3 @@ static void gen_mxu_Q8ADD(DisasContext *ctx)
  *    into XRa and XRd.
- *    aptn2 manages action add or subract of pairs of data.
+ *    aptn2 manages action add or subtract of pairs of data.
  */
@@ -4044,3 +4044,3 @@ static void gen_mxu_s32sfl(DisasContext *ctx)
  *  Q8SAD XRa, XRd, XRb, XRc
- *    Typical SAD opration for motion estimation.
+ *    Typical SAD operation for motion estimation.
  */
-- 
2.39.2


