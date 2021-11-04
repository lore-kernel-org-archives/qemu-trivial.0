Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1midNx-0007LC-RT
	for mharc-qemu-trivial@gnu.org; Thu, 04 Nov 2021 10:06:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1midNu-00076b-If
 for qemu-trivial@nongnu.org; Thu, 04 Nov 2021 10:06:30 -0400
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a]:38786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1midNq-00011T-Ty
 for qemu-trivial@nongnu.org; Thu, 04 Nov 2021 10:06:30 -0400
Received: by mail-io1-xd2a.google.com with SMTP id v65so7011041ioe.5
 for <qemu-trivial@nongnu.org>; Thu, 04 Nov 2021 07:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ib2ItGUGOkMWysYfWU4lM4E6SvnkdoydaKaA4P/DKkQ=;
 b=LQlR1mXPRvSCqwnRsKCkQe8vf2swBjJ9jUL7CZT0XDvryBmkTOr1sc7tKEy7V1IWLh
 02XhA91MtbRiFvvbUZc08nW7hDtiIAVMXxPHYU2ug8pQrwOTqE/WuzFiBAHJyqpsfOKG
 lYyNn5d5FSSTWmVqt/RaqQ/BvQdnJSF6jTSJ6HA6bVUYG9gyiaKO9Auc95tLBsancKTs
 UVBikgZ1Rl/O0OEjWtkNax352kT8pEMeyXZ3vmXwvJelNrJmnz4WIOMSuhe/eaMaGLAl
 k2JEaswij8La5knm+P1UpfQ+9dtYvPNK/7FRU07SPUprMfvav7CwTGKyUZwjqxKgUSCj
 4aww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ib2ItGUGOkMWysYfWU4lM4E6SvnkdoydaKaA4P/DKkQ=;
 b=AGm/4FbG9i0nBUC5B5+mRxQwVgJrWXwujZQEOpXpd4/3IQUTQCmHx851HICKUZAqyp
 SHdK6DIMN298OWmKRDm8J08TCAe0kID/yiqxGECVocGCDBkKZO0DaOsj6eVE2PsvB7/1
 YH7ACMHFXYau/jgSIZVWew7XTmi+9Dlktwm63RkAgvBmigsk2NdXLququXSC/vHIUF1r
 0dq4XYhQ86uv07TY5mH4+aKF3o7tYzA5UocaWcwo185H6tJjJ5mw2/AxB3iHVyygvGCw
 uPvIpkBwLdPieEVyS7TFJRUrP5B7VV/67K2ABwO8itDEEzH4bhG4caA2CBY3tvy1ce5I
 d/sQ==
X-Gm-Message-State: AOAM532TL81DkLbIBqxSoHTIT/yx9cPQrWAWNUXy3gEvsrIjpJNzR2xc
 ORHwZNdZe2/9jibgWUO0hArRfQ==
X-Google-Smtp-Source: ABdhPJymx1YARIwupjvHvw+3g/xtHAZheHHusZzCfxA3cCxU/Q7xtzVI6gDuvnlq3ErWPn1WH/nXQg==
X-Received: by 2002:a05:6602:3353:: with SMTP id
 c19mr1825582ioz.218.1636034784910; 
 Thu, 04 Nov 2021 07:06:24 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id l2sm3206741iln.50.2021.11.04.07.06.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 07:06:24 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>, Laurent Vivier <laurent@vivier.eu>,
 Michael Tokarev <mjt@tls.msk.ru>, Philippe Mathieu-Daude <f4bug@amsat.org>,
 qemu-trivial@nongnu.org, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 17/29] bsd-user/freebsd: Create common target_os_ucontext.h
 file
Date: Thu,  4 Nov 2021 08:05:24 -0600
Message-Id: <20211104140536.42573-18-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211104140536.42573-1-imp@bsdimp.com>
References: <20211104140536.42573-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2a;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2a.google.com
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
X-List-Received-Date: Thu, 04 Nov 2021 14:06:30 -0000

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
 bsd-user/freebsd/target_os_ucontext.h | 26 ++++++++++++++++++++++++++
 2 files changed, 26 insertions(+), 3 deletions(-)
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
index 0000000000..20b8a9188e
--- /dev/null
+++ b/bsd-user/freebsd/target_os_ucontext.h
@@ -0,0 +1,26 @@
+/*
+ * FreeBSD has a common ucontext definition for all architectures.
+ *
+ * Copyright 2021 Warner Losh <imp@bsdimp.com>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later OR BSD-3-Clause
+ */
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
-- 
2.33.0


