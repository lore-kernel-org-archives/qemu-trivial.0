Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1stlch-0005PN-O9
	for mharc-qemu-trivial@gnu.org; Thu, 26 Sep 2024 06:21:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1stlcf-0005OO-Gt
 for qemu-trivial@nongnu.org; Thu, 26 Sep 2024 06:21:22 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1stlce-0000MA-0k
 for qemu-trivial@nongnu.org; Thu, 26 Sep 2024 06:21:21 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-42cb58d810eso12305935e9.0
 for <qemu-trivial@nongnu.org>; Thu, 26 Sep 2024 03:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727346077; x=1727950877; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ARgJuVYou0E4VVmswK8zO7oNcaiQjYHO4FNJULuCZqY=;
 b=Bly7Skad2DmbYApu4HjJ1YUXSvE47c+yulK2w+XeSEaqh3KDSbvrgUVt3XCsV+4xAc
 HNQYAdlkbGoH+7/RbxoV00/dXB8Y/9G3SjPN0mT3dLgrZF3f7MOjyPpNcqRvc8zBTsvE
 sWP28AZ1kZPnJ2pMzIvnwXk/pegIDJhkKRNIhuOLyDhH5L/1a8WKHtnwa0oyFt6Bw57W
 bFM0wEMkRyxJp52y67JQbvM0sw/i/AIKUVqcXD7kx+d3Rffzk3hmqdUpJBXFT44H+dq0
 +C1D7dCcP2ASsSVYHTAAfJI7DAHYBcjIqGM8fdB1+8Wiv70sUYtY1m1V4jts/QKuiF8M
 Dn7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727346077; x=1727950877;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ARgJuVYou0E4VVmswK8zO7oNcaiQjYHO4FNJULuCZqY=;
 b=tq9nc90rpF6w8wBuX5dWTv7LS4aEa+NhtsmY+3BEgalEbTi6cVt31eXYlhBiZcECLd
 loxQDsq4ckvE8qUI0Zz0FlNkl2v0KhTdtKDblJK00rUVAZY/YDZ91EwTitW9D7RE1jeZ
 onkcyvi7Ix5u77yAHOE/Sjb1y1ZrKF9trMGCYj6KripiPPPTWKfIacnEj1KNVpFqTub3
 0Au4a5nrTLbWwbu0kRRBX76GN3WS5ttE+sBpKc38ejmUXVsqbJwtZhuu7D4qCtNQnDyc
 CaPIbC5cylWpJpL3aazz2rdkBmX1MF8UlFRS+f5r/6XbuR/LiF3Tx1jIcuJUAiI/0v4H
 3XQA==
X-Gm-Message-State: AOJu0Yz4sj/PaHTvibTiW0OiYc5pw0+dOx9hUTjp18NYcLa7X3TidJ+C
 s8kWQFiSRHEiQtT9n021petVSidTBvfU/w/lfFpk2RblatVDfjB8uuV4bPs5bDI=
X-Google-Smtp-Source: AGHT+IHLxGe33Ku/mE1BNbe3bmPbTA/m1VzdjLq3kcpNCSLVX57xfGFuUtjUZdaSLwOj4PCSLoXqQg==
X-Received: by 2002:a5d:64ae:0:b0:374:c2a3:63cb with SMTP id
 ffacd0b85a97d-37ccda72703mr1930694f8f.0.1727346076656; 
 Thu, 26 Sep 2024 03:21:16 -0700 (PDT)
Received: from localhost.localdomain (120.171.88.92.rev.sfr.net.
 [92.88.171.120]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37ccf3a4716sm1302184f8f.65.2024.09.26.03.21.15
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 26 Sep 2024 03:21:16 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH] hw/audio/virtio-snd: Remove unnecessary "exec/tswap.h" header
Date: Thu, 26 Sep 2024 12:21:13 +0200
Message-ID: <20240926102113.64890-1-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 26 Sep 2024 10:21:22 -0000

We were including the "exec/tswap.h" header to get
target_words_bigendian() declaration, but since commit a276ec8e26
("hw/audio/virtio-snd: Always use little endian audio format")
removed this method call, we don't need this header anymore.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/audio/virtio-snd.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/audio/virtio-snd.c b/hw/audio/virtio-snd.c
index 69838181dd..c5581d7b3d 100644
--- a/hw/audio/virtio-snd.c
+++ b/hw/audio/virtio-snd.c
@@ -20,7 +20,6 @@
 #include "qemu/log.h"
 #include "qemu/error-report.h"
 #include "qemu/lockable.h"
-#include "exec/tswap.h"
 #include "sysemu/runstate.h"
 #include "trace.h"
 #include "qapi/error.h"
-- 
2.45.2


