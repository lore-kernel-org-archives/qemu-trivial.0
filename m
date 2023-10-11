Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qqYYe-0006Vl-Hd
	for mharc-qemu-trivial@gnu.org; Wed, 11 Oct 2023 08:43:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qqYYb-0006Oc-5k
 for qemu-trivial@nongnu.org; Wed, 11 Oct 2023 08:43:21 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qqYYY-0003C7-AC
 for qemu-trivial@nongnu.org; Wed, 11 Oct 2023 08:43:20 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-406650da82bso62800465e9.3
 for <qemu-trivial@nongnu.org>; Wed, 11 Oct 2023 05:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697028195; x=1697632995; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ISV6zsFK1CMKylDGnocB3bZI/sXgRYAOuOzMNfIpS3U=;
 b=WLCyWctEB/+AUb3qqtPfff9WPdE74dXj6W1Kqompb7j5AvF6rPCZsmf20ptf1klOPm
 mHLX6asMI/3VL262YanLiDDt3BazX3N717pADQI584tPM2TgHxrZ9Q+hXxs4nnaukROh
 YSmYOqyHJp7EKKwz1pz9WlR0t+VOF0mSCVHD8Whs4E8L8iryx5UsCw6gnsb/iisKnCuM
 lekWpjaNjVqxxj27GU/S6pbuoFhxkLpOd2uHhKVbGFA+Ik+3U34oqAIxSFDxZcSppjZ4
 Rhm8fZClfJabwq5G5OUvN4JsVZrfdjnXgBXx75yDSgyp6CB5waTal6jCxljmxUWkMip9
 geyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697028195; x=1697632995;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ISV6zsFK1CMKylDGnocB3bZI/sXgRYAOuOzMNfIpS3U=;
 b=R8OS5o7TSG/IlTivJiKgI2XPD9UsI4Ipdfi3BRoIApil6zcPAODY3TJgAb0GxApaAr
 rAjTzuVtPgsOYclZ2sK0bFzZRl/9cNe4tf4MmgvL5eEhoWjR9EjQxTlMl+VkNFCzqCiD
 rJSIkgkimEefRd8S5uG/By2U90RcEo20yKg5OcPIa9g9YmiV15i5OCys5odVeGQ2nedz
 sOMPaRqzqrgt+o2eAlEjnRuZWJdaMawXlCFhpUBtcpRptsPN+G94V8H6agKxvZuS06gQ
 AEXbu43Xt2lUvak/nwcB7J/7K2g7xmdYUknTiWn4nePu7yk2NJPCZ9gM4HegyBmrfkr1
 DcfA==
X-Gm-Message-State: AOJu0Yy/0jbONfcNbZXXH3PWKtdbf/foS1fbOfn4skxMxfFpYv7B2FIn
 cTPuoblU9GmuSeBCGlGszR3QVg==
X-Google-Smtp-Source: AGHT+IEDnLP6ApTX2K1eKktsFqYbYSWX+JmqLoJV/vG02c/yq5xUREXnNdcWLCsU80cXYdE0HhiewQ==
X-Received: by 2002:a7b:cd8c:0:b0:401:bcd9:4871 with SMTP id
 y12-20020a7bcd8c000000b00401bcd94871mr19747351wmj.21.1697028195209; 
 Wed, 11 Oct 2023 05:43:15 -0700 (PDT)
Received: from m1x-phil.lan (mdq11-h01-176-173-161-48.dsl.sta.abo.bbox.fr.
 [176.173.161.48]) by smtp.gmail.com with ESMTPSA id
 m19-20020a7bcb93000000b003fe61c33df5sm19091110wmi.3.2023.10.11.05.43.14
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 11 Oct 2023 05:43:14 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: BALATON Zoltan <balaton@eik.bme.hu>, qemu-ppc@nongnu.org,
 qemu-trivial@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 0/2] hw/ppc/ppc440_uc: Maintain and remove dead code
Date: Wed, 11 Oct 2023 14:43:10 +0200
Message-ID: <20231011124312.60476-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Wed, 11 Oct 2023 12:43:21 -0000

- Cover ppc440_uc in MAINTAINERS
- Remove dead code

Philippe Mathieu-Daudé (2):
  MAINTAINERS: Cover hw/ppc/ppc440_uc.c with Sam460ex board
  hw/ppc/ppc440_uc: Remove dead l2sram_update_mappings()

 MAINTAINERS        |  1 +
 hw/ppc/ppc440_uc.c | 40 ----------------------------------------
 2 files changed, 1 insertion(+), 40 deletions(-)

-- 
2.41.0


