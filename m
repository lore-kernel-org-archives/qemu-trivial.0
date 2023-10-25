Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qvXmL-0008VL-F3
	for mharc-qemu-trivial@gnu.org; Wed, 25 Oct 2023 02:54:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qvXmI-0008U5-Uh
 for qemu-trivial@nongnu.org; Wed, 25 Oct 2023 02:54:07 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qvXmG-00071Z-Lr
 for qemu-trivial@nongnu.org; Wed, 25 Oct 2023 02:54:06 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4083f61312eso43052715e9.3
 for <qemu-trivial@nongnu.org>; Tue, 24 Oct 2023 23:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698216843; x=1698821643; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u9mQCUmt8kL3bXixksm+1XQHmEqrWqER6ahfYoxRZEc=;
 b=MtSD5rZgKQNd2IFPvtVq1DvoGwI2nloseF5bTCk9qED0pTxFnoS16Z64X4fIDt7TA+
 S6yqvlJUj9BVS7OpqcNBFiaEdiCh0pDon8ABdCFt4uj3xocVkp97hY1b3n3ufi9z9v7b
 GD5o4bIqL6wPn7umAlusxUTJQfJh3KV8WqmU3VAdKYzCO3kQF9WZgtgB6NHxiPgGi3+a
 dZoKs+lQ2ZMas6ZwvOTceGJpl7J3e/EW0flGjjl5DEibO86PVS0RoRoj5rrnukHnROu8
 0T6Bvih0qF0NQVeGQFTV/n6SYWKAPmH7zzTCCP4cRBjV7yHxQ0BNzuCU2KnLqfw51qg7
 p/Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698216843; x=1698821643;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u9mQCUmt8kL3bXixksm+1XQHmEqrWqER6ahfYoxRZEc=;
 b=ZEw3zM1270l6akyEgsK0Q2/9KqAP/4p4hoFFJEskhzj2UIzIqEWMqiYp41bfAzea6s
 JBE4xpfZLUq5VxrVXzFlLLnrmNDSdnoIUP4KaBZphvCY+bptWWjAq2AkTy5xf3alUTlB
 BeD/tRyXUFhshlgN5LZMgo2QQQz9aOYlYL4EpmOXL4yRu4FY3hBc1yuoElJdOOaU4276
 pzGxFTtvVBbEgK2/YUIkHACrEU8MdX7YMWrSDh1AaSS5CPzWgKZx8P2LlmwQ6M8iOkVi
 F062LCI+e2yOSiEj0RumVUXqM1VyTV3CwVoBhwQxY010Az4itMHThIcUP8AJQUE92ikI
 zwcw==
X-Gm-Message-State: AOJu0YzlP7hCvrZBDgIYjLgEMtAiFrXHdcbaNfqiEGuIuWLPPHVSL7W3
 2C6DSctDYOfS95NB4tqf02j3Ts6cVfYn/aoEIK4=
X-Google-Smtp-Source: AGHT+IH19gKEkonPfxdyTFTvSYJDPbrP9llUC/eceIAw6hQhocAVnF/sw08bY+8x9ykZaM5UaGfWMw==
X-Received: by 2002:a5d:5190:0:b0:32d:a101:689d with SMTP id
 k16-20020a5d5190000000b0032da101689dmr10595910wrv.56.1698216842996; 
 Tue, 24 Oct 2023 23:54:02 -0700 (PDT)
Received: from m1x-phil.lan (ghy59-h01-176-171-219-76.dsl.sta.abo.bbox.fr.
 [176.171.219.76]) by smtp.gmail.com with ESMTPSA id
 g11-20020adffc8b000000b0032dc24ae625sm11345346wrr.12.2023.10.24.23.54.01
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 24 Oct 2023 23:54:02 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-trivial@nongnu.org,
 qemu-arm@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>
Subject: [PATCH 07/10] hw/arm/fsl-imx6ul: Remove 'hw/arm/boot.h' from header
Date: Wed, 25 Oct 2023 08:53:13 +0200
Message-ID: <20231025065316.56817-8-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231025065316.56817-1-philmd@linaro.org>
References: <20231025065316.56817-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 25 Oct 2023 06:54:07 -0000

"hw/arm/boot.h" is only required on the source file.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/arm/fsl-imx6ul.h | 1 -
 hw/arm/mcimx6ul-evk.c       | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/arm/fsl-imx6ul.h b/include/hw/arm/fsl-imx6ul.h
index 63012628ff..14390f6014 100644
--- a/include/hw/arm/fsl-imx6ul.h
+++ b/include/hw/arm/fsl-imx6ul.h
@@ -17,7 +17,6 @@
 #ifndef FSL_IMX6UL_H
 #define FSL_IMX6UL_H
 
-#include "hw/arm/boot.h"
 #include "hw/cpu/a15mpcore.h"
 #include "hw/misc/imx6ul_ccm.h"
 #include "hw/misc/imx6_src.h"
diff --git a/hw/arm/mcimx6ul-evk.c b/hw/arm/mcimx6ul-evk.c
index 3ac1e2ea9b..500427e94b 100644
--- a/hw/arm/mcimx6ul-evk.c
+++ b/hw/arm/mcimx6ul-evk.c
@@ -13,6 +13,7 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "hw/arm/fsl-imx6ul.h"
+#include "hw/arm/boot.h"
 #include "hw/boards.h"
 #include "hw/qdev-properties.h"
 #include "qemu/error-report.h"
-- 
2.41.0


