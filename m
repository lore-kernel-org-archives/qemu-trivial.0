Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mcsFp-0000pz-JU
	for mharc-qemu-trivial@gnu.org; Tue, 19 Oct 2021 12:46:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcsFB-0000NC-9s
 for qemu-trivial@nongnu.org; Tue, 19 Oct 2021 12:45:42 -0400
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e]:44775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcsEy-0000Wc-Em
 for qemu-trivial@nongnu.org; Tue, 19 Oct 2021 12:45:40 -0400
Received: by mail-il1-x12e.google.com with SMTP id j8so19033664ila.11
 for <qemu-trivial@nongnu.org>; Tue, 19 Oct 2021 09:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6Cf5sTAxUFGu9BSyltFuNOE2WbAFN6R6D/STx0Iy5tY=;
 b=ScHzN7hp4W9IjtjBBsbzOif3V45Jf/V3k80l8NU9wgDF7kxfo1hkAGsT8oVhhJYpHb
 6jgWUiNZkuCmp21tZDl4vqpOi6cESeZd8cRphLK5hF7Rhp67/epJY0jAXRoLpQL7Reh7
 ZamLJrTSmXoC6FPjL//YfKr2l30gCrEo/OUYn1cOKwyIhz1szeS+Jcw1/x4VqLFfNmPD
 lST5ilJ4CUd6oy/WHq4wai34XqH5ClH3362XmZAIxmpGWEn864YWtKvRDzYvUwfzg6Qt
 6cRtUY/FfNdPcuXezyqV0nldjwejdugZZ2DaOBno+lrjvkDm56jwsYL+R3TZH90g86hM
 Bdbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6Cf5sTAxUFGu9BSyltFuNOE2WbAFN6R6D/STx0Iy5tY=;
 b=ot41tE3xfM+d5/roAQlj5K4mj1u0+KQPNO74b3zH8nELwQGwkVjGy6sAiTgKmv7Z2D
 +Lx3yP2C+pqbBD5G4nx1Syb1WCTNyuaEMkVnqO42J13O9U+K0mNfglfAbrtZLPWzV7cg
 xWJyapi+YRbaosgcrk/2XZzKSORJu1pHrRSM8MlKuLVnzjwgXtK9hkLOq+qyXHMTbfvy
 12QqwkF6avW9/b+ad43ymId3iqVYo6zvvbNwTdjux/a2CxOgon7SWGF9FFFbxhs0P018
 LFkxSXxfM25W+9VYcDfp0yzhJUqrBXDCeDSSVei/cuTAsuOhydPEh+bmD3oMvKGMzdMB
 3BSQ==
X-Gm-Message-State: AOAM530aQjzRnP68utEjFNTeIbkhkCoahHfFijpc2s2zXGL09ngZqOrF
 1FX3DiC5yOL5p9D/tXNABNFWXA==
X-Google-Smtp-Source: ABdhPJzHUBbhJqWT5ZltOimM0P63nZgbMtq3LyPD+ACa8jSuUVCi/hUITsYxv1d7kt2mXuldS8F3iw==
X-Received: by 2002:a05:6e02:158c:: with SMTP id
 m12mr18627535ilu.132.1634661927466; 
 Tue, 19 Oct 2021 09:45:27 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id q7sm1133951ilv.48.2021.10.19.09.45.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 09:45:27 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>, Laurent Vivier <laurent@vivier.eu>,
 qemu-trivial@nongnu.org, Kyle Evans <kevans@freebsd.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Stacey Son <sson@FreeBSD.org>,
 Klye Evans <kevans@FreeBSD.org>
Subject: [PATCH 21/24] bsd-user/arm/target_arch_signal.h: arm get_mcontext
Date: Tue, 19 Oct 2021 10:44:44 -0600
Message-Id: <20211019164447.16359-22-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211019164447.16359-1-imp@bsdimp.com>
References: <20211019164447.16359-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12e;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12e.google.com
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
X-List-Received-Date: Tue, 19 Oct 2021 16:45:42 -0000

Get the machine context from the CPU state.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Klye Evans <kevans@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/arm/target_arch_signal.h | 38 +++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/bsd-user/arm/target_arch_signal.h b/bsd-user/arm/target_arch_signal.h
index b421c2522c..302fdc2846 100644
--- a/bsd-user/arm/target_arch_signal.h
+++ b/bsd-user/arm/target_arch_signal.h
@@ -163,4 +163,42 @@ set_sigtramp_args(CPUARMState *regs, int sig, struct target_sigframe *frame,
     return 0;
 }
 
+/*
+ * Compare to arm/arm/machdep.c get_mcontext()
+ * Assumes that the memory is locked if mcp points to user memory.
+ */
+static inline abi_long get_mcontext(CPUARMState *regs, target_mcontext_t *mcp,
+        int flags)
+{
+    int err = 0;
+    uint32_t *gr = mcp->__gregs;
+
+    gr[TARGET_REG_CPSR] = tswap32(cpsr_read(regs));
+    if (flags & TARGET_MC_GET_CLEAR_RET) {
+        gr[TARGET_REG_R0] = 0;
+        gr[TARGET_REG_CPSR] &= ~CPSR_C;
+    } else {
+        gr[TARGET_REG_R0] = tswap32(regs->regs[0]);
+    }
+
+    gr[TARGET_REG_R1] = tswap32(regs->regs[1]);
+    gr[TARGET_REG_R2] = tswap32(regs->regs[2]);
+    gr[TARGET_REG_R3] = tswap32(regs->regs[3]);
+    gr[TARGET_REG_R4] = tswap32(regs->regs[4]);
+    gr[TARGET_REG_R5] = tswap32(regs->regs[5]);
+    gr[TARGET_REG_R6] = tswap32(regs->regs[6]);
+    gr[TARGET_REG_R7] = tswap32(regs->regs[7]);
+    gr[TARGET_REG_R8] = tswap32(regs->regs[8]);
+    gr[TARGET_REG_R9] = tswap32(regs->regs[9]);
+    gr[TARGET_REG_R10] = tswap32(regs->regs[10]);
+    gr[TARGET_REG_R11] = tswap32(regs->regs[11]);
+    gr[TARGET_REG_R12] = tswap32(regs->regs[12]);
+
+    gr[TARGET_REG_SP] = tswap32(regs->regs[13]);
+    gr[TARGET_REG_LR] = tswap32(regs->regs[14]);
+    gr[TARGET_REG_PC] = tswap32(regs->regs[15]);
+
+    return err;
+}
+
 #endif /* !_TARGET_ARCH_SIGNAL_H_ */
-- 
2.32.0


