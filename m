Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rT2gK-0006zf-2J
	for mharc-qemu-trivial@gnu.org; Thu, 25 Jan 2024 11:34:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rT2gE-0006qv-Nv
 for qemu-trivial@nongnu.org; Thu, 25 Jan 2024 11:34:18 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rT2gA-00029o-FT
 for qemu-trivial@nongnu.org; Thu, 25 Jan 2024 11:34:18 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40e5afc18f5so74613395e9.3
 for <qemu-trivial@nongnu.org>; Thu, 25 Jan 2024 08:34:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706200453; x=1706805253; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=blcIrf8+81pwYQa70vo1vxCRB41hnePR6PPCGf2tfqg=;
 b=VKQ0X4a3q6eQr51QR4ktfoK/MwBKAPj25ylOql2OmMovYeB2gJF8iIcU+Pjsvaro8D
 UaRUxKuzZdEygUmIpVChkjuZtj8fXZtybi6tHKzNpLDfJzl8Wk56VPeT+X03uwZJEGcI
 /HXDwDsmFKjVuHXsggGZjnVjD6qOokp1+FGq096ScrEneJmIZgMXxhuaWVqFNLbBR31z
 T6Gxdrxs76+WbEk4YlxyddDnSBDdaIOwLS64c/mneNDMds8XcHfLRq5KG1/K6twP/BdG
 HK4rumuuqRrFm3yVw3jIhSe2SJ3o0PAUilPdYvJiEYvxmxEuMjsC0z5ylS8J6/DDYYyt
 6dsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706200453; x=1706805253;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=blcIrf8+81pwYQa70vo1vxCRB41hnePR6PPCGf2tfqg=;
 b=VAmErt7tX/KWsOGUM44Ss4hNuYz8cu7diVXcxd3ieBXEH4LdCnF2BC8nKp/zM5y+ZD
 V/PgWx0UD5DiyZp3lC99OAO80YK5NHBYGznM6/b0aINKSqAaJ35G8+4IezY8qQlRTp2+
 WUFR7tGpMlt+ai260/imseQ3oPavjyqB1ZDtAgcbHB2HuiBWwXw/F1Vm1+PvKtU64xbe
 u0uagRIc8a7N3HT6WzR+TtZtAeJE8DktW0frw37tUtcPMlCtbpz9Yk3YJCkxx54sZJNA
 yqG+/oe/Vgw2KzzgXr70v+L7sKX2IN6TuDbuiBGHAxfjbG6PGVGcRiOmn8DafMB4c3e2
 qwqQ==
X-Gm-Message-State: AOJu0YzWlKCYd/e+/5RJhpJCoXj69BFi22TrfTD/+XSIDvR6QIAORsV6
 qlhHCFLHQeSwuwVG9/HP6Vz2eIFXbB4Qh5yBg42aqkQ9Cv2MqRkQ9hQKcKEg/oI=
X-Google-Smtp-Source: AGHT+IEX5+KIpPHhbqC7Ytn3fdJnydoU/IMUMZoFZX7A05hwzjlolN/qp/qq2iUalZGpRlpYGfZuUQ==
X-Received: by 2002:a05:600c:1d8d:b0:40e:d4d2:f00d with SMTP id
 p13-20020a05600c1d8d00b0040ed4d2f00dmr57837wms.130.1706200453065; 
 Thu, 25 Jan 2024 08:34:13 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 p13-20020a05600c358d00b0040ea875a527sm3122208wmq.26.2024.01.25.08.34.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jan 2024 08:34:12 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Subject: [PATCH 08/10] cxl: Clean up includes
Date: Thu, 25 Jan 2024 16:34:06 +0000
Message-Id: <20240125163408.1595135-9-peter.maydell@linaro.org>
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
X-List-Received-Date: Thu, 25 Jan 2024 16:34:18 -0000

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
 hw/cxl/cxl-events.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/hw/cxl/cxl-events.c b/hw/cxl/cxl-events.c
index bee6dfaf148..affcf8a34dd 100644
--- a/hw/cxl/cxl-events.c
+++ b/hw/cxl/cxl-events.c
@@ -7,11 +7,9 @@
  * COPYING file in the top-level directory.
  */
 
-#include <stdint.h>
-
 #include "qemu/osdep.h"
+
 #include "qemu/bswap.h"
-#include "qemu/typedefs.h"
 #include "qemu/error-report.h"
 #include "hw/pci/msi.h"
 #include "hw/pci/msix.h"
-- 
2.34.1


