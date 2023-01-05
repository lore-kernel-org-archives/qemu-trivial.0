Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pDUCM-0002V4-NJ
	for mharc-qemu-trivial@gnu.org; Thu, 05 Jan 2023 12:38:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDUCH-0002SF-47
 for qemu-trivial@nongnu.org; Thu, 05 Jan 2023 12:38:33 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDUCF-0006VM-5M
 for qemu-trivial@nongnu.org; Thu, 05 Jan 2023 12:38:32 -0500
Received: by mail-wr1-x434.google.com with SMTP id r2so2032619wrv.7
 for <qemu-trivial@nongnu.org>; Thu, 05 Jan 2023 09:38:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KQ17OhOko7hPWDzJpQWUm7VE4a4l3d5cAGIgcTVHWzk=;
 b=m0bvoVe4Pg6NoduZWJ9YylESH0gk8GNUOOhTm2Y4anYIxOU/2BbYgKwXyELz13zcJw
 uYEsZ/BFPSVE4NU5kbXpVGyPnBUF+gUAlwi5sxMr+LFjll1scAerM+B2uiC7eIAaX0j/
 CRIXr9nGqAKDd96U7WEz9fovTksCH96ZNbAEIUhbX1pgo0Prg7vpFAcLaJDga+k3Qqvu
 QCWmMevCz3POXqeyAaNy3cVgan5QPty2Mkj0goD17IYDR6+zOxoHqf3pQtMjhX50drL/
 T+n5+CV5EFdjRW5xQd/oadLqYnPl6Gb4RPKForWsF+16Z3tj/5NCUVx26SJ5KthwnvRu
 IJVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KQ17OhOko7hPWDzJpQWUm7VE4a4l3d5cAGIgcTVHWzk=;
 b=Eo7j8rKQlP2gku1+aHy9cANQI7FQzW4BEaqgqMmcCcfPGSeRR7LN9dyK4M8R/WJTWv
 NU6D1L7t8haekvevY705JMGWveB0OMq/NScDdkFAsYaROL4DvdBrPFCxAmEswC5gvr7e
 JEquGZ8ZKt87iQF+z61SqCeiDwIyJ1i6Ub8TYp9pF811eIZRKTunEtDXTCLd0gNrEcDb
 Uy58ia3Z0bkPDMEnkY+mewCpfgARKFT93DpZtWNg5UjwMLCCExBpCPapdfZwy0voo9Vs
 kPWGA9ryNMgqWSR6Qz2SN0iMSyF7N74hEt2IRYdP9iiMypxBBbNzf5eU2euGCQV2eP0Q
 xNzg==
X-Gm-Message-State: AFqh2krzsRRRyokLQrqCidV9HxAMTp9XqSL6fNm5RazqVNI6WU3AfIVw
 BQ0y8opKaz25k7u9Z+K6+Sw34GRkMnpe7zCu
X-Google-Smtp-Source: AMrXdXvOmya1AJpjusvjIwUkfKBlKSrNImPZHP1IStJ8gN38NWDyynpruU0/V8eo3SjhzITEGMnTPQ==
X-Received: by 2002:a5d:6a43:0:b0:242:13bf:29de with SMTP id
 t3-20020a5d6a43000000b0024213bf29demr31715230wrw.52.1672940309206; 
 Thu, 05 Jan 2023 09:38:29 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 q7-20020adff947000000b002426d0a4048sm36453472wrr.49.2023.01.05.09.38.28
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 05 Jan 2023 09:38:28 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-trivial@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2] hw/i386/pc: Remove unused 'owner' argument from
 pc_pci_as_mapping_init
Date: Thu,  5 Jan 2023 18:38:26 +0100
Message-Id: <20230105173826.56748-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
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
X-List-Received-Date: Thu, 05 Jan 2023 17:38:34 -0000

This argument was added 9 years ago in commit 83d08f2673
("pc: map PCI address space as catchall region for not mapped
addresses") and has never been used since, so remove it.

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


