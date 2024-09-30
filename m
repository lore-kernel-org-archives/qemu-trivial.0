Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1svBCT-00066s-Iu
	for mharc-qemu-trivial@gnu.org; Mon, 30 Sep 2024 03:52:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1svBCR-000601-RB
 for qemu-trivial@nongnu.org; Mon, 30 Sep 2024 03:52:07 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1svBCQ-0002FU-48
 for qemu-trivial@nongnu.org; Mon, 30 Sep 2024 03:52:07 -0400
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a8a7596b7dfso498475366b.0
 for <qemu-trivial@nongnu.org>; Mon, 30 Sep 2024 00:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727682723; x=1728287523; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/XjK5WcFDf2fFTQGUJSEkzp7XAmv+Yjy0CIT72sbc8g=;
 b=DgiBqnEv+788zkidNsm8C9DKtXwOY1TMV6hP/rJLtJTK38P6RW1RGwCTWG7yWWkW15
 YM0yYDX4j1HgA7GCidlHBOYnJYvehRRGp50uHRunvTzR2CsXjOWNAW6ar5W39SnjBz4u
 rKI+0pOPUbe3n4KP8Z7PtMfGG9NznO60i1oH2Bi2asWCOC60rMuy9UwPP9xuT/hg7U8I
 p++xWtVfFhKJGGba85byzfdLM6k5s1M9oz4D3YpUHrnN/uDBOX7PO7FqF2zfzJqaWAVA
 s/EzqMpnXoCzrSklRWNeZ+RWtfGcGpJyROC8q0rk+kQSUQ04Q1Uq5AteHZNx3tXZ2lTE
 Yq8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727682723; x=1728287523;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/XjK5WcFDf2fFTQGUJSEkzp7XAmv+Yjy0CIT72sbc8g=;
 b=BvzeBBmmSOxeZyxXOFW1+z1zDhnv+4D/dbkZQVsKAMOZEy6XCgfG5iq/VQTx6GR6Jr
 ei3dvTcxxV77knMmQ1PFQDzEnVWEkv8I4nyZqQ8YvmNoOxVg9y5WVvmn8FaaQ6eFtHnd
 /antPMjBdRnS9vJg/N5nWkVT0pehGg+7n8JIT7TJJly2LJzvQo1hVVsQg2vaIxbNL/RF
 6Izj7Y0Xs6z9/qPh6bJF7Gk9JI0MkTSKNXe2MPGk7fSbjImHE/KIAXts7p3lZt72I9LK
 VfEPOjQ85OtGROs9OvD2rM5mm4nMDvgWBWaQ/Tp4Le4oUk+Mr+ES01qcCCZuDOSH+BYj
 Sx5A==
X-Gm-Message-State: AOJu0YxPAzI+IYXXP+7WYDKK7dDbFPevTgChqsug/U+O721ofejcwgRL
 dnfni0U9tRJflpniYoFDKuSVIioliha1v7i2Uf2VfOxQisUThec0rOHmgun92krQcZnFyF4vXY1
 4
X-Google-Smtp-Source: AGHT+IHabe0gVWNRqNBo/wNfJsgiQVOcirDK/HqGFwNJ/hTfid9ZO6v73sKFKKewOD7SgqyMLJkCMg==
X-Received: by 2002:a5d:49ce:0:b0:374:adf1:9232 with SMTP id
 ffacd0b85a97d-37cd5696e86mr6036435f8f.19.1727679620487; 
 Mon, 30 Sep 2024 00:00:20 -0700 (PDT)
Received: from localhost.localdomain
 (115.red-88-29-173.dynamicip.rima-tde.net. [88.29.173.115])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37cd57429e5sm8234948f8f.98.2024.09.30.00.00.18
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 30 Sep 2024 00:00:19 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH] hw/mips: Build fw_cfg.c once
Date: Mon, 30 Sep 2024 09:00:15 +0200
Message-ID: <20240930070015.28244-1-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Mon, 30 Sep 2024 07:52:08 -0000

Nothing in fw_cfg.c requires target-specific knowledge,
build it once for the 4 MIPS variants.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/mips/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/mips/meson.build b/hw/mips/meson.build
index ca37c42d90..fcbee53bb3 100644
--- a/hw/mips/meson.build
+++ b/hw/mips/meson.build
@@ -1,6 +1,6 @@
 mips_ss = ss.source_set()
 mips_ss.add(files('bootloader.c', 'mips_int.c'))
-mips_ss.add(when: 'CONFIG_FW_CFG_MIPS', if_true: files('fw_cfg.c'))
+common_ss.add(when: 'CONFIG_FW_CFG_MIPS', if_true: files('fw_cfg.c'))
 mips_ss.add(when: 'CONFIG_LOONGSON3V', if_true: files('loongson3_bootp.c', 'loongson3_virt.c'))
 mips_ss.add(when: 'CONFIG_MALTA', if_true: files('malta.c'))
 mips_ss.add(when: 'CONFIG_MIPS_CPS', if_true: files('cps.c'))
-- 
2.45.2


