Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pEnij-0005eB-01
	for mharc-qemu-trivial@gnu.org; Mon, 09 Jan 2023 03:41:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEnig-0005cs-ME
 for qemu-trivial@nongnu.org; Mon, 09 Jan 2023 03:41:26 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEnif-0001e5-7L
 for qemu-trivial@nongnu.org; Mon, 09 Jan 2023 03:41:26 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 k22-20020a05600c1c9600b003d1ee3a6289so5997596wms.2
 for <qemu-trivial@nongnu.org>; Mon, 09 Jan 2023 00:41:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=B7l2Ne5QgaT9qY5iZJA1B6ys6kOA6AyFQ52dwLgtzLg=;
 b=iP864h/QCRmS1WRmtx7jLD+JiCBRkWvl75Ju0RXaqK5laEwzIMVwwHk2oIIBfoyhL0
 1xkQc7YSuV1s7t7tZpJWgdTYd75UO3+sa41QzGxzagXmA4nHw1keU3E2BXB8We4PDWKB
 xveVYQfxlJSCxi55YRq6rbUkmd971XkP1MFskoTZvi8VjWjxgJVOUG2XS8yrETUZQjjW
 c2BooFMIw7JcnCWi606teSzL9LgJLVEXWTznekzfeszBYxYTUlvoLcL30/ObNGDv39v6
 XfmHdcB+Ze0eyAdBBFNBBVXjTqNEraqKPv90ici+1vHp+bOhe6vj48G3/MmRqHgGuTTm
 ST5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=B7l2Ne5QgaT9qY5iZJA1B6ys6kOA6AyFQ52dwLgtzLg=;
 b=2qYPGqhSNuKpfAvrrvGeftKGf8/4LiaMvJYIp7yTYLMFgqeI8xIlYjsPXTw97RfIfZ
 RHxElhsxOqhbxwUPlFs+BZ45d0cNtbUoO6XO8egrCUoR/eYSifuwJDcXFlxlfUDRA5nH
 ROC+84N0WpUg/Wweay/eVzo0Fq4QIHkD1NEI3s4rmdfm8je2c0ytYhLh/nQVc/maBnOj
 OHda4Pw79ecOZXBCdqzbSzwBSkcv2sRhIWkYQdw5TkHvfv+AwjXtMqke0rlE3uNQAW/q
 KuGhznWgtTNZQ3pJ/0/kwsrRymNEEGYXBzBKA1JQNGwhmsF/r2fRx00xJ/zSt64Dx416
 Qs2A==
X-Gm-Message-State: AFqh2kp9SqDVl3VjIfcwk2DmxjZCdlSzVOgfIajXwkF5XmtgErVkJhe6
 9vcjlTLcY/hv1zbBv0vYaw1+rw==
X-Google-Smtp-Source: AMrXdXvw+2Cvuai1bwcvfvtxgNrRsJ0nOufX2/AC1IZ0sz1RMSb2toblswUIvXcfWEZoNikYlcF/0Q==
X-Received: by 2002:a05:600c:6003:b0:3d6:10e:68a8 with SMTP id
 az3-20020a05600c600300b003d6010e68a8mr46566564wmb.0.1673253683565; 
 Mon, 09 Jan 2023 00:41:23 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 h15-20020a05600c314f00b003d99469ece1sm16017146wmo.24.2023.01.09.00.41.22
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Jan 2023 00:41:23 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, qemu-trivial@nongnu.org,
 Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 0/5] hw/i2c/bitbang_i2c: Housekeeping
Date: Mon,  9 Jan 2023 09:41:16 +0100
Message-Id: <20230109084121.72138-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
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
X-List-Received-Date: Mon, 09 Jan 2023 08:41:26 -0000

- Remove unused dummy MemoryRegion
- Convert DPRINTF() to using trace events

(series used as base for follow-up, better if merged via ARM tree)

Philippe Mathieu-Daudé (5):
  hw/i2c/bitbang_i2c: Define TYPE_GPIO_I2C in public header
  hw/i2c/bitbang_i2c: Remove unused dummy MemoryRegion
  hw/i2c/bitbang_i2c: Change state calling bitbang_i2c_set_state()
    helper
  hw/i2c/bitbang_i2c: Trace state changes
  hw/i2c/bitbang_i2c: Convert DPRINTF() to trace events

 hw/arm/musicpal.c            |  3 +-
 hw/i2c/bitbang_i2c.c         | 81 +++++++++++++++++++++++-------------
 hw/i2c/trace-events          |  7 ++++
 include/hw/i2c/bitbang_i2c.h |  2 +
 4 files changed, 62 insertions(+), 31 deletions(-)

-- 
2.38.1


