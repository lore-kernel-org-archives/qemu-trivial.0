Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1soP1J-0003h0-PZ
	for mharc-qemu-trivial@gnu.org; Wed, 11 Sep 2024 11:12:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1soP12-0002Tq-Ll
 for qemu-trivial@nongnu.org; Wed, 11 Sep 2024 11:12:24 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1soP0z-0001Hn-KP
 for qemu-trivial@nongnu.org; Wed, 11 Sep 2024 11:12:19 -0400
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a8d0d0aea3cso696665566b.3
 for <qemu-trivial@nongnu.org>; Wed, 11 Sep 2024 08:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726067535; x=1726672335; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C6fs1IUTb9TPohRF9BBRWmVTfcqz5qZnUo2BPeCal4E=;
 b=f8caxWHhJZiWO7x9aCSYJxqZOjGtYytgOrWhNGzWIvTVTC3yP0iO7+XgpFMdkGjxOY
 mDUn+TuLNxXPS6Sw1X5gpSqmxbQMd6m1ku6aus/jOj3AKKmldvtjrM6KDEIZeT/Xa/QN
 CORcRIa1jgZlFFOwv6zT6RB5XSLzZ0rIO261AVr6CUObbMya+h7d56Kfa7MkDqiF4Wtm
 L05pBv2r48fEOT1QERvmlspC08Ofo078Ag2B97NzIyEAlAUfvQz1ha9thRFHQfF/YRYM
 2SoFqON8qS086BqJNaheQlijlRal6RT1IWfOJyVGQkA9Z2rUHpvHDOpyHLY5+f0AjeEw
 CK9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726067535; x=1726672335;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C6fs1IUTb9TPohRF9BBRWmVTfcqz5qZnUo2BPeCal4E=;
 b=UHQUYjdaABnjIK3/M+ny3s6ABI/Zy6A9C5iZsC9LGbkZc5EDm10/RmhcK8jGhElflF
 GlHZqw6HP+beDeceen0dg4jLiMFedft57IeOrmLhnbU4wFTvpF3ns0iiHmk+SfxNRFaL
 OFr8OIXfKDLzGr5pWMUG6xWAIC9r/r80BndkoGs4WyfAIpkx8azyweeJyXTsh5zTSdk3
 BeTqjvSKtop9aOx3Pk2ZlkO0TcSThApthl8LjNrGUZOqbswq2LtFn5ms7KbIKWX9Vdmx
 BIODBJDcWXi9oNj4Yt1/cjheM7sysfrTDwJZBEcycmhGjvroeS6OY4KfLXl6nQs9Myo6
 /AoA==
X-Gm-Message-State: AOJu0YwwsMUWVz+qbLt66B8i+dRpte8r68QxYc+NWic0ZCIipgRsLRMT
 KTw01dKYe0WJPFSx8qjvuCP5Ons1sLeBM8MVvW36XjUhklErdFKcVII5Z54HXC8=
X-Google-Smtp-Source: AGHT+IGo6R2XSv1js1cRDObLgzNHOxBnfDzrJwBvvPiW2xMsHCcXyzA1FX1VYQwBzdRID1Rmn8nBPg==
X-Received: by 2002:a17:907:7294:b0:a86:96d1:d1f with SMTP id
 a640c23a62f3a-a8ffaadafdbmr488357866b.26.1726067535402; 
 Wed, 11 Sep 2024 08:12:15 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.196.107])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d258338a2sm626940566b.43.2024.09.11.08.12.14
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 11 Sep 2024 08:12:15 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Subject: [PATCH v3 1/5] tests/functional: Correct typo in
 test_netdev_ethtool.py SPDX tag
Date: Wed, 11 Sep 2024 17:12:02 +0200
Message-ID: <20240911151206.60368-2-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240911151206.60368-1-philmd@linaro.org>
References: <20240911151206.60368-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x633.google.com
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
X-List-Received-Date: Wed, 11 Sep 2024 15:12:32 -0000

Cc: Alex Bennée <alex.bennee@linaro.org>
Fixes: 9f95111474 ("tests/avocado: re-factor igb test to avoid timeouts")
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/functional/test_netdev_ethtool.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/functional/test_netdev_ethtool.py b/tests/functional/test_netdev_ethtool.py
index d5b911c918..ee1a397bd2 100755
--- a/tests/functional/test_netdev_ethtool.py
+++ b/tests/functional/test_netdev_ethtool.py
@@ -5,7 +5,7 @@
 # This test leverages ethtool's --test sequence to validate network
 # device behaviour.
 #
-# SPDX-License-Identifier: GPL-2.0-or-late
+# SPDX-License-Identifier: GPL-2.0-or-later
 
 from unittest import skip
 from qemu_test import QemuSystemTest, Asset
-- 
2.45.2


