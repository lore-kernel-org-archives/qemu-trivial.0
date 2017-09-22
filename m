Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dvQ4M-0004Jm-Eg
	for mharc-qemu-trivial@gnu.org; Fri, 22 Sep 2017 11:40:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41012)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dvQ4J-0004H1-K0
	for qemu-trivial@nongnu.org; Fri, 22 Sep 2017 11:40:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dvQ4G-0002uY-G2
	for qemu-trivial@nongnu.org; Fri, 22 Sep 2017 11:40:43 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:38688)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dvQ49-0002lA-56; Fri, 22 Sep 2017 11:40:33 -0400
Received: by mail-qt0-x241.google.com with SMTP id o3so880819qte.5;
	Fri, 22 Sep 2017 08:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=nEm1dbh2nzWvGecKigJSt/i8nVrRDDLFSpXHUP28Dls=;
	b=mvNWghrxLKT/mPTKIAgxoM3CfDuJP0ZX2Qf04P4uzk7DLbCYZP2Yamr82+rrEQfxzA
	4Wiy9Yvlolq74Vuk2gFdEoY+tlR8L812nfqrwapfN1+HMww7M3Rw/85exNbeuiG30rEc
	pmvOkpd3cSb/DbUdHt0uucP4Rfj7msU9Xls0jDtgXTvKiUdZbyRObfQz+vbN75dlY5vn
	+BV3ZlOhaW7NKPkd/RBYNuXzDrI0Xee6t8nORGiY3zRqpYMs4T5LZbX5xQydiJRQ6Kun
	j6TqxMnWpHa3yTAApfO04rZ9HNtC9FuRNGCdrWPTfMwbA+s+eI1K8VHtXkoTgYtYHPW7
	Y48Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=nEm1dbh2nzWvGecKigJSt/i8nVrRDDLFSpXHUP28Dls=;
	b=isGJjX7r/QVAklrMn7bO9kTg1Kj8TA6iLWLl1b9yzS2wVmRvAVjKp+oJmgr1vUEvxR
	DgdLRODE3UC76UAbRhO6iYD4+67SzrJmc913HKA4bdsrhTce3iSVhiEztolXJc4OUnJg
	W2pVaOigUOvcvpvKuhggWKu/oEL0aTgZfxj5hKv9YARbXd64bRTjywFY1vo3gvaxM8FF
	oaS8Kb+tbJ3ExTa/olgGaKXHrvMZ+aPM1iywMqqOaWiJDMhxNxHuv3vhmcdRSZTnfSKP
	CzgInGjooYT2hXld85ErASDQls+NQLy59FR5BKgklVxy6xsKVO/mhErMAYeCHqr5BOSh
	gonw==
X-Gm-Message-State: AHPjjUgvmZSxlSATO59iapKQqIH5j6BEjLKOTysjlKQFSRF9AfJuaeY6
	xmK+A+RqXHcIoqR7f18BOLM=
X-Google-Smtp-Source: AOwi7QCvsY8y7aZapYNK4UKD0qnM+IJHBr38WM3/+Gh/uvcmLrtzY6ij5ozxrQSrQdyarx/kqZvK6A==
X-Received: by 10.200.4.158 with SMTP id s30mr8991757qtg.311.1506094832363;
	Fri, 22 Sep 2017 08:40:32 -0700 (PDT)
Received: from yoga.lan ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id z75sm71742qkb.71.2017.09.22.08.40.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Sep 2017 08:40:31 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>, Alexander Graf <agraf@suse.de>,
	Cornelia Huck <cohuck@redhat.com>,
	Alex Williamson <alex.williamson@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-trivial@nongnu.org
Date: Fri, 22 Sep 2017 12:39:41 -0300
Message-Id: <20170922154014.29350-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170922154014.29350-1-f4bug@amsat.org>
References: <20170922154014.29350-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: [Qemu-trivial] [PATCH 01/34] hw: use "qemu/osdep.h" as first
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
X-List-Received-Date: Fri, 22 Sep 2017 15:40:44 -0000

applied using ./scripts/clean-includes

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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
index c08ee7571a..4a4f0c60fe 100644
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
index a8baadf57a..4810fa0b50 100644
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
index 49e0022533..c11c1eb83e 100644
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
2.14.1


