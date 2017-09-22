Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dvQPT-0006qK-0c
	for mharc-qemu-trivial@gnu.org; Fri, 22 Sep 2017 12:02:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52552)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dvQPQ-0006nG-0m
	for qemu-trivial@nongnu.org; Fri, 22 Sep 2017 12:02:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dvQPP-0000aB-04
	for qemu-trivial@nongnu.org; Fri, 22 Sep 2017 12:02:32 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:34824)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dvQOz-0000Az-BI; Fri, 22 Sep 2017 12:02:05 -0400
Received: by mail-qk0-x244.google.com with SMTP id o77so907005qke.2;
	Fri, 22 Sep 2017 09:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=tJG+9K3zMw8ol/QDWTtz58a5cs2/dRTxO9ibj7Pmppw=;
	b=svNhiCPpAjsN9+V6XyG6rr0jAyZiycQgIvFZc2f2SnVm257CcfKGfmQiHEciAIdMUr
	BEr6p9Of5it7d1chtueDu5pKOMTBMnJH71GCQvdM9MofraQLFbr2tNAxHAgwmEwAuVbw
	3LbPZeqCDyu+DQCWbCfAJhv2qr+DwOl7K0pB9eM4zA9KZnBuuEl3fEJXyrCBp/HP15dy
	4W463F5Nah0vvm7c/M63U3YJSWRZsnYGNAgJR17JhpQMk3LuZUHrLcaNvaFPU5IJxgmZ
	qKONe5dWjSXjjFwCEHVpB0vo+zOPPLgYjmxQUTpQD8eg38PA5Aj3hUR0iKS0TnnTphDr
	Kp/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=tJG+9K3zMw8ol/QDWTtz58a5cs2/dRTxO9ibj7Pmppw=;
	b=WmKuDcgUXa5pKcEkmkWcAzFBFD8GYsDhEvbVwAILxVYwO7d34TQWAtDr680vMB2yny
	6PSCHQ+78RkWGSScFqC3+33INTaBcLpc9rJE8utUT8/+9BsXB9niS67GNLTYYArkgOnL
	bwd4LWM5YEbLwwC7NFCY2HtRcaY5jaa+qQOxMJAtQ8cwSFl+eSgJPbwSoipow/2vasYR
	RYKpMyxLlOI7bDJwqk0nxXhjQEyqXrrgkBBwPONRzhvcBFCRlkVtqAApj0tep5OTBq7B
	MU1VJZyPA2TAI9reUt3ATA8LNGGko9C4i7c1QuRlSD/axsw+v9QP7GeVFpQzSpP2sIJj
	tUlw==
X-Gm-Message-State: AHPjjUjyQ+YaAXfVtwg5ps0h9gKe3UVtNqs/lhsA3gDKccyZ6Yc671cE
	sWr/PsCthTwqOHFR+ZKr5xs=
X-Google-Smtp-Source: AOwi7QD6lMtsgYZgXHodwHl1ZnadhUi3N5l99tIDL7AahsmXSWqBQqZy9Cgu9fzk73Yh5I3HHI/HIA==
X-Received: by 10.55.45.199 with SMTP id t190mr8790760qkh.230.1506096124647;
	Fri, 22 Sep 2017 09:02:04 -0700 (PDT)
Received: from yoga.lan ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id y31sm108325qta.83.2017.09.22.09.02.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Sep 2017 09:02:03 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel@redhat.com>,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Yongbok Kim <yongbok.kim@imgtec.com>, Alexander Graf <agraf@suse.de>,
	David Gibson <david@gibson.dropbear.id.au>,
	Jason Wang <jasowang@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-trivial@nongnu.org
Date: Fri, 22 Sep 2017 13:01:07 -0300
Message-Id: <20170922160111.31885-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170922154014.29350-1-f4bug@amsat.org>
References: <20170922154014.29350-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-trivial] [PATCH 30/34] hw/net/pcnet: use TYPE_PCI_PCNET
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
X-List-Received-Date: Fri, 22 Sep 2017 16:02:33 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/net/pci.h | 1 +
 hw/mips/mips_malta.c | 2 +-
 hw/net/pcnet-pci.c   | 3 +--
 hw/ppc/prep.c        | 3 ++-
 4 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/include/hw/net/pci.h b/include/hw/net/pci.h
index 92111f86f3..5ad5487a91 100644
--- a/include/hw/net/pci.h
+++ b/include/hw/net/pci.h
@@ -15,6 +15,7 @@
 
 #define TYPE_PCI_E1000      "e1000"
 #define TYPE_PCI_E1000E     "e1000e"
+#define TYPE_PCI_PCNET      "pcnet"
 
 PCIDevice *pci_nic_init_nofail(NICInfo *nd, PCIBus *rootbus,
                                const char *default_model,
diff --git a/hw/mips/mips_malta.c b/hw/mips/mips_malta.c
index fb6a2f9363..921678fdb0 100644
--- a/hw/mips/mips_malta.c
+++ b/hw/mips/mips_malta.c
@@ -597,7 +597,7 @@ static void network_init(PCIBus *pci_bus)
             /* The malta board has a PCNet card using PCI SLOT 11 */
             default_devaddr = "0b";
 
-        pci_nic_init_nofail(nd, pci_bus, "pcnet", default_devaddr);
+        pci_nic_init_nofail(nd, pci_bus, TYPE_PCI_PCNET, default_devaddr);
     }
 }
 
diff --git a/hw/net/pcnet-pci.c b/hw/net/pcnet-pci.c
index 0acf8a4879..878e2c89c1 100644
--- a/hw/net/pcnet-pci.c
+++ b/hw/net/pcnet-pci.c
@@ -29,6 +29,7 @@
 
 #include "qemu/osdep.h"
 #include "hw/pci/pci.h"
+#include "hw/net/pci.h"
 #include "net/net.h"
 #include "hw/loader.h"
 #include "qemu/timer.h"
@@ -46,8 +47,6 @@
 //#define PCNET_DEBUG_TMD
 //#define PCNET_DEBUG_MATCH
 
-#define TYPE_PCI_PCNET "pcnet"
-
 #define PCI_PCNET(obj) \
      OBJECT_CHECK(PCIPCNetState, (obj), TYPE_PCI_PCNET)
 
diff --git a/hw/ppc/prep.c b/hw/ppc/prep.c
index fb330a1769..b2c7a62ebc 100644
--- a/hw/ppc/prep.c
+++ b/hw/ppc/prep.c
@@ -44,6 +44,7 @@
 #include "hw/input/i8042.h"
 #include "hw/isa/pc87312.h"
 #include "hw/net/ne2000-isa.h"
+#include "hw/net/pci.h"
 #include "sysemu/block-backend.h"
 #include "sysemu/arch_init.h"
 #include "sysemu/kvm.h"
@@ -800,7 +801,7 @@ static void ibm_40p_init(MachineState *machine)
         pci_vga_init(pci_bus);
 
         for (i = 0; i < nb_nics; i++) {
-            pci_nic_init_nofail(&nd_table[i], pci_bus, "pcnet",
+            pci_nic_init_nofail(&nd_table[i], pci_bus, TYPE_PCI_PCNET,
                                 i == 0 ? "3" : NULL);
         }
     }
-- 
2.14.1


