Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4V03-0001cW-DD
	for mharc-qemu-trivial@gnu.org; Tue, 17 Oct 2017 12:45:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46506)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4V00-0001ZS-QZ
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 12:45:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4Uzz-0003CQ-L6
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 12:45:48 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:48344)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4Uzu-00039o-RX; Tue, 17 Oct 2017 12:45:42 -0400
Received: by mail-qk0-x244.google.com with SMTP id d67so2845073qkg.5;
	Tue, 17 Oct 2017 09:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=II3MRSSAu5rCm7dKe/bV6oJFatmXZPYogcASEY6OqFs=;
	b=HA+kMqAJHKBLv84TYwwIHgGrY9pmbLj7wSH2zDFVe5ZF0QBPcBit1DVewUoVlg2FDZ
	ptRHzhgx1eZt8B9QNWfdvd1ubfPVpCrdJA7UhWdJpsKmSE8T6gdMiXwIL6prfux9VjZk
	+DOeIKAOfRHd0/AM5K1rRX5uxYtNDNUZ5H8TT+SuqmAdhx8EzDKb+OjIMPHv5XUhhJaH
	wpKWFkS5jGbH9W8dRSmKelrFR4bID6GCnCcTip3J2znVIp7fH+ZPWdgN1U0nYZ+5Dm49
	1xwBztgaAIXLouoRs0Z8bz32K3em67++zJar52cIo2AF747fkbPfSd8RDbc0zexUtpHI
	cGfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=II3MRSSAu5rCm7dKe/bV6oJFatmXZPYogcASEY6OqFs=;
	b=RaXBnPNb44u3qeIu46s8Mpzahw2yzhmObsozFsS0si1Qg1URozRZszE7YG5BzyEqDH
	0PM/81tc10ED6lUtE7doAwTY1xGNgXA0ropwQwKN6bBfzwYfIsluvf7beq6RPHw9DjmC
	RPB+M2SBmgpjYVIjyeJADxuL/7JKhP+VIT1oNGZqiVa5q8e9EiMzBFxR9GDWtUL9N3ra
	VKkVb3AVJ6MdBZaresgLTB24Y2pUUAUdwtLREdL2rWYh5qAdiDLSuC4WB4+uRTG58XGg
	EkXs5LrI2mQvy/HvsnKTtFvWY9YdQrUiXW32ztfBgr38t873cfdhGhpbEJXcD4tGHXmR
	YMag==
X-Gm-Message-State: AMCzsaVZfaoqqT09RV1w2Om16HussIcUUA2a1x8Sa9t6vuJAOqnb2xiv
	QWu/3sk5znQ7KpTNIeobQu8=
X-Google-Smtp-Source: ABhQp+RaZCf1gWIIkLkqVp32T1G8GChuV9ilRfZdztKf39bhVqaPBiUL+ygZFA/FYkLsdUs4NlJ5aw==
X-Received: by 10.55.160.135 with SMTP id j129mr18191128qke.274.1508258742226; 
	Tue, 17 Oct 2017 09:45:42 -0700 (PDT)
Received: from x1.local ([181.93.89.178]) by smtp.gmail.com with ESMTPSA id
	q49sm6687653qtq.80.2017.10.17.09.45.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Oct 2017 09:45:41 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-trivial@nongnu.org
Date: Tue, 17 Oct 2017 13:43:53 -0300
Message-Id: <20171017164426.25277-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.0.rc0
In-Reply-To: <20171017164426.25277-1-f4bug@amsat.org>
References: <20171017164426.25277-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-trivial] [PATCH v3 09/42] hw: use "qemu/osdep.h" as first
 #include in source files
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
X-List-Received-Date: Tue, 17 Oct 2017 16:45:49 -0000

applied using ./scripts/clean-includes

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Acked-by: David Gibson <david@gibson.dropbear.id.au>
Acked-by: Cornelia Huck <cohuck@redhat.com>
---
 hw/acpi/ipmi-stub.c             | 1 +
 hw/audio/fmopl.c                | 1 -
 hw/cpu/core.c                   | 1 +
 hw/ppc/spapr_cpu_core.c         | 1 +
 hw/smbios/smbios_type_38-stub.c | 1 +
 hw/vfio/ccw.c                   | 2 +-
 hw/virtio/vhost-vsock.c         | 2 +-
 7 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/hw/acpi/ipmi-stub.c b/hw/acpi/ipmi-stub.c
index 98b6dcee0d..f525f71c2d 100644
--- a/hw/acpi/ipmi-stub.c
+++ b/hw/acpi/ipmi-stub.c
@@ -7,6 +7,7 @@
  * See the COPYING file in the top-level directory.
  */
 
+#include "qemu/osdep.h"
 #include "hw/acpi/ipmi.h"
 
 void build_acpi_ipmi_devices(Aml *table, BusState *bus)
diff --git a/hw/audio/fmopl.c b/hw/audio/fmopl.c
index 5cfb6a96dd..9f50a89b4a 100644
--- a/hw/audio/fmopl.c
+++ b/hw/audio/fmopl.c
@@ -34,7 +34,6 @@
 #include <math.h>
 //#include "driver.h"		/* use M.A.M.E. */
 #include "fmopl.h"
-#include "qemu/osdep.h"
 #ifndef PI
 #define PI 3.14159265358979323846
 #endif
diff --git a/hw/cpu/core.c b/hw/cpu/core.c
index bd578ab80c..7e42e2c87a 100644
--- a/hw/cpu/core.c
+++ b/hw/cpu/core.c
@@ -6,6 +6,7 @@
  * This work is licensed under the terms of the GNU GPL, version 2 or later.
  * See the COPYING file in the top-level directory.
  */
+#include "qemu/osdep.h"
 #include "hw/cpu/core.h"
 #include "qapi/visitor.h"
 #include "qapi/error.h"
diff --git a/hw/ppc/spapr_cpu_core.c b/hw/ppc/spapr_cpu_core.c
index 3e20b1d886..c963440f45 100644
--- a/hw/ppc/spapr_cpu_core.c
+++ b/hw/ppc/spapr_cpu_core.c
@@ -6,6 +6,7 @@
  * This work is licensed under the terms of the GNU GPL, version 2 or later.
  * See the COPYING file in the top-level directory.
  */
+#include "qemu/osdep.h"
 #include "hw/cpu/core.h"
 #include "hw/ppc/spapr_cpu_core.h"
 #include "target/ppc/cpu.h"
diff --git a/hw/smbios/smbios_type_38-stub.c b/hw/smbios/smbios_type_38-stub.c
index 9528c2c28e..5b83c9b1f1 100644
--- a/hw/smbios/smbios_type_38-stub.c
+++ b/hw/smbios/smbios_type_38-stub.c
@@ -7,6 +7,7 @@
  * See the COPYING file in the top-level directory.
  */
 
+#include "qemu/osdep.h"
 #include "hw/smbios/ipmi.h"
 
 void smbios_build_type_38_table(void)
diff --git a/hw/vfio/ccw.c b/hw/vfio/ccw.c
index 76323c6bde..80457a3deb 100644
--- a/hw/vfio/ccw.c
+++ b/hw/vfio/ccw.c
@@ -11,11 +11,11 @@
  * directory.
  */
 
+#include "qemu/osdep.h"
 #include <linux/vfio.h>
 #include <linux/vfio_ccw.h>
 #include <sys/ioctl.h>
 
-#include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "hw/sysbus.h"
 #include "hw/vfio/vfio.h"
diff --git a/hw/virtio/vhost-vsock.c b/hw/virtio/vhost-vsock.c
index 5ec1c6a2a2..aa5af927e1 100644
--- a/hw/virtio/vhost-vsock.c
+++ b/hw/virtio/vhost-vsock.c
@@ -11,8 +11,8 @@
  * top-level directory.
  */
 
-#include <sys/ioctl.h>
 #include "qemu/osdep.h"
+#include <sys/ioctl.h>
 #include "standard-headers/linux/virtio_vsock.h"
 #include "qapi/error.h"
 #include "hw/virtio/virtio-bus.h"
-- 
2.15.0.rc0


