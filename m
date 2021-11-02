Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mi2f4-0007W8-92
	for mharc-qemu-trivial@gnu.org; Tue, 02 Nov 2021 18:53:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mi2f1-0007LL-Mh
 for qemu-trivial@nongnu.org; Tue, 02 Nov 2021 18:53:43 -0400
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33]:37404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mi2ez-0002rH-0j
 for qemu-trivial@nongnu.org; Tue, 02 Nov 2021 18:53:43 -0400
Received: by mail-io1-xd33.google.com with SMTP id y73so594065iof.4
 for <qemu-trivial@nongnu.org>; Tue, 02 Nov 2021 15:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=crPhJy59MKpji7XeYQ6bfKjbA//sfiHqEKw3bAcAfno=;
 b=mldgy1i8lu6/cfOfAvSpK/LykAQO4D7Pkr+uKkua/homUz5Drv02CCVyO8hriLNVKP
 4VxJ1talzv9UbcbnvGRHW7pdhF2kW1P5crbKiJc25W4plxCnx0fiOrjOIHym6BUZWnZP
 f1GsIdJ7HPZoHprBucN3R/bbwHBXw8xmYAdrme+ttUX9tUD74cn7FaT7+dbTvQbnWTEB
 g9CgvGKxnOzJz4E1NZU9S5V/grGnC4ykNmWgVpqoe4Ca+l/orOG9MqcjRc4Ls4AHbPVp
 G+OhTCAenb4B8SfP/8ltZNAvAvuXs+FJVtf0EtrTVZOPazcWhGKm+QPix41TvPNakDK8
 7hSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=crPhJy59MKpji7XeYQ6bfKjbA//sfiHqEKw3bAcAfno=;
 b=4dT3FTIIVx2f/F3D7qBt0FYSiYQLkYzotMxspD23l1rY3tdSxN8ismAh9IuoKne1UM
 zEoVU1hBaHsJvn9+sMGUasezHNQZ4s0n5CVZs5QhumCu0Q7aMGVhAbUtoX7PfE3+1Bep
 6mXIyVSBpcQ6DW2gCyxmmbseeWlhsdUbRhnctYotXCXQXbUtNQW1zYFgT1RBrpiPBjL1
 Zyop+fdMVZ9VBHOusGvyYUm5B/n/fG8zIkIJnyYJwWEkqYO3yYJST72zmuv9AVzavCaU
 7lYQZiucs3pxLVsEUfUVu9lc/Dl+Y7wD/X+ixtHKf84pdzOcGFkMzgo1FWrH+MI97X5z
 Ml5g==
X-Gm-Message-State: AOAM530/UT0pnm9bRd/5XF6t/PK0GpiQ4PpprWeaItyfYcZqPh93uMrU
 7noJbHeZvfC84pA08ssqcN+EHw==
X-Google-Smtp-Source: ABdhPJwvdtHjh5SxFQ8ZPp7UGoVcro1ZZu9OGqWRjNoyHPYleyi1mJCJ0H1cCNseHuXBAGkcxENIeQ==
X-Received: by 2002:a5d:878e:: with SMTP id f14mr28773240ion.111.1635893619122; 
 Tue, 02 Nov 2021 15:53:39 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id h14sm205427ils.75.2021.11.02.15.53.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 15:53:38 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, Warner Losh <imp@bsdimp.com>,
 qemu-trivial@nongnu.org, Philippe Mathieu-Daude <f4bug@amsat.org>,
 Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH v2 18/30] bsd-user/freebsd: Create common target_os_ucontext.h
 file
Date: Tue,  2 Nov 2021 16:52:36 -0600
Message-Id: <20211102225248.52999-19-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211102225248.52999-1-imp@bsdimp.com>
References: <20211102225248.52999-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d33;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd33.google.com
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
X-List-Received-Date: Tue, 02 Nov 2021 22:53:44 -0000

FreeBSD has a MI ucontext structure that contains the MD mcontext
machine state and other things that are machine independent. Create an
include file for all the ucontext stuff. It needs to be included in the
arch specific files after target_mcontext is defined. This is largely
copied from sys/_ucontext.h with the comments about layout removed
because we don't support ancient FreeBSD binaries.

Signed-off-by: Warner Losh <imp@bsdimp.com>
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


