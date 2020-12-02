Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kkS3w-0004U1-Kj
	for mharc-qemu-trivial@gnu.org; Wed, 02 Dec 2020 08:20:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kkS3s-0004Nx-5J
 for qemu-trivial@nongnu.org; Wed, 02 Dec 2020 08:20:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40168)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kkS3p-0003zt-VB
 for qemu-trivial@nongnu.org; Wed, 02 Dec 2020 08:20:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606915245;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=jh9TH7DrLfehy/SeQl5Z6oFCdoL+lKAc4y7mqOr0w7w=;
 b=KnnOiiCzwpQPcGOlUcQtxCcsgfXHChZdJFpSosMmxScFPmSPeuVog/tGCChqnKoh3GFdQQ
 oEyGGzagW2xQJD5CEo491vnMUWP1F3SAHPiw0RldYnhhSYLEH2WKJTVHsSmQEEV/faSDZM
 PFkHePDpZ+rjdZKs7NuQNiZhGj3jGBs=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-55-QhywEDIHPD-4vbKr5FM6Sg-1; Wed, 02 Dec 2020 08:20:43 -0500
X-MC-Unique: QhywEDIHPD-4vbKr5FM6Sg-1
Received: by mail-wr1-f72.google.com with SMTP id b5so4092042wrp.3
 for <qemu-trivial@nongnu.org>; Wed, 02 Dec 2020 05:20:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jh9TH7DrLfehy/SeQl5Z6oFCdoL+lKAc4y7mqOr0w7w=;
 b=kgfz1ixY0wugcH9Eoftoffy+kOmMfmexJ6u48uGTX2hN9/6JP/JApiP0YtQyOJi0Fv
 eKn/zSNUB5ULv+kxJtxb7Yb2R5B7YKT2XOHkx4gThKLzvF/WLPW15bc+W4PGOPc/G2BC
 ru+uRHMsH3Ofa8LQ9+zS7jtQtkT/PdciW8L0xGnAhr06+8Lm80Nsb7id+bvjjfdF0iu6
 vLspSJEmC0whLVLkydhItf1GSN1U3LK2F/H/DppnpMbmzmtz9JkGsMOzWcUdMsnmQsJD
 MbAStdiRYXCG2Bs0CsrRKgMTUpJnoNlEstCQmRhvzzomYEIGs6COYDAb2epR9w2JHREv
 /ebA==
X-Gm-Message-State: AOAM531M2OTxlB3rujgo/KK9Qaq8St0VdUg/nKrTMkeKwKe/vrAdOonf
 FRpGu6zPimaN1MPW9lHQzvkgCL7cKbmZangTiASEsoGfYbgjOICN6XFe78O3XMeT9PCQKzJ+TOS
 u9rylHYzzmGh6PflHzg==
X-Received: by 2002:a7b:c00b:: with SMTP id c11mr3204082wmb.122.1606915241469; 
 Wed, 02 Dec 2020 05:20:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzq7TpvZh3YglVIJcfBh4bkbUOOV6dCzMRA3W9g6rGX5ipqxkboJjYY4rn2/kS+zgn3yDkSmQ==
X-Received: by 2002:a7b:c00b:: with SMTP id c11mr3204063wmb.122.1606915241230; 
 Wed, 02 Dec 2020 05:20:41 -0800 (PST)
Received: from localhost.localdomain (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id a15sm2098510wrn.75.2020.12.02.05.20.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Dec 2020 05:20:40 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH] hw/pci-host/pam: Replace magic number by PAM_REGIONS_COUNT
 definition
Date: Wed,  2 Dec 2020 14:20:38 +0100
Message-Id: <20201202132038.1276404-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 02 Dec 2020 13:20:48 -0000

While this change helps triskaidekaphobic developers, it
is a good practice to avoid magic values and using constant
definitions instead.

Introduce the PAM_REGIONS_COUNT and use it. No logical change.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/hw/pci-host/i440fx.h | 2 +-
 include/hw/pci-host/pam.h    | 2 ++
 include/hw/pci-host/q35.h    | 2 +-
 hw/pci-host/pam.c            | 2 +-
 hw/pci-host/q35.c            | 2 +-
 5 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/include/hw/pci-host/i440fx.h b/include/hw/pci-host/i440fx.h
index 6c16eaf876d..24fd53942ca 100644
--- a/include/hw/pci-host/i440fx.h
+++ b/include/hw/pci-host/i440fx.h
@@ -29,7 +29,7 @@ struct PCII440FXState {
     MemoryRegion *system_memory;
     MemoryRegion *pci_address_space;
     MemoryRegion *ram_memory;
-    PAMMemoryRegion pam_regions[13];
+    PAMMemoryRegion pam_regions[PAM_REGIONS_COUNT];
     MemoryRegion smram_region;
     MemoryRegion smram, low_smram;
 };
diff --git a/include/hw/pci-host/pam.h b/include/hw/pci-host/pam.h
index fec5cd35d60..c1fd06ba2ae 100644
--- a/include/hw/pci-host/pam.h
+++ b/include/hw/pci-host/pam.h
@@ -80,6 +80,8 @@
 #define SMRAM_C_BASE_SEG_MASK  ((uint8_t)0x7)
 #define SMRAM_C_BASE_SEG       ((uint8_t)0x2)  /* hardwired to b010 */
 
+#define PAM_REGIONS_COUNT       13
+
 typedef struct PAMMemoryRegion {
     MemoryRegion alias[4];  /* index = PAM value */
     unsigned current;
diff --git a/include/hw/pci-host/q35.h b/include/hw/pci-host/q35.h
index bbb95817656..ab989698ef8 100644
--- a/include/hw/pci-host/q35.h
+++ b/include/hw/pci-host/q35.h
@@ -44,7 +44,7 @@ struct MCHPCIState {
     MemoryRegion *pci_address_space;
     MemoryRegion *system_memory;
     MemoryRegion *address_space_io;
-    PAMMemoryRegion pam_regions[13];
+    PAMMemoryRegion pam_regions[PAM_REGIONS_COUNT];
     MemoryRegion smram_region, open_high_smram;
     MemoryRegion smram, low_smram, high_smram;
     MemoryRegion tseg_blackhole, tseg_window;
diff --git a/hw/pci-host/pam.c b/hw/pci-host/pam.c
index a4962057833..454dd120db9 100644
--- a/hw/pci-host/pam.c
+++ b/hw/pci-host/pam.c
@@ -62,7 +62,7 @@ void init_pam(DeviceState *dev, MemoryRegion *ram_memory,
 
 void pam_update(PAMMemoryRegion *pam, int idx, uint8_t val)
 {
-    assert(0 <= idx && idx <= 12);
+    assert(0 <= idx && idx < PAM_REGIONS_COUNT);
 
     memory_region_set_enabled(&pam->alias[pam->current], false);
     pam->current = (val >> ((!(idx & 1)) * 4)) & PAM_ATTR_MASK;
diff --git a/hw/pci-host/q35.c b/hw/pci-host/q35.c
index b67cb9c29f8..2eb729dff58 100644
--- a/hw/pci-host/q35.c
+++ b/hw/pci-host/q35.c
@@ -641,7 +641,7 @@ static void mch_realize(PCIDevice *d, Error **errp)
     init_pam(DEVICE(mch), mch->ram_memory, mch->system_memory,
              mch->pci_address_space, &mch->pam_regions[0],
              PAM_BIOS_BASE, PAM_BIOS_SIZE);
-    for (i = 0; i < 12; ++i) {
+    for (i = 0; i < ARRAY_SIZE(mch->pam_regions) - 1; ++i) {
         init_pam(DEVICE(mch), mch->ram_memory, mch->system_memory,
                  mch->pci_address_space, &mch->pam_regions[i+1],
                  PAM_EXPAN_BASE + i * PAM_EXPAN_SIZE, PAM_EXPAN_SIZE);
-- 
2.26.2


