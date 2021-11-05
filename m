Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mipmB-0004zy-Rw
	for mharc-qemu-trivial@gnu.org; Thu, 04 Nov 2021 23:20:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1miplo-0004M6-Ig
 for qemu-trivial@nongnu.org; Thu, 04 Nov 2021 23:20:02 -0400
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d]:41719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1miplm-00046Z-Bg
 for qemu-trivial@nongnu.org; Thu, 04 Nov 2021 23:20:00 -0400
Received: by mail-io1-xd2d.google.com with SMTP id p193so9279352iod.8
 for <qemu-trivial@nongnu.org>; Thu, 04 Nov 2021 20:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xP7qtQ+lrDr+iZjFW+q6X/N5asMVv8qg8pOJCQ+QUNc=;
 b=2mUwZ56MYAvWXPKQhMz42iIlnK7xxqWpxON719SuKMAsXPs9ocbmJa1QTdC0roy/fN
 Y3qGD8E91oHzA1QnzMlPzysE1YxvFACTEqz6cJdEu2Ivw0sSG7dyMNFE13I/wYYAEXHW
 xY2JkRQ7Tl486MgVgWwFr1EqwLgBskll5VNakVi8iaRNETBlAHsekwYSwtHfhAkP02qH
 ibFgqb3I7MRr7YUL+cjVjCzrfF23TFtOPDo3MLjk8Yr1PJO70yL3YOkGC+XxcCSIVj5I
 ppSAIg3OLVR5mrLXAQV+3zrPg8uLBhfO3xravdP2laR1GufFv6qWjgkzwjnsGiciqTFB
 XzkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xP7qtQ+lrDr+iZjFW+q6X/N5asMVv8qg8pOJCQ+QUNc=;
 b=agZRQsgUCp4CUpJzpgEgonc3ejmWuqOflHtrNF5fJmpFxA5fI3MC7VMhcTuPjtAq6t
 JdTR1H+4RIDmAFOpfiyfkFkq5bV8gOSuKWA9IESNkY32M0EEtnXOhHq1pYLrx8iSlOfE
 /hpwbJ6JVc2XlENgH0AJqQqQyZLLyQkg2pCoErT6gGKumHgAIsj2s+Lxo3XrxA8Oyq6o
 PxaeNzaAPbS0qWg62STOHedPC7GN9mi74XPcyW2bfyy0mU2cCS2AEv519SYKbGN5W+nk
 y0UPGP5HjeTuhSZr5FsgjS8VT1/mWcWi5s38CPKEw1R/nXXTFxhv8qTv0FnWiAumJtAF
 3lmQ==
X-Gm-Message-State: AOAM530+jC0Xs4YsqU5g6vF9IzlU7YzKPnkWA87PvTgTSBHKhk59s/H5
 EUR5b+0z9bLVI5nXOzpQOnXI+5ghtC6G9w==
X-Google-Smtp-Source: ABdhPJzIZ6bB5lzLEwwKBjV9NJpplcDsctvvT3T1W4ZuktOO54u31WZIMZf8lBlpZU6l8AccPOxxWg==
X-Received: by 2002:a02:ca4e:: with SMTP id i14mr6862078jal.140.1636082396966; 
 Thu, 04 Nov 2021 20:19:56 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id v4sm3508528ilq.57.2021.11.04.20.19.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 20:19:56 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Philippe Mathieu-Daude <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 qemu-trivial@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@bsdimp.com>, Laurent Vivier <laurent@vivier.eu>,
 Kyle Evans <kevans@freebsd.org>
Subject: [PATCH v4 11/36] bsd-user/x86_64: Move functions into signal.c
Date: Thu,  4 Nov 2021 21:18:52 -0600
Message-Id: <20211105031917.87837-12-imp@bsdimp.com>
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
X-List-Received-Date: Fri, 05 Nov 2021 03:20:02 -0000

Move the current inline functions into sigal.c. This will increate the
flexibility of implementation in the future.

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/x86_64/signal.c             | 56 +++++++++++++++++++++++++++-
 bsd-user/x86_64/target_arch_signal.h | 43 ++++-----------------
 2 files changed, 63 insertions(+), 36 deletions(-)

diff --git a/bsd-user/x86_64/signal.c b/bsd-user/x86_64/signal.c
index ac90323365..8885152a7d 100644
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
index 720e3939c3..b39b70466e 100644
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
2.33.0


