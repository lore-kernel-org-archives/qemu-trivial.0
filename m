Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n66KW-0006T1-6b
	for mharc-qemu-trivial@gnu.org; Sat, 08 Jan 2022 02:40:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n66Is-0005Tj-57
 for qemu-trivial@nongnu.org; Sat, 08 Jan 2022 02:38:19 -0500
Received: from [2607:f8b0:4864:20::d36] (port=43852
 helo=mail-io1-xd36.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n66Iq-0003V4-51
 for qemu-trivial@nongnu.org; Sat, 08 Jan 2022 02:38:17 -0500
Received: by mail-io1-xd36.google.com with SMTP id l3so10039002iol.10
 for <qemu-trivial@nongnu.org>; Fri, 07 Jan 2022 23:38:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=siiQROmFkgoyoci8mg+ev58BNz0SLHU/+j4/Xsy7h34=;
 b=o6Wthbmf9+gsuhvkJSA4DXYAhvjS7ynqhw6hv6P1PHN1GxKlqx21CB2GkxqAxGexMm
 uOlkjS2rHNI4FdMMmepBmeODOPDGyC0+r5kqlo7YzLqW/rlAJHb548Qa3tailb/AOWx8
 9Io0HRUHlfQHvENLvjxklBXyDG4YWhFVUhaChU2CDOLWF6GtwQQQ7seC8OzqF3CnLWZD
 8odHNispijxADcQTtFONsXph+FU5GD+DIBn//yjKM82uBxgN8R5CZJaM6w7RS3Nny8aS
 QPPjt7Tf0BsFBhcexJAtJnUNFipsIdX3SJRK0cnXMSSaDzJWZjjcDaBYdhAk/8G3XDEf
 O1Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=siiQROmFkgoyoci8mg+ev58BNz0SLHU/+j4/Xsy7h34=;
 b=tI8o8wJEde2iwxpQ2/ZlJrZbkSfo5YGbjgAb0DKh9ebRF5QgaB/mWEBsxoDmvXT2Nw
 fJWRZkAjsMCINm9QRzWitCjcFNwn2yRxheLFrjoq0YQmkjuR0DRHPnWKial6vcH6lZYN
 oiPW+9W+MebyDwNJAwo8tkNIH9PdziELt4zCn7E9SJU6FFUHgHWjuovG1XgbVo3Ljm+r
 3pStxWaO7wU3lZw3SRMH+mEK0R14SnBtjwI8HPjxdGVwOa89l0KInUAPCmGFIvOd2Jom
 6EQuqmYgLmoHAzUp42NamFixnMTb9BzQVHfbs/4UyKJVXudzbWpEsR9Mg7u4EBSKM1Do
 HHWA==
X-Gm-Message-State: AOAM533gwTrLPJUWkGPJvs1EXJDckHg0gCJ3Hvxd9RCqEOgNAbzapPwo
 obVmLT9tcKQp77LnIBfPiqa8wA==
X-Google-Smtp-Source: ABdhPJx93hmzAsdzhG/Tc6Kq1VwakhGEGSKTT/qw8EBaC1MN/TdmucVhZmzbUS3npWOGb4ws6q50Ig==
X-Received: by 2002:a05:6638:2688:: with SMTP id
 o8mr30059038jat.118.1641627495227; 
 Fri, 07 Jan 2022 23:38:15 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id w19sm613022iov.12.2022.01.07.23.38.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 23:38:14 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-trivial@nongnu.org, kevans@freebsd.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Warner Losh <imp@bsdimp.com>,
 Laurent Vivier <laurent@vivier.eu>, Stacey Son <sson@FreeBSD.org>,
 Kyle Evans <kevans@FreeBSD.org>
Subject: [PULL 33/37] bsd-user/arm/signal.c: arm get_mcontext
Date: Sat,  8 Jan 2022 00:37:33 -0700
Message-Id: <20220108073737.5959-34-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220108073737.5959-1-imp@bsdimp.com>
References: <20220108073737.5959-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d36
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d36;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd36.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Sat, 08 Jan 2022 07:38:20 -0000

Get the machine context from the CPU state.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Kyle Evans <kevans@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/arm/signal.c | 51 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/bsd-user/arm/signal.c b/bsd-user/arm/signal.c
index 3c0db30a85e..93c9bfc0d37 100644
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
2.33.1


