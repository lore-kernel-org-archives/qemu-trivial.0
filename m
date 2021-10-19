Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mcsFg-0000kX-Dl
	for mharc-qemu-trivial@gnu.org; Tue, 19 Oct 2021 12:46:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcsF7-0000M0-KF
 for qemu-trivial@nongnu.org; Tue, 19 Oct 2021 12:45:38 -0400
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30]:36601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcsEu-0000Sc-Ny
 for qemu-trivial@nongnu.org; Tue, 19 Oct 2021 12:45:37 -0400
Received: by mail-io1-xd30.google.com with SMTP id e144so21147622iof.3
 for <qemu-trivial@nongnu.org>; Tue, 19 Oct 2021 09:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZhJExKbUH25tHb+0wa/214Ve4XCy7t/TwI/sIw4xvj0=;
 b=0WuR7yBmH0wfDZJClWwRTArnIAGnhGpEj8Eq1tBMZhuhXEqvyd8CKroPMhMQw5FtnS
 gWENydyxvCdtg/v+jzOhaVYOAfkrpT0rYdbJGeHHOFnsrV6Cue/A6UVGbo8PHffD1teQ
 BiV7+1nm6xZCJeum+NaRl8rYipm6awkusGRiYxnhyv9ekKPa8ul4BSbrbnlcZnx9yO4P
 bb2+ZVUMpsdBhbZr3QjOLNvXi40VQFP/5FYQTiJmSkkBF55sIExMiRcVv4k8fhtMlasO
 H35jO5oLQPB/mAZ4wRmfFkKu4eIY+Oo2FiEf//NRPjOfCRvnT/6qxOtMZdW68gVfkFNl
 7TZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZhJExKbUH25tHb+0wa/214Ve4XCy7t/TwI/sIw4xvj0=;
 b=1B+4HnZYHPd2Tujj6WV6We9hGXua36bvNkuEQefTHi3u5u8a44ypLTXZWNCbtjGTmW
 TVpNkIuDqUAw9r5A9cWiVAOfIGl6fFUQYCremi8qG1zprVIpTe7KZPK+Vf5BCVjI9fAS
 R1RkIPPfl324J25YUgDQHfJ97GuUljWDdTAQfTT7PQFnlOvnlLaMcDN/ZrX68eReuWRQ
 DnuQKFavO3RHvIv1Vnm/1+uakCxxzre43e/fZTpzDgAd7D8GudH/LXiAisvQpgCz+o7h
 fp4VzpDSCU0eRvbQFuQiv6FNGHtY2BdD9TKfx05fE9lUPkLzgPJA1OZzURvIlF0ig3rc
 28PA==
X-Gm-Message-State: AOAM531H36n4JZ0blgTA88pxx3pKdIre10IHhWpLn72zeDPrBBU5429h
 u3bGosZj/4edz/TgHU+8DYHECw==
X-Google-Smtp-Source: ABdhPJx+lH1fb1dyAxa9Cpi+uqhByJMyzOTqg1qZ88ZsE4bwqwdWSdd4QRW/P6mzMxNzGk4u2boz0A==
X-Received: by 2002:a02:b60a:: with SMTP id h10mr4950048jam.50.1634661923550; 
 Tue, 19 Oct 2021 09:45:23 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id q7sm1133951ilv.48.2021.10.19.09.45.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 09:45:23 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>, Laurent Vivier <laurent@vivier.eu>,
 qemu-trivial@nongnu.org, Kyle Evans <kevans@freebsd.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Stacey Son <sson@FreeBSD.org>
Subject: [PATCH 17/24] bsd-user/arm/target_arch_signal.h: arm specific signal
 registers and stack
Date: Tue, 19 Oct 2021 10:44:40 -0600
Message-Id: <20211019164447.16359-18-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211019164447.16359-1-imp@bsdimp.com>
References: <20211019164447.16359-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d30;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd30.google.com
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
X-List-Received-Date: Tue, 19 Oct 2021 16:45:38 -0000

Defines for registers and stack layout related to signals.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
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
2.32.0


