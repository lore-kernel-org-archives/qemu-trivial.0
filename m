Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j6Pga-0007NI-G5
	for mharc-qemu-trivial@gnu.org; Mon, 24 Feb 2020 21:11:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38717)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kuhn.chenqun@huawei.com>) id 1j6PgU-000768-6t
 for qemu-trivial@nongnu.org; Mon, 24 Feb 2020 21:10:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kuhn.chenqun@huawei.com>) id 1j6PgT-0008FC-5D
 for qemu-trivial@nongnu.org; Mon, 24 Feb 2020 21:10:54 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:3247 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1j6PgN-00085s-KB; Mon, 24 Feb 2020 21:10:47 -0500
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id A78BD7B223F2D41E97D7;
 Tue, 25 Feb 2020 10:10:42 +0800 (CST)
Received: from huawei.com (10.133.205.93) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.439.0; Tue, 25 Feb 2020
 10:10:34 +0800
From: <kuhn.chenqun@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
CC: <peter.maydell@linaro.org>, <zhang.zhanghailiang@huawei.com>, Chen Qun
 <kuhn.chenqun@huawei.com>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 <qemu-arm@nongnu.org>
Subject: [PATCH 11/13] timer/exynos4210_mct: Remove redundant statement in
 exynos4210_mct_write()
Date: Tue, 25 Feb 2020 10:09:35 +0800
Message-ID: <20200225020937.25028-12-kuhn.chenqun@huawei.com>
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
X-List-Received-Date: Tue, 25 Feb 2020 02:10:55 -0000

From: Chen Qun <kuhn.chenqun@huawei.com>

Clang static code analyzer show warning:
hw/timer/exynos4210_mct.c:1370:9: warning: Value stored to 'index' is never read
        index = GET_L_TIMER_CNT_REG_IDX(offset, lt_i);
        ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
hw/timer/exynos4210_mct.c:1399:9: warning: Value stored to 'index' is never read
        index = GET_L_TIMER_CNT_REG_IDX(offset, lt_i);
        ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
hw/timer/exynos4210_mct.c:1441:9: warning: Value stored to 'index' is never read
        index = GET_L_TIMER_CNT_REG_IDX(offset, lt_i);
        ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
---
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
---
 hw/timer/exynos4210_mct.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/hw/timer/exynos4210_mct.c b/hw/timer/exynos4210_mct.c
index 944120aea5..570cf7075b 100644
--- a/hw/timer/exynos4210_mct.c
+++ b/hw/timer/exynos4210_mct.c
@@ -1367,7 +1367,6 @@ static void exynos4210_mct_write(void *opaque, hwaddr offset,
 
     case L0_TCNTB: case L1_TCNTB:
         lt_i = GET_L_TIMER_IDX(offset);
-        index = GET_L_TIMER_CNT_REG_IDX(offset, lt_i);
 
         /*
          * TCNTB is updated to internal register only after CNT expired.
@@ -1396,7 +1395,6 @@ static void exynos4210_mct_write(void *opaque, hwaddr offset,
 
     case L0_ICNTB: case L1_ICNTB:
         lt_i = GET_L_TIMER_IDX(offset);
-        index = GET_L_TIMER_CNT_REG_IDX(offset, lt_i);
 
         s->l_timer[lt_i].reg.wstat |= L_WSTAT_ICNTB_WRITE;
         s->l_timer[lt_i].reg.cnt[L_REG_CNT_ICNTB] = value &
@@ -1438,8 +1436,6 @@ static void exynos4210_mct_write(void *opaque, hwaddr offset,
 
     case L0_FRCNTB: case L1_FRCNTB:
         lt_i = GET_L_TIMER_IDX(offset);
-        index = GET_L_TIMER_CNT_REG_IDX(offset, lt_i);
-
         DPRINTF("local timer[%d] FRCNTB write %llx\n", lt_i, value);
 
         s->l_timer[lt_i].reg.wstat |= L_WSTAT_FRCCNTB_WRITE;
-- 
2.23.0



