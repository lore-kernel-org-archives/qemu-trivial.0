Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j6Pga-0007Lx-1k
	for mharc-qemu-trivial@gnu.org; Mon, 24 Feb 2020 21:11:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38658)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kuhn.chenqun@huawei.com>) id 1j6PgS-00070A-9e
 for qemu-trivial@nongnu.org; Mon, 24 Feb 2020 21:10:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kuhn.chenqun@huawei.com>) id 1j6PgR-0008Da-CE
 for qemu-trivial@nongnu.org; Mon, 24 Feb 2020 21:10:52 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:59808 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1j6PgL-0007vp-0r; Mon, 24 Feb 2020 21:10:45 -0500
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id A122E5CC1DCBE591F729;
 Tue, 25 Feb 2020 10:10:37 +0800 (CST)
Received: from huawei.com (10.133.205.93) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.439.0; Tue, 25 Feb 2020
 10:10:29 +0800
From: <kuhn.chenqun@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
CC: <peter.maydell@linaro.org>, <zhang.zhanghailiang@huawei.com>, Chen Qun
 <kuhn.chenqun@huawei.com>, Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 "Paolo Bonzini" <pbonzini@redhat.com>, Peter Lieven <pl@kamp.de>, Kevin Wolf
 <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>, <qemu-block@nongnu.org>
Subject: [PATCH 02/13] block/iscsi:Remove redundant statement in iscsi_open()
Date: Tue, 25 Feb 2020 10:09:26 +0800
Message-ID: <20200225020937.25028-3-kuhn.chenqun@huawei.com>
X-Mailer: git-send-email 2.14.1.windows.1
In-Reply-To: <20200225020937.25028-1-kuhn.chenqun@huawei.com>
References: <20200225020937.25028-1-kuhn.chenqun@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.133.205.93]
X-CFilter-Loop: Reflected
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
X-List-Received-Date: Tue, 25 Feb 2020 02:10:53 -0000

From: Chen Qun <kuhn.chenqun@huawei.com>

Clang static code analyzer show warning:
  block/iscsi.c:1920:9: warning: Value stored to 'flags' is never read
        flags &= ~BDRV_O_RDWR;
        ^        ~~~~~~~~~~~~

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
---
Cc: Ronnie Sahlberg <ronniesahlberg@gmail.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Peter Lieven <pl@kamp.de>
Cc: Kevin Wolf <kwolf@redhat.com>
Cc: Max Reitz <mreitz@redhat.com>
Cc: qemu-block@nongnu.org
---
 block/iscsi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/block/iscsi.c b/block/iscsi.c
index 682abd8e09..ed88479ede 100644
--- a/block/iscsi.c
+++ b/block/iscsi.c
@@ -1917,7 +1917,6 @@ static int iscsi_open(BlockDriverState *bs, QDict *options, int flags,
         if (ret < 0) {
             goto out;
         }
-        flags &= ~BDRV_O_RDWR;
     }
 
     iscsi_readcapacity_sync(iscsilun, &local_err);
-- 
2.23.0



