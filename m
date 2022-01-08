Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n66JJ-0005vL-7L
	for mharc-qemu-trivial@gnu.org; Sat, 08 Jan 2022 02:38:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n66Ia-0005JY-Mp
 for qemu-trivial@nongnu.org; Sat, 08 Jan 2022 02:38:02 -0500
Received: from [2607:f8b0:4864:20::d2b] (port=36580
 helo=mail-io1-xd2b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n66IU-0003Kz-Ad
 for qemu-trivial@nongnu.org; Sat, 08 Jan 2022 02:37:56 -0500
Received: by mail-io1-xd2b.google.com with SMTP id p65so10130998iof.3
 for <qemu-trivial@nongnu.org>; Fri, 07 Jan 2022 23:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=V+Cl1Da8qxWzFQYHoMpffHhzKgcajhVImOHitRup9JU=;
 b=pg/Ci6EsstG96xupGGV3+iK2w1vcfeS9/iq9RYv6RuEzprptHmrIHvQ6T5xuprooaR
 X5ovHKCIQTdf19Qr/TBeHwUVX9pghvq75ryoguZNXkX6O3QZcCfXCT0LuXMVfO0a+bqj
 pqk+Bq/fS+/jvUXFoMq6LcNEEFY0V9Xy6CKpYxFoK4T42c85SaEI5yR2oorPxsWQHHOH
 cMRZDWo8L1iXTTaleL0I74uqNHH4szwYGOl94OpMHx60Mw2X8mvPuvKcklVHjfPiA+XN
 58CFUTihVaS9L6U+zt51xXUSxDGfuYs2BujEzp7a4w4nIwBlaRvjgkaWQ2PyR2+FAY1e
 3nxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=V+Cl1Da8qxWzFQYHoMpffHhzKgcajhVImOHitRup9JU=;
 b=qCbJJrF0FdvXNTb63Dj85simnfj3jPrSD616mkVeVE3iXwKA13UA2x7eCimvDFgxvZ
 z6diYfiITuHGjDBrF+Yh4MQN7k60CJHQCOUAgX1E/il9cBCI0g350SeWUI/K1B1AnrS7
 meoROaZmuCFZ/8zUjaS/drN7ap1+ZrWiFWaMkEol9EsTpXwgrNY3JnkCL+mXH+mlh0RI
 H4P3soLfDclk7EyeO9/O+GZ3sp7Vt7bQj8woU9JGeoIxRnK9IF2iZ3iKLI5Wh/XZ4stf
 Pp5xF2mqXYuwLO1NnwJlVZ22+O5+GXWnaWKEwtK4E8jaF44eEh4q8LKUp4/yBnzuiAJ9
 SATw==
X-Gm-Message-State: AOAM531e61ONZck/5UYpe8gwWcjNcpnurixCG4WdKEdpnwRuuomqBP3N
 GDyd2iBv1Bn8tg8NgT8jx2ViwQ==
X-Google-Smtp-Source: ABdhPJzVDaaR1rMWpVrLyKeeLbB0+UUocqL0UgMMMUQUZMKr3mmWrW5Fuq2xBw+ILG/lKnV23ofjZQ==
X-Received: by 2002:a05:6602:2e11:: with SMTP id
 o17mr32004168iow.172.1641627469902; 
 Fri, 07 Jan 2022 23:37:49 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id w19sm613022iov.12.2022.01.07.23.37.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 23:37:49 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-trivial@nongnu.org, kevans@freebsd.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Warner Losh <imp@bsdimp.com>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 07/37] bsd-user/i386: Move the inlines into signal.c
Date: Sat,  8 Jan 2022 00:37:07 -0700
Message-Id: <20220108073737.5959-8-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220108073737.5959-1-imp@bsdimp.com>
References: <20220108073737.5959-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2b
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d2b;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2b.google.com
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

Move the (now stubbed out) inlines into bsd-user/i386/signal.c.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/i386/signal.c             | 56 +++++++++++++++++++++++++++++-
 bsd-user/i386/target_arch_signal.h | 43 +++++------------------
 2 files changed, 63 insertions(+), 36 deletions(-)

diff --git a/bsd-user/i386/signal.c b/bsd-user/i386/signal.c
index ac903233653..2939d32400c 100644
--- a/bsd-user/i386/signal.c
+++ b/bsd-user/i386/signal.c
@@ -1 +1,55 @@
-/* Placeholder for signal.c */
+/*
+ *  i386 dependent signal definitions
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
+ * Compare to i386/i386/machdep.c sendsig()
+ * Assumes that target stack frame memory is locked.
+ */
+abi_long set_sigtramp_args(CPUX86State *env, int sig,
+                           struct target_sigframe *frame,
+                           abi_ulong frame_addr,
+                           struct target_sigaction *ka)
+{
+    /* XXX return -TARGET_EOPNOTSUPP; */
+    return 0;
+}
+
+/* Compare to i386/i386/machdep.c get_mcontext() */
+abi_long get_mcontext(CPUX86State *regs, target_mcontext_t *mcp, int flags)
+{
+    /* XXX */
+    return -TARGET_EOPNOTSUPP;
+}
+
+/* Compare to i386/i386/machdep.c set_mcontext() */
+abi_long set_mcontext(CPUX86State *regs, target_mcontext_t *mcp, int srflag)
+{
+    /* XXX */
+    return -TARGET_EOPNOTSUPP;
+}
+
+abi_long get_ucontext_sigreturn(CPUX86State *regs, abi_ulong target_sf,
+                                abi_ulong *target_uc)
+{
+    /* XXX */
+    *target_uc = 0;
+    return -TARGET_EOPNOTSUPP;
+}
diff --git a/bsd-user/i386/target_arch_signal.h b/bsd-user/i386/target_arch_signal.h
index 701c6f964f8..982c7035c75 100644
--- a/bsd-user/i386/target_arch_signal.h
+++ b/bsd-user/i386/target_arch_signal.h
@@ -88,40 +88,13 @@ struct target_sigframe {
     uint32_t    __spare__[2];
 };
 
-/*
- * Compare to i386/i386/machdep.c sendsig()
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
-/* Compare to i386/i386/machdep.c get_mcontext() */
-static inline abi_long get_mcontext(CPUX86State *regs,
-        target_mcontext_t *mcp, int flags)
-{
-    /* XXX */
-    return -TARGET_EOPNOTSUPP;
-}
-
-/* Compare to i386/i386/machdep.c set_mcontext() */
-static inline abi_long set_mcontext(CPUX86State *regs,
-        target_mcontext_t *mcp, int srflag)
-{
-    /* XXX */
-    return -TARGET_EOPNOTSUPP;
-}
-
-static inline abi_long get_ucontext_sigreturn(CPUX86State *regs,
-                        abi_ulong target_sf, abi_ulong *target_uc)
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
 
 #endif /* TARGET_ARCH_SIGNAL_H */
-- 
2.33.1


