Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mjvpd-0007EW-Jx
	for mharc-qemu-trivial@gnu.org; Sun, 07 Nov 2021 23:00:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mjvpY-00077z-Sg
 for qemu-trivial@nongnu.org; Sun, 07 Nov 2021 23:00:25 -0500
Received: from [2607:f8b0:4864:20::129] (port=40591
 helo=mail-il1-x129.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mjvpW-00011z-F2
 for qemu-trivial@nongnu.org; Sun, 07 Nov 2021 23:00:24 -0500
Received: by mail-il1-x129.google.com with SMTP id k1so15545767ilo.7
 for <qemu-trivial@nongnu.org>; Sun, 07 Nov 2021 20:00:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OeOnvHCc2lg5sRstjwa89XicYu0PFuIOGrd2TLaUNlw=;
 b=Wit1wQA/xvMwxTN2yOyYJg7JMtwSwipR01hdkizigcgO1VwQyasnV6ssK1MJbVrVvh
 H+xNO1kaypudARdB8iXgSBB3JnF9sIFkgFcW3Xj36AciWwnR2aqXeiwAvvCc0hzT8myF
 MrokW1k9rDVuMGGCeOMFKFbS8LN0ltKUFOk9YSLB527UQUvtCW1LSUFlkeqGjVG/U2Zq
 Dvu6tcLtMO14gT5UwnzMIfZD0T8Lmg25Hc3sNgSME3KXofKZJ36u4DoPVLjZohRB+NuV
 NzCnLgWpSORK7/FeNyEVmH0m34ojYuWyeBUVULSTM0dIG3pFPEef3XC2X2ivOYggRFzY
 Nr7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OeOnvHCc2lg5sRstjwa89XicYu0PFuIOGrd2TLaUNlw=;
 b=X6Yl2hh3nwryB6ZIIIobtmkJmLTlDYwHSKAFhUgH3zsiX1QKQB3X25ZtOf0yeHPP/i
 6gPX8oBGeAJ4Xludm4My9hR0GPOlaSS65AlSfqrPYnjSxf84kwD5quMvUCHfQNmJQTZl
 ZbKnMJRnUeMnifbDddZ2pMGgHnt3ywv6sEeYbRys4vDxdyJGoLYJMaLpu0PWbh2gK09i
 UA9hIcu3ab1jriYgEzvEElu3gqUOFO07CpvFWUAkuEdLGNyyPo+d+DbCA+wCb7empTzk
 Tt77bIwcNXqDMFhEFSZm9qTQLoe5OrQUqV4E4fzMfwie+cmaH+Ism3qJlIYx5j6Xxh+S
 0yCQ==
X-Gm-Message-State: AOAM5322FtYK4tqA6ZTPaP3zxIelfgg4k6TybDEKId6cRNdHC+7tZrZb
 Ah9kYiliyS8txxuTnvMIH9ITy9Agso0kyg==
X-Google-Smtp-Source: ABdhPJy75qhii/YZkVWw4CX2YVSlf9mc5ISYtZwapQbYPT6aBjFZULcvCOoPAJbk6BfSoGtBf7Povw==
X-Received: by 2002:a5e:d505:: with SMTP id e5mr11685739iom.217.1636343559773; 
 Sun, 07 Nov 2021 19:52:39 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id x15sm876909iob.8.2021.11.07.19.52.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Nov 2021 19:52:39 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Michael Tokarev <mjt@tls.msk.ru>,
 Warner Losh <imp@bsdimp.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Kyle Evans <kevans@freebsd.org>, Philippe Mathieu-Daude <f4bug@amsat.org>,
 qemu-trivial@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Stacey Son <sson@FreeBSD.org>
Subject: [PATCH v5 32/37] bsd-user/arm/signal.c: arm set_sigtramp_args
Date: Sun,  7 Nov 2021 20:51:31 -0700
Message-Id: <20211108035136.43687-33-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211108035136.43687-1-imp@bsdimp.com>
References: <20211108035136.43687-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::129
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::129;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x129.google.com
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
X-List-Received-Date: Mon, 08 Nov 2021 04:00:26 -0000

Implement set_sigtramp_args to setup the arguments to the sigtramp
calls.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/arm/signal.c | 60 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 bsd-user/arm/signal.c

diff --git a/bsd-user/arm/signal.c b/bsd-user/arm/signal.c
new file mode 100644
index 0000000000..3c0db30a85
--- /dev/null
+++ b/bsd-user/arm/signal.c
@@ -0,0 +1,60 @@
+/*
+ *  arm signal functions
+ *
+ *  Copyright (c) 2013 Stacey D. Son
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu.h"
+
+/*
+ * Compare to arm/arm/machdep.c sendsig()
+ * Assumes that target stack frame memory is locked.
+ */
+abi_long set_sigtramp_args(CPUARMState *env, int sig,
+                           struct target_sigframe *frame,
+                           abi_ulong frame_addr,
+                           struct target_sigaction *ka)
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
+    cpsr_write(env, (ka->_sa_handler & 1) * CPSR_T, CPSR_T, CPSRWriteByInstr);
+
+    return 0;
+}
-- 
2.33.0


