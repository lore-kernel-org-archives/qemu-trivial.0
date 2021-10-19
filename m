Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mcsFp-0000p1-At
	for mharc-qemu-trivial@gnu.org; Tue, 19 Oct 2021 12:46:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcsFB-0000ND-BL
 for qemu-trivial@nongnu.org; Tue, 19 Oct 2021 12:45:41 -0400
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130]:34536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcsEx-0000W0-Rw
 for qemu-trivial@nongnu.org; Tue, 19 Oct 2021 12:45:39 -0400
Received: by mail-il1-x130.google.com with SMTP id g2so19089928ild.1
 for <qemu-trivial@nongnu.org>; Tue, 19 Oct 2021 09:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kJZt5TQwAYhLxNtIa2hzmDRBNphst1wKdQpTbGcgx9w=;
 b=efc+yuzD1lmrifCqQ6Wp6yEpWoC217mi81Rf4OlA0ct6KxbIVU841oFhZ8CnJ63+kI
 C24Q6q2cCiA2d5kj6bX4JbqkcYDwqiwhpYgJeXEymH1mqDZwvUwv2avC5MEC8Z4wQRGq
 L/+y36ud0G2mG/BPbc/8u62RfSuyDVRtj9YofeND3TD6ZC95ckL9I1/P77TYMg6BlOQ5
 AVnQ4TEzNLS4f/lF8u2XEFS6SxPboyorUv6sOuBb95w/R0WWufH07DtkJlvx7zxWzOQx
 qYYX/wNS4jKvip4x6/UMBcScPeKdgKXdGrND42d8zPGwzLE0iEm3FZ5Dq9pWJPhRvxOy
 zRJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kJZt5TQwAYhLxNtIa2hzmDRBNphst1wKdQpTbGcgx9w=;
 b=VtzZU0W87mxU+bKGYYUiKlE8eNX+ucBnmiJR5j73PUAIbo3vkFk0WcA//N7ciZa6hg
 aUDfdGHF6C0VvADC9u9oMsHa86uMHGxP8minKrsJtbQG6M7GeA84CRBXfWfBQqvsrVA2
 YDgg+Eq2Zj9c2naU/cEkRzUzKlFlI5QAOhTXFh10ns4yxzURSjjilh2z4QEVTQP6TckY
 CDsAYC7ILqVJ4EbnEet0zG7FE9+/k8kVujYTg2VP8WSSmLnBt3ch3zENNn1jM3wtfPZT
 U+XkhDcOvMEbyc5B+ujOM6o79sHz8R0zTe9+7vPobISlv3YNUngyeC4hYMc+Pxuie8LH
 uf9A==
X-Gm-Message-State: AOAM531D+y3jHURNd+b8wLUNRMcgBgUiIbis8Leg7QAzfv21vCZApIbI
 8/AfUZMvbStX1V7seESid8QWLw==
X-Google-Smtp-Source: ABdhPJyu05bVmgbtzrPnOqO611EY+WoWAqWgroZE+xaus+vJkz8nxPAHGFVkDMz/YhVe6S1WgOE00w==
X-Received: by 2002:a92:1a4e:: with SMTP id z14mr18924416ill.78.1634661926558; 
 Tue, 19 Oct 2021 09:45:26 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id q7sm1133951ilv.48.2021.10.19.09.45.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 09:45:26 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>, Laurent Vivier <laurent@vivier.eu>,
 qemu-trivial@nongnu.org, Kyle Evans <kevans@freebsd.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Stacey Son <sson@FreeBSD.org>
Subject: [PATCH 20/24] bsd-user/arm/target_arch_signal.h: arm set_sigtramp_args
Date: Tue, 19 Oct 2021 10:44:43 -0600
Message-Id: <20211019164447.16359-21-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211019164447.16359-1-imp@bsdimp.com>
References: <20211019164447.16359-1-imp@bsdimp.com>
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

Implement set_sigtramp_args to setup the arguments to the sigtramp
calls.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/arm/target_arch_signal.h | 35 +++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/bsd-user/arm/target_arch_signal.h b/bsd-user/arm/target_arch_signal.h
index 67355ff28f..b421c2522c 100644
--- a/bsd-user/arm/target_arch_signal.h
+++ b/bsd-user/arm/target_arch_signal.h
@@ -128,4 +128,39 @@ struct target_trapframe {
     abi_ulong tf_pc;
 };
 
+/*
+ * Compare to arm/arm/machdep.c sendsig()
+ * Assumes that target stack frame memory is locked.
+ */
+static inline abi_long
+set_sigtramp_args(CPUARMState *regs, int sig, struct target_sigframe *frame,
+    abi_ulong frame_addr, struct target_sigaction *ka)
+{
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
+    regs->regs[0] = sig;
+    regs->regs[1] = frame_addr +
+        offsetof(struct target_sigframe, sf_si);
+    regs->regs[2] = frame_addr +
+        offsetof(struct target_sigframe, sf_uc);
+
+    /* the trampoline uses r5 as the uc address */
+    regs->regs[5] = frame_addr +
+        offsetof(struct target_sigframe, sf_uc);
+    regs->regs[TARGET_REG_PC] = ka->_sa_handler;
+    regs->regs[TARGET_REG_SP] = frame_addr;
+    regs->regs[TARGET_REG_LR] = TARGET_PS_STRINGS - TARGET_SZSIGCODE;
+
+    return 0;
+}
+
 #endif /* !_TARGET_ARCH_SIGNAL_H_ */
-- 
2.32.0


