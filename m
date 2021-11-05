Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mipmW-0005cm-2u
	for mharc-qemu-trivial@gnu.org; Thu, 04 Nov 2021 23:20:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1miplz-0004VI-Pz
 for qemu-trivial@nongnu.org; Thu, 04 Nov 2021 23:20:13 -0400
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b]:45714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1miplx-0004Ad-0D
 for qemu-trivial@nongnu.org; Thu, 04 Nov 2021 23:20:11 -0400
Received: by mail-io1-xd2b.google.com with SMTP id q203so9162237iod.12
 for <qemu-trivial@nongnu.org>; Thu, 04 Nov 2021 20:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rKLMBYjEYlw1VjEHepSl0BqgSbBEPtGPWDcDEzPgUqg=;
 b=fyq52+1H7qnvQoDjJrPOm/QQp1mut1XErFX58Q9qnLnEZ4VXfWuiqKVNvlgI+kptM1
 Cfy0Gj/Uo2OS2mn0M9/g/oWt7GFFRfYyS310V9BIjcsdaYIE/8BaCcdAhft1Vnvwl5Qj
 n1/z5eIgi2Du/KuWWtqtLKjz7jxUHPWTxaAnZPjYG6QQm9qfxh5RRnkYvj6kQVIMC3g+
 JysL0DQ2uyS0Cui2MrJ+S/MLWaCU45Lqa0CyEcRFZ2/PQcOCnAY1Frb7IXVoiNXlqyKZ
 xhpDYO+jwruo3+JfsGaRbX77BBD5jjp587R82D/mHpcMc7he5KmoRGnpQ+cVVOyNNsAV
 HmFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rKLMBYjEYlw1VjEHepSl0BqgSbBEPtGPWDcDEzPgUqg=;
 b=3CjLVmg0BzoUPVyhljkWYX3s2olx+LoKhmPLI771mdRS7PflftFakFp/DfWwrsvbXp
 TlFypMbg8aePfR/6T7tBmeep/Dic4K29ngJ3n7ygHyHtZDYr4DKXPRN5ytPQmgdyYaII
 Lk1UYmgUjal7Trqt/Rb3kXu3SYL2RHRAJFWjvv2Hhi2TjDCRrAJzZziClzfxzUdk+3AN
 8bLuvHzvbhticL2jWBDMRMc3qRkjNp7Gkwv84MekIUNOoOLkUF4UCY9mNKhym7/ojr15
 et/9nWIiI0/EowqtS90RiyO5kH1too0x4UdzZPJWChYV69ZJTZ485uFWuWSDXZTX9//I
 z4iQ==
X-Gm-Message-State: AOAM531c9GyrQ306seFENS9PMjlbQWqJy5fPXPB7QfncZ8ZmBfNXOOy0
 B0duZUKNTMcwLYjHJjDeaAaQew==
X-Google-Smtp-Source: ABdhPJzk+D4b1B7miKa6SSKPZqy971p97GfKWh5yptfPDoXHd0QDPOgyljctneo8X8+a1smh0f+b4w==
X-Received: by 2002:a05:6638:164a:: with SMTP id
 a10mr7011222jat.1.1636082407765; 
 Thu, 04 Nov 2021 20:20:07 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id v4sm3508528ilq.57.2021.11.04.20.20.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 20:20:07 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Philippe Mathieu-Daude <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 qemu-trivial@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@bsdimp.com>, Laurent Vivier <laurent@vivier.eu>,
 Kyle Evans <kevans@freebsd.org>, Stacey Son <sson@FreeBSD.org>,
 Kyle Evans <kevans@FreeBSD.org>
Subject: [PATCH v4 21/36] bsd-user/arm/target_arch_reg.h: Implement core dump
 register copying
Date: Thu,  4 Nov 2021 21:19:02 -0600
Message-Id: <20211105031917.87837-22-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211105031917.87837-1-imp@bsdimp.com>
References: <20211105031917.87837-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2b;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2b.google.com
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
X-List-Received-Date: Fri, 05 Nov 2021 03:20:13 -0000

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


