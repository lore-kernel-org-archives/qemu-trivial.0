Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mi2es-0006pm-In
	for mharc-qemu-trivial@gnu.org; Tue, 02 Nov 2021 18:53:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mi2er-0006mO-NN
 for qemu-trivial@nongnu.org; Tue, 02 Nov 2021 18:53:33 -0400
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30]:47019)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mi2ep-0002oG-2z
 for qemu-trivial@nongnu.org; Tue, 02 Nov 2021 18:53:33 -0400
Received: by mail-io1-xd30.google.com with SMTP id i79so273249ioa.13
 for <qemu-trivial@nongnu.org>; Tue, 02 Nov 2021 15:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rKLMBYjEYlw1VjEHepSl0BqgSbBEPtGPWDcDEzPgUqg=;
 b=s/dtzSAI51H8TR5ZhoFwmRVrAfBAtWMXZyF+/ihwVs4i4zKxWY/ulOdVj5OP5XSDYN
 eMcFwcdWLQHKKnWchU7aVXK3igNR+c6bz6Wo/4OpGdC2s16PSB0ZOn0Yqm3ayLfA6ZZm
 A6AdXUVKHmVd9xJwo9hbQ+edLH+Y+iOoBLD2QXov1ZimgRzk6DVKpoVgLNiEscwIlnuh
 wqWCV215rQoMGtRf030J1GMnldHbBoCPxb62dfeyWDp+4YNpA9liWLcTYIlnpIrETseV
 1lPiGBOeiv0nW86UBAkE0tWwE4DSAKnmE44G8gaTaedKP8zfsT6zDKdyn/wTxFtvNdyS
 8yAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rKLMBYjEYlw1VjEHepSl0BqgSbBEPtGPWDcDEzPgUqg=;
 b=6kJ13oW9PuXbvDA3M12AmbfxVOQAKRTD6x9rfn3tjYoBSDXbE36djsU2vj2ljs359X
 qGdiLAbGy3jNJ8yf2jIXnezwY+imHdLd0EIpu+ZD9qsD6mmXooVjfrH3bVcQlYIxKtf/
 2+RMo2t182oP7Uy8cmVVw4nM+M2Sg/mXJJ2CwptJfARMg1qGz/FtN5cNONSrRdDsP1lW
 F0MjFdEPywVAd0RSvHVBizooD6fEbIFYGm045w/D8mleYle/e983VMzJk9Mzr6tV853H
 OGoNWNz1QyzmJ3witoSXOc7vOFrSFp46hKJKcKQQ4xQmX8Qi2Ict9y9/7webTU4vC4jT
 7C7A==
X-Gm-Message-State: AOAM5303UBFBCY0yw5JaKDPO5lin9eYoJsb+QgHCkfp5qBLYmHftJ9JP
 Osa/hDC4reUuF9Th5OuM2Y5oSw==
X-Google-Smtp-Source: ABdhPJxZv2zX29Q8gXYvRTXEOXB2/l9gBZXJSEqZJ0FZueVXpe0dDXsIXhYIEw2VqbdzxmTpev5rsg==
X-Received: by 2002:a05:6638:33a8:: with SMTP id
 h40mr28762842jav.4.1635893610040; 
 Tue, 02 Nov 2021 15:53:30 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id h14sm205427ils.75.2021.11.02.15.53.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 15:53:29 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, Warner Losh <imp@bsdimp.com>,
 qemu-trivial@nongnu.org, Philippe Mathieu-Daude <f4bug@amsat.org>,
 Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Stacey Son <sson@FreeBSD.org>,
 Kyle Evans <kevans@FreeBSD.org>
Subject: [PATCH v2 11/30] bsd-user/arm/target_arch_reg.h: Implement core dump
 register copying
Date: Tue,  2 Nov 2021 16:52:29 -0600
Message-Id: <20211102225248.52999-12-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211102225248.52999-1-imp@bsdimp.com>
References: <20211102225248.52999-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d30;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd30.google.com
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
X-List-Received-Date: Tue, 02 Nov 2021 22:53:34 -0000

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


