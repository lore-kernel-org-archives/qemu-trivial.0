Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mjvnM-0002Q6-4P
	for mharc-qemu-trivial@gnu.org; Sun, 07 Nov 2021 22:58:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mjvnJ-0002Ml-IA
 for qemu-trivial@nongnu.org; Sun, 07 Nov 2021 22:58:05 -0500
Received: from [2607:f8b0:4864:20::d2a] (port=37868
 helo=mail-io1-xd2a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mjvnH-0006MM-4f
 for qemu-trivial@nongnu.org; Sun, 07 Nov 2021 22:58:04 -0500
Received: by mail-io1-xd2a.google.com with SMTP id k21so89897ioh.4
 for <qemu-trivial@nongnu.org>; Sun, 07 Nov 2021 19:58:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U3NE49HODa5ve+oXzRvqylTHNWY8RpTmmQhoDiFbJDo=;
 b=If5wLTNQHcW/v2Nq6mErBbK1M18ydWGBtAMfaJ2cO5j9RifgdDyGyowYVI0T+WEeph
 ZB5JbyLLAwQHa+HFFPaG+08Zfh/epC62mpyNdUC3bKzBySwYjPcmWQCM3AdLJS3bBsI7
 fgJQnetiM6OwoxAQgc7ZJ1H6zOvC+QRITjSjkaX4bMS6zGK8ogeb6VAMXSFtLo0f8I2K
 Yg7Eq7DOY/+8S+q87mbQGG9PBdBq2PRBFwyG2Bv4OImj0LZ6hIF0p3f6rvioGK+NHdJO
 qbJWdoQX88APRkkF9ifzyzXziVjdJJFQcDNsJgJYNp65PqeG/FG71eFvYPUPFVkY7Fs9
 Znkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U3NE49HODa5ve+oXzRvqylTHNWY8RpTmmQhoDiFbJDo=;
 b=r7zS4wpjfd3GrPa2IV13yJfPqVt3FYRJwJpT0iwh9KgFQgHbUcAThTOEELL5Hu709+
 /4f9BAanwHUHtYosEgaMznoAFkr8eiDIGPWF4NiVpDG6JRhPZ/VN5cR/UcKGnQEScWKv
 h2dQq4yLdiyawz2VNZqpT9PvBr76niNJmOQLRVIZZ4P5lPoNOmMDG2Bl8XugQNyw0hFJ
 itx4jasWXdDEFu3+YtqMnIPPd8TljYbbA9cOQpRIwSosj3mNIq7kCgCXuBdN4uRoamMK
 +tEAqZiefF7PxzlLP6+EpcOY8DlW1ZXDjrJLk+0sGhrjcrLF8fnQAA6oG8Xlktw0mhEP
 sb7A==
X-Gm-Message-State: AOAM531GO0dAbWzaTbBSAamOHJ2GDzWBFfzmiUCHQNu/DzLm2Hk8PnKC
 zU7cLZkItMAbjmLVqfeVihOej5h+Ks0Yng==
X-Google-Smtp-Source: ABdhPJzL6kakMTUq2pFbMI+pQ/96aPiPp8+OeYvOu2p7+sO906c7qAEbS2uYqtw9x1MbHw34Cl5rmg==
X-Received: by 2002:a92:c8c6:: with SMTP id c6mr42754088ilq.54.1636343560668; 
 Sun, 07 Nov 2021 19:52:40 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id x15sm876909iob.8.2021.11.07.19.52.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Nov 2021 19:52:40 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Michael Tokarev <mjt@tls.msk.ru>,
 Warner Losh <imp@bsdimp.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Kyle Evans <kevans@freebsd.org>, Philippe Mathieu-Daude <f4bug@amsat.org>,
 qemu-trivial@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Stacey Son <sson@FreeBSD.org>, Kyle Evans <kevans@FreeBSD.org>
Subject: [PATCH v5 33/37] bsd-user/arm/signal.c: arm get_mcontext
Date: Sun,  7 Nov 2021 20:51:32 -0700
Message-Id: <20211108035136.43687-34-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211108035136.43687-1-imp@bsdimp.com>
References: <20211108035136.43687-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2a
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d2a;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2a.google.com
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
X-List-Received-Date: Mon, 08 Nov 2021 03:58:05 -0000

Get the machine context from the CPU state.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Kyle Evans <kevans@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/arm/signal.c | 51 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

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
-- 
2.33.0


