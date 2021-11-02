Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mi2f8-0007lg-K8
	for mharc-qemu-trivial@gnu.org; Tue, 02 Nov 2021 18:53:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mi2f6-0007cp-LS
 for qemu-trivial@nongnu.org; Tue, 02 Nov 2021 18:53:48 -0400
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130]:41623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mi2f2-0002t2-Fz
 for qemu-trivial@nongnu.org; Tue, 02 Nov 2021 18:53:48 -0400
Received: by mail-il1-x130.google.com with SMTP id i9so645946ilu.8
 for <qemu-trivial@nongnu.org>; Tue, 02 Nov 2021 15:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+r01BN2RKWDgyocvJBPU5Kji19m/VGVQeGkX/VmFsS8=;
 b=JStp4w00RfzOkx0uDorl99c+l/aYTj4LwDf6dNSwDDneQhTGojjqE1yXijXgX+wCJ0
 X8TXMuIHzC1ICNzuBwmUNXvygyzs1ZDt9vX0jBl7OG289nbSuhEsg+hC+d9Kr77GbDSy
 kdrSVSARdIITrmiwvo9jQ2nK3ZzBKK4dkDFAqUv8UnDYmR9fLZcoRERxgaeTPFbttBUK
 jZtC7nCMR+PV0dOBoed/FJ1YJfSLcUg8PP0LecUnkEnrMTx66DxEFebutsogTx2j2AfE
 QbotXse/bw39ZPARZJO7WkBZbi3NLj959DYzHIcAnLekR3hR9SEAD0fOOWYEZdrJSUUb
 IQ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+r01BN2RKWDgyocvJBPU5Kji19m/VGVQeGkX/VmFsS8=;
 b=ygXnxOaZmVXLb1drkWxibBvGd94OZ7hW1KGxP82D2RTOuy5T1rWu/SbKU3TxX6ukgh
 fqcpeMS5PPrYgSkmvn6Y8cVfAA2ymAVTnzrM7B3hsHFjjvMAnJqu2rLcsdwwPXLZYS/s
 FrVd/Fq6ajlUWZrILmZwCCuqswYQCa+w3BVzyq+s2KUqSnmnUK3cX0P5nrIGRa3NQSaG
 bq+w77n7JaRxC6OAOZqNJhPM6N7m1ixDJmq5seB0VjQ74HYbOmd2y/iNy4JFlF0t1JTM
 N2u9dKOvxO0Pw9Ot/KRTymRA1Yyu/Aqbcz2ojH9Cz9KSocS/GwDw7o45FGi5jLflTrmC
 LE0w==
X-Gm-Message-State: AOAM530XyfPi3HljKT2ukj75km7Lcfz18Mh+3Foy6/Bo0OUfPdi+cfIE
 DGpcYEQDi2NPOJ/Rwi8V1TsYM8LspBOmXQ==
X-Google-Smtp-Source: ABdhPJy4eWfcJATw1ghGx+/PutfwVFhsLhZe384iRFNY7TFxO5VgJv3sqH6MPm9N4Mbqx1GXub/k8w==
X-Received: by 2002:a92:cda2:: with SMTP id g2mr17147699ild.2.1635893623411;
 Tue, 02 Nov 2021 15:53:43 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id h14sm205427ils.75.2021.11.02.15.53.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 15:53:43 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, Warner Losh <imp@bsdimp.com>,
 qemu-trivial@nongnu.org, Philippe Mathieu-Daude <f4bug@amsat.org>,
 Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Stacey Son <sson@FreeBSD.org>,
 Kyle Evans <kevans@FreeBSD.org>
Subject: [PATCH v2 23/30] bsd-user/arm/target_arch_signal.h: arm get_mcontext
Date: Tue,  2 Nov 2021 16:52:41 -0600
Message-Id: <20211102225248.52999-24-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211102225248.52999-1-imp@bsdimp.com>
References: <20211102225248.52999-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::130;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x130.google.com
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
X-List-Received-Date: Tue, 02 Nov 2021 22:53:49 -0000

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
index 61440b51b4..b42d08402f 100644
--- a/bsd-user/arm/target_arch_signal.h
+++ b/bsd-user/arm/target_arch_signal.h
@@ -129,4 +129,54 @@ set_sigtramp_args(CPUARMState *env, int sig, struct target_sigframe *frame,
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


