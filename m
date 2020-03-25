Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jH2Et-0003RM-Cf
	for mharc-qemu-trivial@gnu.org; Wed, 25 Mar 2020 05:22:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52683)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kuhn.chenqun@huawei.com>) id 1jH2Eq-0003Na-KL
 for qemu-trivial@nongnu.org; Wed, 25 Mar 2020 05:22:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kuhn.chenqun@huawei.com>) id 1jH2Ep-0007xF-LN
 for qemu-trivial@nongnu.org; Wed, 25 Mar 2020 05:22:16 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:58826 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1jH2En-0007nl-9f; Wed, 25 Mar 2020 05:22:13 -0400
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id C5342B5FD54A23A36382;
 Wed, 25 Mar 2020 17:22:05 +0800 (CST)
Received: from huawei.com (10.133.205.93) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.487.0; Wed, 25 Mar 2020
 17:21:58 +0800
From: Chen Qun <kuhn.chenqun@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
CC: <zhang.zhanghailiang@huawei.com>, <laurent@vivier.eu>, Chen Qun
 <kuhn.chenqun@huawei.com>
Subject: [PATCH 0/3] Three trivial patchs
Date: Wed, 25 Mar 2020 17:21:34 +0800
Message-ID: <20200325092137.24020-1-kuhn.chenqun@huawei.com>
X-Mailer: git-send-email 2.21.0.windows.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Wed, 25 Mar 2020 09:22:17 -0000

Patch1: For g_autofree type initialized.
Patch2: Juest 80-char limit for virtio-crypto.
Patch3: Redundant type conversion for crypto.

Chen Qun (3):
  gdbstub: prevent uninitialized warning
  virtio-crypto: fix 80-char limit violations in
    virtio_crypto_device_realize()
  crypto: Redundant type conversion for AES_KEY pointer

 crypto/cipher-builtin.c   | 6 ++----
 gdbstub.c                 | 4 ++--
 hw/virtio/virtio-crypto.c | 3 ++-
 3 files changed, 6 insertions(+), 7 deletions(-)

--=20
2.23.0



