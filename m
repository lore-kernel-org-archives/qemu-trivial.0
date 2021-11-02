Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mi2f7-0007fV-6x
	for mharc-qemu-trivial@gnu.org; Tue, 02 Nov 2021 18:53:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mi2f5-0007XF-BN
 for qemu-trivial@nongnu.org; Tue, 02 Nov 2021 18:53:47 -0400
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e]:34557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mi2f1-0002sN-Kv
 for qemu-trivial@nongnu.org; Tue, 02 Nov 2021 18:53:47 -0400
Received: by mail-io1-xd2e.google.com with SMTP id b203so609967iof.1
 for <qemu-trivial@nongnu.org>; Tue, 02 Nov 2021 15:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=z1Wl9T8L67x7bSGj83CIsbFNGgACyBDJDUbwpvxuohI=;
 b=YKxiVfyqx92Al9EOD//eWmoDlwcHD2a7uNpaN4JH/gscWMTJj0AYcW+0KAKksa4Sed
 /9B+6/YKyEZauAZh9cWdGvFZ3fHav9H/S4DkcNc0//PnEDclCU2JJGqOc/uNoM/h6q+Z
 XJH1UqLLVrF8g0Sxma4tlpXaELufMUxKthcTWo8bLmBOt0dhhoFVZ/m5Y7/LobxBjVJB
 aP9LIgH8DOarAGGHswacrCLE5lpOnuj4dNj9SpYAmwcMpg3yH+YViWuDuKAoWZ2jEg3I
 ue0XW36S51RYJMksYLAFPCvl5jswccfg7vkFjdmb0WFhndhRhrjA0V9n42CLUuIdudFp
 W4xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=z1Wl9T8L67x7bSGj83CIsbFNGgACyBDJDUbwpvxuohI=;
 b=v4Z/jhZxNa9yGH/cT1zd/dFKYCJ6KymOwhVD0EKgoDEEB4gOcBPLQR9pIgbi/Yy1u4
 aCJoNou0oJ6fX2fwJMuhXnUZwej9Nc5X0SOz2qb5xQnJqHHaPrs5kRLtpwNLCzV1UtO0
 DP4w81fD0O8lT5iK1+3acwWL3a3sdIxQUUFobAs8BzoSNEf7C+LiJlrC8Yvc66qRU8El
 ypw7Q51ZwKNPsAxikR43mK7ECoFO5E/9r5RAXUksMNwjx/ZUjp4NT6IO8UP76fxLaoWn
 XiR8sDDYjxT3XFPKcqBuNPQyvEvraRdTFe20bqcBdTLZBeVI/XcVxNZGJIRE/TpUSV8V
 nQuw==
X-Gm-Message-State: AOAM533E/z6kTlg3Vz2PpIlxuAoheu5QjAG6XUrDeFpXzxMlUcVGnq6r
 CjPbRnyYpHeCRPs06tya75/xIQ==
X-Google-Smtp-Source: ABdhPJy/s4GnIXvCoV0Af6f51xFUMtjGtgZc6P9QgVo1Kwd3cBL2y3OOl5KcgiIzX+6hmminh8x+7Q==
X-Received: by 2002:a05:6602:15d3:: with SMTP id
 f19mr17319677iow.14.1635893622540; 
 Tue, 02 Nov 2021 15:53:42 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id h14sm205427ils.75.2021.11.02.15.53.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 15:53:42 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, Warner Losh <imp@bsdimp.com>,
 qemu-trivial@nongnu.org, Philippe Mathieu-Daude <f4bug@amsat.org>,
 Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Stacey Son <sson@FreeBSD.org>
Subject: [PATCH v2 22/30] bsd-user/arm/target_arch_signal.h: arm
 set_sigtramp_args
Date: Tue,  2 Nov 2021 16:52:40 -0600
Message-Id: <20211102225248.52999-23-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211102225248.52999-1-imp@bsdimp.com>
References: <20211102225248.52999-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 02 Nov 2021 22:53:47 -0000

Implement set_sigtramp_args to setup the arguments to the sigtramp
calls.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/arm/target_arch_signal.h | 47 +++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/bsd-user/arm/target_arch_signal.h b/bsd-user/arm/target_arch_signal.h
index 4bdfcbb8d7..61440b51b4 100644
--- a/bsd-user/arm/target_arch_signal.h
+++ b/bsd-user/arm/target_arch_signal.h
@@ -82,4 +82,51 @@ struct target_sigframe {
     target_mcontext_vfp_t sf_vfp; /* actual saved VFP context */
 };
 
+/*
+ * Compare to arm/arm/machdep.c sendsig()
+ * Assumes that target stack frame memory is locked.
+ */
+static inline abi_long
+set_sigtramp_args(CPUARMState *env, int sig, struct target_sigframe *frame,
+    abi_ulong frame_addr, struct target_sigaction *ka)
+{
+    abi_ulong cpsr;
+
+    /*
+     * Arguments to signal handler:
+     *  r0 = signal number
+     *  r1 = siginfo pointer
+     *  r2 = ucontext pointer
+     *  r5 = ucontext pointer
+     *  pc = signal handler pointer
+     *  sp = sigframe struct pointer
+     *  lr = sigtramp at base of user stack
+     */
+
+    env->regs[0] = sig;
+    env->regs[1] = frame_addr +
+        offsetof(struct target_sigframe, sf_si);
+    env->regs[2] = frame_addr +
+        offsetof(struct target_sigframe, sf_uc);
+
+    /* the trampoline uses r5 as the uc address */
+    env->regs[5] = frame_addr +
+        offsetof(struct target_sigframe, sf_uc);
+    env->regs[TARGET_REG_PC] = ka->_sa_handler & ~1;
+    env->regs[TARGET_REG_SP] = frame_addr;
+    env->regs[TARGET_REG_LR] = TARGET_PS_STRINGS - TARGET_SZSIGCODE;
+    /*
+     * Low bit indicates whether or not we're entering thumb mode.
+     */
+    cpsr = cpsr_read(env);
+    if (ka->_sa_handler & 1) {
+        cpsr |= CPSR_T;
+    } else {
+        cpsr &= ~CPSR_T;
+    }
+    cpsr_write(env, cpsr, CPSR_T, CPSRWriteByInstr);
+
+    return 0;
+}
+
 #endif /* !_TARGET_ARCH_SIGNAL_H_ */
-- 
2.33.0


