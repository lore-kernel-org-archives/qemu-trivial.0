Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jGeqD-0005NT-Ll
	for mharc-qemu-trivial@gnu.org; Tue, 24 Mar 2020 04:23:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36076)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kuhn.chenqun@huawei.com>) id 1jGeqB-0005HI-5j
 for qemu-trivial@nongnu.org; Tue, 24 Mar 2020 04:23:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kuhn.chenqun@huawei.com>) id 1jGeqA-0004Yy-2m
 for qemu-trivial@nongnu.org; Tue, 24 Mar 2020 04:23:15 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:3211 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1jGeq7-0004S9-Bg; Tue, 24 Mar 2020 04:23:11 -0400
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id BEC028E7C208AB8015FF;
 Tue, 24 Mar 2020 16:23:05 +0800 (CST)
Received: from huawei.com (10.133.205.93) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.487.0; Tue, 24 Mar 2020
 16:22:58 +0800
From: Chen Qun <kuhn.chenqun@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
CC: <zhang.zhanghailiang@huawei.com>, <laurent@vivier.eu>,
 <philmd@redhat.com>, Chen Qun <kuhn.chenqun@huawei.com>, Euler Robot
 <euler.robot@huawei.com>, Igor Mitsyanko <i.mitsyanko@gmail.com>, "Peter
 Maydell" <peter.maydell@linaro.org>
Subject: [PATCH v4 3/3] timer/exynos4210_mct: Remove redundant statement in
 exynos4210_mct_write()
Date: Tue, 24 Mar 2020 16:22:35 +0800
Message-ID: <20200324082235.27980-4-kuhn.chenqun@huawei.com>
X-Mailer: git-send-email 2.21.0.windows.1
In-Reply-To: <20200324082235.27980-1-kuhn.chenqun@huawei.com>
References: <20200324082235.27980-1-kuhn.chenqun@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.133.205.93]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.190
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
X-List-Received-Date: Tue, 24 Mar 2020 08:23:16 -0000

Clang static code analyzer show warning:
hw/timer/exynos4210_mct.c:1370:9: warning: Value stored to 'index' is nev=
er read
        index =3D GET_L_TIMER_CNT_REG_IDX(offset, lt_i);
        ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
hw/timer/exynos4210_mct.c:1399:9: warning: Value stored to 'index' is nev=
er read
        index =3D GET_L_TIMER_CNT_REG_IDX(offset, lt_i);
        ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
hw/timer/exynos4210_mct.c:1441:9: warning: Value stored to 'index' is nev=
er read
        index =3D GET_L_TIMER_CNT_REG_IDX(offset, lt_i);
        ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
---
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
---
 hw/timer/exynos4210_mct.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/hw/timer/exynos4210_mct.c b/hw/timer/exynos4210_mct.c
index 944120aea5..570cf7075b 100644
--- a/hw/timer/exynos4210_mct.c
+++ b/hw/timer/exynos4210_mct.c
@@ -1367,7 +1367,6 @@ static void exynos4210_mct_write(void *opaque, hwad=
dr offset,
=20
     case L0_TCNTB: case L1_TCNTB:
         lt_i =3D GET_L_TIMER_IDX(offset);
-        index =3D GET_L_TIMER_CNT_REG_IDX(offset, lt_i);
=20
         /*
          * TCNTB is updated to internal register only after CNT expired.
@@ -1396,7 +1395,6 @@ static void exynos4210_mct_write(void *opaque, hwad=
dr offset,
=20
     case L0_ICNTB: case L1_ICNTB:
         lt_i =3D GET_L_TIMER_IDX(offset);
-        index =3D GET_L_TIMER_CNT_REG_IDX(offset, lt_i);
=20
         s->l_timer[lt_i].reg.wstat |=3D L_WSTAT_ICNTB_WRITE;
         s->l_timer[lt_i].reg.cnt[L_REG_CNT_ICNTB] =3D value &
@@ -1438,8 +1436,6 @@ static void exynos4210_mct_write(void *opaque, hwad=
dr offset,
=20
     case L0_FRCNTB: case L1_FRCNTB:
         lt_i =3D GET_L_TIMER_IDX(offset);
-        index =3D GET_L_TIMER_CNT_REG_IDX(offset, lt_i);
-
         DPRINTF("local timer[%d] FRCNTB write %llx\n", lt_i, value);
=20
         s->l_timer[lt_i].reg.wstat |=3D L_WSTAT_FRCCNTB_WRITE;
--=20
2.23.0



