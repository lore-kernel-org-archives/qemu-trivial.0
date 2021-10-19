Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mcsFr-0000v5-O0
	for mharc-qemu-trivial@gnu.org; Tue, 19 Oct 2021 12:46:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcsFI-0000Uj-Mi
 for qemu-trivial@nongnu.org; Tue, 19 Oct 2021 12:45:49 -0400
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134]:43548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcsEz-0000Xs-Nc
 for qemu-trivial@nongnu.org; Tue, 19 Oct 2021 12:45:44 -0400
Received: by mail-il1-x134.google.com with SMTP id a8so19028274ilj.10
 for <qemu-trivial@nongnu.org>; Tue, 19 Oct 2021 09:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pAHyQTtLAX0HupvxuP4kXDyruDDTGfcKe5SrS3Tshaw=;
 b=WoH7hg2pByaQ2YRFCbynxpQpJ/UjcPMuIzGnIuT7ylOWfzV52DvHbBqdgNiqnEWmja
 DGms4z5fESvTXtO46hKaxK3rpd7V3Dmdqu2F/B+AmCx0VqpegkCXkkYq4WvZXNGWZJBu
 cV5cyyp8t6uze0jITnDvRo5uuWFWzvvC1+YSmd8S7EWYfrI7L01HMJ0PhmPa1I42VDEZ
 2uR3JxNKX4nVrHACoz9Xr+PAxdzGnjbS6Gv63XIAzpJn8Is8Th5Q4HO/3c4rL+FVDHIc
 GQ7DSJ5It9T1Hk9kziDS9Pzo7wArYc3ezhrOTP1jtgGXyLoPDqTVj/3Cthu5kosToUoa
 Oq4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pAHyQTtLAX0HupvxuP4kXDyruDDTGfcKe5SrS3Tshaw=;
 b=Th7CFZxbA/NvQhihAN0YUCO54Y7P2u4BjlGeyYib1ek4VmFaBQGMW8dX5qFmflmRIM
 Ddf+CfxkE7o5Je8G+ryZGfpG8FXiU1ZAx/8IJ3T90EjQbL6udhTG28CGFLoLuoKaJMsr
 hRKWTsyvAOU1w9VWSmXkUp9Qsl/xUr/QARXiDJH7OoluLSSQXitDTkVwD51A0CCD+EEZ
 j3GNrPpyYfgMrqMWd9k92HdoJECUG04ZPKvk166v1+wHGNC4E/dNZJuR+BtmDyNRlprB
 Wn5vydRiQK6cgcr5T9X4v3XpjAQ35caYSJc1Ew7CNIcz8rTQHjdBysc5Dga7A91T6ZEO
 B3dw==
X-Gm-Message-State: AOAM533YGZ2zOh/USzqIk3qSMOz3AHOFYI+++ylzfnGbgKM2UwgXcVEW
 mLYXmadGd0OyBRr3N5opR1B4AA==
X-Google-Smtp-Source: ABdhPJwgOKrVXgDPcP5r2WxnmjR1jz6252mBD+wN5mNe9YYcL6zwU1DjK/8yMEyL70dZGm87ThReIA==
X-Received: by 2002:a05:6e02:1e0c:: with SMTP id
 g12mr19016057ila.260.1634661928604; 
 Tue, 19 Oct 2021 09:45:28 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id q7sm1133951ilv.48.2021.10.19.09.45.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 09:45:28 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>, Laurent Vivier <laurent@vivier.eu>,
 qemu-trivial@nongnu.org, Kyle Evans <kevans@freebsd.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Stacey Son <sson@FreeBSD.org>,
 Klye Evans <kevans@FreeBSD.org>
Subject: [PATCH 22/24] bsd-user/arm/target_arch_signal.h: arm set_mcontext
Date: Tue, 19 Oct 2021 10:44:45 -0600
Message-Id: <20211019164447.16359-23-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211019164447.16359-1-imp@bsdimp.com>
References: <20211019164447.16359-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::134;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x134.google.com
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Tue, 19 Oct 2021 16:45:49 -0000

Move the machine context to the CPU state.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Klye Evans <kevans@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/arm/target_arch_signal.h | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/bsd-user/arm/target_arch_signal.h b/bsd-user/arm/target_arch_signal.h
index 302fdc2846..1d051af9ae 100644
--- a/bsd-user/arm/target_arch_signal.h
+++ b/bsd-user/arm/target_arch_signal.h
@@ -201,4 +201,35 @@ static inline abi_long get_mcontext(CPUARMState *regs, target_mcontext_t *mcp,
     return err;
 }
 
+/* Compare to arm/arm/machdep.c set_mcontext() */
+static inline abi_long set_mcontext(CPUARMState *regs, target_mcontext_t *mcp,
+        int srflag)
+{
+    int err = 0;
+    const uint32_t *gr = mcp->__gregs;
+    uint32_t cpsr;
+
+    regs->regs[0] = tswap32(gr[TARGET_REG_R0]);
+    regs->regs[1] = tswap32(gr[TARGET_REG_R1]);
+    regs->regs[2] = tswap32(gr[TARGET_REG_R2]);
+    regs->regs[3] = tswap32(gr[TARGET_REG_R3]);
+    regs->regs[4] = tswap32(gr[TARGET_REG_R4]);
+    regs->regs[5] = tswap32(gr[TARGET_REG_R5]);
+    regs->regs[6] = tswap32(gr[TARGET_REG_R6]);
+    regs->regs[7] = tswap32(gr[TARGET_REG_R7]);
+    regs->regs[8] = tswap32(gr[TARGET_REG_R8]);
+    regs->regs[9] = tswap32(gr[TARGET_REG_R9]);
+    regs->regs[10] = tswap32(gr[TARGET_REG_R10]);
+    regs->regs[11] = tswap32(gr[TARGET_REG_R11]);
+    regs->regs[12] = tswap32(gr[TARGET_REG_R12]);
+
+    regs->regs[13] = tswap32(gr[TARGET_REG_SP]);
+    regs->regs[14] = tswap32(gr[TARGET_REG_LR]);
+    regs->regs[15] = tswap32(gr[TARGET_REG_PC]);
+    cpsr = tswap32(gr[TARGET_REG_CPSR]);
+    cpsr_write(regs, cpsr, CPSR_USER | CPSR_EXEC, CPSRWriteByInstr);
+
+    return err;
+}
+
 #endif /* !_TARGET_ARCH_SIGNAL_H_ */
-- 
2.32.0


