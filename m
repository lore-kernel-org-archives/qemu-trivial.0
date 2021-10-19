Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mcsEn-0008Si-MS
	for mharc-qemu-trivial@gnu.org; Tue, 19 Oct 2021 12:45:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcsEk-0008PB-NW
 for qemu-trivial@nongnu.org; Tue, 19 Oct 2021 12:45:15 -0400
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f]:39516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcsEg-0000E6-M8
 for qemu-trivial@nongnu.org; Tue, 19 Oct 2021 12:45:14 -0400
Received: by mail-io1-xd2f.google.com with SMTP id o184so9133342iof.6
 for <qemu-trivial@nongnu.org>; Tue, 19 Oct 2021 09:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=b40iFL2DSmEskWiJcrwrYMjZgS+Ai6esoPKmcvNusOQ=;
 b=PthhKvALBwNpz24mmRD5KlXAhOaXu8nkf2hH+Qyp7hBQDal3WijMjjIqcrBCYxQoa6
 0xWbyeUQQWYROZwgCq6DREG/PNpFn1hMutog6r+Th+gluw7pPiWxJkx5eUmIOsMhSPIp
 AZjlsRceD3CfEhefCk5SfNK2GhAdZz7VLfJpwzyO2DGRu8x9stFDllKBDNwz4xZ5+jDu
 9CpuZvSXr2IjAfFDM7xQGoS8DZPT9eWIByhUzv1xW+K9eF3W97/UG+Ihc+rK6FThc65m
 XzEeWH8MJggTL42zj1WsNYJ/C3GX6cjm8gdv2pKYUCe8ZTLVuieCmkaqWv8cTwuGq5Qk
 S5sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=b40iFL2DSmEskWiJcrwrYMjZgS+Ai6esoPKmcvNusOQ=;
 b=c8ZWCHe2Qswp/iHp03TmqNG1DlBmCR0OGzvLq99uOiHyMGaF1YTUCOslVnblMMA9Il
 fuwUBZtmR0aDHVUu3RMw5W0YIBORMEgsyAUXb48q/HkxTldx1AML8O98ianW/xE1UYP9
 T0YOmmyhqFZnQ6hcSkta49TvTmmp9jVRg1wGuH7q8OfsE2Npmz2n09OjDFgqoqzV99/U
 q9BvIAfpb+NJi5O0ykgFu4QfKsySHiWlrY7jUhtxzEFy/Sj5PfNAjcnNhU81CPzYKYll
 +B/8k4UDFYUfTohqC3Bcd01k+LUBw0pt5uwLUFklUD/lgtntG7U21dQGntYtrSB20DNG
 tBOQ==
X-Gm-Message-State: AOAM531Az3RCeGHF17dsUcl//yTSaq6C7p3Td31PxtVps5/Gm+k0IJch
 EEljjyXfPbXHVRGXX1SCe6aMjA==
X-Google-Smtp-Source: ABdhPJyNtzvir8+ZQTICD1FaJi98dIyurI6FPBio9Bcb/V8trMvExcE9lbIHN9A7QeuRUPExIedHEA==
X-Received: by 2002:a02:9149:: with SMTP id b9mr5031271jag.46.1634661909543;
 Tue, 19 Oct 2021 09:45:09 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id q7sm1133951ilv.48.2021.10.19.09.45.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 09:45:08 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>, Laurent Vivier <laurent@vivier.eu>,
 qemu-trivial@nongnu.org, Kyle Evans <kevans@freebsd.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Olivier Houchard <cognet@ci0.org>,
 Stacey Son <sson@FreeBSD.org>
Subject: [PATCH 04/24] bsd-user/arm/target_arch_cpu.h: CPU Loop definitions
Date: Tue, 19 Oct 2021 10:44:27 -0600
Message-Id: <20211019164447.16359-5-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211019164447.16359-1-imp@bsdimp.com>
References: <20211019164447.16359-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2f;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2f.google.com
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
X-List-Received-Date: Tue, 19 Oct 2021 16:45:16 -0000

target_arch_cpu.h is for CPU loop definitions. Create the file and
define target_cpu_init and target_cpu_reset for arm.

Signed-off-by: Olivier Houchard <cognet@ci0.org>
Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/arm/target_arch_cpu.h | 42 ++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 bsd-user/arm/target_arch_cpu.h

diff --git a/bsd-user/arm/target_arch_cpu.h b/bsd-user/arm/target_arch_cpu.h
new file mode 100644
index 0000000000..0f3538196d
--- /dev/null
+++ b/bsd-user/arm/target_arch_cpu.h
@@ -0,0 +1,42 @@
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
+    cpsr_write(env, regs->uregs[16], 0xffffffff, CPSRWriteRaw);
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
2.32.0


