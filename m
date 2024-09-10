Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1snzPk-0004Jx-2W
	for mharc-qemu-trivial@gnu.org; Tue, 10 Sep 2024 07:52:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1snzPV-00045V-JZ
 for qemu-trivial@nongnu.org; Tue, 10 Sep 2024 07:51:59 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1snzPS-0006Xq-IH
 for qemu-trivial@nongnu.org; Tue, 10 Sep 2024 07:51:53 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5c3ca32971cso996343a12.0
 for <qemu-trivial@nongnu.org>; Tue, 10 Sep 2024 04:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725969109; x=1726573909; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S0tP38q2aXeMtCrKpnNgEUV5n804wzkdrcUKmPP1+h0=;
 b=kSnLSsrUEFdPc6I9xKqoTH3UFAbmoOGg6/0qmx8B0sCbxlOq3LxgcQEPezDDL6RWX4
 ph95tO6IDCDpPbcKty/8sgrM64YiL5HgSjkYKQfJwHCQHU1XKwQKDZCMqwfBF1JzSnET
 5kUD9ekLsCGakPwu3MOTD8r0kxURtENbYN3lLj7Bukroine2EV5hxPUVs4ftlHWGSsKp
 qR9HTrGOuFJAMyZd0JGmMtul+6MNkJtA9XUC/R2pscAHHDra0UkFsBv3Q+vrW+n5N4lU
 5wqzueLujSlJ1ZwVdTMqFSqRLf6akfHFIDXfeMHeKQz81K1dW3GmKLAMnl4Ptr46WAnK
 hdMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725969109; x=1726573909;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S0tP38q2aXeMtCrKpnNgEUV5n804wzkdrcUKmPP1+h0=;
 b=KdAKlIMvkzPst7phP8Y4OlPhzntk9sCjlQmtQfQrxI9Q+mcXSfVGai04HZLnqbrdKC
 x7dIMPfi6qchJ52bdArcsTGauR1lRiXDdpeCZrqanPfeieqPlhtPHAO8dY6axMavBhgH
 6RZoJbTOgbRWPP6Vyn/lWv0AgcfO+37OIALkdft2FGRrLo2mKWzxx8gEr5cVb/UhKIYf
 FUy1/x/plAPzQMQB/5PFlnYRH/Vdu/0QdjmPytOrmQRnt0FiwvDCEM4HE/3+Q2HSFFGm
 3r1gIFujSeZi3AAFMdTHFt7PPhr+4Fmn4dGntLq9B5Gju0o5H/yCexMN8AOc/acpU1IF
 6MvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIMiSJ6Lah3aCgUOuXBF3L7Sj/grnI1a8wKvoYP5SlqG05zVzSNZ5B9GIOzfDXasrGyiA9yWCne76mzpM=@nongnu.org
X-Gm-Message-State: AOJu0YzauOxuVMrLgzpvqvBsQTnGo/NuJx96Qt3PNPkXrYZpkm5MwgBg
 K3lxP2AcmxXSLRmk1Ro/5tUsysoRhVx7KX7KRkRcM/bbqzaJ3Pw9AqkgcyMvHoE=
X-Google-Smtp-Source: AGHT+IEzXBUCDbooUfQmm1Y7MsfG8eOhWmJ4LhAsjX0o+QtCoHa6colNT/ObDxaXfyjiD47WeQWfIw==
X-Received: by 2002:a05:6402:448a:b0:5c2:632e:fad7 with SMTP id
 4fb4d7f45d1cf-5c3dc7955famr10749585a12.15.1725969108435; 
 Tue, 10 Sep 2024 04:51:48 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.217.32])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3ebd8cc33sm4188219a12.87.2024.09.10.04.51.46
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 10 Sep 2024 04:51:47 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Stefan Weil <sw@weilnetz.de>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 2/5] tests/functional: Correct typo in test_netdev_ethtool.py
 SPDX tag
Date: Tue, 10 Sep 2024 13:51:28 +0200
Message-ID: <20240910115131.28766-3-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240910115131.28766-1-philmd@linaro.org>
References: <20240910115131.28766-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x534.google.com
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
X-List-Received-Date: Tue, 10 Sep 2024 11:52:04 -0000

Cc: Alex Bennée <alex.bennee@linaro.org>
Fixes: 9f95111474 ("tests/avocado: re-factor igb test to avoid timeouts")
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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


