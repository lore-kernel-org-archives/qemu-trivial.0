Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4V0p-0002Vc-Rp
	for mharc-qemu-trivial@gnu.org; Tue, 17 Oct 2017 12:46:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47116)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4V0k-0002J9-PS
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 12:46:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4V0f-0003YO-3z
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 12:46:30 -0400
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:51384)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4V0X-0003VW-KU; Tue, 17 Oct 2017 12:46:21 -0400
Received: by mail-qk0-x241.google.com with SMTP id 17so2817941qkq.8;
	Tue, 17 Oct 2017 09:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=b18xZHgjr49Lzj0bRioJP+qASk2dVGkdS6AcU/S59R4=;
	b=YMmqaE6Bz3FoHgHvcXF0uvLbgINhurRFUozMGSDKeUo+8UmruCbC6K2s2DMDDwspvx
	Zz1MPaOv/Pduq4ba9/9JRW+oWHwrZLaPcLQ1zVw0QE6W0bnwE8HFnxAIXyeJUvpQVDUL
	iIx3c2FscoMd50m2sYVl9YazvpHTv354Q3MO1rlH9u26HrtcNQ7benOn74q1YOuV268W
	8ODrUDjX+Pkw8MNL8SajUwk3CffRxRaTOba04e2buacFZ5YTGo0pnCF0Z2z0N3wD83wN
	8857/+VO+YWMOu3Eth+sRYk33HgI+SMGU7pLGIVcdodPZxU861U3gb6SlZ95idX37wFu
	ySKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=b18xZHgjr49Lzj0bRioJP+qASk2dVGkdS6AcU/S59R4=;
	b=uAkT4W7MqogkrqjDnJGQqda3tkmtvt7TEnLFCnTNMF1l6kxhWVS9iYV0r3Mo1u92Jd
	/RLdDF9hhKQKPWrIxJfdUOtbM/CwjWcD7ypPSt+X61YM2VsenhGE0piWIxlCzTcxfMm7
	Z6zSpQ3d+4ItTQGAc1iRjXcW01o/6/N6PcVaZp3mPtmMd3JFWugqZRQDUMSZUIBdpuju
	9qzjK3tcm8erQjliMVL1sSOTmXF8nScBvnRHeQ5CzXB4/vONQoxZbEgw623zHfKNuMd1
	rTI68oqLoNOyYEbxKvUpBRdbtvt60Cmp/UUFMPLzkrx5AQhWzdVp5AITjMeZXQ7DsSlf
	0h/A==
X-Gm-Message-State: AMCzsaXfOH0iiDB5v78ay5fxHgmgoHFrLr7mhsfWrDJx77jbabsWoiXi
	GNgtIclrAYmB/YuXh+81N/k=
X-Google-Smtp-Source: ABhQp+QdpEVdGDidAt3skPGk7B8W5K+zZreS2g/4yjzEKZl+XBNn8Xc+z59u/S2dHEGYcG0SOXqKhA==
X-Received: by 10.55.221.68 with SMTP id n65mr3562717qki.27.1508258781073;
	Tue, 17 Oct 2017 09:46:21 -0700 (PDT)
Received: from x1.local ([181.93.89.178]) by smtp.gmail.com with ESMTPSA id
	q49sm6687653qtq.80.2017.10.17.09.46.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Oct 2017 09:46:20 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Tue, 17 Oct 2017 13:44:08 -0300
Message-Id: <20171017164426.25277-25-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.0.rc0
In-Reply-To: <20171017164426.25277-1-f4bug@amsat.org>
References: <20171017164426.25277-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: [Qemu-trivial] [PATCH v3 24/42] misc: remove old i386 dependency
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
X-List-Received-Date: Tue, 17 Oct 2017 16:46:37 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
---
 hw/audio/pcspk.c                    | 1 -
 hw/i386/kvm/pci-assign.c            | 1 -
 hw/i386/pci-assign-load-rom.c       | 2 --
 hw/i386/xen/xen_platform.c          | 1 -
 hw/isa/vt82c686.c                   | 1 -
 hw/misc/ivshmem.c                   | 1 -
 hw/misc/sga.c                       | 1 -
 hw/pci-bridge/pci_expander_bridge.c | 1 -
 monitor.c                           | 1 -
 9 files changed, 10 deletions(-)

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
index 43429b66be..cd17a93de8 100644
--- a/hw/i386/pci-assign-load-rom.c
+++ b/hw/i386/pci-assign-load-rom.c
@@ -4,9 +4,7 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "hw/hw.h"
-#include "hw/i386/pc.h"
 #include "qemu/error-report.h"
-#include "ui/console.h"
 #include "hw/loader.h"
 #include "monitor/monitor.h"
 #include "qemu/range.h"
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


