Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j6sMC-0000dR-2i
	for mharc-qemu-trivial@gnu.org; Wed, 26 Feb 2020 03:47:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44702)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kuhn.chenqun@huawei.com>) id 1j6sM8-0000TF-F1
 for qemu-trivial@nongnu.org; Wed, 26 Feb 2020 03:47:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kuhn.chenqun@huawei.com>) id 1j6sM7-0007gq-An
 for qemu-trivial@nongnu.org; Wed, 26 Feb 2020 03:47:48 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:58922 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1j6sM4-0007Mg-G3; Wed, 26 Feb 2020 03:47:44 -0500
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 619DE51D9CD8B5E24CD;
 Wed, 26 Feb 2020 16:47:42 +0800 (CST)
Received: from huawei.com (10.133.205.93) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.439.0; Wed, 26 Feb 2020
 16:47:31 +0800
From: <kuhn.chenqun@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
CC: <peter.maydell@linaro.org>, <zhang.zhanghailiang@huawei.com>, Chen Qun
 <kuhn.chenqun@huawei.com>, Euler Robot <euler.robot@huawei.com>, Kevin Wolf
 <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>
Subject: [PATCH v2 03/13] block/file-posix: Remove redundant statement in
 raw_handle_perm_lock()
Date: Wed, 26 Feb 2020 16:46:37 +0800
Message-ID: <20200226084647.20636-4-kuhn.chenqun@huawei.com>
X-Mailer: git-send-email 2.21.0.windows.1
In-Reply-To: <20200226084647.20636-1-kuhn.chenqun@huawei.com>
References: <20200226084647.20636-1-kuhn.chenqun@huawei.com>
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
X-List-Received-Date: Wed, 26 Feb 2020 08:47:49 -0000

From: Chen Qun <kuhn.chenqun@huawei.com>

Clang static code analyzer show warning:
  block/file-posix.c:891:9: warning: Value stored to 'op' is never read
        op =3D RAW_PL_ABORT;
        ^    ~~~~~~~~~~~~

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
---
Cc: Kevin Wolf <kwolf@redhat.com>
Cc: Max Reitz <mreitz@redhat.com>
---
 block/file-posix.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index 6345477112..0f77447a25 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -888,7 +888,6 @@ static int raw_handle_perm_lock(BlockDriverState *bs,
                               "Is another process using the image [%s]?\=
n",
                               bs->filename);
         }
-        op =3D RAW_PL_ABORT;
         /* fall through to unlock bytes. */
     case RAW_PL_ABORT:
         raw_apply_lock_bytes(s, s->fd, s->perm, ~s->shared_perm,
--=20
2.23.0



