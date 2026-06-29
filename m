Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79701C43458
	for <qemu-trivial@archiver.kernel.org>; Tue, 30 Jun 2026 00:37:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1weMSP-0001qg-Et; Mon, 29 Jun 2026 20:36:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <randy.schifflin@gmail.com>)
 id 1weJri-00053p-8m
 for qemu-trivial@nongnu.org; Mon, 29 Jun 2026 17:50:07 -0400
Received: from mail-dl1-x1233.google.com ([2607:f8b0:4864:20::1233])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <randy.schifflin@gmail.com>)
 id 1weJre-0000J5-AM
 for qemu-trivial@nongnu.org; Mon, 29 Jun 2026 17:50:05 -0400
Received: by mail-dl1-x1233.google.com with SMTP id
 a92af1059eb24-137335bc3caso7835842c88.0
 for <qemu-trivial@nongnu.org>; Mon, 29 Jun 2026 14:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782769801; x=1783374601; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=8lP9SVA9UjDXWbCF8REE5q6sngiCNF4hU3LBEWRVnkE=;
 b=dg9IqiET/sZ85hHm7frW5dVzPUOqRL5qA3iPvsTLfeKtLgvuqqGyyp3Qoa86QrcrNb
 /8OUAtNcM3uUfnpPz0pjR2AzPnRHL3xAOM+M7zEeRgwZ21Tv/1AIC8JASAM9mH3RZFiR
 LYPcasVn0kuhz3qyvI9lMlSUMyEA3yg8SR7FSrCRGMkTKZDhcMWfB9nX8oy5B5K1/oZy
 K+wH6Yl4UdFmWWeZHvigi0ufgmLHCC8uJvBpj4lma6U4UmCMuAlPOrleIAJ/pxqHFncn
 AkUGUHVVWpInRGJ1XwYVBRAkemgYS8u616QrA/C6oxo8m1peD5qZZIBP24rDTmKGVIW9
 k80w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782769801; x=1783374601;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=8lP9SVA9UjDXWbCF8REE5q6sngiCNF4hU3LBEWRVnkE=;
 b=P4fRWpf4wzC9SR2O2JfC2AO5Q8izUNilCdTp3XpTJ/dytvL8js+7kmXPTCeK6sT/sQ
 5nOjUue1vPO0JezDjWtso4BJmCcARa4Mabe9Mz1rV3hPoAaZrZGavmew+BXwp3jLo8fs
 8E9oou/DaOKA9lFA2v0yETZg1oy8a2QMnEWdn8gqjpbyL4j+/fhGN6FT/xk1+I3521At
 sWhfx/C2+syiIiZlKDGqACeDu+vX+yQiZ/l5SRYgjJ1W1mmZYNh7PESIF8HRRrMYSjyD
 QxBQUwyEauFWsltWZq6I9BtB9ImFY2vGYmvQoz8tDn5puI+thwMadsG93LPj04dW3azA
 8BZw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/F2J16a+L/O2bw+iv3sIkOsrmIydt7kyFXMP+ehfDdCSOi3krQov7w7ZvM8BhQsgg1X1wSXoOMtujliLo=@nongnu.org
X-Gm-Message-State: AOJu0YwSMUL6kjyJUal+UB4M20q5V1vWZvFO0rDGq8I4vs7qKZvjk82/
 CHL/6LEKXGYXxiVfOWyWni8xxIU9fMi2AD8q/MXoaSMOhZ/3tUVuSkLk
X-Gm-Gg: AfdE7clsTif8D6zNIglMdVoRJ9Z/ofn9iM7h7IAJRQEVpnqI7sguXSTRBD7cCHpCEt8
 mr1qDa0TR8/ld8zjIn9jK/Uqm6QfNcDpwsYeGkgQfKCO/rQd4LkNo1IIqeBaupF1Q7QQuWaolaC
 Cf5P6OwG8JaJVBjIiQgP+xakKcq9+JY5kL6rFAHrdv0SbIIRNzIsCQvA5AvH8i9kxc17CiEQTLz
 vyQ/1NOcU7mYj+/pcptH5JqnFdo01jjf8aWQTLAldxvVtTRNwqdE/C/dVblJU1fjBQCkhf6HMGY
 ItANeDI4E0jD35wjB8v5nqJhcOLjn8iGOx/mPm6qsZ/YYrWdcXMPfqgqXCcE7ffFQe5sNSdGro+
 PqB8xn+1bsGg8P0fS4mt2DOY8L3+g8ki9sZKsIMBUA1zRHBqAptQ6tGdbWmjdVML8Bl+qaHoAH2
 Yc27H6vc8b7OJuCHxI/LhQ8yGQ
X-Received: by 2002:a05:701b:454b:10b0:13b:2bd6:1688 with SMTP id
 a92af1059eb24-13b2bd61871mr35190c88.39.1782769800572; 
 Mon, 29 Jun 2026 14:50:00 -0700 (PDT)
Received: from devone.local ([2600:8801:100:1910:7665:6164:2268:839e])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-13b2a9b425asm1755523c88.0.2026.06.29.14.49.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2026 14:50:00 -0700 (PDT)
From: Randy Schifflin <randy.schifflin@gmail.com>
Date: Mon, 29 Jun 2026 14:49:13 -0700
Subject: [PATCH 2/2] target/sh4: fixup tcg for sh4 fipr/ftrv instructions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-fixup-sh4-tcg-fpu-instructions-b4-v1-2-4356b305f971@gmail.com>
References: <20260629-fixup-sh4-tcg-fpu-instructions-b4-v1-0-4356b305f971@gmail.com>
In-Reply-To: <20260629-fixup-sh4-tcg-fpu-instructions-b4-v1-0-4356b305f971@gmail.com>
To: qemu-devel@nongnu.org
Cc: Yoshinori Sato <yoshinori.sato@nifty.com>, qemu-trivial@nongnu.org, 
 Randy Schifflin <randy.schifflin@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openssh-sha256; t=1782769797; l=2741;
 i=randy.schifflin@gmail.com; s=id_rsa; h=from:subject:message-id;
 bh=G8pGQipUKZ2gEWnvowuml1041wRXQUUAP+V52KmszEU=;
 b=U1NIU0lHAAAAAQAAAZcAAAAHc3NoLXJzYQAAAAMBAAEAAAGBALXHj1ozDvr3TmWcPoueK1kIy
 Q3yQ7HL5bbiu8J+P0QBzcchmw5nwN0avQmreXhYuMhz40g0dhCJPnJqNHg1FBflQPz2cgY7Utm3
 9lQrK/CQqWsjRwXMinMR7LrmtMFp9+up7MzdXoxmTLgPsKJ/dQmx0rUHx++mUSl8zl7lHO50YVD
 hsw1RHrkrXlxnUjRi+jtjgErRHvoRwSZpKc44yR62wV8chkTMnHtrn8hgL0Hh+jhHteNn4JTQB/
 wme8MghhliXR5oh9xirpeLlS9S4TBY3Vdk6ccgvncSS4uF/y2ZAAV5sNiLZ97OFkBhIQ0bXhVx9
 w1LPMkho650Iu9da5/0koNheHS2KAVC2FdPTyaxvqeFAsAB8fCprfh4lpShdcVpyChdd2KXFS53
 s9MAUQmZjG0pQvS/dqGCCDWqo7cY3J3VTMXwVtdzYkgZt5eMajL7z8VljXQ08ZgAStdizC/rHNg
 wy+fIL+6kgxvL/NhJwoiAWhC4D+xQY7SXjJGTvwAAAAZwYXRhdHQAAAAAAAAABnNoYTUxMgAAAZ
 QAAAAMcnNhLXNoYTItNTEyAAABgB/wZG3LQPRNDJDvg+/DDGeNtJzqBXLid65jW4xNq5UUerzRA
 vJfLE0M7+UTwZ/+6g+tG55K4oVUAREauCIowIR64a0RGiYT+xKKRhRNz5F0mSGQE7n18sDGwlO4
 QjJ1vL3+Bw9u1nJpyMgsAJPgsTtrIK03m1s7kBqZ1YSH3nCNCdvH84KJQSReRPDv0WWqppAUgyg
 T6vZ/SIk/N/Z5OImUtqxTWPxShlByWnD5zhF+Jpwf7X4fyYzXF3d6w/S4qxXVYlp4q73nMjRnmW
 b8NNTXwyhtsRb9lKy7xUoCw9Jve3jFx3v4b54fC+qZEijD/RvBL9P9QfBe7f5TsdIuXi8+29gD4
 7v0zreir7lGMonxXgtpcyYwuc8eqt1NHnlJSXjDZrrlBRzBGGocE0+VwksEEU0Uqecsgp78V259
 VMSTCzaarU/BrkURx4zy4JmvUOqiBOczPdNuzXzJ789Sy6LPIIIS6vfOqMFxe0RbD0O2cW0GrVt
 DdDojLWqk7VWTOA==
X-Developer-Key: i=randy.schifflin@gmail.com; a=openssh;
 fpr=SHA256:7gww1tlDoVPb7symWGdTNhRWcHyTORA23OcjS8eyd8Y
Received-SPF: pass client-ip=2607:f8b0:4864:20::1233;
 envelope-from=randy.schifflin@gmail.com; helo=mail-dl1-x1233.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 29 Jun 2026 20:36:07 -0400
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
Errors-To: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org
Sender: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org

Fixes TCG generation for sh4 `fipr` and `ftrv` instructions.
Updates the current logic for these instructions to check the
FPSCR register appropriately (according to the sh4 cpu manual, `fipr`
and `ftrv` are only defined when the FPSCR register PR flag is 0).
Also fixes the mth/nth-vector operands by multiplying by 4 to convert
to the correct floating point register offset.

Signed-off-by: Randy Schifflin <randy.schifflin@gmail.com>
---
 target/sh4/op_helper.c |  2 +-
 target/sh4/translate.c | 15 +++++----------
 2 files changed, 6 insertions(+), 11 deletions(-)

diff --git a/target/sh4/op_helper.c b/target/sh4/op_helper.c
index 90c065b217..777380f8e4 100644
--- a/target/sh4/op_helper.c
+++ b/target/sh4/op_helper.c
@@ -488,7 +488,7 @@ void helper_ftrv(CPUSH4State *env, uint32_t n)
     float32 p;
 
     bank_matrix = (env->sr & FPSCR_FR) ? 0 : 16;
-    bank_vector = (env->sr & FPSCR_FR) ? 16 : 0;
+    bank_vector = (env->sr & FPSCR_FR) ? 16 + n : n;
     set_float_exception_flags(0, &env->fp_status);
     for (i = 0 ; i < 4 ; i++) {
         r[i] = float32_zero;
diff --git a/target/sh4/translate.c b/target/sh4/translate.c
index d38a6bd352..373950fd66 100644
--- a/target/sh4/translate.c
+++ b/target/sh4/translate.c
@@ -377,11 +377,6 @@ static inline void gen_store_fpr64(DisasContext *ctx, TCGv_i64 t, int reg)
         goto do_illegal;                    \
     }
 
-#define CHECK_FPSCR_PR_1 \
-    if (!(ctx->tbflags & FPSCR_PR)) {       \
-        goto do_illegal;                    \
-    }
-
 #define CHECK_SH4A \
     if (!(ctx->features & SH_FEATURE_SH4A)) { \
         goto do_illegal;                      \
@@ -1740,22 +1735,22 @@ static void _decode_opc(DisasContext * ctx)
         return;
     case 0xf0ed: /* fipr FVm,FVn */
         CHECK_FPU_ENABLED
-        CHECK_FPSCR_PR_1
+        CHECK_FPSCR_PR_0
         {
-            TCGv m = tcg_constant_i32((ctx->opcode >> 8) & 3);
-            TCGv n = tcg_constant_i32((ctx->opcode >> 10) & 3);
+            TCGv m = tcg_constant_i32(((ctx->opcode >> 8) & 3) << 2);
+            TCGv n = tcg_constant_i32(((ctx->opcode >> 10) & 3) << 2);
             gen_helper_fipr(tcg_env, m, n);
             return;
         }
         break;
     case 0xf0fd: /* ftrv XMTRX,FVn */
         CHECK_FPU_ENABLED
-        CHECK_FPSCR_PR_1
+        CHECK_FPSCR_PR_0
         {
             if ((ctx->opcode & 0x0300) != 0x0100) {
                 goto do_illegal;
             }
-            TCGv n = tcg_constant_i32((ctx->opcode >> 10) & 3);
+            TCGv n = tcg_constant_i32(((ctx->opcode >> 10) & 3) << 2);
             gen_helper_ftrv(tcg_env, n);
             return;
         }

-- 
2.43.0


