Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qvXly-0008Hn-BH
	for mharc-qemu-trivial@gnu.org; Wed, 25 Oct 2023 02:53:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qvXln-0008Fq-V4
 for qemu-trivial@nongnu.org; Wed, 25 Oct 2023 02:53:36 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qvXlm-0006sY-8p
 for qemu-trivial@nongnu.org; Wed, 25 Oct 2023 02:53:35 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-307d58b3efbso3570255f8f.0
 for <qemu-trivial@nongnu.org>; Tue, 24 Oct 2023 23:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698216812; x=1698821612; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iag5xExHVGQuFMGcLhmFmnPUkDT4Uig/AV7ZGJNpQIE=;
 b=BA3yWVn0dXHCOU+167OnnN3CSy0i/l77YLNk4MrvZa3w8QTzSqKJU2pJ+tisoeHRdG
 06XeZz/w5zY/lqLIMWG7VZKZCkvldMHz9chHEfUNYyk137rxfndNcqTAfLKV4w4bN2ih
 gY3OKM4qU4KVNOs21Q2JnkXyfoVqqmxkeJVNo760a9/mgaut65wkIhK3yTtWDFEKgaGT
 L7Yh5bb0nY5O/k6NKNdwc8rysEWn8uRudMnEsIPZ2B1MHWwRZpf65gxLacXNDo0K+BnB
 cEWTWE1/Tr0TgpPYjsxidjCtlmsNUubAsrAtcmfX5Cnn0kQa470wV6svQCmictoRi2HT
 Tqag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698216812; x=1698821612;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iag5xExHVGQuFMGcLhmFmnPUkDT4Uig/AV7ZGJNpQIE=;
 b=HCUa3K6oBaJGgJPLFRWQC7KgESmtfTIzvsBdC0dPE4AvhGdrjt3xOoAoVqZMNTz89R
 MtNzeI7n5/zk7g+bZd8Q67symRsL1bXlmY+2RCoBbpZVYoy3yYdF4/rajJx2Wg7jtJ4U
 00G7gt4c5UH2XsDz54UBoKKU5bZ5D5LoenQ36/XnnReIegJTez8RUYbZSlzK+0WNMU9H
 5CiGOU9YnjdGruFe4bnZJ+/rAyiP4l8JNOUEn17shz+45wLIeNwFSTnoCBdbmaspRSRk
 3tzUWJYGiHTlLtHgWbUoOcOYIGsnhm0tF1xnf5NJCplSQ99T3cqSspfvES6OIaPTHZax
 PYaQ==
X-Gm-Message-State: AOJu0YzDMerZrcavpfMRVEHp835j0I68cGb5FURmjaR/iGCH1+ExKEUd
 Up0/CRwGksUoFKAMA5+xN+VmSA==
X-Google-Smtp-Source: AGHT+IH+BU0dWueSE4ZrLIp8WrBp+5g1OMZ3M/5P+UXCvqGv0+qqWom5rW1a/LJSYnzt45QdxMIWfw==
X-Received: by 2002:a5d:6705:0:b0:32d:d2ef:b0c1 with SMTP id
 o5-20020a5d6705000000b0032dd2efb0c1mr9119519wru.33.1698216812658; 
 Tue, 24 Oct 2023 23:53:32 -0700 (PDT)
Received: from m1x-phil.lan (ghy59-h01-176-171-219-76.dsl.sta.abo.bbox.fr.
 [176.171.219.76]) by smtp.gmail.com with ESMTPSA id
 w10-20020adfec4a000000b0032d2f09d991sm11343022wrn.33.2023.10.24.23.53.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 24 Oct 2023 23:53:32 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-trivial@nongnu.org,
 qemu-arm@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
Subject: [PATCH 02/10] hw/arm/allwinner-h3: Remove 'hw/arm/boot.h' from header
Date: Wed, 25 Oct 2023 08:53:08 +0200
Message-ID: <20231025065316.56817-3-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231025065316.56817-1-philmd@linaro.org>
References: <20231025065316.56817-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
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
X-List-Received-Date: Wed, 25 Oct 2023 06:53:39 -0000

"hw/arm/boot.h" is only required on the source file.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/arm/allwinner-h3.h | 1 -
 hw/arm/orangepi.c             | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/arm/allwinner-h3.h b/include/hw/arm/allwinner-h3.h
index f15d6d7cc7..24ba4e1bf4 100644
--- a/include/hw/arm/allwinner-h3.h
+++ b/include/hw/arm/allwinner-h3.h
@@ -36,7 +36,6 @@
 #define HW_ARM_ALLWINNER_H3_H
 
 #include "qom/object.h"
-#include "hw/arm/boot.h"
 #include "hw/timer/allwinner-a10-pit.h"
 #include "hw/intc/arm_gic.h"
 #include "hw/misc/allwinner-h3-ccu.h"
diff --git a/hw/arm/orangepi.c b/hw/arm/orangepi.c
index 10653361ed..d0eca54cd9 100644
--- a/hw/arm/orangepi.c
+++ b/hw/arm/orangepi.c
@@ -25,6 +25,7 @@
 #include "hw/boards.h"
 #include "hw/qdev-properties.h"
 #include "hw/arm/allwinner-h3.h"
+#include "hw/arm/boot.h"
 
 static struct arm_boot_info orangepi_binfo;
 
-- 
2.41.0


