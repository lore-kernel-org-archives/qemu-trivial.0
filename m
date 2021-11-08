Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mjvnv-0003i7-Ay
	for mharc-qemu-trivial@gnu.org; Sun, 07 Nov 2021 22:58:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mjvnp-0003bm-Tt
 for qemu-trivial@nongnu.org; Sun, 07 Nov 2021 22:58:38 -0500
Received: from [2607:f8b0:4864:20::82f] (port=41778
 helo=mail-qt1-x82f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mjvnn-0006tL-Ic
 for qemu-trivial@nongnu.org; Sun, 07 Nov 2021 22:58:37 -0500
Received: by mail-qt1-x82f.google.com with SMTP id v4so12588301qtw.8
 for <qemu-trivial@nongnu.org>; Sun, 07 Nov 2021 19:58:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FnZV5yZZtImm0a3Lr70JdB+t8rtGyZo6MRXcETRGQ/U=;
 b=m+N0bC0T/7jrW7Mm/HchCTGApQm/zAlLTi8wpSxBKm2LDwvhh0wRWeZGY9KBDGAXeh
 k77Z7UqsmuARYprJRpef8JxlnI38my7qD82hlLETcSaHil7acK9V7xmcieTSLrPKPv4G
 rz3sNvXbAIMKp0DYzQMA9yksaxom/BoDnR00bOPhyjahDye4cGKMSneDwoVlzOo4wWx6
 2Mhj19j/fmaaLrgKHSuE3BgVNbIgJLJcBSU4QnIRekwy3ygn4fNmyBTB6TmJ7d+mhHtz
 THTrLSjGQfqa4gK/QJYVc/zcJnSeqsx7Mxc+Ih0tHMw16+QPCyppwVXlIA8SO2ePu/F0
 ENhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FnZV5yZZtImm0a3Lr70JdB+t8rtGyZo6MRXcETRGQ/U=;
 b=TbI94rKLGqCl8mZS4klEWWEHXrLh6tL1hLGj9Xf0DzVD3vkSft4v4zlkI5/Q77i3Xl
 cIvfyp9DnNmLjW+WLEG1A4rugyhMHH6FIiblflm0FCCkLD0BuaroQMy966n1r7Xz0Od8
 keEsOZzEZheqwpbRFvJc7haad9KJMqVtpYr1xDhOOrJEIuldVnZXpr4tssS9U5zTGTnb
 R+f7twnYa4sUUk/+vO5xv5PfZrCnw72WMeDfKoMIIlBd1Hds0SpVlAHWpxqEB6RQfIxk
 epbkGzbCnXe/2cgooiaf2LVb4eJb1KvEIezbXA88nHhGg8OTWyas2YHNMHHCjHRnc/6z
 EsPA==
X-Gm-Message-State: AOAM530jvcQxJ83UYKiiXHQ6z1NgOWm2I2FWPFvP9GEwceX14CYG1rcU
 d6CmMb60qExeN6tuFvV4vISYwlpUtgfNJw==
X-Google-Smtp-Source: ABdhPJzPPagBpun2c0anJKbYboNkN8mwQm9hYemgvLGnnmGh2TgXA5GGG4Fo6ciT4bHf5t2eCnWS4Q==
X-Received: by 2002:a02:a314:: with SMTP id q20mr5286302jai.104.1636343531764; 
 Sun, 07 Nov 2021 19:52:11 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id x15sm876909iob.8.2021.11.07.19.52.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Nov 2021 19:52:11 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Michael Tokarev <mjt@tls.msk.ru>,
 Warner Losh <imp@bsdimp.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Kyle Evans <kevans@freebsd.org>, Philippe Mathieu-Daude <f4bug@amsat.org>,
 qemu-trivial@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v5 02/37] bsd-user/freebsd: Create common target_os_ucontext.h
 file
Date: Sun,  7 Nov 2021 20:51:01 -0700
Message-Id: <20211108035136.43687-3-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211108035136.43687-1-imp@bsdimp.com>
References: <20211108035136.43687-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::82f
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::82f;
 envelope-from=imp@bsdimp.com; helo=mail-qt1-x82f.google.com
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
X-List-Received-Date: Mon, 08 Nov 2021 03:58:38 -0000

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
index 1a4c5faf19..3ed454e086 100644
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
index 0000000000..1d0c3c4e65
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
2.33.0


