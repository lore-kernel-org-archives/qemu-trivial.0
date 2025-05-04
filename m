Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uBhLa-0007ev-OB
	for mharc-qemu-trivial@gnu.org; Sun, 04 May 2025 17:58:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uBhLY-0007ds-Mp
 for qemu-trivial@nongnu.org; Sun, 04 May 2025 17:58:04 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uBhLX-0005E3-3x
 for qemu-trivial@nongnu.org; Sun, 04 May 2025 17:58:04 -0400
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-223fb0f619dso44209505ad.1
 for <qemu-trivial@nongnu.org>; Sun, 04 May 2025 14:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746395882; x=1747000682; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZQ/IAr0L2Ye5hjM/5zDI94SM4bR+FE9DXwXYA3N/62o=;
 b=eLuShIx3K+dXoWfUFP6vgdpOTA3BHjz3eGt68r6fb00VTVM2g0VGpflHUPDUuyDG4D
 xW6465ABtn1U5lomnpMFW5zld13otE3z8fkIC4BLq1JH4lIBIT6CUhiMU8hvaSGDAxx2
 mdsGOgKkSydekM1JRM/u87VsHR2tfO/FTXVdbdR4bV7E5UtOp1SuSY+LWMW/VoyYchPq
 t26ujW3GJA09zQYgjjjUCrrXG6Ytee4hUGaPbK0Df8YTsVoYb+d2dnaRbcfXdwIDCte/
 z33iT9MxCx7Qh8DLqg/iAqhg9+3U9sdXtT4TL6uzSUzwtU5iXMCThMJ8FuiiDFos3Dy5
 jZ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746395882; x=1747000682;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZQ/IAr0L2Ye5hjM/5zDI94SM4bR+FE9DXwXYA3N/62o=;
 b=t9CAtxe2Njg2KVj+cJg9BZSUqm9+ocU+SVh9fBztqjG9Bqz1ySrcV4O+YTbSzNHEyQ
 2GJ4c4yCog/XTZW3MGIoG9877imDYPzLipmUIZV426blMZ6w7neJNbRqKbhFDJVOOJp5
 LY4mIAGiYwQCElRy1kCMD0rV2wvhBZUX0Zauorpjz/W3czXNWBzJGcxap78ZdniKHwlJ
 n855TkbjEI+GiyiOvmRvfaYA2W5fL9m+9B/+kWyDxMiuBR70QE1RC3y6VA4AfgTZLHAi
 e6J+oZlqr1ufmGshs48jp0AIdsBqFcg7UPKMBjZmd0C9AKw+jskJgC9YziwLUkOzy28N
 l8jQ==
X-Gm-Message-State: AOJu0YyhiwMvxaMkF0YvQ19rBbzCiYmVNX9CFxkWKjK8txTvLZg2zJVD
 67cqC0JQSLgtyyi0KdcmDCgOmLYxMu+d87ob3s6qzV62qBmhYgZDQoMDUhIhFCo=
X-Gm-Gg: ASbGncsI67axDrVnJVJ9YtQWT//yDlnPiAJZ893ktfY2Zad1EzvNPwDXDQi13trfiCT
 74yOU0zwvulJO54Kim1NOp5ipbcHP1qaSX2l0pJCxhmHWOTeX9Z46wG+0GVT9gU8E/xPZ0O0LMS
 ktxtxlraePWRLxQOCqaLVg9MU6jNcDzIzqylGQWGL1hazc55SLckHyJFPOUNr79UDZvL754RCHT
 cHGIKkY9bP8sxsuJvv7nv28m6D4ix7ocvMtIK+opojOFVEwpl39QmDwb2LuSVch18RNlyufIgPc
 Jlxlhu272ZMDHGQXr8TSKl0shVa1se2MdrRk//2fVIVmtWX2
X-Google-Smtp-Source: AGHT+IFXrhvAcF8x3OxhvGDQwhP2PJYnVsaoA+xNbyCx7Jnw9h0qxvBlO2eTj20uBXbBU6q9a+BxMQ==
X-Received: by 2002:a17:902:ce83:b0:21f:136a:a374 with SMTP id
 d9443c01a7336-22e1036cfdamr164992485ad.43.1746395881604; 
 Sun, 04 May 2025 14:58:01 -0700 (PDT)
Received: from gromero0.. ([200.150.181.215]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22e152204fesm41664875ad.137.2025.05.04.14.57.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 May 2025 14:58:01 -0700 (PDT)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, philmd@linaro.org, alex.bennee@linaro.org,
 gustavo.romero@linaro.org
Subject: [PATCH] hw/acpi/pcihp: Fix typo in function name
Date: Sun,  4 May 2025 21:56:38 +0000
Message-Id: <20250504215639.54860-10-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=gustavo.romero@linaro.org; helo=mail-pl1-x62a.google.com
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
X-List-Received-Date: Sun, 04 May 2025 21:58:04 -0000

Fix typo in QEMU's ACPI PCI hotplug API function name that checks
whether a given bus is hotplug-capable.

Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
---
 hw/acpi/acpi-pci-hotplug-stub.c | 2 +-
 hw/acpi/ich9.c                  | 2 +-
 hw/acpi/pcihp.c                 | 2 +-
 hw/acpi/piix4.c                 | 2 +-
 include/hw/acpi/pcihp.h         | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/acpi/acpi-pci-hotplug-stub.c b/hw/acpi/acpi-pci-hotplug-stub.c
index b67b4a92da..b7bc6e40a1 100644
--- a/hw/acpi/acpi-pci-hotplug-stub.c
+++ b/hw/acpi/acpi-pci-hotplug-stub.c
@@ -34,7 +34,7 @@ void acpi_pcihp_reset(AcpiPciHpState *s)
 {
 }
 
-bool acpi_pcihp_is_hotpluggbale_bus(AcpiPciHpState *s, BusState *bus)
+bool acpi_pcihp_is_hotpluggable_bus(AcpiPciHpState *s, BusState *bus)
 {
     return true;
 }
diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
index c7a735bf64..a07c9d115b 100644
--- a/hw/acpi/ich9.c
+++ b/hw/acpi/ich9.c
@@ -570,7 +570,7 @@ void ich9_pm_device_unplug_cb(HotplugHandler *hotplug_dev, DeviceState *dev,
 bool ich9_pm_is_hotpluggable_bus(HotplugHandler *hotplug_dev, BusState *bus)
 {
     ICH9LPCState *lpc = ICH9_LPC_DEVICE(hotplug_dev);
-    return acpi_pcihp_is_hotpluggbale_bus(&lpc->pm.acpi_pci_hotplug, bus);
+    return acpi_pcihp_is_hotpluggable_bus(&lpc->pm.acpi_pci_hotplug, bus);
 }
 
 void ich9_pm_ospm_status(AcpiDeviceIf *adev, ACPIOSTInfoList ***list)
diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
index 5f79c9016b..aac90013d4 100644
--- a/hw/acpi/pcihp.c
+++ b/hw/acpi/pcihp.c
@@ -371,7 +371,7 @@ void acpi_pcihp_device_unplug_request_cb(HotplugHandler *hotplug_dev,
     acpi_send_event(DEVICE(hotplug_dev), ACPI_PCI_HOTPLUG_STATUS);
 }
 
-bool acpi_pcihp_is_hotpluggbale_bus(AcpiPciHpState *s, BusState *bus)
+bool acpi_pcihp_is_hotpluggable_bus(AcpiPciHpState *s, BusState *bus)
 {
     Object *o = OBJECT(bus->parent);
 
diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
index b16d45f03e..d98b80df6d 100644
--- a/hw/acpi/piix4.c
+++ b/hw/acpi/piix4.c
@@ -406,7 +406,7 @@ static bool piix4_is_hotpluggable_bus(HotplugHandler *hotplug_dev,
                                       BusState *bus)
 {
     PIIX4PMState *s = PIIX4_PM(hotplug_dev);
-    return acpi_pcihp_is_hotpluggbale_bus(&s->acpi_pci_hotplug, bus);
+    return acpi_pcihp_is_hotpluggable_bus(&s->acpi_pci_hotplug, bus);
 }
 
 static void piix4_pm_machine_ready(Notifier *n, void *opaque)
diff --git a/include/hw/acpi/pcihp.h b/include/hw/acpi/pcihp.h
index ac21a95913..a97904bada 100644
--- a/include/hw/acpi/pcihp.h
+++ b/include/hw/acpi/pcihp.h
@@ -58,7 +58,7 @@ typedef struct AcpiPciHpState {
 void acpi_pcihp_init(Object *owner, AcpiPciHpState *, PCIBus *root,
                      MemoryRegion *io, uint16_t io_base);
 
-bool acpi_pcihp_is_hotpluggbale_bus(AcpiPciHpState *s, BusState *bus);
+bool acpi_pcihp_is_hotpluggable_bus(AcpiPciHpState *s, BusState *bus);
 void acpi_pcihp_device_pre_plug_cb(HotplugHandler *hotplug_dev,
                                    DeviceState *dev, Error **errp);
 void acpi_pcihp_device_plug_cb(HotplugHandler *hotplug_dev, AcpiPciHpState *s,
-- 
2.34.1


