Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n66KS-0006Ch-0K
	for mharc-qemu-trivial@gnu.org; Sat, 08 Jan 2022 02:39:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n66Im-0005Lo-7J
 for qemu-trivial@nongnu.org; Sat, 08 Jan 2022 02:38:13 -0500
Received: from [2607:f8b0:4864:20::d29] (port=41716
 helo=mail-io1-xd29.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n66Ii-0003RD-6r
 for qemu-trivial@nongnu.org; Sat, 08 Jan 2022 02:38:10 -0500
Received: by mail-io1-xd29.google.com with SMTP id y18so10100726iob.8
 for <qemu-trivial@nongnu.org>; Fri, 07 Jan 2022 23:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=e+6KZ3Ysi4G9kovLQZe1VwbKNP6XCvJKHGf2d/pxlNg=;
 b=S74B33RGxxdx5+64KSHucUxj7FM/+N05Ggq9fSh9tehIoatMps7rhyObePqsgaGPOe
 1B93NHWgL+4PWGVkTdhc7+mIsO1tcULHMxhYXsutGPDqmdQEKbWKXCD504v3qmHwj10a
 /edoskLRJExEcyvMI8EKISqGPY5r5itmElnVliYkhl1z9Pb1X2gNG2qBTPJlvIKq+Y5f
 VRUZsW5FFxw0V8eDgYD9yb+K0HWnjmO9KUyObQzJZUcswR/m8GkoJRNa5IEiIvXhB+h9
 BwrOW16Y5vCCgr4JUb7xqnN0Ne5ArkbfYnFfAWPAYflJSjZQPJaFhkiyyv0iTwqob1uQ
 BJ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=e+6KZ3Ysi4G9kovLQZe1VwbKNP6XCvJKHGf2d/pxlNg=;
 b=AFK2I8zDsL+5fkA0CS742jq1BFBwTLpnSsm/ujBp8OKHMO5DngZLekHxwme8Nm3lAN
 GQDGMo+GC0gQaeEQi5eINajawGVn4Oj5rKDEW4IR+5blMCRu29cf+lghL8EB3MKFg76S
 yQ3lQkIAnMypI1AWuwES3xKb3e1sXWVZRQ3F4ILARvMNzRmbD/CINiLk6PAdCjuLnNYN
 1JbkWy0gPCqShDjDtwkSESNeIXwVvRmdGpvR1YM6OZwIFMUsS18sGWiLJHbMJtGORhQE
 Y8IpkeFx5iJ0jkpxLPOtPUKBelDR1hKVoUaze8Va+SvoatH3v+q3SPTIRpBre4bJx7UR
 swHA==
X-Gm-Message-State: AOAM530BTRCLSr27IprK/XOIwDtOHl5mjjSrxYxOTLxk0kImJ1chah7l
 qFYbqQLRd/8SgR2Lso35ZdrbuA==
X-Google-Smtp-Source: ABdhPJz3BX9BiqvSXZdegkOimtwJnAbOLOCs2Nb/OLu4Q/jD0M8EN/xnUQK3FucXmefm/n4t+wpNfA==
X-Received: by 2002:a6b:fd19:: with SMTP id c25mr29752395ioi.49.1641627485812; 
 Fri, 07 Jan 2022 23:38:05 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id w19sm613022iov.12.2022.01.07.23.38.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 23:38:05 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-trivial@nongnu.org, kevans@freebsd.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Warner Losh <imp@bsdimp.com>,
 Laurent Vivier <laurent@vivier.eu>, Stacey Son <sson@FreeBSD.org>,
 Kyle Evans <kevans@FreeBSD.org>
Subject: [PULL 23/37] bsd-user/arm/target_arch_vmparam.h: Parameters for arm
 address space
Date: Sat,  8 Jan 2022 00:37:23 -0700
Message-Id: <20220108073737.5959-24-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220108073737.5959-1-imp@bsdimp.com>
References: <20220108073737.5959-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d29
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d29;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd29.google.com
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
X-List-Received-Date: Sat, 08 Jan 2022 07:38:16 -0000

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
index 00000000000..4bbc04ddf5b
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
2.33.1


