Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mipmA-0004wk-Ss
	for mharc-qemu-trivial@gnu.org; Thu, 04 Nov 2021 23:20:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1miplt-0004P6-Be
 for qemu-trivial@nongnu.org; Thu, 04 Nov 2021 23:20:05 -0400
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131]:44623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1miplq-00047t-OR
 for qemu-trivial@nongnu.org; Thu, 04 Nov 2021 23:20:05 -0400
Received: by mail-il1-x131.google.com with SMTP id h2so8198779ili.11
 for <qemu-trivial@nongnu.org>; Thu, 04 Nov 2021 20:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5iIfFcYyYja/cPaQ9qdIgUErIUCnLNWxpKMyL/JDBtE=;
 b=7sgS0wNaMypH+B2pRnp6JxirU8GrwCtcz4vg586usnsBFJtF92pr458j8ima9M1zDc
 41DqgpIa90Rj4mSgpWuzolUXTUFDEKVQfB6dRnOBHPhdPXxOXK0dFy4M4LQBPS4V+xYa
 czXXOtYFXhkl8FawyWHnr8wo4/nwG3caztBTzTAJIzAYb/jMdRbe+u7i6ldsq230fpyP
 JAGwmlhn6gi+eWLiJIg1b0eFd1eKrWMklc1LstAqiyM9Rak3QHWKaddj2mTmM0QD9PbA
 DE2Esq+5WLv+oGhUIAWGDtGNMu7MXWx8gPkH+yZaA0vlut1ZOxzFCExUgNXfejlc7TIz
 hC1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5iIfFcYyYja/cPaQ9qdIgUErIUCnLNWxpKMyL/JDBtE=;
 b=gDellDn8iF5RMZ2dWZn4FXDVMYkJMj3cYGkT7J0gCv7ZWLE1YliSI3cYBToHzg3hgB
 5CXSAXEH4LJeW5UW1X2YABriBEQFPswhLHMSOsFBoS2MZNkHcjgKresIsE+aNSpaJSrH
 0nG/cbQIM2USMsIxmJi7yNn8VyEZxOLvi8H21n0iF11iBA5l3bIIBFAdKwGsrW6+dGk1
 XQnT1AK7fIHNH/MyNapM6rpL5FMseJXbAVunJXIhxlYa23lOZh6ldJsQuA7mvVteGhpT
 IspTdYtqCJEwGUyVUuih+gYHw5bqeGmyMaBVoF+Ste7DR8XHHgH0xGv/QFjlmNTvfVFV
 n5dg==
X-Gm-Message-State: AOAM5332oeVD0sywGsAPPROWtMjvaLyhyUha2A/xtaOBuGU/Pi0QZ0QH
 PrLLf6ApEI6LET2wCd7sWwkg3Q==
X-Google-Smtp-Source: ABdhPJypkh9s3TyDfIXDGWEkSL7tEswAYjkD1GWu7/Rr52YEWzPQUkLVfFX2ESdqVvDLNMZE96iTMA==
X-Received: by 2002:a92:cda2:: with SMTP id g2mr28387347ild.46.1636082401440; 
 Thu, 04 Nov 2021 20:20:01 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id v4sm3508528ilq.57.2021.11.04.20.20.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 20:20:01 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Philippe Mathieu-Daude <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 qemu-trivial@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@bsdimp.com>, Laurent Vivier <laurent@vivier.eu>,
 Kyle Evans <kevans@freebsd.org>, Olivier Houchard <cognet@ci0.org>,
 Stacey Son <sson@FreeBSD.org>, Kyle Evans <kevans@FreeBSD.org>
Subject: [PATCH v4 15/36] bsd-user/arm/target_arch_cpu.h: CPU Loop definitions
Date: Thu,  4 Nov 2021 21:18:56 -0600
Message-Id: <20211105031917.87837-16-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211105031917.87837-1-imp@bsdimp.com>
References: <20211105031917.87837-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::131;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x131.google.com
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
X-List-Received-Date: Fri, 05 Nov 2021 03:20:08 -0000

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


