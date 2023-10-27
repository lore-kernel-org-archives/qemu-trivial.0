Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qwN6G-0003QU-UP
	for mharc-qemu-trivial@gnu.org; Fri, 27 Oct 2023 09:42:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qwN6E-0003Pq-Qr
 for qemu-trivial@nongnu.org; Fri, 27 Oct 2023 09:42:06 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qwN6D-0000I0-Aw
 for qemu-trivial@nongnu.org; Fri, 27 Oct 2023 09:42:06 -0400
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-9ba1eb73c27so331539266b.3
 for <qemu-trivial@nongnu.org>; Fri, 27 Oct 2023 06:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698414123; x=1699018923; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pJwLySfUF35zlxa5YOPsnj4pWWz4vwyKayb5dbl6BxU=;
 b=CkxAnJ+jndz9+lFtKAyo6cPzz4naivMtJ8SL1YlVEL+bbIyd/rtnP4DuhKjtUER2Cs
 sP5UzeJw/GXO5uYUWVd2Wn7KdYOT34u3kdSMnWHeA/iqwyOzVYYyellPatWCGsMNwN0Q
 S8d3TRi5MNrouuJthAlWEv6G+I05gQy9ruV4/l2bjjGvko0NqwnACZLr8VnYTQWdyPZW
 SGnpEdyGmp6W/ma8HveC9EmLtxbD03v/Gvp0Wtn39/5EIsGxaKKm25bKWnvSazofYm8S
 uxpUV0u9uYxQaYmXRPq9whE9f90gQMdqxLwB00BKR56a/7TLu9xLWDbUI06C/50gHd+t
 8VWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698414123; x=1699018923;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pJwLySfUF35zlxa5YOPsnj4pWWz4vwyKayb5dbl6BxU=;
 b=U3u5mULBlTrXLnsZOvsfvKSdWtVwS7D7Mu6DBaBwk7XfLDJFIUHecNBILHN8UQIpJR
 JxNFC1vU2cppxomvevZGUgqz07o3z4P+wwsiQRrkpFvPVVXbRAi/oPZ1QMp1n/KPTEBf
 zkG00dIhP3NL2abaBi7M/NHYuuTTdqzTxlnBxoUcmGZevx2vpVydkI7AK39Gvm37yPQF
 fbYdIeHO/Kc14FnFLXgE7xZ/l+Hs2VQfSxOZUd5Z9PLnkwXWmzSsxNgSMODmzQj49Tfg
 smUzsb6yzWi3cPMHbYL/1VXjbpp/ZjMtkH3ky0KYpib5PZ+nKiig603aXkhIIJ341Zlo
 9Atw==
X-Gm-Message-State: AOJu0Yy+ZsRC3/MaZdPCiLF81UI8uUwoMQT5aP2ekvCzylm+IBEj1BYk
 K1e5gGWxdXpYWEfCF89z+cxybg==
X-Google-Smtp-Source: AGHT+IHqvgyWMTNBQ3jZO134+fVbmX/Nv6XxmsrDVpQaBhllf7BoJndpMT+7syHF3aGtxG/c7NybGw==
X-Received: by 2002:a17:907:360a:b0:9c7:dc4e:1a22 with SMTP id
 bk10-20020a170907360a00b009c7dc4e1a22mr2305798ejc.48.1698414123642; 
 Fri, 27 Oct 2023 06:42:03 -0700 (PDT)
Received: from m1x-phil.lan ([176.171.220.131])
 by smtp.gmail.com with ESMTPSA id
 mf19-20020a170906cb9300b0099ddc81903asm1222768ejb.221.2023.10.27.06.42.02
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 27 Oct 2023 06:42:03 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>, qemu-trivial@nongnu.org,
 Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH] hw/watchdog/wdt_aspeed: Remove unused 'hw/misc/aspeed_scu.h'
 header
Date: Fri, 27 Oct 2023 15:42:00 +0200
Message-ID: <20231027134200.29906-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62e.google.com
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
X-List-Received-Date: Fri, 27 Oct 2023 13:42:07 -0000

Aspeed watchdog doesn't use anything from the System Control Unit.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/watchdog/wdt_aspeed.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/watchdog/wdt_aspeed.c b/hw/watchdog/wdt_aspeed.c
index d267aa185c..273a49d360 100644
--- a/hw/watchdog/wdt_aspeed.c
+++ b/hw/watchdog/wdt_aspeed.c
@@ -14,7 +14,6 @@
 #include "qemu/module.h"
 #include "qemu/timer.h"
 #include "sysemu/watchdog.h"
-#include "hw/misc/aspeed_scu.h"
 #include "hw/qdev-properties.h"
 #include "hw/sysbus.h"
 #include "hw/watchdog/wdt_aspeed.h"
-- 
2.41.0


