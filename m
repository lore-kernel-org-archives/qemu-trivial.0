Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1snz3I-0007uW-07
	for mharc-qemu-trivial@gnu.org; Tue, 10 Sep 2024 07:28:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1snz3F-0007tX-6Q
 for qemu-trivial@nongnu.org; Tue, 10 Sep 2024 07:28:53 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1snz3D-0003Qh-Io
 for qemu-trivial@nongnu.org; Tue, 10 Sep 2024 07:28:52 -0400
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5c27067b81aso5516978a12.0
 for <qemu-trivial@nongnu.org>; Tue, 10 Sep 2024 04:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725967730; x=1726572530; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7IJQz062XEcKffx5qVwimty50F+XhBG7KCKIdS+RdzI=;
 b=tod/dAOe9RXC2QPs8KRRIJFPfVln6pfWNVHzJN7GYDFKyORfqOzg3jAcq8o/m9DTjL
 I2C3/g7sjVhsmjDXUG44Pz17PMFutc1oGmsbLSf5glc6/LRvF+6G0Z4MZ3jNDoNstl9c
 8b4zumHdEg/hq9YPvfP39k9n1tsJ/op6UZ6+aD34NGZTWCSOR3w23jw3E/2fjiH8gaqW
 aie+QwzwxsimvlEVk8rXkscWx6lzCKXPbRA3UCL4exXbZhY4YXaYckzBEzNBxf2B7tY7
 ndwyg7oumvU0eojUzUZp2lWbPOfmOUN80nItqGFzRGMOCPvgnE6sI0q1JuDOkLvYd1jE
 ee/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725967730; x=1726572530;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7IJQz062XEcKffx5qVwimty50F+XhBG7KCKIdS+RdzI=;
 b=DCt8vF32bijooVziXhwXGHc8MdjXpFVfCLTk4/+Kb9c9TH5/qH6/f1YDsTaSYCK9tC
 GxSy7cNzDIbKrZacv3mDL0RxrYaMdGTtRWH121PPSGqRo52FZqFRVnrg1aOv5jgfrmNC
 GsdvxFPWBUrJYGX2l4FpMEFu2QIH5eKtDQLCQs2wMEl8nBt+KTWpLpMu8ad69URqyFEN
 G018QqPM1xtEtU2GdKwzIIQ89ACfFTDy/HUY90ulCHZ9IlfQ1AKMny16TkUOb69MTgOW
 FEDuF+0c1tjzSo/GPf0IQcW83DFDCDpxwgBaDBc2fZ6PEKmPhuM+LlO/oFfvgi+xxBdC
 o9AQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZf+JJcaye4tcjCqvkg2TK+uLBDDW7kR1s8rafzDkZGFWMUVU4XoroQ/hTTZdg9Pxegu55T7/Ac4saO5M=@nongnu.org
X-Gm-Message-State: AOJu0Yw/0fSJleEDWI9ARV8NO+kh3XY99hGXcQ5ZoiY4S1K9DzVh1tE/
 9DymgNRNqKis1wUH+aX0UyzP1nk2MkTTd6MLh/Fcy5PA72Nq7KgL4aq3rO+WKic=
X-Google-Smtp-Source: AGHT+IFJx9ZYaXhA7CsNHXFW5t+enU0rDqsDQwXZzYNe6Wm9vw3DlrUA+sRGnzf1FmPkn0oymjVanQ==
X-Received: by 2002:a05:6402:5419:b0:5c2:54a3:6b3e with SMTP id
 4fb4d7f45d1cf-5c3eac064a2mr6508715a12.16.1725967729845; 
 Tue, 10 Sep 2024 04:28:49 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.217.32])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3ebd520cesm4111925a12.50.2024.09.10.04.28.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 10 Sep 2024 04:28:49 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Brian Cain <bcain@quicinc.com>, qemu-trivial@nongnu.org,
 Anton Johansson <anjo@rev.ng>, Alessandro Di Federico <ale@rev.ng>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 2/2] tests/bench: Rename test_akcipher_keys.inc ->
 test_akcipher_keys.c.inc
Date: Tue, 10 Sep 2024 13:28:33 +0200
Message-ID: <20240910112833.27594-3-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240910112833.27594-1-philmd@linaro.org>
References: <20240910112833.27594-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52a.google.com
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
X-List-Received-Date: Tue, 10 Sep 2024 11:28:53 -0000

Since commit 139c1837db ("meson: rename included C source files
to .c.inc"), QEMU standard procedure for included C files is to
use *.c.inc.

Besides, since commit 6a0057aa22 ("docs/devel: make a statement
about includes") this is documented in the Coding Style:

  If you do use template header files they should be named with
  the ``.c.inc`` or ``.h.inc`` suffix to make it clear they are
  being included for expansion.

Rename "test_akcipher_keys.inc" as "test_akcipher_keys.c.inc".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/bench/benchmark-crypto-akcipher.c                         | 2 +-
 .../bench/{test_akcipher_keys.inc => test_akcipher_keys.c.inc}  | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename tests/bench/{test_akcipher_keys.inc => test_akcipher_keys.c.inc} (100%)

diff --git a/tests/bench/benchmark-crypto-akcipher.c b/tests/bench/benchmark-crypto-akcipher.c
index 5e68cb0a1c..fb88106a0c 100644
--- a/tests/bench/benchmark-crypto-akcipher.c
+++ b/tests/bench/benchmark-crypto-akcipher.c
@@ -16,7 +16,7 @@
 #include "crypto/akcipher.h"
 #include "standard-headers/linux/virtio_crypto.h"
 
-#include "test_akcipher_keys.inc"
+#include "test_akcipher_keys.c.inc"
 
 static QCryptoAkCipher *create_rsa_akcipher(const uint8_t *priv_key,
                                             size_t keylen,
diff --git a/tests/bench/test_akcipher_keys.inc b/tests/bench/test_akcipher_keys.c.inc
similarity index 100%
rename from tests/bench/test_akcipher_keys.inc
rename to tests/bench/test_akcipher_keys.c.inc
-- 
2.45.2


