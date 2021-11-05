Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mipmc-0005lE-8e
	for mharc-qemu-trivial@gnu.org; Thu, 04 Nov 2021 23:20:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mipmA-0004wi-Sl
 for qemu-trivial@nongnu.org; Thu, 04 Nov 2021 23:20:22 -0400
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29]:35753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mipm8-0004Fy-U5
 for qemu-trivial@nongnu.org; Thu, 04 Nov 2021 23:20:22 -0400
Received: by mail-io1-xd29.google.com with SMTP id c206so7788884iof.2
 for <qemu-trivial@nongnu.org>; Thu, 04 Nov 2021 20:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NxuDAF8jAoUwFWtiVKiLjCxUV4oGpS2eNcZyh+rNyYo=;
 b=wQu+O1l8NZDXq6FwVCEAeRqtrmLa6RAMWccuNggDsJav6tclXCXSykjgK4atQrpy8U
 KVRrkrONGxxuMEERJZKJCbQ8e9pNTfT6iGyAmJcyGjvUcQtTyF1iQyxwgVqWoIo+vc8L
 GbxCA/N13UZXZqc2ShdL6biJ9jGT5geUiP/KNNtWCMuHYt2K0GDZay7Qi8PXoTxOqChN
 nHAN75yWVkj7gXswngOp0GsCAY1cz+PBoV9QTXMojZ43w5gH767zKv8vldB52Fq4+cOC
 02Ay0gslbG6cN2wtltqDKilq0UpSB9ls5lx193/2y2xK7f32bK7KeFsEMXgZjhXEu5bj
 Cizw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NxuDAF8jAoUwFWtiVKiLjCxUV4oGpS2eNcZyh+rNyYo=;
 b=Xwuo3ZJaxbwz0SHiGuSVHGm3zPCHfy0t+tjPSOqD/6eqA8ZxcZ+rnvVz319Yb++BbV
 XH7N1g7gfpeNimkQguFtA/QPesSTzrYS/cxDC6S/stP44/ft2wottFmbRje1qrwqrrjL
 7G1/+5nO5C60PQuyDTAMQbbu4q1sP6iLhNFC6jWB9ymVj1UKirWd07KNPyh+xzRTvNUJ
 tXhSQbJsdU4naIMbIa1sPiadaivdbLpbVI2T9hSW0Tsq7tzOUBbhVmnlL5Q6L+pg7kuF
 NRF6Ce62/61xRj+KUKWh43SV12GIgTZySc8fpQsbqMQNonDF/R81S8N7OhMnDwfdv9mV
 gGCw==
X-Gm-Message-State: AOAM531segpN5V8WWZuktwHVMGJLrobPAhpf8TfjsoAdEqMkec8Kzb+2
 QxZ7L2EUx3WJCsGIiaRzwYnkig==
X-Google-Smtp-Source: ABdhPJx5zmOTncRFsE40th0YO68ACIy6K1m/u4WZRa6s4KWymxLN1QGaAcsLz4b/+JMqTqKH74C+GQ==
X-Received: by 2002:a05:6602:2ccf:: with SMTP id
 j15mr25770582iow.77.1636082419897; 
 Thu, 04 Nov 2021 20:20:19 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id v4sm3508528ilq.57.2021.11.04.20.20.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 20:20:19 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Philippe Mathieu-Daude <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 qemu-trivial@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@bsdimp.com>, Laurent Vivier <laurent@vivier.eu>,
 Kyle Evans <kevans@freebsd.org>, Stacey Son <sson@FreeBSD.org>,
 Kyle Evans <kevans@FreeBSD.org>
Subject: [PATCH v4 32/36] bsd-user/arm/target_arch_signal.c: arm get_mcontext
Date: Thu,  4 Nov 2021 21:19:13 -0600
Message-Id: <20211105031917.87837-33-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211105031917.87837-1-imp@bsdimp.com>
References: <20211105031917.87837-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d29;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd29.google.com
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
X-List-Received-Date: Fri, 05 Nov 2021 03:20:23 -0000

Get the machine context from the CPU state.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Kyle Evans <kevans@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/arm/signal.c             | 51 +++++++++++++++++++++++++++++++
 bsd-user/arm/target_arch_signal.h |  1 +
 2 files changed, 52 insertions(+)

diff --git a/bsd-user/arm/signal.c b/bsd-user/arm/signal.c
index 3c0db30a85..93c9bfc0d3 100644
--- a/bsd-user/arm/signal.c
+++ b/bsd-user/arm/signal.c
@@ -58,3 +58,54 @@ abi_long set_sigtramp_args(CPUARMState *env, int sig,
 
     return 0;
 }
+
+/*
+ * Compare to arm/arm/machdep.c get_mcontext()
+ * Assumes that the memory is locked if mcp points to user memory.
+ */
+abi_long get_mcontext(CPUARMState *env, target_mcontext_t *mcp, int flags)
+{
+    int err = 0;
+    uint32_t *gr = mcp->__gregs;
+
+    if (mcp->mc_vfp_size != 0 && mcp->mc_vfp_size != sizeof(target_mcontext_vfp_t)) {
+        return -TARGET_EINVAL;
+    }
+
+    gr[TARGET_REG_CPSR] = tswap32(cpsr_read(env));
+    if (flags & TARGET_MC_GET_CLEAR_RET) {
+        gr[TARGET_REG_R0] = 0;
+        gr[TARGET_REG_CPSR] &= ~CPSR_C;
+    } else {
+        gr[TARGET_REG_R0] = tswap32(env->regs[0]);
+    }
+
+    gr[TARGET_REG_R1] = tswap32(env->regs[1]);
+    gr[TARGET_REG_R2] = tswap32(env->regs[2]);
+    gr[TARGET_REG_R3] = tswap32(env->regs[3]);
+    gr[TARGET_REG_R4] = tswap32(env->regs[4]);
+    gr[TARGET_REG_R5] = tswap32(env->regs[5]);
+    gr[TARGET_REG_R6] = tswap32(env->regs[6]);
+    gr[TARGET_REG_R7] = tswap32(env->regs[7]);
+    gr[TARGET_REG_R8] = tswap32(env->regs[8]);
+    gr[TARGET_REG_R9] = tswap32(env->regs[9]);
+    gr[TARGET_REG_R10] = tswap32(env->regs[10]);
+    gr[TARGET_REG_R11] = tswap32(env->regs[11]);
+    gr[TARGET_REG_R12] = tswap32(env->regs[12]);
+
+    gr[TARGET_REG_SP] = tswap32(env->regs[13]);
+    gr[TARGET_REG_LR] = tswap32(env->regs[14]);
+    gr[TARGET_REG_PC] = tswap32(env->regs[15]);
+
+    if (mcp->mc_vfp_size != 0 && mcp->mc_vfp_ptr != 0) {
+        /* see get_vfpcontext in sys/arm/arm/exec_machdep.c */
+        target_mcontext_vfp_t *vfp;
+        vfp = lock_user(VERIFY_WRITE, mcp->mc_vfp_ptr, sizeof(*vfp), 0);
+        for (int i = 0; i < 32; i++) {
+            vfp->mcv_reg[i] = tswap64(*aa32_vfp_dreg(env, i));
+        }
+        vfp->mcv_fpscr = tswap32(vfp_get_fpscr(env));
+        unlock_user(vfp, mcp->mc_vfp_ptr, sizeof(*vfp));
+    }
+    return err;
+}
diff --git a/bsd-user/arm/target_arch_signal.h b/bsd-user/arm/target_arch_signal.h
index 8286aa5d6e..429843c70f 100644
--- a/bsd-user/arm/target_arch_signal.h
+++ b/bsd-user/arm/target_arch_signal.h
@@ -89,5 +89,6 @@ abi_long set_sigtramp_args(CPUARMState *regs, int sig,
                            struct target_sigframe *frame,
                            abi_ulong frame_addr,
                            struct target_sigaction *ka);
+abi_long get_mcontext(CPUARMState *regs, target_mcontext_t *mcp, int flags);
 
 #endif /* !_TARGET_ARCH_SIGNAL_H_ */
-- 
2.33.0


