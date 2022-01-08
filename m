Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n66KS-0006EY-DN
	for mharc-qemu-trivial@gnu.org; Sat, 08 Jan 2022 02:39:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n66Im-0005Ln-6T
 for qemu-trivial@nongnu.org; Sat, 08 Jan 2022 02:38:13 -0500
Received: from [2607:f8b0:4864:20::d32] (port=33785
 helo=mail-io1-xd32.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n66If-0003Qz-Sf
 for qemu-trivial@nongnu.org; Sat, 08 Jan 2022 02:38:09 -0500
Received: by mail-io1-xd32.google.com with SMTP id s6so10177643ioj.0
 for <qemu-trivial@nongnu.org>; Fri, 07 Jan 2022 23:38:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kmpxcPLnQajhynuO8Pi+Ynu8h8dKLSTDfwFItipGD6k=;
 b=JBUq/aEtFuzopJGGuqvG5nVcyM+CCO/a1tSDLc4/u2nKWvRU+GI5k/ZGwEzPEeWTPs
 EtLfypWV+/O2CcfU/ythfugzTGdpHLdlGjVKR5iSeBYVBcEx0ujpLc/expwJwSQgpu3v
 NAnN12aaaFikul3K2Gn5o8X2XQlLNl1eBQpKcGStNzRCfO4rxy4U9Ye/nz/qREb+uPW/
 UdGfh0h9Da5nCaoKiDH7pAWc70eQXcA/sRiAas/fN1vIvYbO/KWy1sHomeShrWAie9FC
 h7hIDpZ4m+dvl0wjzNydvJJjk74lJsrmHTx55asc9wriE9bmuoTlLY7eeWNVTcUalL4P
 LJqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kmpxcPLnQajhynuO8Pi+Ynu8h8dKLSTDfwFItipGD6k=;
 b=0HnFp8ewdf2waGaLO7P4qjmsA4VRDHVNCNIRkthqs1GDMzUq71JR6RF3YYRMMHye5a
 fQ504QxCJLmlKWiskriZp81odNtK2Tky3nOG4TB3XiudltPlvZaksAxCzendSqPnJudy
 yUl5pUf0xMWMen1ChxE85vovvkeAlptE+WA6IexsPhFWf8Tb1+bgFSeVLgM6Kf5HW0ld
 KfcKN1OO+fP/oF71V05IsrCssD/GMHpLprzFAoRK82Fgw30kx2tyeyQGit0sxB/yJu3i
 TVb03CksL9ze7yIN5uQPGfqnSECbBXmLOThf662cI9FigwMAkCalmlPKSmDU8Su1Xsrk
 H4kw==
X-Gm-Message-State: AOAM533gIz6xY4lT0ltkY8k1z9PHmTWal/9TKlPyBCziWHBsD7YeR60F
 X4SLWhmWkXq/vYooESn/rLvlxg==
X-Google-Smtp-Source: ABdhPJyCOlOnFxwM41u2um1Il7cD9Mld5o7qhxixFPqQe0+2dAxyb48UpfzwP4TUg0qaEVUoFKN0uA==
X-Received: by 2002:a05:6602:24ce:: with SMTP id
 h14mr30800084ioe.87.1641627484456; 
 Fri, 07 Jan 2022 23:38:04 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id w19sm613022iov.12.2022.01.07.23.38.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 23:38:04 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-trivial@nongnu.org, kevans@freebsd.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Warner Losh <imp@bsdimp.com>,
 Laurent Vivier <laurent@vivier.eu>, Stacey Son <sson@FreeBSD.org>,
 Kyle Evans <kevans@FreeBSD.org>
Subject: [PULL 22/37] bsd-user/arm/target_arch_reg.h: Implement core dump
 register copying
Date: Sat,  8 Jan 2022 00:37:22 -0700
Message-Id: <20220108073737.5959-23-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220108073737.5959-1-imp@bsdimp.com>
References: <20220108073737.5959-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d32
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d32;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd32.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Sat, 08 Jan 2022 07:38:16 -0000

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
index 00000000000..ef5ed5154f1
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
2.33.1


