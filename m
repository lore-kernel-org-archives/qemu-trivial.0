Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n66J1-0005aR-DO
	for mharc-qemu-trivial@gnu.org; Sat, 08 Jan 2022 02:38:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n66Ia-0005Jc-Nw
 for qemu-trivial@nongnu.org; Sat, 08 Jan 2022 02:38:03 -0500
Received: from [2607:f8b0:4864:20::d29] (port=45617
 helo=mail-io1-xd29.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n66IU-0003Lg-MB
 for qemu-trivial@nongnu.org; Sat, 08 Jan 2022 02:37:57 -0500
Received: by mail-io1-xd29.google.com with SMTP id i14so10074066ioj.12
 for <qemu-trivial@nongnu.org>; Fri, 07 Jan 2022 23:37:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BTfsxNM9ad3sFK6UU28aM7rb4iv/9BYwnwzFoeMZ6WY=;
 b=K5PfPAWntw7Oo0tXZy0HmNOrVmm+yBbcsWvJcFnEgtR8gMK//eSP3bx8BkwY4TxIr2
 +xonyzjeM/MYS8SmNy54pkUswLT/JZZnl85Tj7nVyAXVrkKnHNf0JIH3mWkO/B5jFUPd
 BNvVrG/83LHqaUITaM/+DD/N3JZP4+Q2DA0SK+/nLx4WdTShJcE9cQKSzCOvcjMBhjFk
 zfxvVmOzal7DSidSwehhyJ8LGHPpxdHq9i8yXFtzed6ZvE1kuM6sjSssXmW7w5g52Emo
 eFbU6reQOHSKD9UMqGXT8IkaeXnxuQXQ/NeU9lEH1WFKpwCf6uisid6fPS0E1P2bYjZB
 RK8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BTfsxNM9ad3sFK6UU28aM7rb4iv/9BYwnwzFoeMZ6WY=;
 b=LTu8ZyrOl/hNidMTORCiVP6gPcjcjCRiLm+VqEDkEtSS5u1ZavDRWOLRUu3MqdG8FZ
 p747PrRahki1XFkrIuPgYfjbEOQ/6sCDiNi+Cf2ByhOzhwxWJGXL/DWpe8ajFwkDlLPC
 oOwA0gPGAsyPHA55/u3qYwPozgGwX0ZEOLJS2V2Q46K4N1W69xEvrAa9wsS2mX/J/bVA
 52KmX+lTcxvhIZ3MfCQhH5YpwnN9GbNpk+6x2KEPL0lFatiobOzYGDSAnTUwW5v8pd46
 5Lp1SHFIR0/vJP52G8TJIFEtMy3SU6Bfb9EZkkqcLHJ9mFNhhN/PF06sK7Nn4Y5lj0X9
 sJ4g==
X-Gm-Message-State: AOAM532VGTQy2peSQHNF+sM/TWQVmn2s5ETBVFrS/gCM/SbrJnzPsuFc
 CNaYdU+ma6zB5XpycYC+SsYtUA==
X-Google-Smtp-Source: ABdhPJzn27Gs5NogZBYep67u7habEeouDBsI1KkuLQNOqSR+zV2XBkyZe5gmjcISTixclihClC3s+A==
X-Received: by 2002:a5d:9844:: with SMTP id p4mr31469971ios.109.1641627473416; 
 Fri, 07 Jan 2022 23:37:53 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id w19sm613022iov.12.2022.01.07.23.37.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 23:37:53 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-trivial@nongnu.org, kevans@freebsd.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Warner Losh <imp@bsdimp.com>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 11/37] bsd-user/x86_64: Move functions into signal.c
Date: Sat,  8 Jan 2022 00:37:11 -0700
Message-Id: <20220108073737.5959-12-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220108073737.5959-1-imp@bsdimp.com>
References: <20220108073737.5959-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d29
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d29;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd29.google.com
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
X-List-Received-Date: Sat, 08 Jan 2022 07:38:12 -0000

Move the current inline functions into sigal.c. This will increate the
flexibility of implementation in the future.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/x86_64/signal.c             | 56 +++++++++++++++++++++++++++-
 bsd-user/x86_64/target_arch_signal.h | 43 ++++-----------------
 2 files changed, 63 insertions(+), 36 deletions(-)

diff --git a/bsd-user/x86_64/signal.c b/bsd-user/x86_64/signal.c
index ac903233653..8885152a7da 100644
--- a/bsd-user/x86_64/signal.c
+++ b/bsd-user/x86_64/signal.c
@@ -1 +1,55 @@
-/* Placeholder for signal.c */
+/*
+ *  x86_64 signal definitions
+ *
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
+ * Compare to amd64/amd64/machdep.c sendsig()
+ * Assumes that target stack frame memory is locked.
+ */
+abi_long set_sigtramp_args(CPUX86State *regs,
+        int sig, struct target_sigframe *frame, abi_ulong frame_addr,
+        struct target_sigaction *ka)
+{
+    /* XXX return -TARGET_EOPNOTSUPP; */
+    return 0;
+}
+
+/* Compare to amd64/amd64/machdep.c get_mcontext() */
+abi_long get_mcontext(CPUX86State *regs,
+                target_mcontext_t *mcp, int flags)
+{
+    /* XXX */
+    return -TARGET_EOPNOTSUPP;
+}
+
+/* Compare to amd64/amd64/machdep.c set_mcontext() */
+abi_long set_mcontext(CPUX86State *regs,
+        target_mcontext_t *mcp, int srflag)
+{
+    /* XXX */
+    return -TARGET_EOPNOTSUPP;
+}
+
+abi_long get_ucontext_sigreturn(CPUX86State *regs,
+        abi_ulong target_sf, abi_ulong *target_uc)
+{
+    /* XXX */
+    *target_uc = 0;
+    return -TARGET_EOPNOTSUPP;
+}
diff --git a/bsd-user/x86_64/target_arch_signal.h b/bsd-user/x86_64/target_arch_signal.h
index 720e3939c31..b39b70466ef 100644
--- a/bsd-user/x86_64/target_arch_signal.h
+++ b/bsd-user/x86_64/target_arch_signal.h
@@ -96,40 +96,13 @@ struct target_sigframe {
     uint32_t    __spare__[2];
 };
 
-/*
- * Compare to amd64/amd64/machdep.c sendsig()
- * Assumes that target stack frame memory is locked.
- */
-static inline abi_long set_sigtramp_args(CPUX86State *regs,
-        int sig, struct target_sigframe *frame, abi_ulong frame_addr,
-        struct target_sigaction *ka)
-{
-    /* XXX return -TARGET_EOPNOTSUPP; */
-    return 0;
-}
-
-/* Compare to amd64/amd64/machdep.c get_mcontext() */
-static inline abi_long get_mcontext(CPUX86State *regs,
-                target_mcontext_t *mcp, int flags)
-{
-    /* XXX */
-    return -TARGET_EOPNOTSUPP;
-}
-
-/* Compare to amd64/amd64/machdep.c set_mcontext() */
-static inline abi_long set_mcontext(CPUX86State *regs,
-        target_mcontext_t *mcp, int srflag)
-{
-    /* XXX */
-    return -TARGET_EOPNOTSUPP;
-}
-
-static inline abi_long get_ucontext_sigreturn(CPUX86State *regs,
-        abi_ulong target_sf, abi_ulong *target_uc)
-{
-    /* XXX */
-    *target_uc = 0;
-    return -TARGET_EOPNOTSUPP;
-}
+abi_long set_sigtramp_args(CPUX86State *env, int sig,
+                           struct target_sigframe *frame,
+                           abi_ulong frame_addr,
+                           struct target_sigaction *ka);
+abi_long get_mcontext(CPUX86State *regs, target_mcontext_t *mcp, int flags);
+abi_long set_mcontext(CPUX86State *regs, target_mcontext_t *mcp, int srflag);
+abi_long get_ucontext_sigreturn(CPUX86State *regs, abi_ulong target_sf,
+                                abi_ulong *target_uc);
 
 #endif /* !TARGET_ARCH_SIGNAL_H_ */
-- 
2.33.1


