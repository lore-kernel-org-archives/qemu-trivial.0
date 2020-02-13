Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j2OQk-0000P5-8n
	for mharc-qemu-trivial@gnu.org; Thu, 13 Feb 2020 19:02:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37823)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <balaton@eik.bme.hu>) id 1j2OQh-0000JV-Ln
 for qemu-trivial@nongnu.org; Thu, 13 Feb 2020 19:02:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <balaton@eik.bme.hu>) id 1j2OQg-0001Hz-EE
 for qemu-trivial@nongnu.org; Thu, 13 Feb 2020 19:01:59 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:51035)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <balaton@eik.bme.hu>)
 id 1j2OQd-0000o1-Kk; Thu, 13 Feb 2020 19:01:55 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 8B73C747DF7;
 Fri, 14 Feb 2020 01:01:43 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 6D67F747DCF; Fri, 14 Feb 2020 01:01:43 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
Date: Fri, 14 Feb 2020 00:57:34 +0100
Subject: [PATCH] target/ppc: Fix typo in comments
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
    David Gibson <david@gibson.dropbear.id.au>
Message-Id: <20200214000143.6D67F747DCF@zero.eik.bme.hu>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2001:738:2001:2001::2001
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
X-List-Received-Date: Fri, 14 Feb 2020 00:02:00 -0000

"Deferred" was misspelled as "differed" in some comments, correct this
typo,

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 target/ppc/fpu_helper.c            | 2 +-
 target/ppc/translate/fp-impl.inc.c | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index dc383242f7..5182764df3 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -293,7 +293,7 @@ static void float_invalid_op_vxvc(CPUPPCState *env, bool set_fpcc,
         env->error_code = POWERPC_EXCP_FP | POWERPC_EXCP_FP_VXVC;
         /* Update the floating-point enabled exception summary */
         env->fpscr |= FP_FEX;
-        /* Exception is differed */
+        /* Exception is deferred */
     }
 }
 
diff --git a/target/ppc/translate/fp-impl.inc.c b/target/ppc/translate/fp-impl.inc.c
index d8e27bf4d5..9f7868ee28 100644
--- a/target/ppc/translate/fp-impl.inc.c
+++ b/target/ppc/translate/fp-impl.inc.c
@@ -781,7 +781,7 @@ static void gen_mtfsb1(DisasContext *ctx)
         tcg_gen_trunc_tl_i32(cpu_crf[1], cpu_fpscr);
         tcg_gen_shri_i32(cpu_crf[1], cpu_crf[1], FPSCR_OX);
     }
-    /* We can raise a differed exception */
+    /* We can raise a deferred exception */
     gen_helper_float_check_status(cpu_env);
 }
 
@@ -817,7 +817,7 @@ static void gen_mtfsf(DisasContext *ctx)
         tcg_gen_trunc_tl_i32(cpu_crf[1], cpu_fpscr);
         tcg_gen_shri_i32(cpu_crf[1], cpu_crf[1], FPSCR_OX);
     }
-    /* We can raise a differed exception */
+    /* We can raise a deferred exception */
     gen_helper_float_check_status(cpu_env);
     tcg_temp_free_i64(t1);
 }
@@ -850,7 +850,7 @@ static void gen_mtfsfi(DisasContext *ctx)
         tcg_gen_trunc_tl_i32(cpu_crf[1], cpu_fpscr);
         tcg_gen_shri_i32(cpu_crf[1], cpu_crf[1], FPSCR_OX);
     }
-    /* We can raise a differed exception */
+    /* We can raise a deferred exception */
     gen_helper_float_check_status(cpu_env);
 }
 
-- 
2.21.1


