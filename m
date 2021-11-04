Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1midNz-0007Tm-P2
	for mharc-qemu-trivial@gnu.org; Thu, 04 Nov 2021 10:06:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1midNx-0007K8-Kl
 for qemu-trivial@nongnu.org; Thu, 04 Nov 2021 10:06:33 -0400
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b]:35804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1midNv-00013R-6t
 for qemu-trivial@nongnu.org; Thu, 04 Nov 2021 10:06:33 -0400
Received: by mail-il1-x12b.google.com with SMTP id w15so6284449ill.2
 for <qemu-trivial@nongnu.org>; Thu, 04 Nov 2021 07:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WZLLFuJrSTapjc7n8kKaU/l4LjLdLGHCbkIEXennWv0=;
 b=wv2rB0oN9NjhNQgfChU1UgWnC2K6XfG5ewZnA4rNDDZuc1CeRCiuburjXzv7nXmpag
 XkBxP/q1HbK70sdQPkf5tqtJd9yfqXPSebeXgooK4e4ueWEg6igGaM0tlXVyhNg31SgE
 uA/MltJ6nCmDyr/d+zjiHC0fJH06cqQ+WIzJlDw8GaA3VbR/1q3blRXo53p6TymQvZhc
 FuLn8nzH1MKRAWtY8i8WhZADrn4FIY0JRwXl1MtpuRRgmtb7EpbRXdR84iilg80LcZFM
 7yYZeT588/kmDXAfgGyhckFGLsSRIsqx5EZ+XYedLLAZMw4JKzO/+ax9Whd8RzriSGEN
 vhbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WZLLFuJrSTapjc7n8kKaU/l4LjLdLGHCbkIEXennWv0=;
 b=puLQ7V/v6qjevGj2XbE16K5wwn9N6qdHJ8dmMroEi46XHQ4SHhHuMAO9fhTiWcw0bg
 5SYMJexdHu36kSbs+V3sYVOuZk5BmkB0mmovxKdLyzkqqr9O2nVWcKnIu0FnrzK4SX7k
 8SODE7+jhkf74LQ9oWMZ57/Hdc1sXHN+d3bMxSgnDbSipckXEI0lq33+4MYzK3Bn3we1
 fFo7D2/WAdVS7HRH/HnhvjPafhLP04CpYPBo5Qkh2R09oPfACasJMhrx6qjgwWWopTdV
 eBZcwSOcFf5UFc3Emjyx3DMqwRsAmtTD6G4v/eCjyLCMzlXxp01o4PhSY62C76c0wGin
 GujA==
X-Gm-Message-State: AOAM530KhlQLvaqOf3IwgdBgVlrwUdoqGtxc58mN1Bmdlob5FV12zM/8
 2uLPccXfPoi1DugdSPPV5UXZDA==
X-Google-Smtp-Source: ABdhPJwaRCfG9vOHKUluDkDlD5ec/XA2eoy4AvY5m7/Dh6cGWvuWkLVVAwi32U0HhbxDzz1XJBPiQQ==
X-Received: by 2002:a05:6e02:164d:: with SMTP id
 v13mr12515749ilu.167.1636034790121; 
 Thu, 04 Nov 2021 07:06:30 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id l2sm3206741iln.50.2021.11.04.07.06.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 07:06:29 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>, Laurent Vivier <laurent@vivier.eu>,
 Michael Tokarev <mjt@tls.msk.ru>, Philippe Mathieu-Daude <f4bug@amsat.org>,
 qemu-trivial@nongnu.org, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stacey Son <sson@FreeBSD.org>, Kyle Evans <kevans@FreeBSD.org>
Subject: [PATCH v3 22/29] bsd-user/arm/target_arch_signal.h: arm get_mcontext
Date: Thu,  4 Nov 2021 08:05:29 -0600
Message-Id: <20211104140536.42573-23-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211104140536.42573-1-imp@bsdimp.com>
References: <20211104140536.42573-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12b;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12b.google.com
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
X-List-Received-Date: Thu, 04 Nov 2021 14:06:33 -0000

Get the machine context from the CPU state.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Kyle Evans <kevans@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/arm/target_arch_signal.h | 50 +++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/bsd-user/arm/target_arch_signal.h b/bsd-user/arm/target_arch_signal.h
index e673132c68..ebb44d10dc 100644
--- a/bsd-user/arm/target_arch_signal.h
+++ b/bsd-user/arm/target_arch_signal.h
@@ -121,4 +121,54 @@ set_sigtramp_args(CPUARMState *env, int sig, struct target_sigframe *frame,
     return 0;
 }
 
+/*
+ * Compare to arm/arm/machdep.c get_mcontext()
+ * Assumes that the memory is locked if mcp points to user memory.
+ */
+static inline abi_long get_mcontext(CPUARMState *env, target_mcontext_t *mcp,
+        int flags)
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
+    if (mcp->mc_vfp_size != 0 && mcp->mc_vfp_ptr != NULL) {
+        /* see get_vfpcontext in sys/arm/arm/exec_machdep.c */
+        target_mcontext_vfp_t *vfp = (target_mcontext_vfp_t *)mcp->mc_vfp_ptr;
+        for (int i = 0; i < 32; i++) {
+            vfp->mcv_reg[i] = tswap64(*aa32_vfp_dreg(env, i));
+        }
+        vfp->mcv_fpscr = tswap32(vfp_get_fpscr(env));
+    }
+    return err;
+}
+
 #endif /* !_TARGET_ARCH_SIGNAL_H_ */
-- 
2.33.0


