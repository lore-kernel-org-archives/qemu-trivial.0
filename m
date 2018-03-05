Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1esoHx-0003nF-S7
	for mharc-qemu-trivial@gnu.org; Mon, 05 Mar 2018 06:28:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41622)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1esoHq-0003da-CK
	for qemu-trivial@nongnu.org; Mon, 05 Mar 2018 06:28:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1esoHo-00078Q-SE
	for qemu-trivial@nongnu.org; Mon, 05 Mar 2018 06:28:10 -0500
Received: from mail-wr0-x244.google.com ([2a00:1450:400c:c0c::244]:42152)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1esoHo-00077f-Lv; Mon, 05 Mar 2018 06:28:08 -0500
Received: by mail-wr0-x244.google.com with SMTP id k9so16828636wre.9;
	Mon, 05 Mar 2018 03:28:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=PsZ8Pt1IKFYIHfH6zXtT+iTtcuVZX64bIqosnnIYwfs=;
	b=O1RgWCwQhMPh47j9+5PnWsBHO2CLncA7WR2HmOHTf+liFz1dP4n9T5o1tsSsgLq0J2
	s3SEUvldiVZnW+s1PbaTL3NuA8++e/WpsbzOMcN0iIZvjQOr6ANNAaBT6MyyKRsZ60rR
	gVfJ+IcKUDnG+LsZkhxGwgxU8bQadCxNq5laQZeFByaBWGldkBRYaEdMul61yeOa/eGb
	2meWtrb9WqCYXLQj1TC3PvK0giI9vfSkvsoomSb7u89nKJbb33WcKDMf8TTm524tfOn5
	YvWd1zo6jwi7Y2qmAqmSCwIpSwyGHkr+lJXkuB5k5Vs1XPb5Ag4uPsGKRJX+/NOfx5pm
	bIVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=PsZ8Pt1IKFYIHfH6zXtT+iTtcuVZX64bIqosnnIYwfs=;
	b=R55OFjpBRn3n7c8SpwGhngMbvUXQXUQtlw9VjGPRf20WkWBkpEnvR0xh+yS2jN+bS7
	RDmlPIEIcsXQTjpXDXQt30JlOfGNipTdczTRl6Qjt7TUyNhsyWSWJFHbNWfv2KOb0FLr
	izWmR8ZZf5vKtZkMtJkIe6WdXt/lnWv0DbRZcMsaKYitW5Q6Xuht2bYPPldCxm/gwrsG
	UANfkIws/X0kGdFXgeESm36T9/hT2m52VTi92ASpJObb7p/nZjBZd86/hfFajVFBYOHD
	4GCDCTiHUOMe0UWqn61QR0K7eNTZOeoFIW3cf726/nEQ7rwNgQS5wP7RRRYx2jJVIuVX
	3hAg==
X-Gm-Message-State: APf1xPAo42f23+rC6Py1juWZM8JhsIfkqVdBnXH8P0wNyR9BSPetyDqv
	wqrlSjgFnShFgpmb6mUv6yl8fKm3
X-Google-Smtp-Source: AG47ELsWK6JhWlbnQ2kS/EVcq2tfJpgMLJDPb5fpRqxQTDQ4E+ACCsWfXTLr8I4USXsTO5ah+S8WCA==
X-Received: by 10.223.169.110 with SMTP id u101mr13489133wrc.31.1520249287531; 
	Mon, 05 Mar 2018 03:28:07 -0800 (PST)
Received: from x1.local (ABayonne-654-1-79-224.w86-222.abo.wanadoo.fr.
	[86.222.222.224]) by smtp.gmail.com with ESMTPSA id
	k45sm11744388wrf.62.2018.03.05.03.28.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Mar 2018 03:28:07 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Jiri Slaby <jslaby@suse.cz>
Date: Mon,  5 Mar 2018 08:27:23 -0300
Message-Id: <20180305112732.26471-22-f4bug@amsat.org>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180305112732.26471-1-f4bug@amsat.org>
References: <20180305112732.26471-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::244
Subject: [Qemu-trivial] [PATCH v2 21/30] hw/misc: use the BYTE-based
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
X-List-Received-Date: Mon, 05 Mar 2018 11:28:11 -0000

It eases code review, unit is explicit.

Patch generated using:

  $ git grep -E '(1024|2048|4096|8192|(<<|>>).?(10|20|30))' hw/ include/hw/

and modified manually.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/misc/auxbus.c | 2 +-
 hw/misc/edu.c    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/misc/auxbus.c b/hw/misc/auxbus.c
index b4cacd664b..c78aaebcbe 100644
--- a/hw/misc/auxbus.c
+++ b/hw/misc/auxbus.c
@@ -68,7 +68,7 @@ AUXBus *aux_init_bus(DeviceState *parent, const char *name)
 
     /* Memory related. */
     bus->aux_io = g_malloc(sizeof(*bus->aux_io));
-    memory_region_init(bus->aux_io, OBJECT(bus), "aux-io", (1 << 20));
+    memory_region_init(bus->aux_io, OBJECT(bus), "aux-io", 2 * M_BYTE);
     address_space_init(&bus->aux_addr_space, bus->aux_io, "aux-io");
     return bus;
 }
diff --git a/hw/misc/edu.c b/hw/misc/edu.c
index 34eb05d213..ce8235dfc4 100644
--- a/hw/misc/edu.c
+++ b/hw/misc/edu.c
@@ -357,7 +357,7 @@ static void pci_edu_realize(PCIDevice *pdev, Error **errp)
                        edu, QEMU_THREAD_JOINABLE);
 
     memory_region_init_io(&edu->mmio, OBJECT(edu), &edu_mmio_ops, edu,
-                    "edu-mmio", 1 << 20);
+                    "edu-mmio", 1 * M_BYTE);
     pci_register_bar(pdev, 0, PCI_BASE_ADDRESS_SPACE_MEMORY, &edu->mmio);
 }
 
-- 
2.16.2


