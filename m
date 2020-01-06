Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ioO3D-0006MO-Qn
	for mharc-qemu-trivial@gnu.org; Mon, 06 Jan 2020 03:47:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42025)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pannengyuan@huawei.com>) id 1ioHe2-0007JP-6n
 for qemu-trivial@nongnu.org; Sun, 05 Jan 2020 20:57:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pannengyuan@huawei.com>) id 1ioHe1-0007QS-5R
 for qemu-trivial@nongnu.org; Sun, 05 Jan 2020 20:57:26 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2284 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pannengyuan@huawei.com>)
 id 1ioHdw-0007NY-Mr; Sun, 05 Jan 2020 20:57:20 -0500
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id C1C9B904D1D47B245BCD;
 Mon,  6 Jan 2020 09:57:18 +0800 (CST)
Received: from DESKTOP-9NTIQGG.china.huawei.com (10.173.221.136) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.439.0; Mon, 6 Jan 2020 09:57:10 +0800
From: <pannengyuan@huawei.com>
To: <peter.maydell@linaro.org>
CC: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>, <qemu-arm@nongnu.org>, 
 <zhang.zhanghailiang@huawei.com>, Pan Nengyuan <pannengyuan@huawei.com>,
 Euler Robot <euler.robot@huawei.com>
Subject: [PATCH] arm/translate-a64: fix uninitialized variable warning
Date: Mon, 6 Jan 2020 09:57:00 +0800
Message-ID: <20200106015700.52992-1-pannengyuan@huawei.com>
X-Mailer: git-send-email 2.21.0.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.173.221.136]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.191
X-Mailman-Approved-At: Mon, 06 Jan 2020 03:47:48 -0500
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
X-List-Received-Date: Mon, 06 Jan 2020 01:57:27 -0000

From: Pan Nengyuan <pannengyuan@huawei.com>

Fixes:
target/arm/translate-a64.c: In function 'disas_crypto_three_reg_sha512':
target/arm/translate-a64.c:13625:9: error: 'genfn' may be used uninitiali=
zed in this function [-Werror=3Dmaybe-uninitialized]
    genfn(tcg_rd_ptr, tcg_rn_ptr, tcg_rm_ptr);
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
qemu/target/arm/translate-a64.c:13609:8: error: 'feature' may be used uni=
nitialized in this function [-Werror=3Dmaybe-uninitialized]
    if (!feature) {

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
Cc: Peter Maydell <peter.maydell@linaro.org>=20
---
 target/arm/translate-a64.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index d4bebbe629..211e3d813f 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -13564,8 +13564,8 @@ static void disas_crypto_three_reg_sha512(DisasCo=
ntext *s, uint32_t insn)
     int rm =3D extract32(insn, 16, 5);
     int rn =3D extract32(insn, 5, 5);
     int rd =3D extract32(insn, 0, 5);
-    bool feature;
-    CryptoThreeOpFn *genfn;
+    bool feature =3D false;
+    CryptoThreeOpFn *genfn =3D NULL;
=20
     if (o =3D=3D 0) {
         switch (opcode) {
--=20
2.21.0.windows.1



