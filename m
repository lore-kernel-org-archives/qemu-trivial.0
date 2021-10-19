Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mcsEj-0008Mo-Pf
	for mharc-qemu-trivial@gnu.org; Tue, 19 Oct 2021 12:45:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcsEh-0008Jq-Mm
 for qemu-trivial@nongnu.org; Tue, 19 Oct 2021 12:45:11 -0400
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34]:45652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcsEe-0000CP-OY
 for qemu-trivial@nongnu.org; Tue, 19 Oct 2021 12:45:11 -0400
Received: by mail-io1-xd34.google.com with SMTP id 188so21073875iou.12
 for <qemu-trivial@nongnu.org>; Tue, 19 Oct 2021 09:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Lhju2520btRHFEe15OOplrR2Y9EKp1SAPBP14r0KLQE=;
 b=K/t1tOn6pNo9T/eo2SVN2KQkx6BWnqpKECxRYFDcPBqnqahQNP3bl/Wk41eNCC/kyw
 Bxy2z8UDg4BxPJy3xDIqsIXX3wrwhhcvCxNn0VXgeoCSOJh1j4C721NvEaYbI4WWBcdM
 3y3E/v1wA7JL1+JmI2Jpc9QZrxD2b+oWJU5Xh5J//YdtgaSM6DjP0hH8mH8tPI0CJeFQ
 8UrEQ3c2XzwYKnxP8PuKsFGO2EbU8JHfZp4A7QZmWkoLV4uRdTsM+e0keL8lWSL/WlpX
 sM6oB9VbTEJmyfG5CSrodASRyPh3i15/z2ubPT1P1CiCmHRsQkJvWM1weCtRddmh++5l
 9RWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Lhju2520btRHFEe15OOplrR2Y9EKp1SAPBP14r0KLQE=;
 b=yYBsNv4TS3KxvyYmXm/2V6WmJ2u5TY2D3ADWsEBBZa0xptZRqlO9hfWvHsYidlFP/C
 I1KU4VxaoLDYe8W2s6ze6XV1hp0fZ5OaJvvcSccFKuk9/wJwu17vGtG2FOdycbtZ8LZd
 egHPK/xITa8zsrt9rd/ahsLlGaHaKbAkNVWERXhIDCbPMOKFdtKSeEGMgtsn/isCHBwv
 8OMTovHTEPProCmDDWWaPCxiW17Ch6fcI+aOCsuv88pVqf3DRdzZaAKt8Ab8wxJEsWlR
 vYuKHgN5oEmk8LQCZnpJFqMU2YxM2TweNc/isGejQGDvdt7k6t0JPbn/r2ybjYES4Ws+
 dljw==
X-Gm-Message-State: AOAM530hsfjQ05FdnWA9TZQCT/JHDSe0SC/jD+d5VXGozaXQ8HInK0wf
 CvjJssdsSWqEYvuyvQ06+UgAGw==
X-Google-Smtp-Source: ABdhPJx7oUgosdtqbyNHwAlTDIGfoQIZhWClnDwYaONlT3/jk7u0Fj5TQCw23DyDSIib/naClXzmaQ==
X-Received: by 2002:a6b:2c95:: with SMTP id s143mr19246204ios.36.1634661907611; 
 Tue, 19 Oct 2021 09:45:07 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id q7sm1133951ilv.48.2021.10.19.09.45.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 09:45:07 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>, Laurent Vivier <laurent@vivier.eu>,
 qemu-trivial@nongnu.org, Kyle Evans <kevans@freebsd.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Klye Evans <kevans@FreeBSD.org>,
 Stacey Son <sson@FreeBSD.org>
Subject: [PATCH 03/24] bsd-user/arm/target_arch_cpu.c: Target specific TLS
 routines
Date: Tue, 19 Oct 2021 10:44:26 -0600
Message-Id: <20211019164447.16359-4-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211019164447.16359-1-imp@bsdimp.com>
References: <20211019164447.16359-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d34;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd34.google.com
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
X-List-Received-Date: Tue, 19 Oct 2021 16:45:11 -0000

Target specific TLS routines to get and set the TLS values.

Signed-off-by: Klye Evans <kevans@FreeBSD.org>
Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
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
2.32.0


