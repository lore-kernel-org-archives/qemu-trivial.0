Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1midNg-0006Vs-2a
	for mharc-qemu-trivial@gnu.org; Thu, 04 Nov 2021 10:06:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1midNe-0006QZ-N1
 for qemu-trivial@nongnu.org; Thu, 04 Nov 2021 10:06:14 -0400
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34]:41690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1midNb-0000wz-VA
 for qemu-trivial@nongnu.org; Thu, 04 Nov 2021 10:06:14 -0400
Received: by mail-io1-xd34.google.com with SMTP id p193so6986684iod.8
 for <qemu-trivial@nongnu.org>; Thu, 04 Nov 2021 07:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5iIfFcYyYja/cPaQ9qdIgUErIUCnLNWxpKMyL/JDBtE=;
 b=0KsRHtTzaIzii+ZWZCTR76FtLAIodVpIQehBsjf+XCoFrxV8gS4feMgtlwgA3pgA73
 EDsRrTUUoIYPkgpndxEC5AzI5cW0pyy8lZ17jGDb6G4PXB5pxBKxL2JPTilRXn7C3ZxM
 bUjtAqSH5Dx71uP88vCbRTIBPOPRkLdXNPIxApHlN5uNB4QBwy3oUQhrKLNjXfX+deTw
 o9day25mWc5ayWVVNxpMcVM75jAkMat/niufTSRZXoi8gqtb32gjbdBKaI7HsVWCjqXO
 D/yznpHMmLR1Xm9nLTb3oTUpmP+llZyxm8DyyIzz8y4ZEDWfOWl19jAO5RyQPMWx+1rz
 iefA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5iIfFcYyYja/cPaQ9qdIgUErIUCnLNWxpKMyL/JDBtE=;
 b=WeEeXYuYKr7wm+W2raPGC0+4JU7uI9V+lGriZcXRM4v0fe7xW/U8mezjM8T5soEBwz
 mswTaHl59RWKrQimAvcrbPyf28qtxrbba/AIDjEBlMwWArsPMrvJB6qwCoNzslQ7JeMm
 0xDX/0Tk21unz8QFgM8a9+gz66yZJtHvuBbGlvNlMonPo/RtR9hJMTvDJ46hlYv/Uu+d
 FbrGIjza5Npj1y0ya9mKhll2zHCLy5jDXELaOa7ljbzSI2S4aSqRSr+Q26/tDEsfVdRe
 4kJAONdYM3UAfWYSiGUVMYWnaINuHufZohmXKdKtdpNeA2lkTJyf2WKKfbxvs/F9wNTR
 g9cw==
X-Gm-Message-State: AOAM533IIXWXIGj8EXz/nbywQ+jP5wU52uuWDaLU2GjCuRvIfz+AcYcW
 KF2ZO6IBbV6ztm4k2i1+/Pyk3w==
X-Google-Smtp-Source: ABdhPJxSKbvBgzegEUeDY9xUccML/AwLqA9XpWneoRMkjZRKVWEKKTMs/BoUip/7Tp0zqWi3FvY1gQ==
X-Received: by 2002:a6b:7a04:: with SMTP id h4mr7178334iom.154.1636034770847; 
 Thu, 04 Nov 2021 07:06:10 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id l2sm3206741iln.50.2021.11.04.07.06.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 07:06:10 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>, Laurent Vivier <laurent@vivier.eu>,
 Michael Tokarev <mjt@tls.msk.ru>, Philippe Mathieu-Daude <f4bug@amsat.org>,
 qemu-trivial@nongnu.org, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Olivier Houchard <cognet@ci0.org>, Stacey Son <sson@FreeBSD.org>,
 Kyle Evans <kevans@FreeBSD.org>
Subject: [PATCH v3 04/29] bsd-user/arm/target_arch_cpu.h: CPU Loop definitions
Date: Thu,  4 Nov 2021 08:05:11 -0600
Message-Id: <20211104140536.42573-5-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211104140536.42573-1-imp@bsdimp.com>
References: <20211104140536.42573-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d34;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd34.google.com
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
X-List-Received-Date: Thu, 04 Nov 2021 14:06:15 -0000

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


