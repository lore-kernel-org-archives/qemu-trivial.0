Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eQkxS-0005dh-A1
	for mharc-qemu-trivial@gnu.org; Sun, 17 Dec 2017 21:15:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54171)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1eQkxN-0005WI-EK
	for qemu-trivial@nongnu.org; Sun, 17 Dec 2017 21:15:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1eQkxM-0007j0-HS
	for qemu-trivial@nongnu.org; Sun, 17 Dec 2017 21:15:05 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:46593)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1eQkxH-0007eS-PR; Sun, 17 Dec 2017 21:14:59 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id E5132411AB;
	Mon, 18 Dec 2017 05:14:55 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 2B8FFD30;
	Mon, 18 Dec 2017 00:25:48 +0300 (MSK)
Received: (nullmailer pid 30942 invoked by uid 1000);
	Sun, 17 Dec 2017 21:28:08 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-trivial@nongnu.org
Date: Mon, 18 Dec 2017 00:27:34 +0300
Message-Id: <c7d0877da03c6253a257df3e6057454db6a16b86.1513545944.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1513545944.git.mjt@msgid.tls.msk.ru>
References: <cover.1513545944.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1513545944.git.mjt@msgid.tls.msk.ru>
References: <cover.1513545944.git.mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 29/61] hw: remove "qemu/osdep.h" from header
 files
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
X-List-Received-Date: Mon, 18 Dec 2017 02:15:06 -0000

From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

applied using ./scripts/clean-includes

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Corey Minyard <cminyard@mvista.com>
Tested-by: Corey Minyard <cminyard@mvista.com>
---
 include/hw/acpi/ipmi.h      | 1 -
 include/hw/cpu/core.h       | 1 -
 include/hw/i2c/ppc4xx_i2c.h | 1 -
 3 files changed, 3 deletions(-)

diff --git a/include/hw/acpi/ipmi.h b/include/hw/acpi/ipmi.h
index ab2bb29048..c38483565c 100644
--- a/include/hw/acpi/ipmi.h
+++ b/include/hw/acpi/ipmi.h
@@ -9,7 +9,6 @@
 #ifndef HW_ACPI_IPMI_H
 #define HW_ACPI_IPMI_H
=20
-#include "qemu/osdep.h"
 #include "hw/acpi/aml-build.h"
=20
 /*
diff --git a/include/hw/cpu/core.h b/include/hw/cpu/core.h
index 79ac79c29c..b7470644d8 100644
--- a/include/hw/cpu/core.h
+++ b/include/hw/cpu/core.h
@@ -9,7 +9,6 @@
 #ifndef HW_CPU_CORE_H
 #define HW_CPU_CORE_H
=20
-#include "qemu/osdep.h"
 #include "hw/qdev.h"
=20
 #define TYPE_CPU_CORE "cpu-core"
diff --git a/include/hw/i2c/ppc4xx_i2c.h b/include/hw/i2c/ppc4xx_i2c.h
index e53042f6d4..3450bda577 100644
--- a/include/hw/i2c/ppc4xx_i2c.h
+++ b/include/hw/i2c/ppc4xx_i2c.h
@@ -25,7 +25,6 @@
 #ifndef PPC4XX_I2C_H
 #define PPC4XX_I2C_H
=20
-#include "qemu/osdep.h"
 #include "qemu-common.h"
 #include "hw/sysbus.h"
 #include "hw/i2c/i2c.h"
--=20
2.11.0


