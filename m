Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mi2ez-0007CA-MC
	for mharc-qemu-trivial@gnu.org; Tue, 02 Nov 2021 18:53:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mi2ev-00071K-6x
 for qemu-trivial@nongnu.org; Tue, 02 Nov 2021 18:53:37 -0400
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33]:44656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mi2es-0002pb-MH
 for qemu-trivial@nongnu.org; Tue, 02 Nov 2021 18:53:36 -0400
Received: by mail-io1-xd33.google.com with SMTP id f9so546956ioo.11
 for <qemu-trivial@nongnu.org>; Tue, 02 Nov 2021 15:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=F9IbbLGjnRnokIuDKxQfCzJoAx075CoGnpnzgfUmRKo=;
 b=vy6e8tNZROOdFDQyZxG2MTR1EPgOBt/EBLKpWF+ANbjnjCZLZ1vpw+TvuwivPjRe1g
 fkrzvYbpKXf1PP4mbLPwcs94afw5Ay3MOEEqI67KVMcYoZzpABPmqtLDFu7AejM5KNjw
 TwYjbiRde+0Iu1xgtZ9Dm8y4+lxsT9fWyos+cYdmTDIU6G2Ij3hoLsc3GOsG82DJstEq
 SWSwx839DdjTMmr97OeLYvLvInlg/OfljJfg+8Z7sQ3fUy/MpzYieNl+XYGlJqFwC+bQ
 7IOeM+JC+yb7oPtZScmZ9/Zq5kEl+6OFh94KPkVQqpmIURJ6WSULm1Hm3Q30OKDDH91u
 CaZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=F9IbbLGjnRnokIuDKxQfCzJoAx075CoGnpnzgfUmRKo=;
 b=8CYG4WGcTyP5GRhZwCNHp3hZRPv4rupwx4ZbKjOQDvTNNFKewZUkB0+O+oJ+XhZlSX
 lnO91OL22Ek6o7qUJk7THwWUacTuEc4S04Ek6sduVWVNFFUaHngmEzBuptkTOtpwxp/2
 Nn9zJRFMENwT78hQrRSysDXjoHBJXoPD8nytq70cSsLLTh7aGZaD8tFWonGfN8hr4vwq
 l/oSiroCRxjONV1KU7045mIxyW5gbUqPtCAKwCpxrxLVBmOKoe6ObbYYHyKh59UmeDEo
 OjT/CEg6m/V35mApZbjO5smLiR0U9feoN/NSclMSgT5CMWdVevAj7/nzEFUoIQFUKPoe
 NkDA==
X-Gm-Message-State: AOAM532xpz0pnH5biyZaTDnQmcO3hZvjRTioiA/ZRLhQmrlELFck9Rre
 9kR/xVlhgVuzJP/JzJXxlXDqpw==
X-Google-Smtp-Source: ABdhPJxtfAMNPTpfIwWljKAQYxdyJ57+wlchjUyznx7567i0U3qrmLb+O96wlBDgOiQTh1BREFWoVw==
X-Received: by 2002:a05:6638:29b:: with SMTP id
 c27mr13148859jaq.67.1635893611933; 
 Tue, 02 Nov 2021 15:53:31 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id h14sm205427ils.75.2021.11.02.15.53.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 15:53:31 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, Warner Losh <imp@bsdimp.com>,
 qemu-trivial@nongnu.org, Philippe Mathieu-Daude <f4bug@amsat.org>,
 Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Stacey Son <sson@FreeBSD.org>,
 Kyle Evans <kevans@FreeBSD.org>
Subject: [PATCH v2 13/30] bsd-user/arm/target_arch_sigtramp.h: Signal
 Trampoline for arm
Date: Tue,  2 Nov 2021 16:52:31 -0600
Message-Id: <20211102225248.52999-14-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211102225248.52999-1-imp@bsdimp.com>
References: <20211102225248.52999-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d33;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd33.google.com
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
X-List-Received-Date: Tue, 02 Nov 2021 22:53:37 -0000

Copy of the signal trampoline code for arm, as well as setup_sigtramp to
write it to the stack.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/arm/target_arch_sigtramp.h | 49 +++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 bsd-user/arm/target_arch_sigtramp.h

diff --git a/bsd-user/arm/target_arch_sigtramp.h b/bsd-user/arm/target_arch_sigtramp.h
new file mode 100644
index 0000000000..5d434a9e7e
--- /dev/null
+++ b/bsd-user/arm/target_arch_sigtramp.h
@@ -0,0 +1,49 @@
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
+    G_STATIC_ASSERT(sizeof(sigtramp_code) == TARGET_SZSIGCODE);
+
+    for (i = 0; i < 9; i++) {
+        tswap32s(&sigtramp_code[i]);
+    }
+
+    return memcpy_to_target(offset, sigtramp_code, TARGET_SZSIGCODE);
+}
+#endif /* _TARGET_ARCH_SIGTRAMP_H_ */
-- 
2.33.0


