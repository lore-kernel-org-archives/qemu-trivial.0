Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4FVr-0006dj-Mp
	for mharc-qemu-trivial@gnu.org; Mon, 16 Oct 2017 20:13:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33753)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4FVp-0006bF-Bq
	for qemu-trivial@nongnu.org; Mon, 16 Oct 2017 20:13:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4FVo-0004WT-58
	for qemu-trivial@nongnu.org; Mon, 16 Oct 2017 20:13:37 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:49870)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4FVj-0004Tq-KN; Mon, 16 Oct 2017 20:13:31 -0400
Received: by mail-qt0-x244.google.com with SMTP id k31so56822qta.6;
	Mon, 16 Oct 2017 17:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=cKp4VG4C7kmcRZSQZBieXnrh1VIkQx2MeqZ7RzGzOeo=;
	b=dgaHXGw2HWorE94JrGsaI5DT9vs8XILr/uvV1OKc+f9qO9rE/kZa67K9GYbJ/EM3cD
	MM5cYXkMq8EaHPXAPSJvRq+auX3qzjpqUCGraS98GusBccwLnz7mmDf7p7fJ4WQRO8It
	fQASFBN6RfK6KI/0h75VZn31Xu9/Rx6vgxUlDTJBBKbKSmxAe4bg/WoWsvt+svWsi5Cg
	ufzUzoXrVc/PhMV5pQMtSRbP9zs4ks7cMCpz4Gj+vNRqMBm336On6YnWrHm/nHF2iQ+J
	I0fQq0nN3OaOgv3S1hjc5se2WBImGuaLZGIAPsR+cunIWTxN3UyhHQHXdK37InEi7iiS
	aaoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=cKp4VG4C7kmcRZSQZBieXnrh1VIkQx2MeqZ7RzGzOeo=;
	b=kj2rSc7lmzLKUzMJgow2Lu1w7iWxmS3RGs3ZO/jE7umT0bXOBAdSwW6AXOblLAFsdR
	g3GyqLpNI4Seq42Xp8I/D38i8+SyqYBl9VdxkSrxapu2TO/wOGNPNzcNWHppmlwyBeZ6
	dpj39KWlpiPNrETAIwWdPwMGzHSzuehv8iC3QiM3zp9WpU2fHRP2bI6bMWt2VMQsHQjE
	G1RpflfOW90s9QtW980K8QEQ8AjTlXNr3wuu2cQmk0m9uw4rW9BN+IM/qdjb3IpM/OiV
	9rxiT6G9SedSXIvsvkVK1LhxFlZbob/wqYZy3q2BptrTgA/5mSKKZvDJ5nRdf2am3Ahn
	2hgA==
X-Gm-Message-State: AMCzsaWaiyv9Q+g/PjFPPo7vtvy39LKgiUKHCMC2pDt1aE57iR4Tz6KD
	XJgYYovOETfuMp4ahkD88m4=
X-Google-Smtp-Source: ABhQp+ROvd6uom/dzwp+y4CHBtMudKySvIjNZnNXxebNvGKL+TGnWDgiVypAEciOoByALVo0QCCL5Q==
X-Received: by 10.200.28.138 with SMTP id f10mr10971138qtl.248.1508199211200; 
	Mon, 16 Oct 2017 17:13:31 -0700 (PDT)
Received: from x1.local ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id r6sm5409043qkh.22.2017.10.16.17.13.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Oct 2017 17:13:30 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Mon, 16 Oct 2017 21:11:51 -0300
Message-Id: <20171017001209.32276-22-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.0.rc0
In-Reply-To: <20171017001209.32276-1-f4bug@amsat.org>
References: <20171017001209.32276-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: [Qemu-trivial] [PATCH v2 21/39] misc: remove old i386 dependency
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
X-List-Received-Date: Tue, 17 Oct 2017 00:13:38 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
---
 hw/audio/pcspk.c                    | 1 -
 hw/i386/kvm/pci-assign.c            | 1 -
 hw/i386/pci-assign-load-rom.c       | 1 -
 hw/i386/xen/xen_platform.c          | 1 -
 hw/isa/vt82c686.c                   | 1 -
 hw/misc/ivshmem.c                   | 1 -
 hw/misc/sga.c                       | 1 -
 hw/pci-bridge/pci_expander_bridge.c | 1 -
 monitor.c                           | 1 -
 9 files changed, 9 deletions(-)

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
diff --git a/hw/i386/kvm/pci-assign.c b/hw/i386/kvm/pci-assign.c
index d8559d8342..da954d504c 100644
--- a/hw/i386/kvm/pci-assign.c
+++ b/hw/i386/kvm/pci-assign.c
@@ -25,7 +25,6 @@
 #include <linux/kvm.h>
 #include "qapi/error.h"
 #include "hw/hw.h"
-#include "hw/i386/pc.h"
 #include "qemu/error-report.h"
 #include "ui/console.h"
 #include "hw/loader.h"
diff --git a/hw/i386/pci-assign-load-rom.c b/hw/i386/pci-assign-load-rom.c
index 43429b66be..2c3a60392e 100644
--- a/hw/i386/pci-assign-load-rom.c
+++ b/hw/i386/pci-assign-load-rom.c
@@ -4,7 +4,6 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "hw/hw.h"
-#include "hw/i386/pc.h"
 #include "qemu/error-report.h"
 #include "ui/console.h"
 #include "hw/loader.h"
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
index fe0d1bdbb4..54737d20e7 100644
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
2.15.0.rc0


