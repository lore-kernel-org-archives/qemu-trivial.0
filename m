Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4V1D-0002uW-C5
	for mharc-qemu-trivial@gnu.org; Tue, 17 Oct 2017 12:47:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47535)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4V1A-0002rw-Aq
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 12:47:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4V19-0003oD-Gx
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 12:47:00 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:52485)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4V16-0003mI-LU; Tue, 17 Oct 2017 12:46:56 -0400
Received: by mail-qt0-x244.google.com with SMTP id 31so4909069qtz.9;
	Tue, 17 Oct 2017 09:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=gPy2fxdk1rnxZoSk/SMfgFX6C2L67+zhbQdjRWQUNag=;
	b=qrA/TBWzzggiiokA5CysC8u1lur4UkGtAaWaQ/0XWX9oF9xzAjbPqoyhFxd9pNvlTA
	TNGpkMijyzR+6gnDHrEqwi0YdOzeNuQveABDCq2eXXpJkBMWxsTEPLe9FZLamnrgpY3h
	gpLexF85+sLFo90wRKg9mYlYwKYTaMfXsZ+bGPWzF9H8uDjeseT7EJXmWaqzTJ1YHy9t
	7YiT8hkEBZcTFflzkxCWdGoZT+z4wZlwULIHDZrfYiS38cA8W2ftVajzSxpKz6Tdpma5
	WwyvZdIybIODzav02Q9Rq4xTFudzdNUl+73z6XR+lA5itKrb7o9mCFHXBjDrW4XvSrUv
	9MqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=gPy2fxdk1rnxZoSk/SMfgFX6C2L67+zhbQdjRWQUNag=;
	b=YURM1Oq3FNLGxMavsVcqMS9vJoNcSj43JNa6i+2O+bmWszAAvvZRQ9DJJ+LLlc2HdO
	77UluE8X0pfAT45saL07ONsQfoDtyATwBUAuirIQaoFhxYqLKHLK9/fTCONiwiBcOrGg
	u2XlJ1uqtgNcBdppOkDEYOiiVS2wuLFZ5wCxd+YFPDdpE8eluJvBGnZdCqf7vtuvnCdl
	IKzn5gYfG0O1xWde6vviNX2BoE1ElK1lvez3ohi4UfoM81JMcycH0g9QLwZsmLXJW7Qr
	ybfeYVx0O7wcExaQ9al7D0MqxVcWtwoaLOuaMqk8KDOFZiROUxAIjtHR6yVcgjTeD+zX
	HlWw==
X-Gm-Message-State: AMCzsaWQ/nRIceRsM9gdEWPb0yw9Bu+rqC/90V5mvQ11n6uc5m2aU9hD
	XJLtnzsjksKB8dIhMuRPzdE=
X-Google-Smtp-Source: ABhQp+R9I+PYvjUEIU/zGHdT9T9LKIzczRS0qBhvnfIjsh8LVdvCWqtVDHGCDIF4gagiHCXB9euwKA==
X-Received: by 10.237.37.8 with SMTP id v8mr21483802qtc.275.1508258816075;
	Tue, 17 Oct 2017 09:46:56 -0700 (PDT)
Received: from x1.local ([181.93.89.178]) by smtp.gmail.com with ESMTPSA id
	q49sm6687653qtq.80.2017.10.17.09.46.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Oct 2017 09:46:55 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
	Gerd Hoffmann <kraxel@redhat.com>,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
	Aurelien Jarno <aurelien@aurel32.net>, Yongbok Kim <yongbok.kim@imgtec.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Tue, 17 Oct 2017 13:44:20 -0300
Message-Id: <20171017164426.25277-37-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.0.rc0
In-Reply-To: <20171017164426.25277-1-f4bug@amsat.org>
References: <20171017164426.25277-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: [Qemu-trivial] [PATCH v3 36/42] hw/display/vga: "vga_int.h"
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
X-List-Received-Date: Tue, 17 Oct 2017 16:47:02 -0000

since The VGACommonState struct has a GraphicHwOps *hw_ops member,
then remove the now unnecessary includes.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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
index b4d579857a..cde3f17ebd 100644
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
index 35696b6fdd..22fd069ad2 100644
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
index cdc3fed6ca..06d0adc590 100644
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
2.15.0.rc0


