Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qvXmT-00007J-9b
	for mharc-qemu-trivial@gnu.org; Wed, 25 Oct 2023 02:54:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qvXmJ-0008UF-NE
 for qemu-trivial@nongnu.org; Wed, 25 Oct 2023 02:54:08 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qvXmB-00070y-TA
 for qemu-trivial@nongnu.org; Wed, 25 Oct 2023 02:54:07 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-32d81864e3fso3552592f8f.2
 for <qemu-trivial@nongnu.org>; Tue, 24 Oct 2023 23:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698216837; x=1698821637; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u1N4iB5qyuXhYbGZOImwLflm5tVzhud2jN7eFf2rhmk=;
 b=Ui4hp91lNnDoUXWXHbqYRg6PgF1X3kgL2rhzJa88iNQxuFV8dEqP5W9W8oFdlNkg0N
 Wdam1VmOyCDQmbAkkoKRogdEOk5crjMsmCuSRso7A9bZVyM56b019AXxSqwtCd3GOlQs
 TUjoUMQbmXovq8bHmQSoSu5Ele67O4nXG+XVS7G0ka2MO04/VtL4iud9IUriAzHQIwaH
 7s9ESw5+26VhfWRFDccEhprooTF4Nobw9Cf+aWI7HMS0gS5qSeStVy4gyTPp0OSeZzYe
 mzO5H81V/JKVZ2+Gn+XnjT1FjQKOlGOI/yl2P/YGfc+1XM+hLL1DwDO0kgZPzNWjg9Va
 k1rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698216837; x=1698821637;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u1N4iB5qyuXhYbGZOImwLflm5tVzhud2jN7eFf2rhmk=;
 b=oo0v5vzyUYwnBma2TI4Y9QgYx4yHedj1nF9SBsPn53b0N3suidSqvBqx0otxJBCjEK
 bi/BlBLtqsIQO9+yg8aZbR6h3i6RMEOFMI/fHPUgAd7+ltKMSm7QFWJEQKprXSG9Bwlg
 NG5y3EGRHeA8wo7xEOl4SzoxPIj0xv7c3F/JZKTCw9HeKlkqnkTyta1ufQ4vbABt9raH
 fvZGwcP8diCs8kIN0+yJav2NK4aEe+CfoXPAuzsmj4Aq3bO8W5tLPu4Flw/2v4ngsjPo
 tMBh5Dm4Bq0LxV5jTcf3AO5cOG0EYEWHM7BpCgR0qEHzl4uK0WseHxEMfp2R9w+Q4cIy
 X5Og==
X-Gm-Message-State: AOJu0YwLNADfcXftEIoTfmKNJTf7YL5rASlD65KkUVnPP7d9hiU+QVpR
 WWyfH8hNYNkh7U97KKWRBqhC5A==
X-Google-Smtp-Source: AGHT+IEEsuZCV45fQh046rPv2iYuXe1yHkovGstlj2ZWdDoeswPbZXMJTEaWEhVvNe4ohN22D/wo1Q==
X-Received: by 2002:adf:ed8e:0:b0:32d:9d99:d0a5 with SMTP id
 c14-20020adfed8e000000b0032d9d99d0a5mr11157008wro.5.1698216836919; 
 Tue, 24 Oct 2023 23:53:56 -0700 (PDT)
Received: from m1x-phil.lan (ghy59-h01-176-171-219-76.dsl.sta.abo.bbox.fr.
 [176.171.219.76]) by smtp.gmail.com with ESMTPSA id
 r6-20020a5d6946000000b00318147fd2d3sm11326018wrw.41.2023.10.24.23.53.55
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 24 Oct 2023 23:53:56 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-trivial@nongnu.org,
 qemu-arm@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>
Subject: [PATCH 06/10] hw/arm/fsl-imx6: Remove 'hw/arm/boot.h' from header
Date: Wed, 25 Oct 2023 08:53:12 +0200
Message-ID: <20231025065316.56817-7-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231025065316.56817-1-philmd@linaro.org>
References: <20231025065316.56817-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 25 Oct 2023 06:54:13 -0000

"hw/arm/boot.h" is only required on the source file.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/arm/fsl-imx6.h | 1 -
 hw/arm/sabrelite.c        | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/arm/fsl-imx6.h b/include/hw/arm/fsl-imx6.h
index 5b4d48da08..519b871014 100644
--- a/include/hw/arm/fsl-imx6.h
+++ b/include/hw/arm/fsl-imx6.h
@@ -17,7 +17,6 @@
 #ifndef FSL_IMX6_H
 #define FSL_IMX6_H
 
-#include "hw/arm/boot.h"
 #include "hw/cpu/a9mpcore.h"
 #include "hw/misc/imx6_ccm.h"
 #include "hw/misc/imx6_src.h"
diff --git a/hw/arm/sabrelite.c b/hw/arm/sabrelite.c
index 41191245b8..56f184b9ae 100644
--- a/hw/arm/sabrelite.c
+++ b/hw/arm/sabrelite.c
@@ -13,6 +13,7 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "hw/arm/fsl-imx6.h"
+#include "hw/arm/boot.h"
 #include "hw/boards.h"
 #include "hw/qdev-properties.h"
 #include "qemu/error-report.h"
-- 
2.41.0


