Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n66J5-0005n6-6f
	for mharc-qemu-trivial@gnu.org; Sat, 08 Jan 2022 02:38:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n66IT-0005Hw-9o
 for qemu-trivial@nongnu.org; Sat, 08 Jan 2022 02:37:57 -0500
Received: from [2607:f8b0:4864:20::d2b] (port=37505
 helo=mail-io1-xd2b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n66IN-0003Jz-Pd
 for qemu-trivial@nongnu.org; Sat, 08 Jan 2022 02:37:49 -0500
Received: by mail-io1-xd2b.google.com with SMTP id 19so10094437ioz.4
 for <qemu-trivial@nongnu.org>; Fri, 07 Jan 2022 23:37:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BqNi6fntG0ZGKoQuBAAKzElQ2KHXFVMfekNgaGGkf34=;
 b=tN1ZW4XnAaZDOcABUjHaiDx07fmQUjmIe65E9izTV6U1X+JAipFYpWBJefU//swq9N
 kf1DoOBMfCoGEGvrwsu1Yq5DFrvVjbw9jK0/nhq/awbi/JXkwN0GIBwBE0Vtx9mr5Bn1
 m97tWmD34I4PPxSa2pHFfcZL1A56cp5sglvijkELRC1OydGbaJsNDKcRmsvxh9Zj8DXC
 55i5ay5G/i3xwC3X4Dg77XXJ1XCRCDIECPXBQMr2uqG4s4CvRVpNoXI/uWpxZMNycz4Q
 apFuAeHPv+MqN6aMwT4k2zz8yktlzx52LjpwVJ+fig12Ri9bjYPPwbjtEtNl3pJ8xkeT
 lrfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BqNi6fntG0ZGKoQuBAAKzElQ2KHXFVMfekNgaGGkf34=;
 b=oKZ3lV+36wMhetFezqp6+Tg2AZvTQG9kHmoURJgjm4kb28mpm12SPjwAVhtjG9O6zZ
 HU7y+bGVjBtNKuzZggIuWF1YNINI3hYvfZxvu+Z+uhsZbBqjYTFc/qItBKnWlrNlOWpr
 c1MCrpm9Qoq6tdKQ6dFzN71DAgisgvvMfhP5zhF6M5cPXWC8E7GSOxpK2vmSAIbVfxS0
 GUcOzRPsM9RdGT/4LdDCbgsUwx64+OayyKMkv4fvR3wNL4nY9FeTNTzoVQqKhPMrVhOz
 0i/r1W7rd76qwr3n06af2hT9qR7LooquVDJ0tDW+FAI+SsQqgwnLeSi2FG+4QWyMESlR
 S3qg==
X-Gm-Message-State: AOAM530DSOPRJFw48p9NprSDtiFujjkGPP9+GTynD8Y6mxkSLElemTjg
 Q0U0LlkoME5skjEnktZaAODswQyPXUxQfIrT
X-Google-Smtp-Source: ABdhPJx+JdOOYLuFjxQRO6bvzhnjjuvG4haECxQXuRZeS1RL0RjLjd8POBTNiR/FGpbHZsepCDdIig==
X-Received: by 2002:a5d:8a0a:: with SMTP id w10mr31730136iod.90.1641627464641; 
 Fri, 07 Jan 2022 23:37:44 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id w19sm613022iov.12.2022.01.07.23.37.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 23:37:44 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-trivial@nongnu.org, kevans@freebsd.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Warner Losh <imp@bsdimp.com>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 02/37] bsd-user/freebsd: Create common target_os_ucontext.h file
Date: Sat,  8 Jan 2022 00:37:02 -0700
Message-Id: <20220108073737.5959-3-imp@bsdimp.com>
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
X-List-Received-Date: Sat, 08 Jan 2022 07:38:00 -0000

FreeBSD has a MI ucontext structure that contains the MD mcontext
machine state and other things that are machine independent. Create an
include file for all the ucontext stuff. It needs to be included in the
arch specific files after target_mcontext is defined. This is largely
copied from sys/_ucontext.h with the comments about layout removed
because we don't support ancient FreeBSD binaries.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/freebsd/target_os_signal.h   |  3 ---
 bsd-user/freebsd/target_os_ucontext.h | 35 +++++++++++++++++++++++++++
 2 files changed, 35 insertions(+), 3 deletions(-)
 create mode 100644 bsd-user/freebsd/target_os_ucontext.h

diff --git a/bsd-user/freebsd/target_os_signal.h b/bsd-user/freebsd/target_os_signal.h
index 1a4c5faf19e..3ed454e086d 100644
--- a/bsd-user/freebsd/target_os_signal.h
+++ b/bsd-user/freebsd/target_os_signal.h
@@ -1,9 +1,6 @@
 #ifndef _TARGET_OS_SIGNAL_H_
 #define _TARGET_OS_SIGNAL_H_
 
-/* FreeBSD's sys/ucontext.h defines this */
-#define TARGET_MC_GET_CLEAR_RET 0x0001
-
 #include "target_os_siginfo.h"
 #include "target_arch_signal.h"
 
diff --git a/bsd-user/freebsd/target_os_ucontext.h b/bsd-user/freebsd/target_os_ucontext.h
new file mode 100644
index 00000000000..1d0c3c4e651
--- /dev/null
+++ b/bsd-user/freebsd/target_os_ucontext.h
@@ -0,0 +1,35 @@
+/*
+ * FreeBSD has a common ucontext definition for all architectures.
+ *
+ * Copyright 2021 Warner Losh <imp@bsdimp.com>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later OR BSD-3-Clause
+ */
+#ifndef TARGET_OS_UCONTEXT_H
+#define TARGET_OS_UCONTEXT_H
+
+/*
+ * Defines the common bits for all of FreeBSD's architectures. Has to be
+ * included AFTER the MD target_mcontext_t is defined, however, so can't
+ * be in the grab-bag that is target_os_signal.h.
+ */
+
+/* See FreeBSD's sys/ucontext.h */
+#define TARGET_MC_GET_CLEAR_RET 0x0001
+
+/* FreeBSD's sys/_ucontext.h structures */
+typedef struct target_ucontext {
+    target_sigset_t     uc_sigmask;
+    target_mcontext_t   uc_mcontext;
+    abi_ulong           uc_link;
+    target_stack_t      uc_stack;
+    int32_t             uc_flags;
+    int32_t             __spare__[4];
+} target_ucontext_t;
+
+#ifdef TARGET_MCONTEXT_SIZE
+G_STATIC_ASSERT(TARGET_MCONTEXT_SIZE == sizeof(target_mcontext_t));
+G_STATIC_ASSERT(TARGET_UCONTEXT_SIZE == sizeof(target_ucontext_t));
+#endif /* TARGET_MCONTEXT_SIZE */
+
+#endif /* TARGET_OS_UCONTEXT_H */
-- 
2.33.1


