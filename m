Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fSBRg-0005Q5-UD
	for mharc-qemu-trivial@gnu.org; Sun, 10 Jun 2018 21:16:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42966)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSBRc-0005Lr-6c
	for qemu-trivial@nongnu.org; Sun, 10 Jun 2018 21:16:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSBRb-00030q-6r
	for qemu-trivial@nongnu.org; Sun, 10 Jun 2018 21:16:28 -0400
Received: from mail-qt0-x234.google.com ([2607:f8b0:400d:c0d::234]:42500)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSBRX-0002yN-Bk; Sun, 10 Jun 2018 21:16:23 -0400
Received: by mail-qt0-x234.google.com with SMTP id y31-v6so18837862qty.9;
	Sun, 10 Jun 2018 18:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=URI5vXq1/Pq4eTrMDKrrT8V6K5VVTyPtLTtqCCDfXmk=;
	b=VShdoAThjKTiYPuqv84RZcrzx4r/yA8XGhG96IH2CuIY3jpbP6glAaGWsHECapddyL
	Zq2+lcVDzDd2KtU/wl71D38YdH0ZmzO2LwSPzdWbq5LqpRYdtLL5Hm330myuMtSE2Tdo
	Wo/MstpOU293TDhYW/8EVR2aj4W0iY8Fvl+ESao2znAwbx0nh/so3ilNYERgGF0RNxzO
	MKJtbKj03cx9Dfqep7XTRJF5tI13ESPF9BcOtuAJ3O+t51JMRDTlMoXrZbhMrTepE7uK
	6A7U3uUEL7z0fhC1GBepB7GXVSdy2M63rSWyj/wPPas5GdrneSzXFI6kVUMT/7vKFZYi
	iBVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=URI5vXq1/Pq4eTrMDKrrT8V6K5VVTyPtLTtqCCDfXmk=;
	b=cUIL5omZjwCUoHub7TMk6662O96fOVL3G32tpfhz408jHeV6eB5sFQkjK+SOvjcyso
	Oan+wxkU/B4+pv3JirDvkHNZsTQe4o4FKt3jojupMOEP+MiPeYoepbXW3hsormvniCRg
	I5FId+I0Fgmjb7vRbY6CD7VatcMvVjBMpgJQFad5LmWIEA5JN6dlry0A2R7JZ6vZNCKK
	LXcxNwm4w4WHUpGmbzV1Xe5Rada+Nb9+tCglWQCDZv+Eq/X7HGz71PdEwa6q7Tug3yiw
	PEwQ27BJ88/wf3tlh2QHa6zzdh3kADZkEtdpxaQJmXOq4rn7/Q41WPPFxUpj6lUl2VJA
	zkcg==
X-Gm-Message-State: APt69E1ywtacRBfaStLpG4Jqy897XgX8D0dk0z9GdJDBKDc937oOr3QS
	E617p+2gsCYPiZRaddnw6MM=
X-Google-Smtp-Source: ADUXVKILa7Ibkd8MP4G3Q8eg6z5WxnHBRZoNVmkk593d4+IA9qoVf9wEBALp8Qri+/s2xLAWQVjFxw==
X-Received: by 2002:aed:3942:: with SMTP id
	l60-v6mr14805563qte.67.1528679782978; 
	Sun, 10 Jun 2018 18:16:22 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	o5-v6sm28237223qtm.60.2018.06.10.18.16.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Jun 2018 18:16:22 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Thomas Huth <thuth@redhat.com>,
	Stefan Weil <sw@weilnetz.de>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org, Jiri Slaby <jslaby@suse.cz>
Date: Sun, 10 Jun 2018 22:14:36 -0300
Message-Id: <20180611011501.10235-16-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180611011501.10235-1-f4bug@amsat.org>
References: <20180611011501.10235-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::234
Subject: [Qemu-trivial] [PATCH v4 15/40] hw/misc: Use the IEC binary prefix
 definitions
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
X-List-Received-Date: Mon, 11 Jun 2018 01:16:31 -0000

It eases code review, unit is explicit.

Patch generated using:

  $ git grep -E '(1024|2048|4096|8192|(<<|>>).?(10|20|30))' hw/ include/hw/

and modified manually.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/misc/auxbus.c | 3 ++-
 hw/misc/edu.c    | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/misc/auxbus.c b/hw/misc/auxbus.c
index b4cacd664b..b8a8721201 100644
--- a/hw/misc/auxbus.c
+++ b/hw/misc/auxbus.c
@@ -27,6 +27,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qemu/log.h"
 #include "hw/misc/auxbus.h"
 #include "hw/i2c/i2c.h"
@@ -68,7 +69,7 @@ AUXBus *aux_init_bus(DeviceState *parent, const char *name)
 
     /* Memory related. */
     bus->aux_io = g_malloc(sizeof(*bus->aux_io));
-    memory_region_init(bus->aux_io, OBJECT(bus), "aux-io", (1 << 20));
+    memory_region_init(bus->aux_io, OBJECT(bus), "aux-io", 1 * MiB);
     address_space_init(&bus->aux_addr_space, bus->aux_io, "aux-io");
     return bus;
 }
diff --git a/hw/misc/edu.c b/hw/misc/edu.c
index 34eb05d213..df26a4d046 100644
--- a/hw/misc/edu.c
+++ b/hw/misc/edu.c
@@ -23,6 +23,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "hw/pci/pci.h"
 #include "hw/pci/msi.h"
 #include "qemu/timer.h"
@@ -357,7 +358,7 @@ static void pci_edu_realize(PCIDevice *pdev, Error **errp)
                        edu, QEMU_THREAD_JOINABLE);
 
     memory_region_init_io(&edu->mmio, OBJECT(edu), &edu_mmio_ops, edu,
-                    "edu-mmio", 1 << 20);
+                    "edu-mmio", 1 * MiB);
     pci_register_bar(pdev, 0, PCI_BASE_ADDRESS_SPACE_MEMORY, &edu->mmio);
 }
 
-- 
2.17.1


