Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ioO3D-0006M5-Kb
	for mharc-qemu-trivial@gnu.org; Mon, 06 Jan 2020 03:47:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41896)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pannengyuan@huawei.com>) id 1ioHbo-00067i-Kd
 for qemu-trivial@nongnu.org; Sun, 05 Jan 2020 20:55:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pannengyuan@huawei.com>) id 1ioHbn-0006GD-MA
 for qemu-trivial@nongnu.org; Sun, 05 Jan 2020 20:55:08 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2283 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pannengyuan@huawei.com>)
 id 1ioHbj-000682-0d; Sun, 05 Jan 2020 20:55:03 -0500
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 9E0DD221AA39A676E0E5;
 Mon,  6 Jan 2020 09:54:54 +0800 (CST)
Received: from DESKTOP-9NTIQGG.china.huawei.com (10.173.221.136) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.439.0; Mon, 6 Jan 2020 09:54:46 +0800
From: <pannengyuan@huawei.com>
To: <eblake@redhat.com>
CC: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>,
 <qemu-block@nongnu.org>, <zhang.zhanghailiang@huawei.com>, Pan Nengyuan
 <pannengyuan@huawei.com>, Euler Robot <euler.robot@huawei.com>
Subject: [PATCH] nbd: fix uninitialized variable warning
Date: Mon, 6 Jan 2020 09:54:43 +0800
Message-ID: <20200106015443.38540-1-pannengyuan@huawei.com>
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
X-List-Received-Date: Mon, 06 Jan 2020 01:55:10 -0000

From: Pan Nengyuan <pannengyuan@huawei.com>

Fixes:
/mnt/sdb/qemu/nbd/server.c: In function 'nbd_handle_request':
/mnt/sdb/qemu/nbd/server.c:2313:9: error: 'ret' may be used uninitialized=
 in this function [-Werror=3Dmaybe-uninitialized]
     int ret;

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
---
 nbd/server.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/nbd/server.c b/nbd/server.c
index 24ebc1a805..7eb3de0842 100644
--- a/nbd/server.c
+++ b/nbd/server.c
@@ -2310,7 +2310,7 @@ static coroutine_fn int nbd_handle_request(NBDClien=
t *client,
                                            NBDRequest *request,
                                            uint8_t *data, Error **errp)
 {
-    int ret;
+    int ret =3D 0;
     int flags;
     NBDExport *exp =3D client->exp;
     char *msg;
--=20
2.21.0.windows.1



