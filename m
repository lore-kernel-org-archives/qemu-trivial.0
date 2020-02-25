Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j6QRo-0005Vj-AY
	for mharc-qemu-trivial@gnu.org; Mon, 24 Feb 2020 21:59:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44556)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kuhn.chenqun@huawei.com>) id 1j6QRl-0005Sg-QY
 for qemu-trivial@nongnu.org; Mon, 24 Feb 2020 21:59:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kuhn.chenqun@huawei.com>) id 1j6QRk-0007Kt-Su
 for qemu-trivial@nongnu.org; Mon, 24 Feb 2020 21:59:45 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:47664 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1j6QRg-0007Gc-LD; Mon, 24 Feb 2020 21:59:40 -0500
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 5AF4A33254F7D2F1710F;
 Tue, 25 Feb 2020 10:59:35 +0800 (CST)
Received: from huawei.com (10.133.205.93) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.439.0; Tue, 25 Feb 2020
 10:59:27 +0800
From: Chen Qun <kuhn.chenqun@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
CC: <zhang.zhanghailiang@huawei.com>, <peter.chubb@nicta.com.au>,
 <peter.maydell@linaro.org>, <jasowang@redhat.com>, <qemu-arm@nongnu.org>,
 Chen Qun <kuhn.chenqun@huawei.com>
Subject: [PATCH] hw/net/imx_fec: write TGSR and TCSR3 in imx_enet_write()
Date: Tue, 25 Feb 2020 10:59:23 +0800
Message-ID: <20200225025923.19328-1-kuhn.chenqun@huawei.com>
X-Mailer: git-send-email 2.14.1.windows.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [10.133.205.93]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.35
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
X-List-Received-Date: Tue, 25 Feb 2020 02:59:46 -0000

The current code causes clang static code analyzer generate warning:
hw/net/imx_fec.c:858:9: warning: Value stored to 'value' is never read
        value =3D value & 0x0000000f;
        ^       ~~~~~~~~~~~~~~~~~~
hw/net/imx_fec.c:864:9: warning: Value stored to 'value' is never read
        value =3D value & 0x000000fd;
        ^       ~~~~~~~~~~~~~~~~~~

According to the definition of the function, the two =E2=80=9Cvalue=E2=80=
=9D assignments
 should be written to registers.

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
---
I'm not sure if this modification is correct, just from the function
 definition, it is correct.
---
 hw/net/imx_fec.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
index 6a124a154a..92f6215712 100644
--- a/hw/net/imx_fec.c
+++ b/hw/net/imx_fec.c
@@ -855,13 +855,13 @@ static void imx_enet_write(IMXFECState *s, uint32_t=
 index, uint32_t value)
         break;
     case ENET_TGSR:
         /* implement clear timer flag */
-        value =3D value & 0x0000000f;
+        s->regs[index] =3D value & 0x0000000f;
         break;
     case ENET_TCSR0:
     case ENET_TCSR1:
     case ENET_TCSR2:
     case ENET_TCSR3:
-        value =3D value & 0x000000fd;
+        s->regs[index] =3D value & 0x000000fd;
         break;
     case ENET_TCCR0:
     case ENET_TCCR1:
--=20
2.23.0



