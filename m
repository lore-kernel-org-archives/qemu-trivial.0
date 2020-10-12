Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kRxCt-0005ga-Uj
	for mharc-qemu-trivial@gnu.org; Mon, 12 Oct 2020 08:45:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kRxCs-0005dL-B4
 for qemu-trivial@nongnu.org; Mon, 12 Oct 2020 08:45:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kRxCp-00005K-Bn
 for qemu-trivial@nongnu.org; Mon, 12 Oct 2020 08:45:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602506734;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xCNLhoelsRO4TCaFqCkPA59+Ay48720LqdAdNtyWtdc=;
 b=ME0qyA/3xFXlPM+JyqDYjndNjdg9M+Bi4xYmeOb4Xfq5nl7WTbN7ImIK16TkalixutE/IG
 fU0zzkjB89xJIysW2YrWW3sqvSeypdbCUwKyuX+QmXULvqq1JUp8+LMl6nin+xFvoOqREc
 8eMRH+tkhjTdDZB0RzkDW2zUCj1F+Ao=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-354-wi1GEYfGPCCRfaIP-9SuFA-1; Mon, 12 Oct 2020 08:45:33 -0400
X-MC-Unique: wi1GEYfGPCCRfaIP-9SuFA-1
Received: by mail-wr1-f71.google.com with SMTP id b11so5459154wrm.3
 for <qemu-trivial@nongnu.org>; Mon, 12 Oct 2020 05:45:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xCNLhoelsRO4TCaFqCkPA59+Ay48720LqdAdNtyWtdc=;
 b=dvF501LCYdI3fcCcJVZahxyfG6gig7GDj3LMeP+LvnS8OQrZVnabBu1Uf3f7bh/AIm
 K+AcZ7cqWlkkVwo7hwRk9txxn6jXqozhXkdJNOY2U3mcBPh1qgyIebL9Rx7xtS/8zcNu
 ovaRrrqFqr45aNTsYWgB+CaZdWsEByaRO2ex33Q1NG5xPaW4hC0Bb103ra5E+PY1J64F
 j/mmRZxTMv6zwDAtRhVbR6tzkmTL7Ayj+X4E7wD+Xjlq1BILu1iEAxZhAh/ZQJ3VKPxE
 LyMYKXdDiXh6aWn42O9F09sj5cQeBTjta0CMJS0NsrL/CyLd7wmX4oR7885ECfdYnioy
 lS2Q==
X-Gm-Message-State: AOAM531sctGxJyKMXWqU19ue1c/1Adx5oXkEwnCnMUSdve7pIGn6LFCY
 Le3ZK4fRnKxrbTk8tX+Q/0G6dbb0avblDYEQUQqpzTxrfJD3uUy8ZmMTzXb5iR+XOEzCTv1etsI
 FsU0MUxyFYMFXqil8uA==
X-Received: by 2002:a5d:4409:: with SMTP id z9mr29211365wrq.236.1602506731773; 
 Mon, 12 Oct 2020 05:45:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxae6z034MmpPgmdTflq+mg0CAWtLHwAeKxZKoPrU70udcFRiLBlXGhJ+sn9Ujlq9DXSzSzbg==
X-Received: by 2002:a5d:4409:: with SMTP id z9mr29211331wrq.236.1602506731500; 
 Mon, 12 Oct 2020 05:45:31 -0700 (PDT)
Received: from localhost.localdomain
 (106.red-83-59-162.dynamicip.rima-tde.net. [83.59.162.106])
 by smtp.gmail.com with ESMTPSA id l5sm24326366wrq.14.2020.10.12.05.45.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2020 05:45:30 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 qemu-trivial@nongnu.org, Paul Durrant <paul@xen.org>,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Stefano Stabellini <sstabellini@kernel.org>, Helge Deller <deller@gmx.de>,
 Anthony Perard <anthony.perard@citrix.com>,
 Richard Henderson <rth@twiddle.net>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 xen-devel@lists.xenproject.org,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Paolo Bonzini <pbonzini@redhat.com>, Huacai Chen <chenhc@lemote.com>
Subject: [PATCH 4/5] hw: Use the PCI_SLOT() macro from 'hw/pci/pci.h'
Date: Mon, 12 Oct 2020 14:45:05 +0200
Message-Id: <20201012124506.3406909-5-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201012124506.3406909-1-philmd@redhat.com>
References: <20201012124506.3406909-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/12 02:58:41
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 12 Oct 2020 12:45:38 -0000

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

We already have a generic PCI_SLOT() macro in "hw/pci/pci.h"
to extract the PCI slot identifier, use it.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/hppa/dino.c        | 2 +-
 hw/i386/xen/xen-hvm.c | 2 +-
 hw/isa/piix3.c        | 2 +-
 hw/mips/gt64xxx_pci.c | 2 +-
 hw/pci-host/bonito.c  | 2 +-
 hw/pci-host/ppce500.c | 2 +-
 hw/ppc/ppc4xx_pci.c   | 2 +-
 hw/sh4/sh_pci.c       | 2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/hw/hppa/dino.c b/hw/hppa/dino.c
index 81053b5fb64..5b82c9440d1 100644
--- a/hw/hppa/dino.c
+++ b/hw/hppa/dino.c
@@ -496,7 +496,7 @@ static void dino_set_irq(void *opaque, int irq, int level)
 
 static int dino_pci_map_irq(PCIDevice *d, int irq_num)
 {
-    int slot = d->devfn >> 3;
+    int slot = PCI_SLOT(d->devfn);
 
     assert(irq_num >= 0 && irq_num <= 3);
 
diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
index f3ababf33b6..276254e6ca9 100644
--- a/hw/i386/xen/xen-hvm.c
+++ b/hw/i386/xen/xen-hvm.c
@@ -140,7 +140,7 @@ typedef struct XenIOState {
 
 int xen_pci_slot_get_pirq(PCIDevice *pci_dev, int irq_num)
 {
-    return irq_num + ((pci_dev->devfn >> 3) << 2);
+    return irq_num + (PCI_SLOT(pci_dev->devfn) << 2);
 }
 
 void xen_piix3_set_irq(void *opaque, int irq_num, int level)
diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index 587850b8881..f46ccae25cf 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -361,7 +361,7 @@ type_init(piix3_register_types)
 static int pci_slot_get_pirq(PCIDevice *pci_dev, int pci_intx)
 {
     int slot_addend;
-    slot_addend = (pci_dev->devfn >> 3) - 1;
+    slot_addend = PCI_SLOT(pci_dev->devfn) - 1;
     return (pci_intx + slot_addend) & 3;
 }
 
diff --git a/hw/mips/gt64xxx_pci.c b/hw/mips/gt64xxx_pci.c
index e091bc4ed55..588e6f99301 100644
--- a/hw/mips/gt64xxx_pci.c
+++ b/hw/mips/gt64xxx_pci.c
@@ -982,7 +982,7 @@ static int gt64120_pci_map_irq(PCIDevice *pci_dev, int irq_num)
 {
     int slot;
 
-    slot = (pci_dev->devfn >> 3);
+    slot = PCI_SLOT(pci_dev->devfn);
 
     switch (slot) {
     /* PIIX4 USB */
diff --git a/hw/pci-host/bonito.c b/hw/pci-host/bonito.c
index b05295639a6..ee8b193e15b 100644
--- a/hw/pci-host/bonito.c
+++ b/hw/pci-host/bonito.c
@@ -570,7 +570,7 @@ static int pci_bonito_map_irq(PCIDevice *pci_dev, int irq_num)
 {
     int slot;
 
-    slot = (pci_dev->devfn >> 3);
+    slot = PCI_SLOT(pci_dev->devfn);
 
     switch (slot) {
     case 5:   /* FULOONG2E_VIA_SLOT, SouthBridge, IDE, USB, ACPI, AC97, MC97 */
diff --git a/hw/pci-host/ppce500.c b/hw/pci-host/ppce500.c
index 9517aab913e..5ad1424b31a 100644
--- a/hw/pci-host/ppce500.c
+++ b/hw/pci-host/ppce500.c
@@ -342,7 +342,7 @@ static const MemoryRegionOps e500_pci_reg_ops = {
 
 static int mpc85xx_pci_map_irq(PCIDevice *pci_dev, int pin)
 {
-    int devno = pci_dev->devfn >> 3;
+    int devno = PCI_SLOT(pci_dev->devfn);
     int ret;
 
     ret = ppce500_pci_map_irq_slot(devno, pin);
diff --git a/hw/ppc/ppc4xx_pci.c b/hw/ppc/ppc4xx_pci.c
index 28724c06f88..e8789f64e80 100644
--- a/hw/ppc/ppc4xx_pci.c
+++ b/hw/ppc/ppc4xx_pci.c
@@ -243,7 +243,7 @@ static void ppc4xx_pci_reset(void *opaque)
  * may need further refactoring for other boards. */
 static int ppc4xx_pci_map_irq(PCIDevice *pci_dev, int irq_num)
 {
-    int slot = pci_dev->devfn >> 3;
+    int slot = PCI_SLOT(pci_dev->devfn);
 
     trace_ppc4xx_pci_map_irq(pci_dev->devfn, irq_num, slot);
 
diff --git a/hw/sh4/sh_pci.c b/hw/sh4/sh_pci.c
index 73d2d0bccb0..734892f47c7 100644
--- a/hw/sh4/sh_pci.c
+++ b/hw/sh4/sh_pci.c
@@ -109,7 +109,7 @@ static const MemoryRegionOps sh_pci_reg_ops = {
 
 static int sh_pci_map_irq(PCIDevice *d, int irq_num)
 {
-    return (d->devfn >> 3);
+    return PCI_SLOT(d->devfn);
 }
 
 static void sh_pci_set_irq(void *opaque, int irq_num, int level)
-- 
2.26.2


