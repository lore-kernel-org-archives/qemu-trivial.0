Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jH2Ex-0003bo-VP
	for mharc-qemu-trivial@gnu.org; Wed, 25 Mar 2020 05:22:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52708)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kuhn.chenqun@huawei.com>) id 1jH2Es-0003PK-DG
 for qemu-trivial@nongnu.org; Wed, 25 Mar 2020 05:22:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kuhn.chenqun@huawei.com>) id 1jH2Eq-0007yL-Cr
 for qemu-trivial@nongnu.org; Wed, 25 Mar 2020 05:22:17 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:58828 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1jH2Eo-0007ni-1c; Wed, 25 Mar 2020 05:22:14 -0400
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id C909F889F01F33829259;
 Wed, 25 Mar 2020 17:22:05 +0800 (CST)
Received: from huawei.com (10.133.205.93) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.487.0; Wed, 25 Mar 2020
 17:21:59 +0800
From: Chen Qun <kuhn.chenqun@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
CC: <zhang.zhanghailiang@huawei.com>, <laurent@vivier.eu>, Chen Qun
 <kuhn.chenqun@huawei.com>, Euler Robot <euler.robot@huawei.com>
Subject: [PATCH 2/3] virtio-crypto: fix 80-char limit violations in
 virtio_crypto_device_realize()
Date: Wed, 25 Mar 2020 17:21:36 +0800
Message-ID: <20200325092137.24020-3-kuhn.chenqun@huawei.com>
X-Mailer: git-send-email 2.21.0.windows.1
In-Reply-To: <20200325092137.24020-1-kuhn.chenqun@huawei.com>
References: <20200325092137.24020-1-kuhn.chenqun@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.133.205.93]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.32
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
X-List-Received-Date: Wed, 25 Mar 2020 09:22:19 -0000

Fix: aa8f057e74ae

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
---
 hw/virtio/virtio-crypto.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/virtio/virtio-crypto.c b/hw/virtio/virtio-crypto.c
index 4c65114de5..eb4a9e4e85 100644
--- a/hw/virtio/virtio-crypto.c
+++ b/hw/virtio/virtio-crypto.c
@@ -786,7 +786,8 @@ static void virtio_crypto_device_realize(DeviceState =
*dev, Error **errp)
         error_setg(errp, "'cryptodev' parameter expects a valid object")=
;
         return;
     } else if (cryptodev_backend_is_used(vcrypto->cryptodev)) {
-        char *path =3D object_get_canonical_path_component(OBJECT(vcrypt=
o->conf.cryptodev));
+        char *path =3D object_get_canonical_path_component(
+            OBJECT(vcrypto->conf.cryptodev));
         error_setg(errp, "can't use already used cryptodev backend: %s",=
 path);
         g_free(path);
         return;
--=20
2.23.0



