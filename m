Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1snzxC-0007nE-1P
	for mharc-qemu-trivial@gnu.org; Tue, 10 Sep 2024 08:26:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1snzxA-0007gr-FX
 for qemu-trivial@nongnu.org; Tue, 10 Sep 2024 08:26:40 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1snzx8-0003fV-J9
 for qemu-trivial@nongnu.org; Tue, 10 Sep 2024 08:26:40 -0400
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a8d60e23b33so266506766b.0
 for <qemu-trivial@nongnu.org>; Tue, 10 Sep 2024 05:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725971197; x=1726575997; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u2Lzz72uA0m2TQJZ42QIGkbSlS4YxmlVZGvzRWw4vAw=;
 b=LhK3o5iVtHACOww/vJYRBMs+Q+fESt+u5jtWK9e9DgrU80Hca9TnefnZS52aqUqhnq
 FnIAT+Q2Pp7Fdcu3O/2cHwbaEw2BV8hy3jKPi9X/xYHWWhzPTtFYrm7C7sPz+Ge6UyCv
 HISqgqnNH3CfWhoz34GRdIbDVg6rpI2+cOLv3TE5Ek0AWH92JsAv7m0+Wtl72aeKaOHZ
 +wWPvExSWgYJYQir0D0nPmv8W76A/4mZ8y98sKCI9HySSaiQ7NMl8oX5xdmhyhB+/cCb
 RcWncHs4XLhvlOZN9ejIbNdd3qXMoXBgwclv22zgjXzX5NjlJOUohv+R8LaIkld9HKI0
 YKuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725971197; x=1726575997;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u2Lzz72uA0m2TQJZ42QIGkbSlS4YxmlVZGvzRWw4vAw=;
 b=GGBBBHZdr47Qgr/H+J4D89H75BJvLQvUuz2OVo/qT+e5umIJL10+WE1RROd91b2njh
 c4YluNbLv/QpCvooaKKGRCuGQe5icoiK0yMKAg6wYlZmBeh5NTgf5P0b+u1yvysXMG+Y
 XK0QjF2i62jpDMtBzOXxgmW5XEHDWxKE7EcH8KUiGKWg9HgNr0dy6ZrbLhPKhdTEWdg0
 YWdW8AqdXths+ha2fCJqZ2KG/4adZ4a5ZOLcHEmsmhebOA1aX3gQ4ZQVG9atnTG7keUZ
 maTL2i9w0BKa6a5DgbeI9NYClcDwNDB6lo8iiN5/cGfgGr0VNrUgvCFY4+GBpsJhZwYc
 9IpQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZd7DYgoj5WjOaDjSjox9Yk7P4aupJnxqiKlDzWN2wbWP77DAIwLfMsIQdi3jmt/G6t3t3Oi3YXx+lMG4=@nongnu.org
X-Gm-Message-State: AOJu0Yw6EHoX+DGWFiJh3enQWiXHKbaIq5frfug1sG4niahOraL+nxcS
 TOvTjIZuyi5IatLRg0Wed2WD926onwmJghSnPiccNIJ/NHc8sTVnprVi86Ma8hDoTzOaUKNPZPF
 S
X-Google-Smtp-Source: AGHT+IHP2xUMYwNTGa132hPW/frSnnAJjKWOf1ndbm8IcFMD4+X1TQFeWanAqRYzTZHZlKA2/hpSmA==
X-Received: by 2002:a17:907:7f29:b0:a7a:ba59:3164 with SMTP id
 a640c23a62f3a-a8ffae0b899mr55866066b.53.1725971196780; 
 Tue, 10 Sep 2024 05:26:36 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.217.32])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25c72815sm478828866b.140.2024.09.10.05.26.35
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 10 Sep 2024 05:26:36 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Stefan Weil <sw@weilnetz.de>,
 qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 2/5] tests/functional: Correct typo in
 test_netdev_ethtool.py SPDX tag
Date: Tue, 10 Sep 2024 14:26:15 +0200
Message-ID: <20240910122618.33056-3-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240910122618.33056-1-philmd@linaro.org>
References: <20240910122618.33056-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x630.google.com
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
X-List-Received-Date: Tue, 10 Sep 2024 12:26:40 -0000

Cc: Alex Bennée <alex.bennee@linaro.org>
Fixes: 9f95111474 ("tests/avocado: re-factor igb test to avoid timeouts")
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
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


