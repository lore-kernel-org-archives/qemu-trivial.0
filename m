Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ip1G0-0007p0-D9
	for mharc-qemu-trivial@gnu.org; Tue, 07 Jan 2020 21:39:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39826)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pannengyuan@huawei.com>) id 1ip1Fy-0007lR-0K
 for qemu-trivial@nongnu.org; Tue, 07 Jan 2020 21:39:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pannengyuan@huawei.com>) id 1ip1Fx-0001ST-0u
 for qemu-trivial@nongnu.org; Tue, 07 Jan 2020 21:39:37 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2287 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pannengyuan@huawei.com>)
 id 1ip1Fr-0001H3-3j; Tue, 07 Jan 2020 21:39:32 -0500
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 408923B9DA37C5863BAA;
 Wed,  8 Jan 2020 10:39:25 +0800 (CST)
Received: from DESKTOP-9NTIQGG.china.huawei.com (10.173.221.136) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.439.0; Wed, 8 Jan 2020 10:39:18 +0800
From: <pannengyuan@huawei.com>
To: <peter.maydell@linaro.org>
CC: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>, <qemu-arm@nongnu.org>, 
 <zhang.zhanghailiang@huawei.com>, Pan Nengyuan <pannengyuan@huawei.com>,
 Euler Robot <euler.robot@huawei.com>
Subject: [PATCH v2] arm/translate-a64: fix uninitialized variable warning
Date: Wed, 8 Jan 2020 10:39:15 +0800
Message-ID: <20200108023915.52288-1-pannengyuan@huawei.com>
X-Mailer: git-send-email 2.21.0.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.173.221.136]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.191
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
X-List-Received-Date: Wed, 08 Jan 2020 02:39:39 -0000

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
---
Changes v2 to v1:
- add a default label to fix uninitialized warnings(suggested by Richard =
Henderson)
---
 target/arm/translate-a64.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index d4bebbe629..63a3d26687 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -13585,6 +13585,8 @@ static void disas_crypto_three_reg_sha512(DisasCo=
ntext *s, uint32_t insn)
             feature =3D dc_isar_feature(aa64_sha3, s);
             genfn =3D NULL;
             break;
+        default:
+            g_assert_not_reached();
         }
     } else {
         switch (opcode) {
--=20
2.21.0.windows.1



