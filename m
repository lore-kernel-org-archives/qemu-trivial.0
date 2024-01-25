Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rT2gG-0006uH-LR
	for mharc-qemu-trivial@gnu.org; Thu, 25 Jan 2024 11:34:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rT2gF-0006rU-8H
 for qemu-trivial@nongnu.org; Thu, 25 Jan 2024 11:34:19 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rT2gB-0002AJ-3v
 for qemu-trivial@nongnu.org; Thu, 25 Jan 2024 11:34:18 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40ed232ea06so6744695e9.1
 for <qemu-trivial@nongnu.org>; Thu, 25 Jan 2024 08:34:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706200453; x=1706805253; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q+eC4LHMBL/iVnWEGbnsMN/lqwJwozZWJpzQmLLpDa0=;
 b=gZTPy9M8DXpWBMJVATgRm04efqFyEE/FsBwtBdKklrr+Tr94m5Zca0TnRrNgIbXiCa
 iOhdZ+l4B7WN4RHmaCUT0bRaO3vaNyCzTckh6dEir4xSTFkNbHEN8GhVW9YJilawWH1i
 UGLNs9q7WPWbiAx+JYl7nuWVOKSJEL0MVdCNwk5m/gmyhdiHV0AKimFgskDm4CW0GhcJ
 SGM40qzwQezDNdETE1CY9TAAWQPBaQALbd2NeVp6UzvLOspnR9PcDu7huK5SjFYw35g9
 cGrDHnsgaKWezFWcAow/FZ04PfCHpe0MU8Ky28r4nJJUfxHhY0bzcXXSnpRfxSG25UJc
 +G2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706200453; x=1706805253;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q+eC4LHMBL/iVnWEGbnsMN/lqwJwozZWJpzQmLLpDa0=;
 b=WDU/aCPscmJTNWwB2SHM7FISp4QNM2Q1AaaoW3RV0QLxLpAjP7WcaZbDasyHoEjKf9
 g3L7OPcGlXxIr0jou30w/WtdiJoV3qHIvNarVtCkdwRfa3SIp9Us6eNh6jhIPoXKho76
 ZvnxaHpY5Htww8lKbFrszZDoaoCfHY0GDWQA6kuw9ThNx7xwvkhZFmHjgNZGsNgS6Btr
 8VD6pJhwQ2ZvPfSBPpIzDjL3acbenTK3xfHmgh6ujoaUU3XjvWWWmFclrgCvgGhkqTEo
 Yg4CF+7gp0jfZ9I0gSik3BdQ2sI24PZf1u3W1M1r2Tji1SHCabOFozMc7kCb0tdt/Q9N
 KA6w==
X-Gm-Message-State: AOJu0YxiDvt5S5oqy+uXf2CefaYEO9qaAhntFOmI37dccO7C5karM15+
 d6Bbn9sqNJfigAU+4KjB5AD3NTdiFSS6k/YUd/kJ6Do8STaoPyFPrN6HAsFpP83sh3cnB5BNsZ4
 E
X-Google-Smtp-Source: AGHT+IGyP5nRjHk0KpttX4oDcB2/nRV7auXh/RG+igrAkp1gDwPsD5uz4x8PKPiZDBAucmppiO9Tmg==
X-Received: by 2002:a5d:6543:0:b0:339:502f:5e0c with SMTP id
 z3-20020a5d6543000000b00339502f5e0cmr1146669wrv.10.1706200453495; 
 Thu, 25 Jan 2024 08:34:13 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 p13-20020a05600c358d00b0040ea875a527sm3122208wmq.26.2024.01.25.08.34.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jan 2024 08:34:13 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Subject: [PATCH 09/10] riscv: Clean up includes
Date: Thu, 25 Jan 2024 16:34:07 +0000
Message-Id: <20240125163408.1595135-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240125163408.1595135-1-peter.maydell@linaro.org>
References: <20240125163408.1595135-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 25 Jan 2024 16:34:19 -0000

This commit was created with scripts/clean-includes:
 ./scripts/clean-includes --git riscv target/riscv/*.[ch]

All .c should include qemu/osdep.h first.  The script performs three
related cleanups:

* Ensure .c files include qemu/osdep.h first.
* Including it in a .h is redundant, since the .c  already includes
  it.  Drop such inclusions.
* Likewise, including headers qemu/osdep.h includes is redundant.
  Drop these, too.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/riscv/vector_internals.h | 1 -
 target/riscv/vector_internals.c | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/vector_internals.h b/target/riscv/vector_internals.h
index 8133111e5f6..842765f6c16 100644
--- a/target/riscv/vector_internals.h
+++ b/target/riscv/vector_internals.h
@@ -19,7 +19,6 @@
 #ifndef TARGET_RISCV_VECTOR_INTERNALS_H
 #define TARGET_RISCV_VECTOR_INTERNALS_H
 
-#include "qemu/osdep.h"
 #include "qemu/bitops.h"
 #include "cpu.h"
 #include "tcg/tcg-gvec-desc.h"
diff --git a/target/riscv/vector_internals.c b/target/riscv/vector_internals.c
index 9cf5c17cdea..12f5964fbbe 100644
--- a/target/riscv/vector_internals.c
+++ b/target/riscv/vector_internals.c
@@ -16,6 +16,7 @@
  * this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
+#include "qemu/osdep.h"
 #include "vector_internals.h"
 
 /* set agnostic elements to 1s */
-- 
2.34.1


