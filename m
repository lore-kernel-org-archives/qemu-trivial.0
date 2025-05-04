Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uBhLS-0007W9-9H
	for mharc-qemu-trivial@gnu.org; Sun, 04 May 2025 17:57:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uBhLP-0007T1-Gb
 for qemu-trivial@nongnu.org; Sun, 04 May 2025 17:57:55 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uBhLO-0005CC-2K
 for qemu-trivial@nongnu.org; Sun, 04 May 2025 17:57:55 -0400
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-2254e0b4b79so56203455ad.2
 for <qemu-trivial@nongnu.org>; Sun, 04 May 2025 14:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746395872; x=1747000672; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/tk0gbWoG4ApvXZ5c0JKBgUdcITDobE9RIrWnb6spIQ=;
 b=uQ+eRlOtBzBq7CikOTB055G8LygEOkXihgGfPUQMtIW3HLQaDquot6F5pHZbqBFVC2
 chgyJYwYWWgngWLvLgVF0bIWiN2l+o77dngAONAF1MqJHee81nJDld/979Ij8wB23iV9
 RtoqZlDdyEezkUlIG08ddtZpHTJlHis9ijHT2oDMuvP8/02kbV4/qczWZdDsDzhGq7K5
 ueWg+HF812GxrZLkIuQKXuJr0WcnjmCPSBjU1eNA8zGoQjCVffPGvOuPcj5XV9Io2awU
 E6dKii4w/IHYNG7F02YbFI/A6AOkI6M+wvEsKaNUU4pgJjOEY749HGwP3O7YDduGE76r
 vjfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746395872; x=1747000672;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/tk0gbWoG4ApvXZ5c0JKBgUdcITDobE9RIrWnb6spIQ=;
 b=BC1aKaOkglgaBVjCAmCKxB3hxFxmFdjJilGRIBbSIJCfEqwyJlxzFEhc0XRprflW2V
 ab/EIVZVRdH9NGDpDVyLopHYGZffCYDF4SDVp6Kfpgg6LQFTbBUtb5I+JAaLOH+iMxAy
 xSBMZx+5MqUx3JMbcZpnqj9BW4h7JoSXaJT62x0Xs8LJngu4FkcK5ih6x1lkKa1bhTbj
 QAImrZ9KBJzyD0rmoKfEgY6CfayRmxdmdN7rYHzpEXoFBMSOM5HUj80Tvg3eaDPbsaqw
 X+CGHGkv2/b910YADZLS/Ya9tFmW4xszfQmRQ1XM3RLPZzRLrWzGfEfrSrv3Tih76wbA
 qdrQ==
X-Gm-Message-State: AOJu0YzSPApVelq6Mmif2n8Slp7l3xhKHYeoLHzmujZ6duDfCWNvyire
 1ywM6P7wWwzlMtLsBAtBvbThiAemmyKiRHc5Wkt1h6+UN+DmMDRzhqrrTGovHQY=
X-Gm-Gg: ASbGncusn0+b725V3jEK+abEbjNplCVj69L4dcSJkPmL4J4yEz1I72hseqwAX/p79/U
 0nqOEy8GwDHMgYKmnBV50T6Jm7ZDELGVcB2CgaAMn7cZi7RnBsuVHcs4lH7NJ7aX4zQ+kyi4O5a
 xXJuI664j3j4hSObG+G9jSc8AvPZV8vEw03XPKeKwHcabCX118b6dwikeLC4n4slbhcLXW+Kyhk
 zvK8jwtSZmF4z3MGoUHvarGREMDsSwRlf9hyW/bug5RncifKoOgMtWClCquM20LrKmCf5Tmdgco
 RJDrRP8LtOcp2zUOq/43kBO9E/OhdJHKoVJMuLf2euPxI9zd
X-Google-Smtp-Source: AGHT+IHX4B3MtSbPeoHfu5rcPv/UTsigKurblHN2gBuy1xugWg/RnALJkq6fkZSYL6exMOXH8S9yiA==
X-Received: by 2002:a17:902:ef02:b0:224:2717:7993 with SMTP id
 d9443c01a7336-22e1eadac90mr79083055ad.45.1746395872673; 
 Sun, 04 May 2025 14:57:52 -0700 (PDT)
Received: from gromero0.. ([200.150.181.215]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22e152204fesm41664875ad.137.2025.05.04.14.57.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 May 2025 14:57:52 -0700 (PDT)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, philmd@linaro.org, alex.bennee@linaro.org,
 gustavo.romero@linaro.org
Subject: [PATCH] hw/core/machine: Fix indentation
Date: Sun,  4 May 2025 21:56:34 +0000
Message-Id: <20250504215639.54860-6-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=gustavo.romero@linaro.org; helo=mail-pl1-x632.google.com
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
X-List-Received-Date: Sun, 04 May 2025 21:57:55 -0000

Fix indentation for some elements in the hardware compat arrays.

Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
---
 hw/core/machine.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index ed01798d37..b8ae155dfa 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -41,7 +41,7 @@ GlobalProperty hw_compat_10_0[] = {};
 const size_t hw_compat_10_0_len = G_N_ELEMENTS(hw_compat_10_0);
 
 GlobalProperty hw_compat_9_2[] = {
-    {"arm-cpu", "backcompat-pauth-default-use-qarma5", "true"},
+    { "arm-cpu", "backcompat-pauth-default-use-qarma5", "true"},
     { "virtio-balloon-pci", "vectors", "0" },
     { "virtio-balloon-pci-transitional", "vectors", "0" },
     { "virtio-balloon-pci-non-transitional", "vectors", "0" },
@@ -58,12 +58,12 @@ GlobalProperty hw_compat_9_1[] = {
 const size_t hw_compat_9_1_len = G_N_ELEMENTS(hw_compat_9_1);
 
 GlobalProperty hw_compat_9_0[] = {
-    {"arm-cpu", "backcompat-cntfrq", "true" },
+    { "arm-cpu", "backcompat-cntfrq", "true" },
     { "scsi-hd", "migrate-emulated-scsi-request", "false" },
     { "scsi-cd", "migrate-emulated-scsi-request", "false" },
-    {"vfio-pci", "skip-vsc-check", "false" },
+    { "vfio-pci", "skip-vsc-check", "false" },
     { "virtio-pci", "x-pcie-pm-no-soft-reset", "off" },
-    {"sd-card", "spec_version", "2" },
+    { "sd-card", "spec_version", "2" },
 };
 const size_t hw_compat_9_0_len = G_N_ELEMENTS(hw_compat_9_0);
 
-- 
2.34.1


