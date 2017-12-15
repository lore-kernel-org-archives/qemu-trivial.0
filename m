Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ePgjv-0003YE-VC
	for mharc-qemu-trivial@gnu.org; Thu, 14 Dec 2017 22:32:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35642)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgjt-0003W6-V6
	for qemu-trivial@nongnu.org; Thu, 14 Dec 2017 22:32:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgjq-0006cp-Qf
	for qemu-trivial@nongnu.org; Thu, 14 Dec 2017 22:32:45 -0500
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:43109)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgjo-0006ZA-1B; Thu, 14 Dec 2017 22:32:40 -0500
Received: by mail-qt0-x241.google.com with SMTP id w10so10557454qtb.10;
	Thu, 14 Dec 2017 19:32:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=+KkvbwVZ77I11+yPCDh8Qw6tGBs3fRtJboRyQ58slV0=;
	b=pk2leXaI79MQ165QDKVC3g5Bd748QWc4hE6v+6l0QZJa6idmck7kEaQyoWs1T2NvqY
	OryclCR3JmR482E/ZNSrOKYG1l8k2ZIpM2Mw2DbQDZuAgt4uaTkuyArjEq06yW53H9f+
	MltbKG42o12Bg2euv9kpy0+PdlJaW3HIDSxOStJRbDdsrezPP/x5zqpBEDU6+8vIh3Zf
	ll7I0XUSQDAdke2SVU3dP8e/tbdyaQaXubsVFNKUyVGqaYNbYuMayxIz/BzjkNh0V5KP
	eLAJGWi66+Cf+M9ig95iPf0hUtWzciVinFADVUYDJmpSEjBgt+ucW4CmRWDmtItwghVa
	XiaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=+KkvbwVZ77I11+yPCDh8Qw6tGBs3fRtJboRyQ58slV0=;
	b=Tlr2mS2a8kXUvTb3kGEeelPDfXyasvEe3goBut9Whoo/d3G0+YceqUR+KI+JYmsyf2
	jKsK2ayZUtk+OvJnwkkZ+33EyzoeAWJmXuYPcbI8U8SzHkTMoyFFs7vB50NNsdDABjEj
	/lUXyUzb7OYvyFGqrymX9iW08iI6v310GooMZaPkDHZ8hEBFdn66fmgNWWr+OUMRvLc/
	wVDhBhUokxE6zKygTuPbNigirH5WpDzVg4mlSVqeQf8rYA8M21M1mIdkNuVe/zptZQbm
	gPVz54EnHE20qUk66yxviLgD+aNfQLMQH/asfjr1c2I5Tt8s4oC4gUPHNVuiCqguWiWk
	75dQ==
X-Gm-Message-State: AKGB3mJG5lvSL2hZAscUfMX/czwcyh8KeHJJ7M6sc3D7XQbMRHofNcVB
	lcxBCvtjnxRWz3cBig9maLQ=
X-Google-Smtp-Source: ACJfBovqjAD4k3muwGN6p+SEQeDwkTMQStM7A6S2FLhraYLI3gNlJyM/gymlfWwVZgDn4FhMZZ0h0g==
X-Received: by 10.200.57.40 with SMTP id s37mr21014006qtb.41.1513308759535;
	Thu, 14 Dec 2017 19:32:39 -0800 (PST)
Received: from x1.local ([181.91.222.165]) by smtp.gmail.com with ESMTPSA id
	q24sm3794605qkq.63.2017.12.14.19.32.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Dec 2017 19:32:38 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: "Michael S. Tsirkin" <mst@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-trivial@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>
Date: Fri, 15 Dec 2017 00:30:08 -0300
Message-Id: <20171215033015.738-37-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20171215033015.738-1-f4bug@amsat.org>
References: <20171215033015.738-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: [Qemu-trivial] [PATCH v4 36/43] hw/display/vga: "vga_int.h"
 requires "ui/console.h"
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
X-List-Received-Date: Fri, 15 Dec 2017 03:32:47 -0000

since The VGACommonState struct has a GraphicHwOps *hw_ops member,
then remove the now unnecessary includes.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 hw/display/qxl.h        | 1 -
 hw/display/vga_int.h    | 3 ++-
 hw/display/cirrus_vga.c | 1 -
 hw/display/vga-isa-mm.c | 1 -
 hw/display/vga-isa.c    | 1 -
 hw/display/vga-pci.c    | 1 -
 hw/display/vga.c        | 1 -
 hw/display/virtio-vga.c | 1 -
 hw/display/vmware_vga.c | 1 -
 9 files changed, 2 insertions(+), 9 deletions(-)

diff --git a/hw/display/qxl.h b/hw/display/qxl.h
index f6556adb73..8668a8e05a 100644
--- a/hw/display/qxl.h
+++ b/hw/display/qxl.h
@@ -3,7 +3,6 @@
 
 #include "qemu-common.h"
 
-#include "ui/console.h"
 #include "hw/hw.h"
 #include "hw/pci/pci.h"
 #include "vga_int.h"
diff --git a/hw/display/vga_int.h b/hw/display/vga_int.h
index ad34a1f048..fe23b81442 100644
--- a/hw/display/vga_int.h
+++ b/hw/display/vga_int.h
@@ -25,8 +25,9 @@
 #ifndef HW_VGA_INT_H
 #define HW_VGA_INT_H
 
-#include "hw/hw.h"
+#include "exec/ioport.h"
 #include "exec/memory.h"
+#include "ui/console.h"
 
 #define ST01_V_RETRACE      0x08
 #define ST01_DISP_ENABLE    0x01
diff --git a/hw/display/cirrus_vga.c b/hw/display/cirrus_vga.c
index bc32bf1e39..138ae961b9 100644
--- a/hw/display/cirrus_vga.c
+++ b/hw/display/cirrus_vga.c
@@ -31,7 +31,6 @@
 #include "trace.h"
 #include "hw/hw.h"
 #include "hw/pci/pci.h"
-#include "ui/console.h"
 #include "ui/pixel_ops.h"
 #include "vga_int.h"
 #include "hw/loader.h"
diff --git a/hw/display/vga-isa-mm.c b/hw/display/vga-isa-mm.c
index 51ccbccc41..68c4d6e23e 100644
--- a/hw/display/vga-isa-mm.c
+++ b/hw/display/vga-isa-mm.c
@@ -23,7 +23,6 @@
  */
 #include "qemu/osdep.h"
 #include "hw/hw.h"
-#include "ui/console.h"
 #include "hw/i386/pc.h"
 #include "vga_int.h"
 #include "ui/pixel_ops.h"
diff --git a/hw/display/vga-isa.c b/hw/display/vga-isa.c
index 1af95562f2..26f69fd40a 100644
--- a/hw/display/vga-isa.c
+++ b/hw/display/vga-isa.c
@@ -25,7 +25,6 @@
  */
 #include "qemu/osdep.h"
 #include "hw/hw.h"
-#include "ui/console.h"
 #include "hw/i386/pc.h"
 #include "vga_int.h"
 #include "ui/pixel_ops.h"
diff --git a/hw/display/vga-pci.c b/hw/display/vga-pci.c
index 7adb89fcb4..1674bd3581 100644
--- a/hw/display/vga-pci.c
+++ b/hw/display/vga-pci.c
@@ -25,7 +25,6 @@
  */
 #include "qemu/osdep.h"
 #include "hw/hw.h"
-#include "ui/console.h"
 #include "hw/pci/pci.h"
 #include "vga_int.h"
 #include "ui/pixel_ops.h"
diff --git a/hw/display/vga.c b/hw/display/vga.c
index ce95b40e5c..4163b532e0 100644
--- a/hw/display/vga.c
+++ b/hw/display/vga.c
@@ -24,7 +24,6 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "hw/hw.h"
-#include "ui/console.h"
 #include "hw/i386/pc.h"
 #include "hw/pci/pci.h"
 #include "vga_int.h"
diff --git a/hw/display/virtio-vga.c b/hw/display/virtio-vga.c
index f9b017d86b..baa74ba82c 100644
--- a/hw/display/virtio-vga.c
+++ b/hw/display/virtio-vga.c
@@ -1,7 +1,6 @@
 #include "qemu/osdep.h"
 #include "hw/hw.h"
 #include "hw/pci/pci.h"
-#include "ui/console.h"
 #include "vga_int.h"
 #include "hw/virtio/virtio-pci.h"
 #include "qapi/error.h"
diff --git a/hw/display/vmware_vga.c b/hw/display/vmware_vga.c
index 0e6673a911..bd3e8b3586 100644
--- a/hw/display/vmware_vga.c
+++ b/hw/display/vmware_vga.c
@@ -26,7 +26,6 @@
 #include "hw/hw.h"
 #include "hw/loader.h"
 #include "trace.h"
-#include "ui/console.h"
 #include "ui/vnc.h"
 #include "hw/pci/pci.h"
 
-- 
2.15.1


