Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1midNq-0006pR-3l
	for mharc-qemu-trivial@gnu.org; Thu, 04 Nov 2021 10:06:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1midNj-0006jH-W6
 for qemu-trivial@nongnu.org; Thu, 04 Nov 2021 10:06:20 -0400
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32]:40863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1midNi-0000zN-9L
 for qemu-trivial@nongnu.org; Thu, 04 Nov 2021 10:06:19 -0400
Received: by mail-io1-xd32.google.com with SMTP id d70so6053684iof.7
 for <qemu-trivial@nongnu.org>; Thu, 04 Nov 2021 07:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rKLMBYjEYlw1VjEHepSl0BqgSbBEPtGPWDcDEzPgUqg=;
 b=KYtKzccL8ob3kUeHq3Ewwfr64lXVIMC/wjEJdd0QyGXwHIxYScpuXWWsxGEiBr9/V/
 uID0tZChUrwYDYzGyDbHOCEt4mCibH8vLIC1i4xEgZSdx/1w5L060EUrlZ0Rf0B6wxin
 IW85FRItnuG1HeO48h2t6M2wzpOv0T3dDqbuhEIJl2OZ0N8bXK75Z3MS1eAoOAxlv8t7
 iPH/kK9NpT4BO7AYGD+0vWSkKipqQgvBwovMv8dM5KGdULnrDxD3WmFv1eYrofnmNTp/
 eL6peqmIayR1d6tfsCpFG6cVMLCCqLAS8Z5o7CthMIGJEgxnA9CFJEDfFF1yY9DLmW2R
 x7qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rKLMBYjEYlw1VjEHepSl0BqgSbBEPtGPWDcDEzPgUqg=;
 b=OA9A3NjwX9c3vvieEN1IcVgxo0hyR+fVHiwgDmrLCqTQB/XwvZtVTtxZXIbnVGJO+b
 dGqSwWSIJ6O4Ak6XbP1TURrC8ghsU9x8/c4Wk8GcthFN6Wpi5ZpY7xc4nXmFzFgp5o8B
 2tHtHgkkoB4GhvBOVmbcs7QbtuWMpxA22SPsSHlXAHVxnqnYm9OtxKyA5U3/6SVqZc3w
 K+UpyWtJQjk9TSbwcX5Xr5XTEXMpLNoFEbwX5lbDw0hgbgIsAOsiH3avNxFTsl1zWWXL
 AU8eQUINgOg2F0NFScUNQlNK2efzq01wvNoaRRuRXw5K3A7w/W/AVczL5f1URK2Rtxhr
 cqew==
X-Gm-Message-State: AOAM5334tn8ElDAhnyWkI/vN7bQZi5e3vQhdhr/xg8RmGP0+iRTneEi3
 SIZILihfd9RAfTCk25l9f3Ep/g==
X-Google-Smtp-Source: ABdhPJxc5UBb9wK4JZvulGce+Lf1H9gs0hvt/fzZY7ftqYjL3NCtS8dnAG7dKOB5gQrewPt63owaCQ==
X-Received: by 2002:a5e:d505:: with SMTP id e5mr868503iom.217.1636034777257;
 Thu, 04 Nov 2021 07:06:17 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id l2sm3206741iln.50.2021.11.04.07.06.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 07:06:16 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>, Laurent Vivier <laurent@vivier.eu>,
 Michael Tokarev <mjt@tls.msk.ru>, Philippe Mathieu-Daude <f4bug@amsat.org>,
 qemu-trivial@nongnu.org, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stacey Son <sson@FreeBSD.org>, Kyle Evans <kevans@FreeBSD.org>
Subject: [PATCH v3 10/29] bsd-user/arm/target_arch_reg.h: Implement core dump
 register copying
Date: Thu,  4 Nov 2021 08:05:17 -0600
Message-Id: <20211104140536.42573-11-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211104140536.42573-1-imp@bsdimp.com>
References: <20211104140536.42573-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d32;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd32.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 04 Nov 2021 14:06:20 -0000

Implement the register copying routines to extract registers from the
cpu for core dump generation.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/arm/target_arch_reg.h | 60 ++++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 bsd-user/arm/target_arch_reg.h

diff --git a/bsd-user/arm/target_arch_reg.h b/bsd-user/arm/target_arch_reg.h
new file mode 100644
index 0000000000..ef5ed5154f
--- /dev/null
+++ b/bsd-user/arm/target_arch_reg.h
@@ -0,0 +1,60 @@
+/*
+ *  FreeBSD arm register structures
+ *
+ *  Copyright (c) 2015 Stacey Son
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef _TARGET_ARCH_REG_H_
+#define _TARGET_ARCH_REG_H_
+
+/* See sys/arm/include/reg.h */
+typedef struct target_reg {
+    uint32_t        r[13];
+    uint32_t        r_sp;
+    uint32_t        r_lr;
+    uint32_t        r_pc;
+    uint32_t        r_cpsr;
+} target_reg_t;
+
+typedef struct target_fp_reg {
+    uint32_t        fp_exponent;
+    uint32_t        fp_mantissa_hi;
+    u_int32_t       fp_mantissa_lo;
+} target_fp_reg_t;
+
+typedef struct target_fpreg {
+    uint32_t        fpr_fpsr;
+    target_fp_reg_t fpr[8];
+} target_fpreg_t;
+
+#define tswapreg(ptr)   tswapal(ptr)
+
+static inline void target_copy_regs(target_reg_t *regs, const CPUARMState *env)
+{
+    int i;
+
+    for (i = 0; i < 13; i++) {
+        regs->r[i] = tswapreg(env->regs[i + 1]);
+    }
+    regs->r_sp = tswapreg(env->regs[13]);
+    regs->r_lr = tswapreg(env->regs[14]);
+    regs->r_pc = tswapreg(env->regs[15]);
+    regs->r_cpsr = tswapreg(cpsr_read((CPUARMState *)env));
+}
+
+#undef tswapreg
+
+#endif /* !_TARGET_ARCH_REG_H_ */
-- 
2.33.0


