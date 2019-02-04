Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gqnVv-0000h7-OM
	for mharc-qemu-trivial@gnu.org; Mon, 04 Feb 2019 18:18:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49912)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gqnVt-0000dY-MA
	for qemu-trivial@nongnu.org; Mon, 04 Feb 2019 18:18:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gqnVs-0000W5-VL
	for qemu-trivial@nongnu.org; Mon, 04 Feb 2019 18:18:53 -0500
Received: from mx1.redhat.com ([209.132.183.28]:54110)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1gqnVf-000071-LX; Mon, 04 Feb 2019 18:18:40 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 64C2E14AAB;
	Mon,  4 Feb 2019 23:18:36 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-98.brq.redhat.com [10.40.204.98])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1D79017989;
	Mon,  4 Feb 2019 23:18:29 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <rth@twiddle.net>, Andrew Jeffery <andrew@aj.id.au>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Jan Kiszka <jan.kiszka@web.de>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Michael Walle <michael@walle.cc>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-ppc@nongnu.org,
	Peter Chubb <peter.chubb@nicta.com.au>,
	Beniamino Galvani <b.galvani@gmail.com>,
	BALATON Zoltan <balaton@eik.bme.hu>, Magnus Damm <magnus.damm@gmail.com>,
	Gerd Hoffmann <kraxel@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
	Joel Stanley <joel@jms.id.au>, Andrzej Zaborowski <balrogg@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-arm@nongnu.org,
	Jason Wang <jasowang@redhat.com>, Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Thomas Huth <thuth@redhat.com>
Date: Tue,  5 Feb 2019 00:18:05 +0100
Message-Id: <20190204231815.29661-2-philmd@redhat.com>
In-Reply-To: <20190204231815.29661-1-philmd@redhat.com>
References: <20190204231815.29661-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Mon, 04 Feb 2019 23:18:36 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH v2 01/11] hw/arm/aspeed: Use
 TYPE_TMP105/TYPE_PCA9552 instead of hardcoded string
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
X-List-Received-Date: Mon, 04 Feb 2019 23:18:54 -0000

Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/arm/aspeed.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 5158985482..e98ede5a86 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -19,6 +19,8 @@
 #include "hw/arm/aspeed_soc.h"
 #include "hw/boards.h"
 #include "hw/i2c/smbus.h"
+#include "hw/misc/pca9552.h"
+#include "hw/misc/tmp105.h"
 #include "qemu/log.h"
 #include "sysemu/block-backend.h"
 #include "hw/loader.h"
@@ -267,7 +269,8 @@ static void ast2500_evb_i2c_init(AspeedBoardState *bm=
c)
                           eeprom_buf);
=20
     /* The AST2500 EVB expects a LM75 but a TMP105 is compatible */
-    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 7), "tmp105",=
 0x4d);
+    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 7),
+                     TYPE_TMP105, 0x4d);
=20
     /* The AST2500 EVB does not have an RTC. Let's pretend that one is
      * plugged on the I2C bus header */
@@ -288,13 +291,15 @@ static void witherspoon_bmc_i2c_init(AspeedBoardSta=
te *bmc)
     AspeedSoCState *soc =3D &bmc->soc;
     uint8_t *eeprom_buf =3D g_malloc0(8 * 1024);
=20
-    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 3), "pca9552"=
, 0x60);
+    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 3), TYPE_PCA9=
552,
+                     0x60);
=20
     i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 4), "tmp423",=
 0x4c);
     i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 5), "tmp423",=
 0x4c);
=20
     /* The Witherspoon expects a TMP275 but a TMP105 is compatible */
-    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 9), "tmp105",=
 0x4a);
+    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 9), TYPE_TMP1=
05,
+                     0x4a);
=20
     /* The witherspoon board expects Epson RX8900 I2C RTC but a ds1338 i=
s
      * good enough */
@@ -302,7 +307,7 @@ static void witherspoon_bmc_i2c_init(AspeedBoardState=
 *bmc)
=20
     smbus_eeprom_init_one(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 11), 0x5=
1,
                           eeprom_buf);
-    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 11), "pca9552=
",
+    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 11), TYPE_PCA=
9552,
                      0x60);
 }
=20
--=20
2.20.1


