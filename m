Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C138C54F51
	for <qemu-trivial@archiver.kernel.org>; Wed, 29 Jul 2026 20:56:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wpBJj-0001Cq-7w; Wed, 29 Jul 2026 16:55:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <randy.schifflin@gmail.com>)
 id 1wpBJg-0001B7-9K
 for qemu-trivial@nongnu.org; Wed, 29 Jul 2026 16:55:53 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <randy.schifflin@gmail.com>)
 id 1wpBJe-0003Dc-CB
 for qemu-trivial@nongnu.org; Wed, 29 Jul 2026 16:55:52 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 98e67ed59e1d1-3856d6fbcb3so1145726a91.2
 for <qemu-trivial@nongnu.org>; Wed, 29 Jul 2026 13:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1785358547; x=1785963347; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=EuI3Lte6L+TUx4+qq6+bqLHevoNQdlXy3sbflPLSDh8=;
 b=DTIvq6X8fkxCzJJI3uwyjHxXIsG3ktmfDojrlA+suEJ+5q8WmJN7TjNX1LNLtj9LEI
 lTMlI6iDgBEMSbvRX/zs6dMH+h+1OnXAX9JtATv7kzPX1mY045GhA5IvK5e4g4fd6x5V
 Tf5hyE2bBduFn3osdJmi8ErXuv1uV/463Eczt5Kv8BzrevjVeAncBj2MONVbAMCztg8O
 mQlGDKN2OIEKuMH5x6AyoASFrFGBq6gtpL4l8MvD1P9TPSpdvlSvK/Y7nmmnRScXIHKm
 +c9TKnd1zSYb7Ybz2FilEeoP80pycQSUPcINvKv+F3mXC7hflBS8Nyoip0Ol2+gf2DUI
 FgNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785358547; x=1785963347;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=EuI3Lte6L+TUx4+qq6+bqLHevoNQdlXy3sbflPLSDh8=;
 b=ShM93Nv9blK4O6xfRKbmyWup3Ac0wX7oa7ZPGSuaO7O9Rxn3e16dp41wRGsi1Cjhvg
 qMG4fR616LYZjHRFYnslc10S9PMhxtMi92bJy7iZV0G8OPt5Nyn/0b1NycHUlZA1qGbW
 hujTHhXrW3YYkJPJrTe4gxF2WQZcY3pWrqXaXnRMpyQzuNw/XglLUjOv82biAUuIpvtc
 HIb/uye7mcXMlRX/IpL7Jf7tFkLfV4puVZJQGA/AG5ZyJTo9LOTP535nMAh6G3WboVJo
 1RoM0UsLzRMRgQgui/nsL4u/h3L5Br5n8WVOYdX5hV9jCKCJijI5ek/k72VIY/orTvfR
 Z29w==
X-Forwarded-Encrypted: i=1;
 AHgh+RolOdDCM0YxIxft1AD+/PgabEGLbmi5MQCN9Wbrz/ncs91l3T7oRGiG7mobzsEMbtR2BgNbOq5yFLNw0LQ=@nongnu.org
X-Gm-Message-State: AOJu0Yxx7gXjCE81/0oRVJDQsal0jCdJEd3rB2oBoCrzcME2+x/Gr8Wn
 TyxFHiyZ0FkSgSzVxW+ghXGkh3oMDf+a1+Aqr7mkxktLne+fuPHnkKTfdOZ7Jyw7
X-Gm-Gg: AR+sD111ALF3/sAnQSEeHbI3HOLzO1iJQgI7cP9HwNagmKKPg1vd16KM0cYah5FvTdt
 khXJTXXiCybhCeksd7Txs90JEAHVZcC/GnUq46cMMCgytj9/tJSTl8XjumgjRW76PUl32FVpssg
 2lDGoysuwvBaWbyYVBIz7gpZKpJV5n6HloTsum8UiWLVtvHeMGQYNsaGuUqQwEniPArGQQKQoXG
 GRTsVczqzl4pkvqAWexY+sperTakREdWTuMY0/kUzU5ntQEgprNaD0eB712ybEoG+uC2YJQtvMX
 EKiEDfcumv8ar75NHJE+5vf8pat1lIRfXfE3lXgRpekhdaV4/BEyf3BwrCQ2zYdhgIKzmazXMqC
 MJJ+jyUIZs4iWE+mO/XuiRdyUH2MbDYFkMMOcvgxE9rn/8NSBTZGanoJVEXMbAFtz1kfIr9hhB5
 ugBiK3vUMnEkhlgYpgZt+iH5vOaO9/WF9iOC3ycF6b/axmNNVMNmPqvYlMnA8dpbOwrNmI6OJLZ
 m68vQP91g==
X-Received: by 2002:a17:90b:5785:b0:36b:77b9:5c8c with SMTP id
 98e67ed59e1d1-38f98f6c278mr398721a91.17.1785358547306; 
 Wed, 29 Jul 2026 13:55:47 -0700 (PDT)
Received: from devone.local ([2600:8801:100:1910:66a:cb3f:f6a7:d5f0])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-13e7271f010sm14868879c88.9.2026.07.29.13.55.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jul 2026 13:55:46 -0700 (PDT)
From: Randy Schifflin <randy.schifflin@gmail.com>
Date: Wed, 29 Jul 2026 13:55:08 -0700
Subject: [PATCH 2/2] target/sh4: fixup tcg generation for sh4 `fmov`
 instructions.
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-sh4-fix-fmov-instructions-b4-v1-2-65cc9679025a@gmail.com>
References: <20260729-sh4-fix-fmov-instructions-b4-v1-0-65cc9679025a@gmail.com>
In-Reply-To: <20260729-sh4-fix-fmov-instructions-b4-v1-0-65cc9679025a@gmail.com>
To: qemu-devel@nongnu.org
Cc: Yoshinori Sato <yoshinori.sato@nifty.com>, qemu-trivial@nongnu.org, 
 Randy Schifflin <randy.schifflin@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openssh-sha256; t=1785358542; l=7410;
 i=randy.schifflin@gmail.com; s=id_rsa; h=from:subject:message-id;
 bh=08WCZqu/9I1ItEc38de3w3oVAgSe2Jwf4MRVglV4fIA=;
 b=U1NIU0lHAAAAAQAAAZcAAAAHc3NoLXJzYQAAAAMBAAEAAAGBALXHj1ozDvr3TmWcPoueK1kIy
 Q3yQ7HL5bbiu8J+P0QBzcchmw5nwN0avQmreXhYuMhz40g0dhCJPnJqNHg1FBflQPz2cgY7Utm3
 9lQrK/CQqWsjRwXMinMR7LrmtMFp9+up7MzdXoxmTLgPsKJ/dQmx0rUHx++mUSl8zl7lHO50YVD
 hsw1RHrkrXlxnUjRi+jtjgErRHvoRwSZpKc44yR62wV8chkTMnHtrn8hgL0Hh+jhHteNn4JTQB/
 wme8MghhliXR5oh9xirpeLlS9S4TBY3Vdk6ccgvncSS4uF/y2ZAAV5sNiLZ97OFkBhIQ0bXhVx9
 w1LPMkho650Iu9da5/0koNheHS2KAVC2FdPTyaxvqeFAsAB8fCprfh4lpShdcVpyChdd2KXFS53
 s9MAUQmZjG0pQvS/dqGCCDWqo7cY3J3VTMXwVtdzYkgZt5eMajL7z8VljXQ08ZgAStdizC/rHNg
 wy+fIL+6kgxvL/NhJwoiAWhC4D+xQY7SXjJGTvwAAAAZwYXRhdHQAAAAAAAAABnNoYTUxMgAAAZ
 QAAAAMcnNhLXNoYTItNTEyAAABgJjD4YoyAJVx6YtKFG4DSSZ/lM6zGXP9xkBv7C+WE5SzuSsdd
 LedRuHa39qoKmU6v3H/r/pH8lg0GWUXg5ch8vWkPmCVdNTN9bcOzWz4BrEtvS5GWMx+aPQbTOxI
 ANWgmRIm2zSNBouVhlm0VEJf8MojWDrBEIZI7AtB2BEo2hM/UpSCM4E+U02ymKjasXEL+ykMXZ3
 x64eXVrqHpokqY++awMVml87SO6jQwfM6ek20UqBR3G9cT5Ofd0qitKzfYD3EjX+lvU6IbExt6N
 DSKobS78MkZy7ef4OjVVpn7JMOiYGR+UJMPFsfe74apOk2Uyd48/pUUOgGTqgAFSIPWCDgqpgul
 WCGAkFqjdo+f+Ho5t6I0O9gQBG+THI3lHfcs5EL6ffdCJZdlmgQrfpuXGoOWQpphbNGL7Ecvd6R
 cLoJb5wAPqhOuwYZpY0eZ6nk7CKDp38QB/NZJasW9d5jFWvxJZReIqhkBpt9TrcmebbgUSMZZfv
 hIgcG3no2hgilAA==
X-Developer-Key: i=randy.schifflin@gmail.com; a=openssh;
 fpr=SHA256:7gww1tlDoVPb7symWGdTNhRWcHyTORA23OcjS8eyd8Y
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=randy.schifflin@gmail.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org
Sender: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org

Fixes TCG generation for sh4 `fmov` instructions.

Updates the current logic for these instructions to correctly handle
  SH4 pair single-precision data transfer semantics.
  According to the SH4 cpu manual, `fmov` between a double-precision
  register operand and memory requires the precision mode to be
  single-precision and the transfer size mode to be pairwise f32.
  The result is reading/writing a pair of two f32 values to/from memory.
  In little-endian mode, this has slightly different semantics than
  the current implementation which handles reads/writes as a single
  f64 value- the first and second words get incorrectly reversed.

Signed-off-by: Randy Schifflin <randy.schifflin@gmail.com>
---
 target/sh4/translate.c | 82 +++++++++++++++++++++++++++++---------------------
 1 file changed, 47 insertions(+), 35 deletions(-)

diff --git a/target/sh4/translate.c b/target/sh4/translate.c
index 373950fd66..8fe3b15e50 100644
--- a/target/sh4/translate.c
+++ b/target/sh4/translate.c
@@ -962,10 +962,14 @@ static void _decode_opc(DisasContext * ctx)
     case 0xf00a: /* fmov {F,D,X}Rm,@Rn - FPSCR: Nothing */
         CHECK_FPU_ENABLED
         if (ctx->tbflags & FPSCR_SZ) {
-            TCGv_i64 fp = tcg_temp_new_i64();
-            gen_load_fpr64(ctx, fp, XHACK(B7_4));
-            tcg_gen_qemu_st_i64(fp, REG(B11_8), ctx->memidx,
-                                MO_TEUQ | MO_ALIGN);
+            TCGv addr = tcg_temp_new_i32();
+            int xsrc = XHACK(B7_4);
+
+            tcg_gen_qemu_st_i32(FREG(xsrc), REG(B11_8), ctx->memidx,
+                                MO_TEUL | MO_ALIGN);
+            tcg_gen_addi_i32(addr, REG(B11_8), 4);
+            tcg_gen_qemu_st_i32(FREG(xsrc + 1), addr, ctx->memidx,
+                                MO_TEUL | MO_ALIGN);
         } else {
             tcg_gen_qemu_st_i32(FREG(B7_4), REG(B11_8), ctx->memidx,
                                 MO_TEUL | MO_ALIGN);
@@ -974,23 +978,29 @@ static void _decode_opc(DisasContext * ctx)
     case 0xf008: /* fmov @Rm,{F,D,X}Rn - FPSCR: Nothing */
         CHECK_FPU_ENABLED
         if (ctx->tbflags & FPSCR_SZ) {
-            TCGv_i64 fp = tcg_temp_new_i64();
-            tcg_gen_qemu_ld_i64(fp, REG(B7_4), ctx->memidx,
-                                MO_TEUQ | MO_ALIGN);
-            gen_store_fpr64(ctx, fp, XHACK(B11_8));
+            TCGv addr = tcg_temp_new_i32();
+            int xdst = XHACK(B11_8);
+            tcg_gen_qemu_ld_i32(FREG(xdst), REG(B7_4), ctx->memidx,
+                                MO_TEUL | MO_ALIGN);
+            tcg_gen_addi_i32(addr, REG(B7_4), 4);
+            tcg_gen_qemu_ld_i32(FREG(xdst + 1), addr, ctx->memidx,
+                                MO_TEUL | MO_ALIGN);
         } else {
             tcg_gen_qemu_ld_i32(FREG(B11_8), REG(B7_4), ctx->memidx,
                                 MO_TEUL | MO_ALIGN);
         }
         return;
+
     case 0xf009: /* fmov @Rm+,{F,D,X}Rn - FPSCR: Nothing */
         CHECK_FPU_ENABLED
         if (ctx->tbflags & FPSCR_SZ) {
-            TCGv_i64 fp = tcg_temp_new_i64();
-            tcg_gen_qemu_ld_i64(fp, REG(B7_4), ctx->memidx,
-                                MO_TEUQ | MO_ALIGN);
-            gen_store_fpr64(ctx, fp, XHACK(B11_8));
-            tcg_gen_addi_i32(REG(B7_4), REG(B7_4), 8);
+            int xdst = XHACK(B11_8);
+            tcg_gen_qemu_ld_i32(FREG(xdst), REG(B7_4), ctx->memidx,
+                                MO_TEUL | MO_ALIGN);
+            tcg_gen_addi_i32(REG(B7_4), REG(B7_4), 4);
+            tcg_gen_qemu_ld_i32(FREG(xdst + 1), REG(B7_4), ctx->memidx,
+                                MO_TEUL | MO_ALIGN);
+            tcg_gen_addi_i32(REG(B7_4), REG(B7_4), 4);
         } else {
             tcg_gen_qemu_ld_i32(FREG(B11_8), REG(B7_4), ctx->memidx,
                                 MO_TEUL | MO_ALIGN);
@@ -999,20 +1009,18 @@ static void _decode_opc(DisasContext * ctx)
         return;
     case 0xf00b: /* fmov {F,D,X}Rm,@-Rn - FPSCR: Nothing */
         CHECK_FPU_ENABLED
-        {
-            TCGv addr = tcg_temp_new_i32();
-            if (ctx->tbflags & FPSCR_SZ) {
-                TCGv_i64 fp = tcg_temp_new_i64();
-                gen_load_fpr64(ctx, fp, XHACK(B7_4));
-                tcg_gen_subi_i32(addr, REG(B11_8), 8);
-                tcg_gen_qemu_st_i64(fp, addr, ctx->memidx,
-                                    MO_TEUQ | MO_ALIGN);
-            } else {
-                tcg_gen_subi_i32(addr, REG(B11_8), 4);
-                tcg_gen_qemu_st_i32(FREG(B7_4), addr, ctx->memidx,
-                                    MO_TEUL | MO_ALIGN);
-            }
-            tcg_gen_mov_i32(REG(B11_8), addr);
+        if (ctx->tbflags & FPSCR_SZ) {
+            int xdst = XHACK(B7_4);
+            tcg_gen_subi_i32(REG(B11_8), REG(B11_8), 4);
+            tcg_gen_qemu_st_i32(FREG(xdst + 1), REG(B11_8), ctx->memidx,
+                                MO_TEUL | MO_ALIGN);
+            tcg_gen_subi_i32(REG(B11_8), REG(B11_8), 4);
+            tcg_gen_qemu_st_i32(FREG(xdst), REG(B11_8), ctx->memidx,
+                                MO_TEUL | MO_ALIGN);
+        } else {
+            tcg_gen_subi_i32(REG(B11_8), REG(B11_8), 4);
+            tcg_gen_qemu_st_i32(FREG(B7_4), REG(B11_8), ctx->memidx,
+                                MO_TEUL | MO_ALIGN);
         }
         return;
     case 0xf006: /* fmov @(R0,Rm),{F,D,X}Rm - FPSCR: Nothing */
@@ -1021,10 +1029,12 @@ static void _decode_opc(DisasContext * ctx)
             TCGv addr = tcg_temp_new_i32();
             tcg_gen_add_i32(addr, REG(B7_4), REG(0));
             if (ctx->tbflags & FPSCR_SZ) {
-                TCGv_i64 fp = tcg_temp_new_i64();
-                tcg_gen_qemu_ld_i64(fp, addr, ctx->memidx,
-                                    MO_TEUQ | MO_ALIGN);
-                gen_store_fpr64(ctx, fp, XHACK(B11_8));
+                int xdst = XHACK(B11_8);
+                tcg_gen_qemu_ld_i32(FREG(xdst), addr, ctx->memidx,
+                                    MO_TEUL | MO_ALIGN);
+                tcg_gen_addi_i32(addr, addr, 4);
+                tcg_gen_qemu_ld_i32(FREG(xdst + 1), addr, ctx->memidx,
+                                    MO_TEUL | MO_ALIGN);
             } else {
                 tcg_gen_qemu_ld_i32(FREG(B11_8), addr, ctx->memidx,
                                     MO_TEUL | MO_ALIGN);
@@ -1037,10 +1047,12 @@ static void _decode_opc(DisasContext * ctx)
             TCGv addr = tcg_temp_new();
             tcg_gen_add_i32(addr, REG(B11_8), REG(0));
             if (ctx->tbflags & FPSCR_SZ) {
-                TCGv_i64 fp = tcg_temp_new_i64();
-                gen_load_fpr64(ctx, fp, XHACK(B7_4));
-                tcg_gen_qemu_st_i64(fp, addr, ctx->memidx,
-                                    MO_TEUQ | MO_ALIGN);
+                int xsrc = XHACK(B7_4);
+                tcg_gen_qemu_st_i32(FREG(xsrc), addr, ctx->memidx,
+                                    MO_TEUL | MO_ALIGN);
+                tcg_gen_addi_i32(addr, addr, 4);
+                tcg_gen_qemu_st_i32(FREG(xsrc + 1), addr, ctx->memidx,
+                                    MO_TEUL | MO_ALIGN);
             } else {
                 tcg_gen_qemu_st_i32(FREG(B7_4), addr, ctx->memidx,
                                     MO_TEUL | MO_ALIGN);

-- 
2.43.0


