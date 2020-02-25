Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j6PgZ-0007L9-SU
	for mharc-qemu-trivial@gnu.org; Mon, 24 Feb 2020 21:10:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38730)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kuhn.chenqun@huawei.com>) id 1j6PgU-00078Z-Ut
 for qemu-trivial@nongnu.org; Mon, 24 Feb 2020 21:10:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kuhn.chenqun@huawei.com>) id 1j6PgU-0008Fv-0K
 for qemu-trivial@nongnu.org; Mon, 24 Feb 2020 21:10:54 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:3248 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1j6PgN-00085t-N9; Mon, 24 Feb 2020 21:10:48 -0500
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id C36695B1E644EC59BFDE;
 Tue, 25 Feb 2020 10:10:42 +0800 (CST)
Received: from huawei.com (10.133.205.93) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.439.0; Tue, 25 Feb 2020
 10:10:33 +0800
From: <kuhn.chenqun@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
CC: <peter.maydell@linaro.org>, <zhang.zhanghailiang@huawei.com>, Chen Qun
 <kuhn.chenqun@huawei.com>, Alistair Francis <alistair@alistair23.me>, "Edgar
 E. Iglesias" <edgar.iglesias@gmail.com>, <qemu-arm@nongnu.org>
Subject: [PATCH 09/13] dma/xlnx-zdma: Remove redundant statement in
 zdma_write_dst()
Date: Tue, 25 Feb 2020 10:09:33 +0800
Message-ID: <20200225020937.25028-10-kuhn.chenqun@huawei.com>
X-Mailer: git-send-email 2.14.1.windows.1
In-Reply-To: <20200225020937.25028-1-kuhn.chenqun@huawei.com>
References: <20200225020937.25028-1-kuhn.chenqun@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.133.205.93]
X-CFilter-Loop: Reflected
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
X-List-Received-Date: Tue, 25 Feb 2020 02:10:56 -0000

From: Chen Qun <kuhn.chenqun@huawei.com>

Clang static code analyzer show warning:
hw/dma/xlnx-zdma.c:399:13: warning: Value stored to 'dst_type' is never read
            dst_type = FIELD_EX32(s->dsc_dst.words[3], ZDMA_CH_DST_DSCR_WORD3,
            ^          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
---
Cc: Alistair Francis <alistair@alistair23.me>
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
---
 hw/dma/xlnx-zdma.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/hw/dma/xlnx-zdma.c b/hw/dma/xlnx-zdma.c
index 8fb83f5b07..45355c5d59 100644
--- a/hw/dma/xlnx-zdma.c
+++ b/hw/dma/xlnx-zdma.c
@@ -396,8 +396,6 @@ static void zdma_write_dst(XlnxZDMA *s, uint8_t *buf, uint32_t len)
             zdma_load_descriptor(s, next, &s->dsc_dst);
             dst_size = FIELD_EX32(s->dsc_dst.words[2], ZDMA_CH_DST_DSCR_WORD2,
                                   SIZE);
-            dst_type = FIELD_EX32(s->dsc_dst.words[3], ZDMA_CH_DST_DSCR_WORD3,
-                                  TYPE);
         }
 
         /* Match what hardware does by ignoring the dst_size and only using
-- 
2.23.0



