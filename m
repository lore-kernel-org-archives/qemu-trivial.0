Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mipmJ-0005Sh-Rf
	for mharc-qemu-trivial@gnu.org; Thu, 04 Nov 2021 23:20:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mipmC-00050e-81
 for qemu-trivial@nongnu.org; Thu, 04 Nov 2021 23:20:24 -0400
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d]:35757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mipmA-0004GK-6l
 for qemu-trivial@nongnu.org; Thu, 04 Nov 2021 23:20:23 -0400
Received: by mail-io1-xd2d.google.com with SMTP id c206so7788917iof.2
 for <qemu-trivial@nongnu.org>; Thu, 04 Nov 2021 20:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=58nY3Z2yBhPr75+AsIyykvpCnSBFtHFIGJuFPLu1qik=;
 b=IRUwAkz8klEw4Dvxx4a5QN1oakAKkBfW3D5SJ/tLjJFJa/JCJwQEou1gSb03PbTJtV
 sFuce7WwCSgQH/JV3d4bbrssLbRPEuI92XZdCAddF9rlZUVhdDwuRrQCDbfRzhf5l34a
 EY8fB7E0VCVqlaAToBVF4LhClMAccmZN5V7L3roQGogVEI6DLCTCdap9WmonQ80x+tiz
 ApN/u7otLXFngvouZAPkZvSjkHLDi/VIL+BxttRcsnOjjWhVuN4I2IBseKypAjO2cmW9
 pMCFAHoQMwDQZJJU+Qlv8CEJVafQSLSL49XSNQUjvmUve7ucQG6ZH4gLWYTu50/qqqCY
 LlQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=58nY3Z2yBhPr75+AsIyykvpCnSBFtHFIGJuFPLu1qik=;
 b=ygHQPVWhGqX1KkhIj8puVpQ39OagYKF7IaFHvS5kADGS4SamotTsQ1Xn4xifM+cRio
 G8MetAndNuEMvAC/QzmjGzb1DT4EjX3d+vGmbuY0BgCFOBDjobcuGqjx8pWexL9Wu7jO
 Zy1tv9H4tKuwOdPNtbSDJX4G0jsW+ZKsT0hWG7d16Cvg4pB1BCfQLVQHAber1nlJUoNr
 I9lcIqAp2CAQgA8O6hbMwldd4QblJ2bJtflDkBmIB/yPmt9opINfu+286iBTHC/vP5/a
 RKCHBFc9vI1/XwEc6GU+wkTRtWBykkc3Wif7u5tM8UTetUz016qpilgIL0aQdhjGMNo8
 LmPw==
X-Gm-Message-State: AOAM532d9ScLTLwA8qvz6hwfOytGYxm8O/1cWYHGGa/vHYd6zr0CXIFL
 AJqu1fIQ8+qu9AsHMoapzKIieg==
X-Google-Smtp-Source: ABdhPJyHNa3HfRhESco+5r3ltk+fu0c6fkHJqwj8xpE/G3rnDkbn97GJ6kgsuv2RucGPzCI1ATrvoQ==
X-Received: by 2002:a05:6638:1242:: with SMTP id
 o2mr6964239jas.68.1636082420902; 
 Thu, 04 Nov 2021 20:20:20 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id v4sm3508528ilq.57.2021.11.04.20.20.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 20:20:20 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Philippe Mathieu-Daude <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 qemu-trivial@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@bsdimp.com>, Laurent Vivier <laurent@vivier.eu>,
 Kyle Evans <kevans@freebsd.org>, Stacey Son <sson@FreeBSD.org>,
 Kyle Evans <kevans@FreeBSD.org>
Subject: [PATCH v4 33/36] bsd-user/arm/target_arch_signal.c: arm set_mcontext
Date: Thu,  4 Nov 2021 21:19:14 -0600
Message-Id: <20211105031917.87837-34-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211105031917.87837-1-imp@bsdimp.com>
References: <20211105031917.87837-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2d;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2d.google.com
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
X-List-Received-Date: Fri, 05 Nov 2021 03:20:24 -0000

Move the machine context to the CPU state.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Kyle Evans <kevans@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/arm/signal.c             | 79 +++++++++++++++++++++++++++++++
 bsd-user/arm/target_arch_signal.h |  1 +
 2 files changed, 80 insertions(+)

diff --git a/bsd-user/arm/signal.c b/bsd-user/arm/signal.c
index 93c9bfc0d3..d32e3b4560 100644
--- a/bsd-user/arm/signal.c
+++ b/bsd-user/arm/signal.c
@@ -109,3 +109,82 @@ abi_long get_mcontext(CPUARMState *env, target_mcontext_t *mcp, int flags)
     }
     return err;
 }
+
+/* Compare to arm/arm/exec_machdep.c set_mcontext() */
+abi_long set_mcontext(CPUARMState *env, target_mcontext_t *mcp, int srflag)
+{
+    int err = 0;
+    const uint32_t *gr = mcp->__gregs;
+    uint32_t cpsr, ccpsr = cpsr_read(env);
+    uint32_t fpscr, mask;
+
+    cpsr = tswap32(gr[TARGET_REG_CPSR]);
+    /*
+     * Only allow certain bits to change, reject attempted changes to non-user
+     * bits. In addition, make sure we're headed for user mode and none of the
+     * interrupt bits are set.
+     */
+    if ((ccpsr & ~CPSR_USER) != (cpsr & ~CPSR_USER)) {
+        return -TARGET_EINVAL;
+    }
+    if ((cpsr & CPSR_M) != ARM_CPU_MODE_USR ||
+        (cpsr & (CPSR_I | CPSR_F)) != 0) {
+        return -TARGET_EINVAL;
+    }
+    mask = cpsr & CPSR_T ? 0x1 : 0x3;
+
+    /*
+     * Make sure that we either have no vfp, or it's the correct size.
+     * FreeBSD just ignores it, though, so maybe we'll need to adjust
+     * things below instead.
+     */
+    if (mcp->mc_vfp_size != 0 && mcp->mc_vfp_size != sizeof(target_mcontext_vfp_t)) {
+        return -TARGET_EINVAL;
+    }
+    /*
+     * Make sure T mode matches the PC's notion of thumb mode, although
+     * FreeBSD lets the processor sort this out, so we may need remove
+     * this check, or generate a signal...
+     */
+    if (!!(tswap32(gr[TARGET_REG_PC]) & 1) != !!(cpsr & CPSR_T)) {
+        return -TARGET_EINVAL;
+    }
+
+    env->regs[0] = tswap32(gr[TARGET_REG_R0]);
+    env->regs[1] = tswap32(gr[TARGET_REG_R1]);
+    env->regs[2] = tswap32(gr[TARGET_REG_R2]);
+    env->regs[3] = tswap32(gr[TARGET_REG_R3]);
+    env->regs[4] = tswap32(gr[TARGET_REG_R4]);
+    env->regs[5] = tswap32(gr[TARGET_REG_R5]);
+    env->regs[6] = tswap32(gr[TARGET_REG_R6]);
+    env->regs[7] = tswap32(gr[TARGET_REG_R7]);
+    env->regs[8] = tswap32(gr[TARGET_REG_R8]);
+    env->regs[9] = tswap32(gr[TARGET_REG_R9]);
+    env->regs[10] = tswap32(gr[TARGET_REG_R10]);
+    env->regs[11] = tswap32(gr[TARGET_REG_R11]);
+    env->regs[12] = tswap32(gr[TARGET_REG_R12]);
+
+    env->regs[13] = tswap32(gr[TARGET_REG_SP]);
+    env->regs[14] = tswap32(gr[TARGET_REG_LR]);
+    env->regs[15] = tswap32(gr[TARGET_REG_PC] & mask);
+    if (mcp->mc_vfp_size != 0 && mcp->mc_vfp_ptr != 0) {
+        /* see set_vfpcontext in sys/arm/arm/exec_machdep.c */
+        target_mcontext_vfp_t *vfp;
+
+        vfp = lock_user(VERIFY_READ, mcp->mc_vfp_ptr, sizeof(*vfp), 1);
+        for (int i = 0; i < 32; i++) {
+            __get_user(*aa32_vfp_dreg(env, i), &vfp->mcv_reg[i]);
+        }
+        __get_user(fpscr, &vfp->mcv_fpscr);
+        vfp_set_fpscr(env, fpscr);
+        unlock_user(vfp, mcp->mc_vfp_ptr, sizeof(target_ucontext_t));
+
+        /*
+         * linux-user sets fpexc, fpinst and fpinst2, but these aren't in
+         * FreeBSD's mcontext, what to do?
+         */
+    }
+    cpsr_write(env, cpsr, CPSR_USER | CPSR_EXEC, CPSRWriteByInstr);
+
+    return err;
+}
diff --git a/bsd-user/arm/target_arch_signal.h b/bsd-user/arm/target_arch_signal.h
index 429843c70f..83ecfaafef 100644
--- a/bsd-user/arm/target_arch_signal.h
+++ b/bsd-user/arm/target_arch_signal.h
@@ -90,5 +90,6 @@ abi_long set_sigtramp_args(CPUARMState *regs, int sig,
                            abi_ulong frame_addr,
                            struct target_sigaction *ka);
 abi_long get_mcontext(CPUARMState *regs, target_mcontext_t *mcp, int flags);
+abi_long set_mcontext(CPUARMState *regs, target_mcontext_t *mcp, int srflag);
 
 #endif /* !_TARGET_ARCH_SIGNAL_H_ */
-- 
2.33.0


