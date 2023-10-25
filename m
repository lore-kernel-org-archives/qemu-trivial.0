Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qvXlp-0008G1-Md
	for mharc-qemu-trivial@gnu.org; Wed, 25 Oct 2023 02:53:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qvXlh-0008EW-TL
 for qemu-trivial@nongnu.org; Wed, 25 Oct 2023 02:53:31 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qvXlf-0006rZ-Vh
 for qemu-trivial@nongnu.org; Wed, 25 Oct 2023 02:53:29 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40906fc54fdso19071425e9.0
 for <qemu-trivial@nongnu.org>; Tue, 24 Oct 2023 23:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698216806; x=1698821606; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=liQUfBw2vuT84lDsRH1NnEhHpPgK8Ag3m+jx8pbJ8Jk=;
 b=h2jCsW7lEkfzhHS/255OJ4nM/SRPKiYh7pAzjIfmzf47Y05lUX08Bid35oGGcJiohR
 pE1FoSGkMjBWhiHFTx1ffM2gLzbEV8KlDyZly6/VmzojUr04mgUgBKD1Hz97fbIKsP3z
 MdOEJGOUhQ5poITKv68uAX4z88f7pSEawaqlDzS85PxxAeRD9+Wh0QhLMQbazdY5IGSF
 M67mphoFb/KZddzaXpcbN5DvbK8ifLGumgbCGECpJW/vcqROjHU9xIJQHkJD8E42aPg5
 A2jks3dSxTcQL1nEoBi9SvMjydyuRvcbryyfg/85oeHl5wyFePqk+40TXJpMnqqWhBpQ
 Za6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698216806; x=1698821606;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=liQUfBw2vuT84lDsRH1NnEhHpPgK8Ag3m+jx8pbJ8Jk=;
 b=q0+XhgPg/Iwy8EhDav7kR8PtOJjMWcbHld44irEQl28x+MAcGc21pLCLhdFhdcfB84
 qZlSf/JLOj5uDkIgKAjQnl5ajQwD5Cwqihc2NEMofx1dlPxsGsT9yKUxARDX7RkSyt1g
 Sq9WlgAzY6OuS9iebPNwOqcyFq8Yr1dqpeZ/aQ6x+tLtPOIofcO3VNXj2UgrGctxxuMP
 I+XNa8/Vj7eFIRRQrBPS2D8CaW9o/D/Bb9BvKAoKzVJ8KMusny3mjGCwcMoxmHZ0qmIM
 JLhRcn3D1CrdgPbx7FyWYOKP9CI50Zg3wppj+QpglhW0Hkgr+s6VLsvmnM4TES0P04J7
 C/LQ==
X-Gm-Message-State: AOJu0YwBCGpsJrqkf4h961MWaMo/c+WL4HGEgCyaA8xjdf7R9a4/jjXu
 56zZN+MTgg6/vfmbbTrXA4rvsA==
X-Google-Smtp-Source: AGHT+IFobtS7uum76Yh/zJuMcq+0R4SW1bW/dluGqRkhF3CLkjt+ASEIYhHgQGlcAk/8D+VVjQ0fWA==
X-Received: by 2002:a05:600c:46cc:b0:409:2c5:b2cd with SMTP id
 q12-20020a05600c46cc00b0040902c5b2cdmr5715576wmo.14.1698216806466; 
 Tue, 24 Oct 2023 23:53:26 -0700 (PDT)
Received: from m1x-phil.lan (ghy59-h01-176-171-219-76.dsl.sta.abo.bbox.fr.
 [176.171.219.76]) by smtp.gmail.com with ESMTPSA id
 l23-20020a1c7917000000b004063cced50bsm13579078wme.23.2023.10.24.23.53.24
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 24 Oct 2023 23:53:26 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-trivial@nongnu.org,
 qemu-arm@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
Subject: [PATCH 01/10] hw/arm/allwinner-a10: Remove 'hw/arm/boot.h' from header
Date: Wed, 25 Oct 2023 08:53:07 +0200
Message-ID: <20231025065316.56817-2-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231025065316.56817-1-philmd@linaro.org>
References: <20231025065316.56817-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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
X-List-Received-Date: Wed, 25 Oct 2023 06:53:33 -0000

"hw/arm/boot.h" is only required on the source file.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/arm/allwinner-a10.h | 1 -
 hw/arm/cubieboard.c            | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/arm/allwinner-a10.h b/include/hw/arm/allwinner-a10.h
index cd1465c613..2eb83a17ea 100644
--- a/include/hw/arm/allwinner-a10.h
+++ b/include/hw/arm/allwinner-a10.h
@@ -1,7 +1,6 @@
 #ifndef HW_ARM_ALLWINNER_A10_H
 #define HW_ARM_ALLWINNER_A10_H
 
-#include "hw/arm/boot.h"
 #include "hw/timer/allwinner-a10-pit.h"
 #include "hw/intc/allwinner-a10-pic.h"
 #include "hw/net/allwinner_emac.h"
diff --git a/hw/arm/cubieboard.c b/hw/arm/cubieboard.c
index 8c7fa91529..29146f5018 100644
--- a/hw/arm/cubieboard.c
+++ b/hw/arm/cubieboard.c
@@ -21,6 +21,7 @@
 #include "hw/boards.h"
 #include "hw/qdev-properties.h"
 #include "hw/arm/allwinner-a10.h"
+#include "hw/arm/boot.h"
 #include "hw/i2c/i2c.h"
 
 static struct arm_boot_info cubieboard_binfo = {
-- 
2.41.0


