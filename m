Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ePgjG-0002tE-SP
	for mharc-qemu-trivial@gnu.org; Thu, 14 Dec 2017 22:32:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34850)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgjB-0002pA-CN
	for qemu-trivial@nongnu.org; Thu, 14 Dec 2017 22:32:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgjA-0005TX-CD
	for qemu-trivial@nongnu.org; Thu, 14 Dec 2017 22:32:01 -0500
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:43811)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgj5-0005Og-Ps; Thu, 14 Dec 2017 22:31:55 -0500
Received: by mail-qk0-x243.google.com with SMTP id j207so8864686qke.10;
	Thu, 14 Dec 2017 19:31:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=w/MSxYt8Puj9UH8o4U72mIYq9rh1UEZzy/Qfi7tb2GQ=;
	b=PkmjikCmIRX3FUbFL8N7I5GPusWxnxY7teHqutpYm0yq1+22HyGvMqmq5D3LrucFGp
	mp177yH4QFup5fvF9541/8F9c6+GUh6/sxOTWNwGwDZM7M7wfCBqeKzJ0DY0Tp+RwdJ7
	ri+cYNExlP6JSxVE+ZVsU1a/lLEbfaSeOPkHe4KHmMtCkvCvlLO0YZ93OkndGoSqTNzA
	Ea0We6246deKwpcET5ZJdW+EBnTby8hiOFYWURGwljf23Rbxv/kowIF8m7F/NlPzcddt
	M14t9erHj+YfcG4oSgNWSAG0haeKZ0tz6nBvk7hfZuLVhOeQ8BiSzofHIEsH07wpkBNz
	kMUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=w/MSxYt8Puj9UH8o4U72mIYq9rh1UEZzy/Qfi7tb2GQ=;
	b=lgH7RDgWqlJIKnEuVHi7FVckMtsX/NR5SXYP+ChnIOBBRWS0b3/9a3aE6OVHFeo6Od
	mAKhf4nbOLmSa8uYPezHqFtHkJJbY+Wsp/Dljxya4Cnxurx+uiH3z4MVHyXHwHYCK7Gz
	NAIxxxWaGtenc1QbT2sBniJwX/8A3Fer+3v8q8J3NFUgZbyJ8sx5UXS87wleR1ElWBRq
	I13aZekpluJo7MxGByxW6MRDqiwQSSXOkSVZcMNe4yIBk02F3smnnSwwIrrg1UxpCs/6
	i9Saz3hzYlgO4VSvRrvYLBItqIXTx3i3G79ABYc035CifA4z6c0q+U6xtZ5xSM+iAZxZ
	xjJw==
X-Gm-Message-State: AKGB3mIXUTAttf+pN3Gw/M1ohCDGZujI5R5hgPVt1M7qez+P2sB/TFON
	Bd/ArOAkXXg5vL0LGNsYT4f41fbcKqI=
X-Google-Smtp-Source: ACJfBovCXIUqjZNak39ct7/habeB7M1Lt4gz+uCEpJpwZVa9T6j+FPWcJS1TD6Cuo8JN5LKw/RE7Dg==
X-Received: by 10.55.122.135 with SMTP id v129mr19767632qkc.104.1513308715307; 
	Thu, 14 Dec 2017 19:31:55 -0800 (PST)
Received: from x1.local ([181.91.222.165]) by smtp.gmail.com with ESMTPSA id
	q24sm3794605qkq.63.2017.12.14.19.31.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Dec 2017 19:31:54 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: "Michael S. Tsirkin" <mst@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-trivial@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Richard Henderson <rth@twiddle.net>, Marcel Apfelbaum <marcel@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	xen-devel@lists.xenproject.org (open list:X86)
Date: Fri, 15 Dec 2017 00:29:56 -0300
Message-Id: <20171215033015.738-25-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20171215033015.738-1-f4bug@amsat.org>
References: <20171215033015.738-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: [Qemu-trivial] [PATCH v4 24/43] misc: remove old i386 dependency
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
X-List-Received-Date: Fri, 15 Dec 2017 03:32:02 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
---
 hw/audio/pcspk.c                    | 1 -
 hw/i386/xen/xen_platform.c          | 1 -
 hw/isa/vt82c686.c                   | 1 -
 hw/misc/ivshmem.c                   | 1 -
 hw/misc/sga.c                       | 1 -
 hw/pci-bridge/pci_expander_bridge.c | 1 -
 monitor.c                           | 1 -
 7 files changed, 7 deletions(-)

diff --git a/hw/audio/pcspk.c b/hw/audio/pcspk.c
index 0206f7399b..908696d483 100644
--- a/hw/audio/pcspk.c
+++ b/hw/audio/pcspk.c
@@ -24,7 +24,6 @@
 
 #include "qemu/osdep.h"
 #include "hw/hw.h"
-#include "hw/i386/pc.h"
 #include "hw/isa/isa.h"
 #include "hw/audio/soundhw.h"
 #include "audio/audio.h"
diff --git a/hw/i386/xen/xen_platform.c b/hw/i386/xen/xen_platform.c
index 056b87de0b..fc8623c90b 100644
--- a/hw/i386/xen/xen_platform.c
+++ b/hw/i386/xen/xen_platform.c
@@ -26,7 +26,6 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "hw/hw.h"
-#include "hw/i386/pc.h"
 #include "hw/ide.h"
 #include "hw/pci/pci.h"
 #include "hw/irq.h"
diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index c129985e2a..4084b32be9 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -12,7 +12,6 @@
 
 #include "qemu/osdep.h"
 #include "hw/hw.h"
-#include "hw/i386/pc.h"
 #include "hw/isa/vt82c686.h"
 #include "hw/i2c/i2c.h"
 #include "hw/i2c/smbus.h"
diff --git a/hw/misc/ivshmem.c b/hw/misc/ivshmem.c
index a5a46827fe..4919011f38 100644
--- a/hw/misc/ivshmem.c
+++ b/hw/misc/ivshmem.c
@@ -20,7 +20,6 @@
 #include "qapi/error.h"
 #include "qemu/cutils.h"
 #include "hw/hw.h"
-#include "hw/i386/pc.h"
 #include "hw/pci/pci.h"
 #include "hw/pci/msi.h"
 #include "hw/pci/msix.h"
diff --git a/hw/misc/sga.c b/hw/misc/sga.c
index 03b006d6f0..97fd63f176 100644
--- a/hw/misc/sga.c
+++ b/hw/misc/sga.c
@@ -26,7 +26,6 @@
  */
 #include "qemu/osdep.h"
 #include "hw/pci/pci.h"
-#include "hw/i386/pc.h"
 #include "hw/loader.h"
 #include "sysemu/sysemu.h"
 
diff --git a/hw/pci-bridge/pci_expander_bridge.c b/hw/pci-bridge/pci_expander_bridge.c
index 8c8ac737ad..9e799dc10f 100644
--- a/hw/pci-bridge/pci_expander_bridge.c
+++ b/hw/pci-bridge/pci_expander_bridge.c
@@ -16,7 +16,6 @@
 #include "hw/pci/pci_bus.h"
 #include "hw/pci/pci_host.h"
 #include "hw/pci/pci_bridge.h"
-#include "hw/i386/pc.h"
 #include "qemu/range.h"
 #include "qemu/error-report.h"
 #include "sysemu/numa.h"
diff --git a/monitor.c b/monitor.c
index e36fb5308d..d682eee2d8 100644
--- a/monitor.c
+++ b/monitor.c
@@ -28,7 +28,6 @@
 #include "hw/hw.h"
 #include "monitor/qdev.h"
 #include "hw/usb.h"
-#include "hw/i386/pc.h"
 #include "hw/pci/pci.h"
 #include "sysemu/watchdog.h"
 #include "hw/loader.h"
-- 
2.15.1


