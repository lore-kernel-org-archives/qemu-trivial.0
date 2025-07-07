Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A62C6C83F07
	for <qemu-trivial@archiver.kernel.org>; Mon,  7 Jul 2025 14:34:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1uYmvb-0000oB-IS; Mon, 07 Jul 2025 10:34:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uYmle-0001eG-9l
 for qemu-trivial@nongnu.org; Mon, 07 Jul 2025 10:24:27 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uYmlU-0003h9-7e
 for qemu-trivial@nongnu.org; Mon, 07 Jul 2025 10:24:25 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-451d6ade159so27771065e9.1
 for <qemu-trivial@nongnu.org>; Mon, 07 Jul 2025 07:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751898254; x=1752503054; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4HaH+kUume+fg2FMjUxdlmgquGzVKExAQM709OB1vig=;
 b=V9voB1tmh+1GWjqaDZde3m75jFY8BOiYwAhXejco7gDfskaJCrmAEezRR03LwEdFYZ
 vAdZUf7eUf0CouoVQLbyl3wQKibuV6kssD39iwJ6VF1XLS9SOhszKs9MgH0Q/j6niRYx
 ZRKqb/BmhzSMooQLDjpxoeeBnKBylK4wfaylHSAMnUg6xJEtclII9RjPBhevxd2DLEOW
 l6Vv8kAQmnGcKE1zPU/SBfPYkObBReRLMp74bMauiKtCuuvIJqU5PF8TmqyTinX1wmvk
 r/vbHl/jAYKkx+ozDtR0v+h/hZEWM6yCAuLxIoO7Fm2XmG4H8PrkGyfuV7d3YD4fo9kF
 x7rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751898254; x=1752503054;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4HaH+kUume+fg2FMjUxdlmgquGzVKExAQM709OB1vig=;
 b=G+towZNsQMiowa6dU+a/Tz6ySj41nGJKO+SwHKBfeVR/emNxdGuFvYMaZPmoM67J7w
 niHJHKR4CYqmBvdKHUk3GCxIAecLYheOR9+IP6CxkG4tue8JC84Pyk0yymfeo0/bHRKc
 hG5i6Wzf0qDNZZl2seh+AKUfs4lhyCSR02vJN6GXtVeR06iV8Tn60d8dvmwxAm9XgEfF
 zU4ZKYoYOmDuSl4X7Q4wljZFWWtLXvgxwvsQ1huEBiOEn+wJytM7kZeQ4RvozPxuc10F
 D0OnmsqO7/SHL3K45UwCsVkCjwTxqQeM6YLf1pQb7BAwNCRsGC+7IsB49ziCtMO2foah
 GVIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWky9Rn083xVSHuiL24HyEKMC81zP31d8HvlXRpNNEAAjZezId0nstQ35KKBMx88s1zOtqadHJjD2C8vg4=@nongnu.org
X-Gm-Message-State: AOJu0YyQ41kbGTwzb64haaIB3okON+FiuupHDQaeyc/zUrLLYzxYXhN4
 qmZACOy38Ei5ZqH2oxCjcjnZ0ubH3H80IZkqJpUab5P7q73NPXmtdh75FwVWLUvyQR8=
X-Gm-Gg: ASbGncvhLbkQLSMNu3wwTX/y0o7gABqt8zNkc4r7OK+uQYfiqupnXjqyx5w6GD1xVYM
 XbE9HvxDFeBW3g+upkUOH9S44G1HpgByil3CAk3pYlrW0Lm7FeiCyZZAljG6d0IZe5Xdj91vyqb
 qgNcJqI+vKxlucS9mAxyS2njU9zOO1dACO0A5J1F7dxFypyOxo0e5kOaOouCvD6smrtNO+u0k2I
 RGApU8NC3oNyuR3iGcZ4BAZ27jNe2U4Ysh2c2dyXxQPt0qggMcAI7L7SuKuIYr4tGM3/vR7koub
 np6BZD73JAuPLC+fnxk2CRcywcyqgLhz3ZZBgJ7qVbr2KXy2H+Vf9x5o9FMZWFT4fbhL
X-Google-Smtp-Source: AGHT+IHMCbBO+MCD1RhezlGF/6JUHeqLHzsIJIHVxKvjRbhObjxIY35cDl4Bcsp/u6M1S6aCQ1xvMQ==
X-Received: by 2002:a05:600c:540f:b0:445:1984:247d with SMTP id
 5b1f17b1804b1-454b4e67f8bmr114513615e9.7.1751898254207; 
 Mon, 07 Jul 2025 07:24:14 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454c2732201sm49234665e9.29.2025.07.07.07.24.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jul 2025 07:24:13 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH] hw/uefi: Create and use trace.h wrapper header
Date: Mon,  7 Jul 2025 15:24:12 +0100
Message-ID: <20250707142412.558561-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org
Sender: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org

The documentation of the trace subsystem (docs/devel/tracing.rst)
says that each subdirectory which uses trace events should create a
wrapper trace.h file which includes the trace/trace-foo.h generated
header, and that .c files then #include "trace.h".

We didn't follow this pattern in hw/uefi/.  Correct this by creating
and using the trace.h wrapper header.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/uefi/trace.h              | 2 ++
 hw/uefi/var-service-core.c   | 2 +-
 hw/uefi/var-service-policy.c | 2 +-
 hw/uefi/var-service-utils.c  | 2 +-
 hw/uefi/var-service-vars.c   | 2 +-
 5 files changed, 6 insertions(+), 4 deletions(-)
 create mode 100644 hw/uefi/trace.h

diff --git a/hw/uefi/trace.h b/hw/uefi/trace.h
new file mode 100644
index 00000000000..6aa1c938960
--- /dev/null
+++ b/hw/uefi/trace.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+#include "trace/trace-hw_uefi.h"
diff --git a/hw/uefi/var-service-core.c b/hw/uefi/var-service-core.c
index 4836a0cb811..feec5a59583 100644
--- a/hw/uefi/var-service-core.c
+++ b/hw/uefi/var-service-core.c
@@ -12,7 +12,7 @@
 #include "hw/uefi/var-service-api.h"
 #include "hw/uefi/var-service-edk2.h"
 
-#include "trace/trace-hw_uefi.h"
+#include "trace.h"
 
 static int uefi_vars_pre_load(void *opaque)
 {
diff --git a/hw/uefi/var-service-policy.c b/hw/uefi/var-service-policy.c
index 3b1155fe4ea..58da4adbeba 100644
--- a/hw/uefi/var-service-policy.c
+++ b/hw/uefi/var-service-policy.c
@@ -14,7 +14,7 @@
 #include "hw/uefi/var-service-api.h"
 #include "hw/uefi/var-service-edk2.h"
 
-#include "trace/trace-hw_uefi.h"
+#include "trace.h"
 
 static void calc_policy(uefi_var_policy *pol);
 
diff --git a/hw/uefi/var-service-utils.c b/hw/uefi/var-service-utils.c
index c9ef46570f4..258013f436a 100644
--- a/hw/uefi/var-service-utils.c
+++ b/hw/uefi/var-service-utils.c
@@ -8,7 +8,7 @@
 
 #include "hw/uefi/var-service.h"
 
-#include "trace/trace-hw_uefi.h"
+#include "trace.h"
 
 /* ------------------------------------------------------------------ */
 
diff --git a/hw/uefi/var-service-vars.c b/hw/uefi/var-service-vars.c
index 7f98d77a38d..37d05b71cf7 100644
--- a/hw/uefi/var-service-vars.c
+++ b/hw/uefi/var-service-vars.c
@@ -12,7 +12,7 @@
 #include "hw/uefi/var-service-api.h"
 #include "hw/uefi/var-service-edk2.h"
 
-#include "trace/trace-hw_uefi.h"
+#include "trace.h"
 
 #define EFI_VARIABLE_ATTRIBUTE_SUPPORTED                                \
     (EFI_VARIABLE_NON_VOLATILE |                                        \
-- 
2.43.0


