Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mipmX-0005hV-PX
	for mharc-qemu-trivial@gnu.org; Thu, 04 Nov 2021 23:20:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mipm7-0004lM-64
 for qemu-trivial@nongnu.org; Thu, 04 Nov 2021 23:20:19 -0400
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36]:45725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mipm4-0004DC-7g
 for qemu-trivial@nongnu.org; Thu, 04 Nov 2021 23:20:18 -0400
Received: by mail-io1-xd36.google.com with SMTP id q203so9162430iod.12
 for <qemu-trivial@nongnu.org>; Thu, 04 Nov 2021 20:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xELoQ9MP23ZY0icqqnGEqd1dDOY3xpL6nxhgED/dCUI=;
 b=4+70WyCeUe298IFuNjUCUTB6RGpMksuaazivOLytdluebtyjnefRBXQlFlXcBwHToI
 xWTF49hVkffSEzxMMZghqPHbKv9RriCnIokKNx0syK2hxzuQFrQOBaLD2EgZFt3IvRyB
 x41TLrIjfCTeNNuIetWoYEh9HkqwcSQ4v6Y/grRH/mqIfCaYc+UQljP3p6WMnb9B5oHj
 PPUpbuTL4nFfXx6u0tIhCae4Uv8o6JwEDd0gwpZqdeJMTSpPdx/5Wlz3UO9copIv2Cls
 WKeOD/369Z0vs9GAdPh0vZnojA6GHjDn5mq4VmZKplGbY+LcE28RPbpK4v3LcSejp9A4
 LGZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xELoQ9MP23ZY0icqqnGEqd1dDOY3xpL6nxhgED/dCUI=;
 b=8OIS8G3ISwz+AVA/vxYcf99gFQQcoYMLmTl9mfbCxv1qgRQBkGAXVv+ethtrKH9aNZ
 sT2QAHgGeJE0p5Z2lwhsR6JFWxCyPbkeglq5aEkqrLNAnrR+FG1hmPo+kcIh7WFUOvwn
 IrIiOQlRpYxa2QHGGtBj4y4x6ysBOSQnsyskn75S4nXLoZVYTS1ZyhTB3i4U+dxDFxBJ
 dhy0V+ZdjmpoOh443AUvxIJft52uEgaxipaBAeb7GOEiMNERa9RTGyB4c5dTKI8ePd/Z
 aAqswDn/dT9jcY2kDGdGiHh5MpJLu2S9PFBzBH36Jna6cBuxOsDi6Ze7VObRoOP/nvxB
 SjYA==
X-Gm-Message-State: AOAM532z9KLjfoLk+YyMCEZG2fDbCA5ROYpBlI9zMH+kjYgP364P/fmK
 GGtPrrkKrkI/efg2vOFlbsP/Bw==
X-Google-Smtp-Source: ABdhPJzsL3yqZIFIEsMi3J6NXe28GnPJrDUNp3yIAO8pHpHfB2/ythOmmiKIL+TQ6DIqP/ZXLwssZQ==
X-Received: by 2002:a5d:87d4:: with SMTP id q20mr32618516ios.190.1636082414906; 
 Thu, 04 Nov 2021 20:20:14 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id v4sm3508528ilq.57.2021.11.04.20.20.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 20:20:14 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Philippe Mathieu-Daude <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 qemu-trivial@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@bsdimp.com>, Laurent Vivier <laurent@vivier.eu>,
 Kyle Evans <kevans@freebsd.org>, Stacey Son <sson@FreeBSD.org>,
 Kyle Evans <kevans@FreeBSD.org>
Subject: [PATCH v4 28/36] bsd-user/arm/target_arch_signal.h: arm specific
 signal registers and stack
Date: Thu,  4 Nov 2021 21:19:09 -0600
Message-Id: <20211105031917.87837-29-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211105031917.87837-1-imp@bsdimp.com>
References: <20211105031917.87837-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d36;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd36.google.com
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
X-List-Received-Date: Fri, 05 Nov 2021 03:20:19 -0000

Defines for registers and stack layout related to signals.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/arm/target_arch_signal.h | 57 +++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 bsd-user/arm/target_arch_signal.h

diff --git a/bsd-user/arm/target_arch_signal.h b/bsd-user/arm/target_arch_signal.h
new file mode 100644
index 0000000000..973183d99c
--- /dev/null
+++ b/bsd-user/arm/target_arch_signal.h
@@ -0,0 +1,57 @@
+/*
+ *  arm signal definitions
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
+#ifndef _TARGET_ARCH_SIGNAL_H_
+#define _TARGET_ARCH_SIGNAL_H_
+
+#include "cpu.h"
+
+#define TARGET_REG_R0   0
+#define TARGET_REG_R1   1
+#define TARGET_REG_R2   2
+#define TARGET_REG_R3   3
+#define TARGET_REG_R4   4
+#define TARGET_REG_R5   5
+#define TARGET_REG_R6   6
+#define TARGET_REG_R7   7
+#define TARGET_REG_R8   8
+#define TARGET_REG_R9   9
+#define TARGET_REG_R10  10
+#define TARGET_REG_R11  11
+#define TARGET_REG_R12  12
+#define TARGET_REG_R13  13
+#define TARGET_REG_R14  14
+#define TARGET_REG_R15  15
+#define TARGET_REG_CPSR 16
+#define TARGET__NGREG   17
+/* Convenience synonyms */
+#define TARGET_REG_FP   TARGET_REG_R11
+#define TARGET_REG_SP   TARGET_REG_R13
+#define TARGET_REG_LR   TARGET_REG_R14
+#define TARGET_REG_PC   TARGET_REG_R15
+
+#define TARGET_INSN_SIZE    4       /* arm instruction size */
+
+/* Size of the signal trampolin code. See _sigtramp(). */
+#define TARGET_SZSIGCODE    ((abi_ulong)(9 * TARGET_INSN_SIZE))
+
+/* compare to arm/include/_limits.h */
+#define TARGET_MINSIGSTKSZ  (1024 * 4)                  /* min sig stack size */
+#define TARGET_SIGSTKSZ     (TARGET_MINSIGSTKSZ + 32768)  /* recommended size */
+
+#endif /* !_TARGET_ARCH_SIGNAL_H_ */
-- 
2.33.0


