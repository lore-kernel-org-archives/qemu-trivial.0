Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mjvpe-0007Ks-PV
	for mharc-qemu-trivial@gnu.org; Sun, 07 Nov 2021 23:00:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mjvpS-000764-AX
 for qemu-trivial@nongnu.org; Sun, 07 Nov 2021 23:00:22 -0500
Received: from [2607:f8b0:4864:20::129] (port=45682
 helo=mail-il1-x129.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mjvpQ-0000yS-Em
 for qemu-trivial@nongnu.org; Sun, 07 Nov 2021 23:00:18 -0500
Received: by mail-il1-x129.google.com with SMTP id i12so15544698ila.12
 for <qemu-trivial@nongnu.org>; Sun, 07 Nov 2021 20:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rKLMBYjEYlw1VjEHepSl0BqgSbBEPtGPWDcDEzPgUqg=;
 b=cJXZ5UEBvURLY9C+HCVOQ6PhBsyhLuyZlDOhItVxfW5gUagn8P25kfL5smpvPzhg1j
 8yMZDut/8s8mLYvjc4r2ndsxSYvSWXkOW+p82aNYJGAsNDEC+v9EpSG6aXrEQ3YxkrhZ
 RPZcft2vXDWBRM+ugjDqEFQPDhLuosq9pkf2ENKu7ctj07Re95Mv6V0R/DFGTRG1n4V9
 IGttdSx3fcRmAA9WoLJ+mt8YcExDSlgb44h7xImQu3OgLZOWfal6BFJ441ZgBib5UWOc
 UUkoA7vWwy0K6KKmim7Ck4Ez/rV/Tb/33s34IKdVQCpEFCbnJCc1FZd/SHknUVgpEyO4
 3ghg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rKLMBYjEYlw1VjEHepSl0BqgSbBEPtGPWDcDEzPgUqg=;
 b=BuJeItHSL4cwxGb4KIIxTLFhAQKUZT1ho3Dcw94sOmjlebOG4BaXzggURWvfXdPNvz
 SQ7xkFSBxpXSVsQAhAfG7JglRLOI/JwIIPwmEePczsQW820sH5JbGq5bT3d1Ng71pIol
 iDnF3xoWw6RqVt45tBu36q7tcO4yfeSf89aYOXHvHc83ulxczh6XKBm6vv9Jow+JIOl2
 VF1XN7jCVHGrD3domln8vV7ogeKeWyFbMpPOYIddszOgtfsrHettx6qJwfEMDHq3/psQ
 wAhis/k3blZpVrIALkJJ59QDBWsZI3bdlaV4ByucLpuluzqP98xBQmhtpFiuJ7r98/Lk
 Be/w==
X-Gm-Message-State: AOAM532vQx7WtKVPkIKT04C+eL3CFVbvvUy8XwnbN5r8DBdCc8PH2+JT
 nLvGTiHq6TyxE5PSrWYa/JQKZrrC2iataA==
X-Google-Smtp-Source: ABdhPJw7o9FR3RFWy6svo0UDVF9ltptU8k1K/5h0Zbz9/6BhrVlm6KXEtZfIVxE+OvqL6qNsOzD4nw==
X-Received: by 2002:a05:6602:2c0d:: with SMTP id
 w13mr11266965iov.79.1636343550934; 
 Sun, 07 Nov 2021 19:52:30 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id x15sm876909iob.8.2021.11.07.19.52.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Nov 2021 19:52:30 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Michael Tokarev <mjt@tls.msk.ru>,
 Warner Losh <imp@bsdimp.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Kyle Evans <kevans@freebsd.org>, Philippe Mathieu-Daude <f4bug@amsat.org>,
 qemu-trivial@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Stacey Son <sson@FreeBSD.org>, Kyle Evans <kevans@FreeBSD.org>
Subject: [PATCH v5 22/37] bsd-user/arm/target_arch_reg.h: Implement core dump
 register copying
Date: Sun,  7 Nov 2021 20:51:21 -0700
Message-Id: <20211108035136.43687-23-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211108035136.43687-1-imp@bsdimp.com>
References: <20211108035136.43687-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::129
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::129;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x129.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 08 Nov 2021 04:00:23 -0000

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


