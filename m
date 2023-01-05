Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pDRQO-0006Wc-HL
	for mharc-qemu-trivial@gnu.org; Thu, 05 Jan 2023 09:40:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDRQJ-0006PU-Qx
 for qemu-trivial@nongnu.org; Thu, 05 Jan 2023 09:40:54 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDRQH-0003Ey-Mz
 for qemu-trivial@nongnu.org; Thu, 05 Jan 2023 09:40:51 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 b24-20020a05600c4a9800b003d21efdd61dso1471285wmp.3
 for <qemu-trivial@nongnu.org>; Thu, 05 Jan 2023 06:40:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=oNDOqnsLbyhoDi5uMGk8/4UUP00n8RzWnJNlr2mmXCw=;
 b=u+oblYgDY7fD5KbasUEDoj5ricSGpo9z6Te0DEHS/SThi1t0rp/Fv8scGCdmt2GIlP
 pmEYoaESJHTQuCXvJJtnzTVnh3o1fFNZDG2hqM3P57ynBy/iCXkKPjOpYe/IsLcDBDVs
 YZg+LabRFF4d5wpM4fJRxknQE8NjxVGDVbnjfadaSXx92E2N6TSo8ZUIYRnWasGhoepP
 vJ04VRV9EO1n3/LbREv8uBGkuGjrpF3EBybBAcZ9tonptuJYB4chEPts6IW9UZJb6mpy
 7q8VcLuABMf5Pj5kmf60/EO8BqcCyBigeAk94CHtEUB0dPlH2fMDC1Y+MTea1ntE5OLv
 a5qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oNDOqnsLbyhoDi5uMGk8/4UUP00n8RzWnJNlr2mmXCw=;
 b=RWTM4SVSeFqpDSvKQDWbfMH4q7tZwCSD1Bn3B0z2nBDBLruvYluRox6QPtDN40sTy7
 1zIlA2XMSGMjyP3gfSfam95ajymIxkIgIGpuhbCHvnz3ynqn8rogywCeWmr4yRuErIIc
 o9erF8adld4fbb3V+FsncYJpTdIQmlVkvqq9GF4w5rfA5aK+d/ONY6F+MB/3Ki9u81YT
 nNOnXFQWCBS59FA+14wsfagagV3QSTVDZ/weriI2s7jMHxLIAPwOUzHaIQvczAI2nuhd
 wr5tvawx3u954ziXjb66bG/+uEh9HwaUgOat0Xvcmu8tJoZ2oqxmCMEBtQ1qMfH+FtP0
 J2yg==
X-Gm-Message-State: AFqh2krwHbl31hphGGr+fZdnd07VRO/DF9gpQAZs2+ExVtXgjrotpMjR
 WHiJ+JgvWHigskQo1ASJhJigvQ==
X-Google-Smtp-Source: AMrXdXtUdzQfZCdaIthHpZ1bmoKgUfFFqEdVMcyrdI0LWmObweZ2PwXERpr2EM259hg0RYgppYWG3g==
X-Received: by 2002:a05:600c:2217:b0:3d2:267d:64da with SMTP id
 z23-20020a05600c221700b003d2267d64damr35326920wml.10.1672929646406; 
 Thu, 05 Jan 2023 06:40:46 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 z25-20020a1c4c19000000b003d1e1f421bfsm2622176wmf.10.2023.01.05.06.40.45
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 05 Jan 2023 06:40:45 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-trivial@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH] hw/i386/pc: Remove unused 'owner' argument from
 pc_pci_as_mapping_init
Date: Thu,  5 Jan 2023 15:40:44 +0100
Message-Id: <20230105144044.51822-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
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
X-List-Received-Date: Thu, 05 Jan 2023 14:40:55 -0000

This argument was added 9 years ago in commit 83d08f2673
and has never been used since, so remote it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/i386/pc.c         | 2 +-
 hw/pci-host/i440fx.c | 3 +--
 hw/pci-host/q35.c    | 3 +--
 include/hw/i386/pc.h | 2 +-
 4 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index d489ecc0d1..6e592bd969 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -782,7 +782,7 @@ void pc_guest_info_init(PCMachineState *pcms)
 }
 
 /* setup pci memory address space mapping into system address space */
-void pc_pci_as_mapping_init(Object *owner, MemoryRegion *system_memory,
+void pc_pci_as_mapping_init(MemoryRegion *system_memory,
                             MemoryRegion *pci_address_space)
 {
     /* Set to lower priority than RAM */
diff --git a/hw/pci-host/i440fx.c b/hw/pci-host/i440fx.c
index d5426ef4a5..262f82c303 100644
--- a/hw/pci-host/i440fx.c
+++ b/hw/pci-host/i440fx.c
@@ -272,8 +272,7 @@ PCIBus *i440fx_init(const char *pci_type,
                      IO_APIC_DEFAULT_ADDRESS - 1);
 
     /* setup pci memory mapping */
-    pc_pci_as_mapping_init(OBJECT(f), f->system_memory,
-                           f->pci_address_space);
+    pc_pci_as_mapping_init(f->system_memory, f->pci_address_space);
 
     /* if *disabled* show SMRAM to all CPUs */
     memory_region_init_alias(&f->smram_region, OBJECT(d), "smram-region",
diff --git a/hw/pci-host/q35.c b/hw/pci-host/q35.c
index 20da121374..26390863d6 100644
--- a/hw/pci-host/q35.c
+++ b/hw/pci-host/q35.c
@@ -574,8 +574,7 @@ static void mch_realize(PCIDevice *d, Error **errp)
     }
 
     /* setup pci memory mapping */
-    pc_pci_as_mapping_init(OBJECT(mch), mch->system_memory,
-                           mch->pci_address_space);
+    pc_pci_as_mapping_init(mch->system_memory, mch->pci_address_space);
 
     /* if *disabled* show SMRAM to all CPUs */
     memory_region_init_alias(&mch->smram_region, OBJECT(mch), "smram-region",
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 991f905f5d..88a120bc23 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -156,7 +156,7 @@ void pc_guest_info_init(PCMachineState *pcms);
 #define PCI_HOST_ABOVE_4G_MEM_SIZE     "above-4g-mem-size"
 
 
-void pc_pci_as_mapping_init(Object *owner, MemoryRegion *system_memory,
+void pc_pci_as_mapping_init(MemoryRegion *system_memory,
                             MemoryRegion *pci_address_space);
 
 void xen_load_linux(PCMachineState *pcms);
-- 
2.38.1


