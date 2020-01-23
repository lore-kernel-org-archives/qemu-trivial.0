Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iuSOo-0006oH-3f
	for mharc-qemu-trivial@gnu.org; Wed, 22 Jan 2020 21:39:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49791)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pannengyuan@huawei.com>) id 1iuSOk-0006kI-LL
 for qemu-trivial@nongnu.org; Wed, 22 Jan 2020 21:39:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pannengyuan@huawei.com>) id 1iuSOi-0001bq-BO
 for qemu-trivial@nongnu.org; Wed, 22 Jan 2020 21:39:10 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2689 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pannengyuan@huawei.com>)
 id 1iuSOc-0001W4-Ud; Wed, 22 Jan 2020 21:39:03 -0500
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 1D690621789EB8202781;
 Thu, 23 Jan 2020 10:38:55 +0800 (CST)
Received: from DESKTOP-9NTIQGG.china.huawei.com (10.173.221.136) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.439.0; Thu, 23 Jan 2020 10:38:48 +0800
From: <pannengyuan@huawei.com>
To: <alistair@alistair23.me>, <peter.maydell@linaro.org>
CC: <zhang.zhanghailiang@huawei.com>, <qemu-devel@nongnu.org>,
 <qemu-trivial@nongnu.org>, Pan Nengyuan <pannengyuan@huawei.com>, Euler Robot
 <euler.robot@huawei.com>
Subject: [PATCH] stm32f4xx_syscfg: remove redundant code to fix coverity
 warning
Date: Thu, 23 Jan 2020 10:38:45 +0800
Message-ID: <20200123023845.20980-1-pannengyuan@huawei.com>
X-Mailer: git-send-email 2.21.0.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.173.221.136]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.190
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 23 Jan 2020 02:39:13 -0000

From: Pan Nengyuan <pannengyuan@huawei.com>

Fixes the coverity warning:
    CID 91708242: (EVALUATION_ORDER)
    50. write_write_typo: In "config =3D config =3D irq / 16", "config" i=
s written twice with the same value.
    50    uint8_t config =3D config =3D irq / 16;

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
---
 hw/misc/stm32f4xx_syscfg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/misc/stm32f4xx_syscfg.c b/hw/misc/stm32f4xx_syscfg.c
index dbcdca59f8..f960e4ea1e 100644
--- a/hw/misc/stm32f4xx_syscfg.c
+++ b/hw/misc/stm32f4xx_syscfg.c
@@ -47,7 +47,7 @@ static void stm32f4xx_syscfg_set_irq(void *opaque, int =
irq, int level)
     STM32F4xxSyscfgState *s =3D opaque;
     int icrreg =3D irq / 4;
     int startbit =3D (irq & 3) * 4;
-    uint8_t config =3D config =3D irq / 16;
+    uint8_t config =3D irq / 16;
=20
     trace_stm32f4xx_syscfg_set_irq(irq / 16, irq % 16, level);
=20
--=20
2.21.0.windows.1



