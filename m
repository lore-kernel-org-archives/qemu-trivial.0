Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mi2eq-0006hP-0A
	for mharc-qemu-trivial@gnu.org; Tue, 02 Nov 2021 18:53:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mi2eo-0006cs-0p
 for qemu-trivial@nongnu.org; Tue, 02 Nov 2021 18:53:30 -0400
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131]:36687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mi2ej-0002li-40
 for qemu-trivial@nongnu.org; Tue, 02 Nov 2021 18:53:29 -0400
Received: by mail-il1-x131.google.com with SMTP id l8so669669ilv.3
 for <qemu-trivial@nongnu.org>; Tue, 02 Nov 2021 15:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vWKFnk2z7P/FO7vmESDP+3rLyDPPYyXRje+b3kNtLy0=;
 b=SsavFzzm5ELQ3n5eUrwRAL0d57Ku+6m4olfEy8d5A3B9S0DTnNaJNSVx3dx8viAqUC
 +Ll8wt6sCrJqSFneu8pGy/tH8/rgzqlD+O8NbTKDL4kromS7AiAFCcz4rGmQCchzF8LJ
 fOT1kUj1dQT6muMyUo6xPjAAfhdsmHwaf+hdj1/FtVp0uBnqajspRt+V3b6B7qkKtDju
 u7tzpqgvSzTbh4P0RGU5YXW14nWqgi4P9hkWx+/FGxYO45+/g18pNtzunpi7OS/kWcd/
 C3wUcJXIdyENbed1vb5NP/EPuZXRNUdfxkSboJ6nab78RVF5SfjH3FgOzzKz+NMk/Kmk
 Pc9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vWKFnk2z7P/FO7vmESDP+3rLyDPPYyXRje+b3kNtLy0=;
 b=34TGLRm9oREeUwxbh2SBUkMH5CHH2BUSMCvFgDO8mLs0R1r2/JKVFGz1gb91/2Lvxb
 IQe8WEwp2tTiUiJoZ+FaG0ahC9PDemO8yeJW+oMx0LpRaQssXu0RFJJv/yOcDo7f+QpA
 JQxM9MKYTMwK2Au4Od0qODZ2k2BCScIZ3FOPdXN+Sac+629ufnQIAJNJs9J+FpASwi4i
 fSfnDEy483/wwvRzrizJDYaf+af0zNNj8Gx/P/+dhY+UJmfLJb4kyYlbbrz9pW2ALNIz
 YAzYqZPEEgx+HXUiqo/Zm9pZlIwN1upT/94wBYriYY8HsbZ8gl22VI3SmrlGgq117bmi
 s0YQ==
X-Gm-Message-State: AOAM5310nvHmxzsE+UAna/o4dW+Qe0mYbOAyoo1IIAN2PMOI0wAEJIAA
 dBBd9XMVbSC61eo/hBM0A3CznA==
X-Google-Smtp-Source: ABdhPJxH+baiQsCG1sLdKxKgP11cO5Ifb7U7+X1NlKm/GGMpDpEhhc1Gp/P1eDxa4EwciBFNu1m18Q==
X-Received: by 2002:a05:6e02:1e02:: with SMTP id
 g2mr27732887ila.67.1635893604164; 
 Tue, 02 Nov 2021 15:53:24 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id h14sm205427ils.75.2021.11.02.15.53.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 15:53:23 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, Warner Losh <imp@bsdimp.com>,
 qemu-trivial@nongnu.org, Philippe Mathieu-Daude <f4bug@amsat.org>,
 Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Olivier Houchard <cognet@ci0.org>,
 Stacey Son <sson@FreeBSD.org>, Kyle Evans <kevans@FreeBSD.org>
Subject: [PATCH v2 05/30] bsd-user/arm/target_arch_cpu.h: CPU Loop definitions
Date: Tue,  2 Nov 2021 16:52:23 -0600
Message-Id: <20211102225248.52999-6-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211102225248.52999-1-imp@bsdimp.com>
References: <20211102225248.52999-1-imp@bsdimp.com>
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
X-List-Received-Date: Tue, 02 Nov 2021 22:53:30 -0000

target_arch_cpu.h is for CPU loop definitions. Create the file and
define target_cpu_init and target_cpu_reset for arm.

Signed-off-by: Olivier Houchard <cognet@ci0.org>
Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
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


