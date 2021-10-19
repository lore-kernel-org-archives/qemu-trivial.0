Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mcsFU-0000fb-2t
	for mharc-qemu-trivial@gnu.org; Tue, 19 Oct 2021 12:46:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcsEy-0000Fv-5Y
 for qemu-trivial@nongnu.org; Tue, 19 Oct 2021 12:45:28 -0400
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32]:40560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcsEo-0000MG-5h
 for qemu-trivial@nongnu.org; Tue, 19 Oct 2021 12:45:27 -0400
Received: by mail-io1-xd32.google.com with SMTP id x1so21100337iof.7
 for <qemu-trivial@nongnu.org>; Tue, 19 Oct 2021 09:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+ZQV0YJMyRs2xXRGkVBiDySL2/j9JGTeSa3Oi2rrn2U=;
 b=07qJzJK4NNurGj5I0NfWTKT17nar35V6Hc7PjX82KVAhFSEsmc6C43eetwyQNxezjG
 x25m4u5vViMYirGNfy9c70gpk6nEMy2aJfSIQAlXzItraINFgn+2ceEigUaWo3IDJW7/
 r6Ny2vhLXoo6qh+06uZEdSDjLJz/4WzGisACHiMYeqKVXJF/Bcykkm+p/tHPZaF9XT4z
 qJOeg1rbXQHZ2GeMMaMesMm3G02k1P7N/YYbkV9nUWkulDbUCwiKNuaRA6styZOp4nJI
 DZlJTZlkMubqGaQRjcXrX4MkFiMMe2UXH2Wk7L/JpIGEnEMHRe/a7imOsMyqW8VmuQL2
 phGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+ZQV0YJMyRs2xXRGkVBiDySL2/j9JGTeSa3Oi2rrn2U=;
 b=OErPHIqiviqpnsYSWzugZhEpjzhnPJlD48R7U9d0o33numbd8ifQq0Ih44pdxlB8SP
 Tu9qQxfK1bydVSHAx4Uhae1KnFKUiU9KYCJ2hIXPcIWwwgejwB2Bj0cvhjvESLGXUkSq
 i7enEXIqDjhspobpiSHuL7UTH+NFfYeino9em3OMb2JiswXB/DmMkNywpaG1nDHj7/b/
 YsQJ4YtnHH/l8qbMK9Qdan2lIQ01rayfN3b4pZVsLBgS6+drTZOOrc/8Px1qe1YkteLo
 fkXwYAkymfwQxxXHSpFNpwFt6TmiAXHJJvJbuFo/kyLg51r2ukHt909Q3IuiHGnjt21e
 CEeg==
X-Gm-Message-State: AOAM5310bHnKuLJ4M4Bx/iQVrA8pSzRzwUcESxJ4qW3O7HZlZrZKsuax
 zEEM36lKWCGcUUXTcIEMa7V9mA==
X-Google-Smtp-Source: ABdhPJyjglqVqbCarMiKQfhCzT6/fBGJLhVn9F7MfOArHMe7k/24F+/SX8ySeZYrbYtcp/gLZwtutQ==
X-Received: by 2002:a5e:8f01:: with SMTP id c1mr12695762iok.148.1634661916978; 
 Tue, 19 Oct 2021 09:45:16 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id q7sm1133951ilv.48.2021.10.19.09.45.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 09:45:16 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>, Laurent Vivier <laurent@vivier.eu>,
 qemu-trivial@nongnu.org, Kyle Evans <kevans@freebsd.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Stacey Son <sson@FreeBSD.org>
Subject: [PATCH 10/24] bsd-user/arm/target_arch_reg.h: Implement core dump
 register copying
Date: Tue, 19 Oct 2021 10:44:33 -0600
Message-Id: <20211019164447.16359-11-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211019164447.16359-1-imp@bsdimp.com>
References: <20211019164447.16359-1-imp@bsdimp.com>
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
X-List-Received-Date: Tue, 19 Oct 2021 16:45:29 -0000

Implement the register copying routines to extract registers from the
cpu for core dump generation.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
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
2.32.0


