Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n66KQ-00068j-1g
	for mharc-qemu-trivial@gnu.org; Sat, 08 Jan 2022 02:39:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n66Ie-0005Jz-Hi
 for qemu-trivial@nongnu.org; Sat, 08 Jan 2022 02:38:11 -0500
Received: from [2607:f8b0:4864:20::135] (port=45026
 helo=mail-il1-x135.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n66Ia-0003O1-BZ
 for qemu-trivial@nongnu.org; Sat, 08 Jan 2022 02:38:02 -0500
Received: by mail-il1-x135.google.com with SMTP id v18so6462888ilm.11
 for <qemu-trivial@nongnu.org>; Fri, 07 Jan 2022 23:37:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dGk1mYR+ompm1xLOR0KlYLZIRg9T3SJe9aFkUo7qUu4=;
 b=wmlIVybvJUbsOoVR96K7OED2nZ1tfRqeux+dLGSv0kC1xfM09erl/Gn4PgrBok5/P/
 GUY13Ss247fCHaUDNzW413lka65fzdvnRZiCgYhi0HnnTXrkUGsn8d2sSvledw0u0kdC
 qGoLPY9RRrdDvxh1Lr9z0c+RPudIb2jMHiOX0nD7LqsbkptHOysMDj4lQAl5mlGEpO73
 15u6BbqtXSOsvIgqZ/WPfFuPhBRdCRj2s5OGT43jDWeIl4ddej8MHe3ugZY9swPdJSOx
 LBaJTUia33EC5IUnZDN6C+Y+zGSepazySgZhwBihwUycD3qbhvIbAF3DoA88S/R7e337
 aJ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dGk1mYR+ompm1xLOR0KlYLZIRg9T3SJe9aFkUo7qUu4=;
 b=70HykZDRVuskTSX/AwufG13TVAsF78IuHp99+LjJhri5zWPe0SQytDCfMcZyZJYdgs
 JxsErI2o8fYprO0nWpKdRgz4XEz05L9eEWZg8uBqpByd4Rmbg+q6TvgSJzqJzWTtOFGB
 uNGQiUVNZWOZYFGw0LB9CE8zrGnGiL1KXta1KsR0TBzo8eTe7hPdTDHpNbt77VH0HXdR
 fYoGfTvHNgW+tetZeXuTizOxJtgQIj7Z3RB9KNm8RlBL4qXsQYj8/bVlFWpI2vEpcFsb
 kRBgrTsxyA1MMH9WBIIu8wDP/x9RCqamyvCdjzxPLfJh/jPVc0JTyMbH4FBYXW+NjiE4
 gyfA==
X-Gm-Message-State: AOAM5327T8rL+y0W2+5VAmZXMKBvZMGGosrkO1VXg081jAFDfKOBDiYf
 Owr6CshDlbIoWDAkCTszdaSYnA==
X-Google-Smtp-Source: ABdhPJyu9uu+FLYhxyBiRuXFuSAlHui2GVSQ5AA67MbiRvecRt4N04KxF4irbqaIIvnDJ+n+IBTBuA==
X-Received: by 2002:a05:6e02:1c85:: with SMTP id
 w5mr27470309ill.27.1641627477738; 
 Fri, 07 Jan 2022 23:37:57 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id w19sm613022iov.12.2022.01.07.23.37.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 23:37:57 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-trivial@nongnu.org, kevans@freebsd.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Warner Losh <imp@bsdimp.com>,
 Laurent Vivier <laurent@vivier.eu>, Kyle Evans <kevans@FreeBSD.org>,
 Stacey Son <sson@FreeBSD.org>
Subject: [PULL 15/37] bsd-user/arm/target_arch_cpu.c: Target specific TLS
 routines
Date: Sat,  8 Jan 2022 00:37:15 -0700
Message-Id: <20220108073737.5959-16-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220108073737.5959-1-imp@bsdimp.com>
References: <20220108073737.5959-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::135
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::135;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x135.google.com
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
X-List-Received-Date: Sat, 08 Jan 2022 07:38:14 -0000

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
index 00000000000..93cfaea0986
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
index 00000000000..02bf9149d54
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
2.33.1


