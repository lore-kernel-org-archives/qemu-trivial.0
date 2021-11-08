Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mjvnu-0003fj-G1
	for mharc-qemu-trivial@gnu.org; Sun, 07 Nov 2021 22:58:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mjvno-0003Zu-5T
 for qemu-trivial@nongnu.org; Sun, 07 Nov 2021 22:58:36 -0500
Received: from [2607:f8b0:4864:20::72b] (port=41856
 helo=mail-qk1-x72b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mjvnl-0006t8-Eh
 for qemu-trivial@nongnu.org; Sun, 07 Nov 2021 22:58:35 -0500
Received: by mail-qk1-x72b.google.com with SMTP id br39so14355978qkb.8
 for <qemu-trivial@nongnu.org>; Sun, 07 Nov 2021 19:58:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5iIfFcYyYja/cPaQ9qdIgUErIUCnLNWxpKMyL/JDBtE=;
 b=NfHOezxAQZwlBSOYp7TJ/oP6B8i4eQo3lr7bpTG4WKbr33nsP+Gy4NKPo4poVrHD3V
 Dewd6RTtfPdgLtRqMr5/HS/zi8+Hkx/sZT4SGuTJg2A+gm4ooovXm5S7eRajkyMymcem
 lG+1RWxIjDs3V4kQmtzK2BYf7vueoZR9m2gNGo36mN8j4gQACnK4KJoZwu13uCTdkK9v
 nAFTI7J5Ie9g3cRjzVG4Eg/zRED041Q4zmjqR6zdGxnq66tPwhruziyNNq07Ah1jBBWi
 Zeia9MaWMBww3XKz9IqQtsSo7gKg8kH8ArCTWOP7YlSaBz4kCUfvzdZ6wWUoqCy/gJKt
 1H6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5iIfFcYyYja/cPaQ9qdIgUErIUCnLNWxpKMyL/JDBtE=;
 b=HvHdO332R2iQRWWSR8RVs+1gVBR49UkhrgmY6wv+Ql5KYeewONMyDqA0wF3vqhcLCQ
 Vye2jIUrtvHJ9QPU1CF2NL8qlBTe78zGu4LH7pnK8PTrm9Fy0O4B7MCzTd2p4toX9K4J
 +wRtoiz/aJY5RZxgt7rFARbCX/I9lfKv1u/7EAD3XQOx9+zupX0Wfk4Dh+WcZbX+qHMi
 egSoxjnTI0ob/AMEXWQ0zPCuPnrYri0Nwyj1MfynnFYoOrqmuFmL7rvX8k8PMWIkM3Q2
 CbwJFH40bzx0/XxUSTEB2FsOa2Fvla9+q05vlSlk+z6kqN60lW3QoIlhS9B3OYSGpb/3
 Ifcw==
X-Gm-Message-State: AOAM533GZu+eMZr5tLkij7ySxQjJTrtwRcGu37J/kaYD65JYCetBvPH4
 0fEi5TqbyiRouKWXDJn/5DiybBEO9asCEA==
X-Google-Smtp-Source: ABdhPJxfEchwduoayk4m5UPDHya/opL2QitujfBL0RA7Bguv24IG3p9wdBma/K7GH2JB3tBxXo/FzQ==
X-Received: by 2002:a02:84ec:: with SMTP id f99mr21768957jai.122.1636343545147; 
 Sun, 07 Nov 2021 19:52:25 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id x15sm876909iob.8.2021.11.07.19.52.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Nov 2021 19:52:24 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Michael Tokarev <mjt@tls.msk.ru>,
 Warner Losh <imp@bsdimp.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Kyle Evans <kevans@freebsd.org>, Philippe Mathieu-Daude <f4bug@amsat.org>,
 qemu-trivial@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Olivier Houchard <cognet@ci0.org>, Stacey Son <sson@FreeBSD.org>,
 Kyle Evans <kevans@FreeBSD.org>
Subject: [PATCH v5 16/37] bsd-user/arm/target_arch_cpu.h: CPU Loop definitions
Date: Sun,  7 Nov 2021 20:51:15 -0700
Message-Id: <20211108035136.43687-17-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211108035136.43687-1-imp@bsdimp.com>
References: <20211108035136.43687-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::72b
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::72b;
 envelope-from=imp@bsdimp.com; helo=mail-qk1-x72b.google.com
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
X-List-Received-Date: Mon, 08 Nov 2021 03:58:36 -0000

target_arch_cpu.h is for CPU loop definitions. Create the file and
define target_cpu_init and target_cpu_reset for arm.

Signed-off-by: Olivier Houchard <cognet@ci0.org>
Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/arm/target_arch_cpu.h | 43 ++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 bsd-user/arm/target_arch_cpu.h

diff --git a/bsd-user/arm/target_arch_cpu.h b/bsd-user/arm/target_arch_cpu.h
new file mode 100644
index 0000000000..66215684d6
--- /dev/null
+++ b/bsd-user/arm/target_arch_cpu.h
@@ -0,0 +1,43 @@
+/*
+ *  arm cpu init and loop
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
+#ifndef _TARGET_ARCH_CPU_H_
+#define _TARGET_ARCH_CPU_H_
+
+#include "target_arch.h"
+
+#define TARGET_DEFAULT_CPU_MODEL "any"
+
+static inline void target_cpu_init(CPUARMState *env,
+        struct target_pt_regs *regs)
+{
+    int i;
+
+    cpsr_write(env, regs->uregs[16], CPSR_USER | CPSR_EXEC,
+               CPSRWriteByInstr);
+    for (i = 0; i < 16; i++) {
+        env->regs[i] = regs->uregs[i];
+    }
+}
+
+static inline void target_cpu_reset(CPUArchState *cpu)
+{
+}
+
+#endif /* !_TARGET_ARCH_CPU_H */
-- 
2.33.0


