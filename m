Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mi2en-0006c8-Ri
	for mharc-qemu-trivial@gnu.org; Tue, 02 Nov 2021 18:53:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mi2em-0006W0-Jf
 for qemu-trivial@nongnu.org; Tue, 02 Nov 2021 18:53:28 -0400
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133]:42807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mi2ei-0002lS-DI
 for qemu-trivial@nongnu.org; Tue, 02 Nov 2021 18:53:28 -0400
Received: by mail-il1-x133.google.com with SMTP id y17so640892ilb.9
 for <qemu-trivial@nongnu.org>; Tue, 02 Nov 2021 15:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3XmuKD3L8C0RdT+vaSED8BhWG5EV9OjA2AgZ0ahq8Uw=;
 b=iPyfiSuINy8vkik9L92tVHCkSvee55t7TKi6oopBbKAvlSxhzNzxZzOZf6zOAtZCAN
 P4iVjJ1UpES78CsTWu2G23WinAMULTeoTo1oJ0NH3E4CaNp/GhWswMr+9UyAes+u4hKK
 fEO47a0OxQWp6lGRVfsCdwwx4MTyKBnCCIqyPFukId6yRoOCIfOHvt4hQU85TjcnlwHh
 ZAQa4KMi5CEMk0pRGYLdwPGp5iks0mHNhOVEyLFjc3c6ZHD45EXUviufwNA4jM8xhkyh
 yJ9ThigJhgCSMr34RzwGzn0IBxAVqTirdgN6C8cewaAB30iZ3kPuMCTEGetmG3GENnV1
 EGVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3XmuKD3L8C0RdT+vaSED8BhWG5EV9OjA2AgZ0ahq8Uw=;
 b=w7QRa5ZfVXgaxs4z3DuG4ohMvjQ6jDmbzNrrWUz9eWqIIFfWpyDwxke+/Hb4mtDcbA
 e3LEskU9rpa2Vph4k3rpVh6QsJA1UjcTRlQV8e42NI4FFu8W/RAbw3v+AF7GUqMYAMZY
 mRhIm9YVDw8WBf7qWxxSHPGCr4Jxwae3z30MaLWnxioaVccIoJTDURcFF9hcV9nEpczD
 2bJrgd3RQa8cKVGokk+FVjHiYutQ/rOsTq3jsmNP4RXPMSz0nkvmpZsYCdI4DWhoNDHW
 QoTmn3iBDLJ2vq0fGYHLqpAVGnJbzdhihvDEjzk4Fsb/tpgWsipQcEHQrq3EoVcnyy9H
 ud8g==
X-Gm-Message-State: AOAM533oQCFvgwlgi/SinPabE0nOxnGK4lR90z/oSZenX3P0oFdXUaNb
 Xaw+aSLH/AGm0Y9aN3o8h+gNGQ==
X-Google-Smtp-Source: ABdhPJwAPEE9Jzvh/AipZjx7FP/gErMzutJqaXbI63slYHqxZy7ICAz5EFwSuZPUM1FNaWBaX38ocg==
X-Received: by 2002:a05:6e02:1606:: with SMTP id
 t6mr2909987ilu.40.1635893603334; 
 Tue, 02 Nov 2021 15:53:23 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id h14sm205427ils.75.2021.11.02.15.53.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 15:53:23 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, Warner Losh <imp@bsdimp.com>,
 qemu-trivial@nongnu.org, Philippe Mathieu-Daude <f4bug@amsat.org>,
 Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Kyle Evans <kevans@FreeBSD.org>,
 Stacey Son <sson@FreeBSD.org>
Subject: [PATCH v2 04/30] bsd-user/arm/target_arch_cpu.c: Target specific TLS
 routines
Date: Tue,  2 Nov 2021 16:52:22 -0600
Message-Id: <20211102225248.52999-5-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211102225248.52999-1-imp@bsdimp.com>
References: <20211102225248.52999-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::133;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x133.google.com
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
X-List-Received-Date: Tue, 02 Nov 2021 22:53:28 -0000

Target specific TLS routines to get and set the TLS values.

Signed-off-by: Kyle Evans <kevans@FreeBSD.org>
Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/arm/target_arch.h     | 28 ++++++++++++++++++++++++
 bsd-user/arm/target_arch_cpu.c | 39 ++++++++++++++++++++++++++++++++++
 2 files changed, 67 insertions(+)
 create mode 100644 bsd-user/arm/target_arch.h
 create mode 100644 bsd-user/arm/target_arch_cpu.c

diff --git a/bsd-user/arm/target_arch.h b/bsd-user/arm/target_arch.h
new file mode 100644
index 0000000000..93cfaea098
--- /dev/null
+++ b/bsd-user/arm/target_arch.h
@@ -0,0 +1,28 @@
+/*
+ * ARM 32-bit specific prototypes for bsd-user
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
+#ifndef _TARGET_ARCH_H_
+#define _TARGET_ARCH_H_
+
+#include "qemu.h"
+
+void target_cpu_set_tls(CPUARMState *env, target_ulong newtls);
+target_ulong target_cpu_get_tls(CPUARMState *env);
+
+#endif /* !_TARGET_ARCH_H_ */
diff --git a/bsd-user/arm/target_arch_cpu.c b/bsd-user/arm/target_arch_cpu.c
new file mode 100644
index 0000000000..02bf9149d5
--- /dev/null
+++ b/bsd-user/arm/target_arch_cpu.c
@@ -0,0 +1,39 @@
+/*
+ *  arm cpu related code
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
+#include "target_arch.h"
+
+void target_cpu_set_tls(CPUARMState *env, target_ulong newtls)
+{
+    if (access_secure_reg(env)) {
+        env->cp15.tpidrurw_s = newtls;
+        env->cp15.tpidruro_s = newtls;
+        return;
+    }
+
+    env->cp15.tpidr_el[0] = newtls;
+    env->cp15.tpidrro_el[0] = newtls;
+}
+
+target_ulong target_cpu_get_tls(CPUARMState *env)
+{
+    if (access_secure_reg(env)) {
+        return env->cp15.tpidruro_s;
+    }
+    return env->cp15.tpidrro_el[0];
+}
-- 
2.33.0


