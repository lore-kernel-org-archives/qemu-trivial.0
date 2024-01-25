Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rT2gD-0006q0-Rx
	for mharc-qemu-trivial@gnu.org; Thu, 25 Jan 2024 11:34:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rT2gC-0006oe-IZ
 for qemu-trivial@nongnu.org; Thu, 25 Jan 2024 11:34:16 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rT2g9-000288-0E
 for qemu-trivial@nongnu.org; Thu, 25 Jan 2024 11:34:16 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40eb2f392f0so39314275e9.1
 for <qemu-trivial@nongnu.org>; Thu, 25 Jan 2024 08:34:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706200451; x=1706805251; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nXb190+lhYx3lCV3waqp1Pgx9RLFbwQo2doe5u6vJo0=;
 b=jQacrLeElBhY2VsPUmiiTHp7LMo43BnnTLv8I/3I9vB9xIzQC9BYIm3oMJDQ2KzQ5z
 uuzQMIdctBqFy17glRDaxwFieQwwomoiQzQ2ONqGl49tCUoF5Q8dvaHHXetlY4+ST17P
 Fffl8iC/E5qOwOxtdV6wnhH5rpcKIWqPR/17p6cDJRMd6uVrkeBVZ1ZqB6GEN31UQ0TQ
 3Oq8lAMbVRzm0sneGP2Tjlvi7nXE9cia0Q8zow6cru8kP1zw1ZumcwA7BTlkxUjIUJk2
 lZIHy+zxxOONCxg05XDIIzjm4S3FbPUlb8G36blFTAr1s9hrcV87klwix2PmsjoP4pxe
 YguA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706200451; x=1706805251;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nXb190+lhYx3lCV3waqp1Pgx9RLFbwQo2doe5u6vJo0=;
 b=HUa7Mf7c6fDBOvdYbAD5pkLSjrudXq/8zBk32MGdc9Dq2Y/zq+DkM1lbIHULQnoblm
 J5suNQGyNlcYKv9wo8B1bNU1gbF4kEFh+aYeNsXW28TKJdOpR+fJc4CfAyp50wI6IDaM
 Vemza+0mYFUz9xdqJKtd+YKJzxGFU2MVWy/iztbhOLIjPO7RW+/kAP2qMsgDi+t89wj/
 9BpX8aeXu/q7anqe4V4eyP8v2ud4DJaQlJwwOXRB2LxFCy7S2ji3dWmInzywC9YqCHJx
 s/EaBOYnJPqLF7itnn9Q5GztvSiuPI/s0pCwj5SChKojm5Noxvpm3LreAj4r4EqkgrhT
 Ie0A==
X-Gm-Message-State: AOJu0YxULm7jUZ8a3WWkv0kfLmugLoEpKzktwNW3inRS1lnZjhre5RlU
 fE1gOj9vsBPlCK53TzBDCzzdFGQClLNCMhveeAxsv+4mzewN7mIWNdO4h81KYuNTYRh/7TBEvOW
 a
X-Google-Smtp-Source: AGHT+IE0HVnIpPRsMYXIc3iE3qK38WGkTQQ5apxgP2dO9pN94oPR2pBbMSyOI/zQvndLN2N8XGhK+Q==
X-Received: by 2002:a05:600c:a01:b0:40d:7d87:6730 with SMTP id
 z1-20020a05600c0a0100b0040d7d876730mr716948wmp.101.1706200451391; 
 Thu, 25 Jan 2024 08:34:11 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 p13-20020a05600c358d00b0040ea875a527sm3122208wmq.26.2024.01.25.08.34.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jan 2024 08:34:11 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Subject: [PATCH 04/10] aspeed: Clean up includes
Date: Thu, 25 Jan 2024 16:34:02 +0000
Message-Id: <20240125163408.1595135-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240125163408.1595135-1-peter.maydell@linaro.org>
References: <20240125163408.1595135-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
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
X-List-Received-Date: Thu, 25 Jan 2024 16:34:16 -0000

This commit was created with scripts/clean-includes.

All .c should include qemu/osdep.h first.  The script performs three
related cleanups:

* Ensure .c files include qemu/osdep.h first.
* Including it in a .h is redundant, since the .c  already includes
  it.  Drop such inclusions.
* Likewise, including headers qemu/osdep.h includes is redundant.
  Drop these, too.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/aspeed_eeprom.h     | 1 -
 tests/qtest/qtest_aspeed.h | 2 --
 hw/arm/aspeed_eeprom.c     | 1 +
 3 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/hw/arm/aspeed_eeprom.h b/hw/arm/aspeed_eeprom.h
index bbf9e54365b..f08c16ef506 100644
--- a/hw/arm/aspeed_eeprom.h
+++ b/hw/arm/aspeed_eeprom.h
@@ -7,7 +7,6 @@
 #ifndef ASPEED_EEPROM_H
 #define ASPEED_EEPROM_H
 
-#include "qemu/osdep.h"
 
 extern const uint8_t tiogapass_bmc_fruid[];
 extern const size_t tiogapass_bmc_fruid_len;
diff --git a/tests/qtest/qtest_aspeed.h b/tests/qtest/qtest_aspeed.h
index 235dfaa186a..d35b0c7cba5 100644
--- a/tests/qtest/qtest_aspeed.h
+++ b/tests/qtest/qtest_aspeed.h
@@ -12,8 +12,6 @@
 #ifndef QTEST_ASPEED_H
 #define QTEST_ASPEED_H
 
-#include <stdint.h>
-
 #include "libqtest.h"
 
 #define AST2600_ASPEED_I2C_BASE_ADDR 0x1e78a000
diff --git a/hw/arm/aspeed_eeprom.c b/hw/arm/aspeed_eeprom.c
index ace5266cec9..daa3d329d10 100644
--- a/hw/arm/aspeed_eeprom.c
+++ b/hw/arm/aspeed_eeprom.c
@@ -4,6 +4,7 @@
  * SPDX-License-Identifier: GPL-2.0-only
  */
 
+#include "qemu/osdep.h"
 #include "aspeed_eeprom.h"
 
 /* Tiogapass BMC FRU */
-- 
2.34.1


