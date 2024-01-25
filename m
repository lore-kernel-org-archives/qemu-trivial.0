Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rT2gC-0006oW-Ef
	for mharc-qemu-trivial@gnu.org; Thu, 25 Jan 2024 11:34:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rT2gB-0006kR-01
 for qemu-trivial@nongnu.org; Thu, 25 Jan 2024 11:34:15 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rT2g8-00027y-CC
 for qemu-trivial@nongnu.org; Thu, 25 Jan 2024 11:34:14 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40ea5653f6bso72622325e9.3
 for <qemu-trivial@nongnu.org>; Thu, 25 Jan 2024 08:34:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706200451; x=1706805251; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YHMUzgkXRP9wZQ4wL9pyKD3XATptA/6sivyW/DCZ/hM=;
 b=bi/pruiCm49nj9ILT+kpStwEwO9eaRdLx3QMegVjbGBUuXzPqMCfY/VLEiowyEi/ah
 sjm69QzKrnK33D0KCaHz2dlnm8r9wKoUQlfX5bFZQo8PYu67wvplJOyTMCYApYLiIU3F
 mtWhegm0KDyHn7H/ZddOJCeua6OtkInuu4ke9tG4Ah2lxjlzZnZzjX70wTRrIn+bJLBx
 AXzfLr4G7M9JTktV8zCTuxKi5ApGRRKwIG8ARVfW9okcIKwAFlTswzlb2BhMKIpOyvua
 RHHchnmSce+JKyWqIwOk+tlkWo1pSgCkvuYOstu1y78n/jB5zoPKoMOaTU4hWflKlgaA
 mpCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706200451; x=1706805251;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YHMUzgkXRP9wZQ4wL9pyKD3XATptA/6sivyW/DCZ/hM=;
 b=esUuW3Z37W/pqbeYU/+wzAN0MzMYv+QoVyK9hLV2WhlY6ZfauUWvGBAu/Wf9tT085w
 dwfSJNCjgKiWEOlKg1v0WMfglG4W+ljxcSat+2QSXZin9a33dJCXSC8kKxtp3wH8xIS9
 9JSWSTndW8JUJrhdoJgvfXgODw/R2lBVphn4gBN3eD9KoQIhWkJ2Po3Kau20zoG+oycl
 sRPwipMlSktmEY6WNEqtTZzshrOD/AJB/Dr/VFKQlKahLejAK73hqSest5VH96fKSBjQ
 SRuLjpK1Gqsv8Im+x4L6qsU5Jm0y74B3myCep/R/oaNs/MHZ7EoK+BoLVlt2G0A4Yj7t
 kfNQ==
X-Gm-Message-State: AOJu0YzqRYFJPaq+LRJMuLYqEqsc7utfzGRZ32Vnl7o6EMGUQ+9Nee6x
 ZnRmjosq+aDvB7pF4kg2r0o0rMoDkkaPvl3J0s9bL0bKYvsiRkE4eCa5NsBrvh8=
X-Google-Smtp-Source: AGHT+IEG5L84L9UQXNBAuQGxJwjDbdv6l1TIIMxWTQVW/2Acw35eIfLzZx0nKHSdfcOUsZl6/DYHWQ==
X-Received: by 2002:a05:600c:22c7:b0:40d:9061:b8 with SMTP id
 7-20020a05600c22c700b0040d906100b8mr743699wmg.223.1706200450979; 
 Thu, 25 Jan 2024 08:34:10 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 p13-20020a05600c358d00b0040ea875a527sm3122208wmq.26.2024.01.25.08.34.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jan 2024 08:34:10 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Subject: [PATCH 03/10] disas/riscv: Clean up includes
Date: Thu, 25 Jan 2024 16:34:01 +0000
Message-Id: <20240125163408.1595135-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240125163408.1595135-1-peter.maydell@linaro.org>
References: <20240125163408.1595135-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 25 Jan 2024 16:34:15 -0000

This commit was created with scripts/clean-includes:
 ./scripts/clean-includes --git disas/riscv disas/riscv*[ch]

All .c should include qemu/osdep.h first.  The script performs three
related cleanups:

* Ensure .c files include qemu/osdep.h first.
* Including it in a .h is redundant, since the .c  already includes
  it.  Drop such inclusions.
* Likewise, including headers qemu/osdep.h includes is redundant.
  Drop these, too.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 disas/riscv.h          | 1 -
 disas/riscv-xthead.c   | 1 +
 disas/riscv-xventana.c | 1 +
 3 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/disas/riscv.h b/disas/riscv.h
index 19e5ed2ce63..16a08e4895c 100644
--- a/disas/riscv.h
+++ b/disas/riscv.h
@@ -7,7 +7,6 @@
 #ifndef DISAS_RISCV_H
 #define DISAS_RISCV_H
 
-#include "qemu/osdep.h"
 #include "target/riscv/cpu_cfg.h"
 
 /* types */
diff --git a/disas/riscv-xthead.c b/disas/riscv-xthead.c
index 99da679d16c..fcca326d1c3 100644
--- a/disas/riscv-xthead.c
+++ b/disas/riscv-xthead.c
@@ -4,6 +4,7 @@
  * SPDX-License-Identifier: GPL-2.0-or-later
  */
 
+#include "qemu/osdep.h"
 #include "disas/riscv.h"
 #include "disas/riscv-xthead.h"
 
diff --git a/disas/riscv-xventana.c b/disas/riscv-xventana.c
index a0224d1fb31..cd694f15f32 100644
--- a/disas/riscv-xventana.c
+++ b/disas/riscv-xventana.c
@@ -4,6 +4,7 @@
  * SPDX-License-Identifier: GPL-2.0-or-later
  */
 
+#include "qemu/osdep.h"
 #include "disas/riscv.h"
 #include "disas/riscv-xventana.h"
 
-- 
2.34.1


