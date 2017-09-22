Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dvQPY-0006ue-0U
	for mharc-qemu-trivial@gnu.org; Fri, 22 Sep 2017 12:02:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52609)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dvQPS-0006pU-7e
	for qemu-trivial@nongnu.org; Fri, 22 Sep 2017 12:02:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dvQPR-0000cP-5H
	for qemu-trivial@nongnu.org; Fri, 22 Sep 2017 12:02:34 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:35705)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dvQP7-0000IK-TR; Fri, 22 Sep 2017 12:02:13 -0400
Received: by mail-qt0-x241.google.com with SMTP id l25so922639qtf.2;
	Fri, 22 Sep 2017 09:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=9wBr7MaEAlSzNBhHHaN4TtcRiiDMdOEVFwJ5WRoCOoo=;
	b=C+1+cmR22e+jIRtd54TyOVMDMt8IjQZ5AJfhilq9lhMN+yKEtcaiFh7eMTML0HtGH9
	PinI2S0wkjmTZSfD8RJA2hsFKjah8m6J/WizVjfFYi/bohS/fvX1L3LqcyCcgEpswl6J
	qey5GGMI7H1vEJdM9PmuqXGTEybE4nQwTBrj+K+KmA5JGOtpYz6nem6ZNQI6schHtGJw
	r7FrHTzRmlkXwiIgCxMLsqbPGsvUD0F9MLJ2VfRpyILUar6Ef4dnhWFAihO8DCOaTZp8
	GzQ4G2sbzJqr27fS/2NFfFOBhaf/Jj/Wy1rcNCmuvs8OC3D2Ir5e2k2L3JgRzR24AvgY
	zH/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=9wBr7MaEAlSzNBhHHaN4TtcRiiDMdOEVFwJ5WRoCOoo=;
	b=F/V0wa+2Ezcxn67nL0Y6DdnKLnURXkLZJTHkI9dzgyctu9uAvdoZZbVcqlvC/Ld7rl
	OXThrCSNDtXbKWLfWpTMBM/OG7pKWsvN/A/5TEA2I4lbBpWt71keLrc/CJG0ULYrGaL2
	APVTymOce7ni65bSEBcZ834CWgYrw+/fl/FLxp5bGYWLXdnVU5nSFP86FtAvZtLppD/M
	J66v0m3cyoGqo6Oozi0wndVPHFq0PT471ojHE2kdM40YbnzinHVOpTl3lNFsx9gO9GWV
	Nglsz7HEjzT9kjoqPRvw15pJl/oDffEIKRNQSuv8w4bIYbowm+mvdcpZbuaGReubsJ+g
	1FpA==
X-Gm-Message-State: AHPjjUiF/4NPtReSxL5H5K6YZIE722Gi/qLycAgcM+Ef6sODH8+Y796s
	OBziHN5nBXbujUrZtoIQUpM=
X-Google-Smtp-Source: AOwi7QD+j1uSEZwCFvrre5ivOEuH9TVKdiE1AwpTWMTxMN+hwEFvHqZh01vdHO2qzB9ppFWRVodssA==
X-Received: by 10.200.47.24 with SMTP id j24mr9127300qta.147.1506096133239;
	Fri, 22 Sep 2017 09:02:13 -0700 (PDT)
Received: from yoga.lan ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id y31sm108325qta.83.2017.09.22.09.02.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Sep 2017 09:02:12 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel@redhat.com>,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
	Aurelien Jarno <aurelien@aurel32.net>, Alexander Graf <agraf@suse.de>,
	David Gibson <david@gibson.dropbear.id.au>,
	Jason Wang <jasowang@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Artyom Tarasenko <atar4qemu@gmail.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-trivial@nongnu.org
Date: Fri, 22 Sep 2017 13:01:09 -0300
Message-Id: <20170922160111.31885-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170922154014.29350-1-f4bug@amsat.org>
References: <20170922154014.29350-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: [Qemu-trivial] [PATCH 32/34] hw/net/ne2000: use TYPE_PCI_NE2000
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 22 Sep 2017 16:02:38 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/net/pci.h  | 1 +
 hw/net/ne2000.c       | 3 ++-
 hw/ppc/mac_newworld.c | 3 ++-
 hw/ppc/mac_oldworld.c | 3 ++-
 hw/ppc/prep.c         | 2 +-
 hw/sparc64/sun4u.c    | 3 ++-
 6 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/include/hw/net/pci.h b/include/hw/net/pci.h
index 43ed3b0145..da733dd1d9 100644
--- a/include/hw/net/pci.h
+++ b/include/hw/net/pci.h
@@ -15,6 +15,7 @@
 
 #define TYPE_PCI_E1000      "e1000"
 #define TYPE_PCI_E1000E     "e1000e"
+#define TYPE_PCI_NE2000     "ne2k_pci"
 #define TYPE_PCI_PCNET      "pcnet"
 #define TYPE_PCI_RTL8139    "rtl8139"
 
diff --git a/hw/net/ne2000.c b/hw/net/ne2000.c
index 29bd4adb3f..b0a664d302 100644
--- a/hw/net/ne2000.c
+++ b/hw/net/ne2000.c
@@ -23,6 +23,7 @@
  */
 #include "qemu/osdep.h"
 #include "hw/pci/pci.h"
+#include "hw/net/pci.h"
 #include "ne2000.h"
 #include "hw/loader.h"
 #include "sysemu/sysemu.h"
@@ -779,7 +780,7 @@ static void ne2000_class_init(ObjectClass *klass, void *data)
 }
 
 static const TypeInfo ne2000_info = {
-    .name          = "ne2k_pci",
+    .name          = TYPE_PCI_NE2000,
     .parent        = TYPE_PCI_DEVICE,
     .instance_size = sizeof(PCINE2000State),
     .class_init    = ne2000_class_init,
diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
index 33b46cb50b..2afc35c27f 100644
--- a/hw/ppc/mac_newworld.c
+++ b/hw/ppc/mac_newworld.c
@@ -55,6 +55,7 @@
 #include "hw/ppc/mac_dbdma.h"
 #include "hw/timer/m48t59.h"
 #include "hw/pci/pci.h"
+#include "hw/net/pci.h"
 #include "net/net.h"
 #include "sysemu/sysemu.h"
 #include "hw/boards.h"
@@ -435,7 +436,7 @@ static void ppc_core99_init(MachineState *machine)
     }
 
     for (i = 0; i < nb_nics; i++) {
-        pci_nic_init_nofail(&nd_table[i], pci_bus, "ne2k_pci", NULL);
+        pci_nic_init_nofail(&nd_table[i], pci_bus, TYPE_PCI_NE2000, NULL);
     }
 
     /* The NewWorld NVRAM is not located in the MacIO device */
diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
index 193b9047d9..8096e5a126 100644
--- a/hw/ppc/mac_oldworld.c
+++ b/hw/ppc/mac_oldworld.c
@@ -34,6 +34,7 @@
 #include "net/net.h"
 #include "hw/isa/isa.h"
 #include "hw/pci/pci.h"
+#include "hw/net/pci.h"
 #include "hw/boards.h"
 #include "hw/nvram/fw_cfg.h"
 #include "hw/char/escc.h"
@@ -278,7 +279,7 @@ static void ppc_heathrow_init(MachineState *machine)
                              escc_mem, 0, memory_region_size(escc_mem));
 
     for(i = 0; i < nb_nics; i++)
-        pci_nic_init_nofail(&nd_table[i], pci_bus, "ne2k_pci", NULL);
+        pci_nic_init_nofail(&nd_table[i], pci_bus, TYPE_PCI_NE2000, NULL);
 
 
     ide_drive_get(hd, ARRAY_SIZE(hd));
diff --git a/hw/ppc/prep.c b/hw/ppc/prep.c
index b2c7a62ebc..103beafef3 100644
--- a/hw/ppc/prep.c
+++ b/hw/ppc/prep.c
@@ -636,7 +636,7 @@ static void ppc_prep_init(MachineState *machine)
             isa_ne2000_init(isa_bus, ne2000_io[i], ne2000_irq[i],
                             &nd_table[i]);
         } else {
-            pci_nic_init_nofail(&nd_table[i], pci_bus, "ne2k_pci", NULL);
+            pci_nic_init_nofail(&nd_table[i], pci_bus, TYPE_PCI_NE2000, NULL);
         }
     }
 
diff --git a/hw/sparc64/sun4u.c b/hw/sparc64/sun4u.c
index fd10741607..67879c5135 100644
--- a/hw/sparc64/sun4u.c
+++ b/hw/sparc64/sun4u.c
@@ -32,6 +32,7 @@
 #include "hw/char/serial.h"
 #include "hw/timer/m48t59.h"
 #include "hw/input/i8042.h"
+#include "hw/net/pci.h"
 #include "hw/block/fdc.h"
 #include "net/net.h"
 #include "qemu/timer.h"
@@ -476,7 +477,7 @@ static void sun4uv_init(MemoryRegion *address_space_mem,
 
             onboard_nic_idx = i;
         } else {
-            pci_nic_init_nofail(nd, pci_bus, "ne2k_pci", NULL);
+            pci_nic_init_nofail(nd, pci_bus, TYPE_PCI_NE2000, NULL);
         }
     }
     onboard_nic_idx = MAX(onboard_nic_idx, 0);
-- 
2.14.1


