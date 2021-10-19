Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mcsFE-0000Qn-8C
	for mharc-qemu-trivial@gnu.org; Tue, 19 Oct 2021 12:45:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcsF1-0000Il-BE
 for qemu-trivial@nongnu.org; Tue, 19 Oct 2021 12:45:31 -0400
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e]:45722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcsEq-0000OE-Aw
 for qemu-trivial@nongnu.org; Tue, 19 Oct 2021 12:45:30 -0400
Received: by mail-il1-x12e.google.com with SMTP id i6so1834767ila.12
 for <qemu-trivial@nongnu.org>; Tue, 19 Oct 2021 09:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qKieTplX001DlDmVejwLqaD5XvOKcD6CG4SPfQbfG6E=;
 b=wo6hNFMJjIqJ0JmYZ/PBZcPDC/yYKXot5f+ltJwA5Wxv1AsQ7U7IKBB8yeIALeSw3o
 x3506neGEEeHjdordw3eBEnKk0nwBeHi0mPigvhtGVyKF+6f5XQI44ndXVgg1t5+vQEU
 r1coXPLo4OlMvdOAQtMtSa6CAPyHe0vb9qyS64gpgP2c8oRkF+8eoAILS+nu+0DYzl6E
 ljIdCxlsT0DeIqBMEZa/DGmVCQJCToxWuPUcI/equ4L11Z6XNEjGPuMlpcFcTg3JZp+/
 iK08VrObMVovtwa+9YQfF5625e6kYCVpE+yax/MmuaR58tRDpYuM6aKSN94F0g/XMWnV
 d1Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qKieTplX001DlDmVejwLqaD5XvOKcD6CG4SPfQbfG6E=;
 b=dysP6ajtFBTTdIKNHXHDGZpe13w0WzsyBFnTlDkC9wkTIq5mezBN/Mcp1iVTlUn95Q
 BvC+w9PTeMs55m9XtAg28RoLOpU/BRr3hsQLdMRsIgmKGAvo26do2BPAc0T4ot5Vagf5
 O0aqzrtBsf/oxk1mXr2rNkTIYA6itQOSDOnPjmRjkDbsWF8iSc+YVHrLDyAPIQGOg3bc
 zzI3SqRJH+oNlj82pJ9btte0fGyK7LOAJ70YSC5vQkQC4PBSb+vFxaLncZAvAoxh3J7x
 jdYssEG6x35Y6+WAmHLJbr9PX9cBJEwxVKNjTLCrZFnx1GoMgVPd5cuPz8GZOmnIJCOP
 wsuA==
X-Gm-Message-State: AOAM533Vk1YxYmuqlr3my03rIxmJ7xy7MYH0cAPrrXbAMpYxs6BoJddp
 ISDY6Qpz5TavHownWXhIJmpfPA==
X-Google-Smtp-Source: ABdhPJyUSXtH3JHmSFLU5EZDdacivs8SJPNH7V9lmO4EAVlXXhbY4m3RLwOzYqshEaFRKUezhNE5CA==
X-Received: by 2002:a92:c7a1:: with SMTP id f1mr17646486ilk.263.1634661918807; 
 Tue, 19 Oct 2021 09:45:18 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id q7sm1133951ilv.48.2021.10.19.09.45.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 09:45:18 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>, Laurent Vivier <laurent@vivier.eu>,
 qemu-trivial@nongnu.org, Kyle Evans <kevans@freebsd.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Stacey Son <sson@FreeBSD.org>
Subject: [PATCH 12/24] bsd-user/arm/target_arch_sigtramp.h: Signal Trampoline
 for arm
Date: Tue, 19 Oct 2021 10:44:35 -0600
Message-Id: <20211019164447.16359-13-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211019164447.16359-1-imp@bsdimp.com>
References: <20211019164447.16359-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12e;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12e.google.com
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
X-List-Received-Date: Tue, 19 Oct 2021 16:45:33 -0000

Copy of the signal trampoline code for arm, as well as setup_sigtramp to
write it to the stack.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/arm/target_arch_sigtramp.h | 52 +++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 bsd-user/arm/target_arch_sigtramp.h

diff --git a/bsd-user/arm/target_arch_sigtramp.h b/bsd-user/arm/target_arch_sigtramp.h
new file mode 100644
index 0000000000..ed53d336ed
--- /dev/null
+++ b/bsd-user/arm/target_arch_sigtramp.h
@@ -0,0 +1,52 @@
+/*
+ *  arm sysarch() system call emulation
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
+#ifndef _TARGET_ARCH_SIGTRAMP_H_
+#define _TARGET_ARCH_SIGTRAMP_H_
+
+/* Compare to arm/arm/locore.S ENTRY_NP(sigcode) */
+static inline abi_long setup_sigtramp(abi_ulong offset, unsigned sigf_uc,
+        unsigned sys_sigreturn)
+{
+    int i;
+    uint32_t sys_exit = TARGET_FREEBSD_NR_exit;
+    /*
+     * The code has to load r7 manually rather than using
+     * "ldr r7, =SYS_return to make sure the size of the
+     * code is correct.
+     */
+    uint32_t sigtramp_code[] = {
+    /* 1 */ 0xE1A0000D,                  /* mov r0, sp */
+    /* 2 */ 0xE2800000 + sigf_uc,        /* add r0, r0, #SIGF_UC */
+    /* 3 */ 0xE59F700C,                  /* ldr r7, [pc, #12] */
+    /* 4 */ 0xEF000000 + sys_sigreturn,  /* swi (SYS_sigreturn) */
+    /* 5 */ 0xE59F7008,                  /* ldr r7, [pc, #8] */
+    /* 6 */ 0xEF000000 + sys_exit,       /* swi (SYS_exit)*/
+    /* 7 */ 0xEAFFFFFA,                  /* b . -16 */
+    /* 8 */ sys_sigreturn,
+    /* 9 */ sys_exit
+    };
+
+    for (i = 0; i < 9; i++) {
+        tswap32s(&sigtramp_code[i]);
+    }
+
+    return memcpy_to_target(offset, sigtramp_code, TARGET_SZSIGCODE);
+}
+#endif /* _TARGET_ARCH_SIGTRAMP_H_ */
-- 
2.32.0


