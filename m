Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mi2f2-0007QK-Pv
	for mharc-qemu-trivial@gnu.org; Tue, 02 Nov 2021 18:53:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mi2f1-0007KQ-GX
 for qemu-trivial@nongnu.org; Tue, 02 Nov 2021 18:53:43 -0400
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c]:36828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mi2ey-0002rN-W1
 for qemu-trivial@nongnu.org; Tue, 02 Nov 2021 18:53:43 -0400
Received: by mail-io1-xd2c.google.com with SMTP id e144so596918iof.3
 for <qemu-trivial@nongnu.org>; Tue, 02 Nov 2021 15:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xELoQ9MP23ZY0icqqnGEqd1dDOY3xpL6nxhgED/dCUI=;
 b=CQcLloqus83jhu7E3RBsymu81cuJi2Z1w1VoTvGbHwKnSW/Ix9A6Pe/0aafQyHJ0Bk
 0JyROYTPVof1Z8hUfb0R+66ErFufTNmPSaPbsZhgQuOKUQpFxrNow5TlQ+Wb9nLV9Png
 oQyKxwickPqW9s0fdf4jL5zPEnlR/toVO4KN+Jd8Og2ciFy6YtSR6JfqC9vxfgRrNAXm
 3/BeD/BACIHobaUO7H3ktZrnR15TIzksS/Rt9dkDpzCnESz/Py9m7KrcW+vlvy9jrFuc
 uSHh6CCG5ULHqHfQJ7KiDbXsOjNCaNVHAlk0wPujez6RbmZZMjtuSOnNMQ9dRaIioPuF
 XsxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xELoQ9MP23ZY0icqqnGEqd1dDOY3xpL6nxhgED/dCUI=;
 b=cDc5t/2fuiy1owor2wizoTqv1kbH082x5G9GnEnG2meODAfYoGYSotgisUE2Tc1ZGW
 6zB79+CeQc0qph1k6SuILCf1JQGnc3RO0m4RjqtszZccogJAtBunKc7XvOUdqUX5uMc2
 Rw/drjscOp7XwIvfVvk3T4ztdLh76tmxyInQG6WFvF9yHFfj/VoZMbIGbpw3RXHx6um+
 hAYdmHasel1L23iw8g2OiyEG0vW8bOCgW+2bfzS2CivLAFaHPCZWDHB6dcb5E+NngsL9
 6qvoAfYDER8OcvJe7GI/iCZ5fyjwSHRsSvjYKTEV44Xbg7Y9OZ48cN1Bqk0xeKzksg0R
 71dA==
X-Gm-Message-State: AOAM533b0KoT0vxIMX//JTEmI3CVdTIAWjTvT2j/7GlIbkViT3NFCxqn
 yo3BBSOnCTZ5qmHpbV+d9aAE1Q==
X-Google-Smtp-Source: ABdhPJyXbOvz4fwnQoZ3uH6kM8YSVIUOS38lJGC3fXbnS52n8Ee1D5V3XVeyXbno1EuNK5dlmMlF6g==
X-Received: by 2002:a6b:e903:: with SMTP id u3mr27574447iof.36.1635893620053; 
 Tue, 02 Nov 2021 15:53:40 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id h14sm205427ils.75.2021.11.02.15.53.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 15:53:39 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, Warner Losh <imp@bsdimp.com>,
 qemu-trivial@nongnu.org, Philippe Mathieu-Daude <f4bug@amsat.org>,
 Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Stacey Son <sson@FreeBSD.org>,
 Kyle Evans <kevans@FreeBSD.org>
Subject: [PATCH v2 19/30] bsd-user/arm/target_arch_signal.h: arm specific
 signal registers and stack
Date: Tue,  2 Nov 2021 16:52:37 -0600
Message-Id: <20211102225248.52999-20-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211102225248.52999-1-imp@bsdimp.com>
References: <20211102225248.52999-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2c;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2c.google.com
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
X-List-Received-Date: Tue, 02 Nov 2021 22:53:43 -0000

Defines for registers and stack layout related to signals.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/arm/target_arch_signal.h | 57 +++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 bsd-user/arm/target_arch_signal.h

diff --git a/bsd-user/arm/target_arch_signal.h b/bsd-user/arm/target_arch_signal.h
new file mode 100644
index 0000000000..973183d99c
--- /dev/null
+++ b/bsd-user/arm/target_arch_signal.h
@@ -0,0 +1,57 @@
+/*
+ *  arm signal definitions
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
+#ifndef _TARGET_ARCH_SIGNAL_H_
+#define _TARGET_ARCH_SIGNAL_H_
+
+#include "cpu.h"
+
+#define TARGET_REG_R0   0
+#define TARGET_REG_R1   1
+#define TARGET_REG_R2   2
+#define TARGET_REG_R3   3
+#define TARGET_REG_R4   4
+#define TARGET_REG_R5   5
+#define TARGET_REG_R6   6
+#define TARGET_REG_R7   7
+#define TARGET_REG_R8   8
+#define TARGET_REG_R9   9
+#define TARGET_REG_R10  10
+#define TARGET_REG_R11  11
+#define TARGET_REG_R12  12
+#define TARGET_REG_R13  13
+#define TARGET_REG_R14  14
+#define TARGET_REG_R15  15
+#define TARGET_REG_CPSR 16
+#define TARGET__NGREG   17
+/* Convenience synonyms */
+#define TARGET_REG_FP   TARGET_REG_R11
+#define TARGET_REG_SP   TARGET_REG_R13
+#define TARGET_REG_LR   TARGET_REG_R14
+#define TARGET_REG_PC   TARGET_REG_R15
+
+#define TARGET_INSN_SIZE    4       /* arm instruction size */
+
+/* Size of the signal trampolin code. See _sigtramp(). */
+#define TARGET_SZSIGCODE    ((abi_ulong)(9 * TARGET_INSN_SIZE))
+
+/* compare to arm/include/_limits.h */
+#define TARGET_MINSIGSTKSZ  (1024 * 4)                  /* min sig stack size */
+#define TARGET_SIGSTKSZ     (TARGET_MINSIGSTKSZ + 32768)  /* recommended size */
+
+#endif /* !_TARGET_ARCH_SIGNAL_H_ */
-- 
2.33.0


