Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uBhLT-0007Wj-Q0
	for mharc-qemu-trivial@gnu.org; Sun, 04 May 2025 17:57:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uBhLR-0007Vn-Gf
 for qemu-trivial@nongnu.org; Sun, 04 May 2025 17:57:57 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uBhLQ-0005Ce-46
 for qemu-trivial@nongnu.org; Sun, 04 May 2025 17:57:57 -0400
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-22c33677183so43679935ad.2
 for <qemu-trivial@nongnu.org>; Sun, 04 May 2025 14:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746395875; x=1747000675; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4IkZ6rX56LKQaeRF12GcjWtnMJwwMH7mXS6+CURuUmU=;
 b=Af4ooutyageaA+AS8szEtxgGcs7sFYLyBiX4iSq3vxxCF9lZs0rc7aut5t7dhzCuUD
 jve0dFcm8ObnXuVTjHCng8lT8eG1C2EEx7EEkNRKE/5SpNHv0pMG9Q+XONXXQsQkrHPI
 eNyEJl+RGgszU2t8BjBLVntoIaKv9xuubX1jN2c7v8GGDF1X0CCKSXkf8UKmKRUTKi7I
 r3N5YeurCpa2KyrzEgNihHVl8ke8Pag6yQRPKUKwneOkwyfUV1qCIBsiVhfTF1qB7Rwj
 uivSX5vqWVTXhnxXKtYPN2Sy6R28rqh/pZ8lfi+eUAd+DqcKzhS3i+9kOZlxV2ONvTWX
 SGcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746395875; x=1747000675;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4IkZ6rX56LKQaeRF12GcjWtnMJwwMH7mXS6+CURuUmU=;
 b=vEpiCvBOfuFjpz26flqLI6ILr28cRC7NoY71Z5rxCLEyeYukZXdAgSm1J+amS3AdWr
 WvyE07FOiA+kqUeu4K45+5glhhNpleke2XIqkVNkoX2VnbttODz7jgGjyjjacAi9H+B8
 4udc1lRdSXhNnevvRWtCT0SpySTVox3Yvz8qH6fmfsH8Gd5u07eTQ27NK5cGhWHuhlfC
 lb0KiUoxpQbOcmIuqozBZHCl3mcj1zvDWwW1L5BX6ceo1k96xGF+qwhCbzJEqYwH3ePv
 1/a2bsxMv+Xj/XXCh4ATyI0rzVeWQKIUgjfUxVMMAjjF+/LMsUrXgslWMLq9teMlkkX/
 l32A==
X-Gm-Message-State: AOJu0Yw2RLbSVpZqvVrvx8+JgK9okafsvcqSPWqJx/sJMA0cbeilWHQV
 jRq9QqMrr8D/5PWh+omcVKv83bqGGJC2YUddXE/S5T1hKfc41bQMwuuJYYQHCII=
X-Gm-Gg: ASbGncsSfnw5Z7mFC0zurfeJM7Zrxtgj3VJB91HjptT7DfnAVH/EutT68O4w91NqIpz
 nCKmxhuALiMx2a50qhbiWVqMKr5XfSAgNirXLwO72YNf9IryrfxHBpHIzpAKfpLmvV/euXdmQBi
 O4JkBb/GGmmGeGJSEMXjQE5XXi4t1ZI1hN2kKUpBAFFybYcwqeff3YeetdFefLqfMrnzXtBUCl9
 pL4dlLAN66pqFc9BvyLC4BrI4h9nqRzMOIKAoi6M/jCC0pbHg6zF39YSR49t8jTZ5JtR9vzv55X
 mss6f1VG1HVFhqmJ6B4l8etyeXBuN8vxDNUK0hSs+I0tb0kG
X-Google-Smtp-Source: AGHT+IH3Dy6ZWpC1LCQVSAT5pW0VCitpjDb+UBJtRpZwdsHcgCtkN8WOEsYnwb/qSI0lPJ99iNC9Pw==
X-Received: by 2002:a17:902:e750:b0:227:e7c7:d451 with SMTP id
 d9443c01a7336-22e1eaa4478mr76337595ad.29.1746395874851; 
 Sun, 04 May 2025 14:57:54 -0700 (PDT)
Received: from gromero0.. ([200.150.181.215]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22e152204fesm41664875ad.137.2025.05.04.14.57.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 May 2025 14:57:54 -0700 (PDT)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, philmd@linaro.org, alex.bennee@linaro.org,
 gustavo.romero@linaro.org
Subject: [PATCH] hw/i386/acpi-build: Fix typo and grammar in comment
Date: Sun,  4 May 2025 21:56:35 +0000
Message-Id: <20250504215639.54860-7-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=gustavo.romero@linaro.org; helo=mail-pl1-x62e.google.com
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
X-List-Received-Date: Sun, 04 May 2025 21:57:58 -0000

Fix typo and verb conjugation in a comment about FADT initialization.

Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
---
 hw/i386/acpi-build.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 3fffa4a332..b5836417a0 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -139,7 +139,7 @@ static void init_common_fadt_data(MachineState *ms, Object *o,
     /*
      * "ICH9-LPC" or "PIIX4_PM" has "smm-compat" property to keep the old
      * behavior for compatibility irrelevant to smm_enabled, which doesn't
-     * comforms to ACPI spec.
+     * conform to the ACPI spec.
      */
     bool smm_enabled = object_property_get_bool(o, "smm-compat", NULL) ?
         true : x86_machine_is_smm_enabled(x86ms);
-- 
2.34.1


