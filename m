Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uBhLI-0007Ol-R9
	for mharc-qemu-trivial@gnu.org; Sun, 04 May 2025 17:57:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uBhLH-0007No-AF
 for qemu-trivial@nongnu.org; Sun, 04 May 2025 17:57:47 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uBhLF-0005AZ-Fj
 for qemu-trivial@nongnu.org; Sun, 04 May 2025 17:57:46 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-2279915e06eso40165805ad.1
 for <qemu-trivial@nongnu.org>; Sun, 04 May 2025 14:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746395864; x=1747000664; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Fwa6vL14YZTfst2loVGLMHYQVKFZcNKU8l3yQjztZTQ=;
 b=pmJUQiSxXFsAnEGLrouWwFlwbX9g9bL3IecR4U385nF7NIRq9j/1+bMFlKldGAdAIC
 p3q8ZR40xVqogHJF4TqR5ztfqsFB5FprYRl6q5olQcjQQgoh7tPF4yOqJmGgzlr1+c9G
 lCT3i9sUhTvXG2QGCG65lBpMGEj2ctoa/JLNv3nv7620RNimSHSETbZheayU404YSO1I
 7P8UgCokiPw9TtZ4NGirTwZwAcecnbLsgBSeHw8zk6EDGh6LZB/zUEVVLtRyiMHBvyZ8
 rM7KAM1Jnz1MSS2gRmP2s+IFGXaFOROQBqCgS0mPm+Ao/DN0APTE/XgjmZ6gfZ9wWV/W
 x1PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746395864; x=1747000664;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Fwa6vL14YZTfst2loVGLMHYQVKFZcNKU8l3yQjztZTQ=;
 b=b1HrLQON9a7oT89jvQxflxMO26+g1XcBjmWPH8UgVisnA/BZCQOe4g59Jbkfb4gCwB
 tVhwUs00Oscd7FaLspcAsWJRwM2xJrRZbDSh6BfYf5DwWc7P7crALPEWCognFNty5cw8
 jY2ldNSw5i17mq3f5FiKiIPa7shtTkKY14A40/JLGtZ72buL8zSmroefqXwYTBJDffqL
 rUg9hQXbrIc30anoP09JSEFQLQihujmij8Gl9E4VmBUZa4NkizEQa56W8husSefKAMFT
 SVulv9JvsDpip9HCEk+02+9Ozuk6DYET7hpn8fTePcMx/Nq12heRawyOD+LRZ3iL0Yt9
 W8bw==
X-Gm-Message-State: AOJu0YyDeYihF1pXvUwvtr3Y34Cx7h3M6jgiItfz97NSzug3+vXzP8dU
 9D5lZPxSSYUvj0s2y8n8+5ta9w6Lr6/c+yYsxImgrb3dlU4gpUiy73jubfhpxGI=
X-Gm-Gg: ASbGncvJICUdqi8o6gEdrRl6JRroWigFUokhfD2lWuBpZ+IIC8ST+SPGYs/f3kFgmjT
 HVFlHwatTVt+L7+3TUJV19x7V0cBa4DmdsfILzYMGSAcJQnpueH5u0wy7SgQjosb+NiYjnM985Q
 jtgQuMtRPFA678ZaXQZMrmYAZlaD+hWH6Zx4pmQBxAlLPhqu3C29UtKGIZ6OTCpIamz2RQpiWhh
 yYYeonknRBEbdEjvbvm/H5Sp3Wb/9CBtC0br70NvaBPGgWJWGYaCiJJFqo9jw70JQtmo4FssxBb
 FPLZIjZxZyh0NuICxWyLXAn5YRoPG0Udfkm1UOJktaZMtQlE
X-Google-Smtp-Source: AGHT+IGQT6GPAkKoXGz9SNSn4/Ag1yM9bhq9courAlNnN3GPAxPb4sdccxa10oDnwKBUwHRRrLTVag==
X-Received: by 2002:a17:903:2b0c:b0:21f:2ded:76ea with SMTP id
 d9443c01a7336-22e1eae4269mr91622705ad.36.1746395863786; 
 Sun, 04 May 2025 14:57:43 -0700 (PDT)
Received: from gromero0.. ([200.150.181.215]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22e152204fesm41664875ad.137.2025.05.04.14.57.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 May 2025 14:57:43 -0700 (PDT)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, philmd@linaro.org, alex.bennee@linaro.org,
 gustavo.romero@linaro.org
Subject: [PATCH] hw/pci/pci.c: Turn DPRINTF into trace events
Date: Sun,  4 May 2025 21:56:30 +0000
Message-Id: <20250504215639.54860-2-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=gustavo.romero@linaro.org; helo=mail-pl1-x62d.google.com
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
X-List-Received-Date: Sun, 04 May 2025 21:57:47 -0000

Remove PCI_DPRINTF() macro and use trace events instead.

Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
---
 hw/pci/pci.c        | 19 ++++++-------------
 hw/pci/trace-events |  4 ++++
 2 files changed, 10 insertions(+), 13 deletions(-)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index fe38c4c028..352b3d12c8 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -54,13 +54,6 @@
 #include "hw/xen/xen.h"
 #include "hw/i386/kvm/xen_evtchn.h"
 
-//#define DEBUG_PCI
-#ifdef DEBUG_PCI
-# define PCI_DPRINTF(format, ...)       printf(format, ## __VA_ARGS__)
-#else
-# define PCI_DPRINTF(format, ...)       do { } while (0)
-#endif
-
 bool pci_available = true;
 
 static char *pcibus_get_dev_path(DeviceState *dev);
@@ -2439,12 +2432,12 @@ static void pci_patch_ids(PCIDevice *pdev, uint8_t *ptr, uint32_t size)
     /* Only a valid rom will be patched. */
     rom_magic = pci_get_word(ptr);
     if (rom_magic != 0xaa55) {
-        PCI_DPRINTF("Bad ROM magic %04x\n", rom_magic);
+        trace_pci_bad_rom_magic(rom_magic, 0xaa55);
         return;
     }
     pcir_offset = pci_get_word(ptr + 0x18);
     if (pcir_offset + 8 >= size || memcmp(ptr + pcir_offset, "PCIR", 4)) {
-        PCI_DPRINTF("Bad PCIR offset 0x%x or signature\n", pcir_offset);
+        trace_pci_bad_pcir_offset(pcir_offset);
         return;
     }
 
@@ -2453,8 +2446,8 @@ static void pci_patch_ids(PCIDevice *pdev, uint8_t *ptr, uint32_t size)
     rom_vendor_id = pci_get_word(ptr + pcir_offset + 4);
     rom_device_id = pci_get_word(ptr + pcir_offset + 6);
 
-    PCI_DPRINTF("%s: ROM id %04x%04x / PCI id %04x%04x\n", pdev->romfile,
-                vendor_id, device_id, rom_vendor_id, rom_device_id);
+    trace_pci_rom_and_pci_ids(pdev->romfile, vendor_id, device_id,
+                              rom_vendor_id, rom_device_id);
 
     checksum = ptr[6];
 
@@ -2462,7 +2455,7 @@ static void pci_patch_ids(PCIDevice *pdev, uint8_t *ptr, uint32_t size)
         /* Patch vendor id and checksum (at offset 6 for etherboot roms). */
         checksum += (uint8_t)rom_vendor_id + (uint8_t)(rom_vendor_id >> 8);
         checksum -= (uint8_t)vendor_id + (uint8_t)(vendor_id >> 8);
-        PCI_DPRINTF("ROM checksum %02x / %02x\n", ptr[6], checksum);
+        trace_pci_rom_checksum_change(ptr[6], checksum);
         ptr[6] = checksum;
         pci_set_word(ptr + pcir_offset + 4, vendor_id);
     }
@@ -2471,7 +2464,7 @@ static void pci_patch_ids(PCIDevice *pdev, uint8_t *ptr, uint32_t size)
         /* Patch device id and checksum (at offset 6 for etherboot roms). */
         checksum += (uint8_t)rom_device_id + (uint8_t)(rom_device_id >> 8);
         checksum -= (uint8_t)device_id + (uint8_t)(device_id >> 8);
-        PCI_DPRINTF("ROM checksum %02x / %02x\n", ptr[6], checksum);
+        trace_pci_rom_checksum_change(ptr[6], checksum);
         ptr[6] = checksum;
         pci_set_word(ptr + pcir_offset + 6, device_id);
     }
diff --git a/hw/pci/trace-events b/hw/pci/trace-events
index 6a9968962f..02c80d3ec8 100644
--- a/hw/pci/trace-events
+++ b/hw/pci/trace-events
@@ -6,6 +6,10 @@ pci_pm_transition(const char *dev, uint32_t bus, uint32_t slot, uint32_t func, u
 pci_update_mappings_del(const char *dev, uint32_t bus, uint32_t slot, uint32_t func, int bar, uint64_t addr, uint64_t size) "%s %02x:%02x.%x %d,0x%"PRIx64"+0x%"PRIx64
 pci_update_mappings_add(const char *dev, uint32_t bus, uint32_t slot, uint32_t func, int bar, uint64_t addr, uint64_t size) "%s %02x:%02x.%x %d,0x%"PRIx64"+0x%"PRIx64
 pci_route_irq(int dev_irq, const char *dev_path, int parent_irq, const char *parent_path) "IRQ %d @%s -> IRQ %d @%s"
+pci_bad_rom_magic(uint16_t bad_rom_magic, uint16_t good_rom_magic) "Bad ROM magic number: %04"PRIX16". Should be: %04"PRIX16
+pci_bad_pcir_offset(uint16_t pcir_offset) "Bad PCIR offset 0x%"PRIx16" or signature"
+pci_rom_and_pci_ids(char *romfile, uint16_t vendor_id, uint16_t device_id, uint16_t rom_vendor_id, uint16_t rom_device_id) "%s: ROM ID %04"PRIx16":%04"PRIx16" | PCI ID %04"PRIx16":%04"PRIx16
+pci_rom_checksum_change(uint8_t old_checksum, uint8_t new_checksum) "ROM checksum changed from %02"PRIx8" to %02"PRIx8
 
 # pci_host.c
 pci_cfg_read(const char *dev, uint32_t bus, uint32_t slot, uint32_t func, unsigned offs, unsigned val) "%s %02x:%02x.%x @0x%x -> 0x%x"
-- 
2.34.1


