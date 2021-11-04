Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1midNr-0006v4-MZ
	for mharc-qemu-trivial@gnu.org; Thu, 04 Nov 2021 10:06:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1midNq-0006pd-9W
 for qemu-trivial@nongnu.org; Thu, 04 Nov 2021 10:06:26 -0400
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b]:47057)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1midNj-0000zp-BR
 for qemu-trivial@nongnu.org; Thu, 04 Nov 2021 10:06:25 -0400
Received: by mail-il1-x12b.google.com with SMTP id w10so6239824ilc.13
 for <qemu-trivial@nongnu.org>; Thu, 04 Nov 2021 07:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1ztRBQYqWrUwRLf6NQ4W8izvboRcDbY0eKrhIvHHz3I=;
 b=f4/1VVtJdxJA6ObRpXO+osPgo4zji3vWjabJJiDGSf4vow5N0uZUAiWIyw/szw3CM5
 0N9uYPq7IcQ1UfgSyKwNiRqjaLeesxaCx7yxLUEeYeyvm5GWSv06BbuDA3LShGeLfKcZ
 V47rd2SJH3R+UH5cqfZZD+dvfynqMpsX0Gx5mA4VNf6Ng2ONv/8MEaSm4UhNJd5Zzllm
 a77QM/xyEo6f5aBciIWi0rSy4dmnX2wrf3v3/ufQExT/WfuxGF66A7ry6rA2+/XANOw+
 a+BZXijX8H8DVIqzXwv+vlCZl06rOOTetHenpi3eVg5lYAQESqY0CQq5QL0OyhdZWmVf
 m48A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1ztRBQYqWrUwRLf6NQ4W8izvboRcDbY0eKrhIvHHz3I=;
 b=C0MN9HTFf+tLTQzD+RcfRWE9rYnnixJsiw82zPeV3Wp0SrR1xP55WmoSxeObW5zhr6
 o7FSzXsXE2N0SlDPCi1LlScNU4b6Ko7jX/RS45+EU3eEY6RfqkPcHUqaBrSAuYtUXr68
 KRNqSQphY5IQgH85tADdiXBx6d2qUxmwRtG8Kvzxg72GLhFMHPSRFrrTda1rqlP1de+v
 bVDtlAECrrPysy+YkBVTs1SObPS2Xod6o+8VFGQQ/l+XwWSSn2jN8vB8OhroRqfiDPIf
 iEPRO+7SKkRBUFZdNRP7iRhxcHUom9LOS4wxAgHAkrcS5R4sVhVfG5lrwLW6eU2fP91K
 BYIg==
X-Gm-Message-State: AOAM532Xv71eZzRZRo/W/pncrSu7krGFqOAHZjwQcO9lSWT/3Nz9O1Qk
 3fIQFnWYrUAqPQSe+bgJrCxV2g==
X-Google-Smtp-Source: ABdhPJzhJlGyw6qGMCYmRBhagt+wukl5nkYtsFooH+QpjdchGQtVv6zlczOBEkKzCwMrIyLpztUAXw==
X-Received: by 2002:a92:8742:: with SMTP id d2mr34167829ilm.128.1636034778237; 
 Thu, 04 Nov 2021 07:06:18 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id l2sm3206741iln.50.2021.11.04.07.06.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 07:06:17 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>, Laurent Vivier <laurent@vivier.eu>,
 Michael Tokarev <mjt@tls.msk.ru>, Philippe Mathieu-Daude <f4bug@amsat.org>,
 qemu-trivial@nongnu.org, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stacey Son <sson@FreeBSD.org>, Kyle Evans <kevans@FreeBSD.org>
Subject: [PATCH v3 11/29] bsd-user/arm/target_arch_vmparam.h: Parameters for
 arm address space
Date: Thu,  4 Nov 2021 08:05:18 -0600
Message-Id: <20211104140536.42573-12-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211104140536.42573-1-imp@bsdimp.com>
References: <20211104140536.42573-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12b;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 04 Nov 2021 14:06:26 -0000

Various parameters describing the layout of the ARM address space. In
addition, define routines to get the stack pointer and to set the second
return value.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Kyle Evans <kevans@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/arm/target_arch_vmparam.h | 48 ++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 bsd-user/arm/target_arch_vmparam.h

diff --git a/bsd-user/arm/target_arch_vmparam.h b/bsd-user/arm/target_arch_vmparam.h
new file mode 100644
index 0000000000..4bbc04ddf5
--- /dev/null
+++ b/bsd-user/arm/target_arch_vmparam.h
@@ -0,0 +1,48 @@
+/*
+ *  arm VM parameters definitions
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
+#ifndef _TARGET_ARCH_VMPARAM_H_
+#define _TARGET_ARCH_VMPARAM_H_
+
+#include "cpu.h"
+
+/* compare to sys/arm/include/vmparam.h */
+#define TARGET_MAXTSIZ      (64 * MiB)           /* max text size */
+#define TARGET_DFLDSIZ      (128 * MiB)          /* initial data size limit */
+#define TARGET_MAXDSIZ      (512 * MiB)          /* max data size */
+#define TARGET_DFLSSIZ      (4 * MiB)            /* initial stack size limit */
+#define TARGET_MAXSSIZ      (64 * MiB)           /* max stack size */
+#define TARGET_SGROWSIZ     (128 * KiB)          /* amount to grow stack */
+
+#define TARGET_RESERVED_VA  0xf7000000
+
+                /* KERNBASE - 512 MB */
+#define TARGET_VM_MAXUSER_ADDRESS   (0xc0000000 - (512 * MiB))
+#define TARGET_USRSTACK             TARGET_VM_MAXUSER_ADDRESS
+
+static inline abi_ulong get_sp_from_cpustate(CPUARMState *state)
+{
+    return state->regs[13]; /* sp */
+}
+
+static inline void set_second_rval(CPUARMState *state, abi_ulong retval2)
+{
+    state->regs[1] = retval2;
+}
+
+#endif  /* ! _TARGET_ARCH_VMPARAM_H_ */
-- 
2.33.0


