Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j8knu-0006Uv-JF
	for mharc-qemu-trivial@gnu.org; Mon, 02 Mar 2020 08:08:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48855)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kuhn.chenqun@huawei.com>) id 1j8knn-0006Hg-3I
 for qemu-trivial@nongnu.org; Mon, 02 Mar 2020 08:08:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kuhn.chenqun@huawei.com>) id 1j8knm-0003QV-16
 for qemu-trivial@nongnu.org; Mon, 02 Mar 2020 08:08:07 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:51762 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1j8knj-0003Mm-Jh; Mon, 02 Mar 2020 08:08:03 -0500
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 3C7B568BD8D6A4CC4AD7;
 Mon,  2 Mar 2020 21:07:58 +0800 (CST)
Received: from huawei.com (10.133.205.93) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.439.0; Mon, 2 Mar 2020
 21:07:49 +0800
From: Chen Qun <kuhn.chenqun@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
CC: <peter.maydell@linaro.org>, <zhang.zhanghailiang@huawei.com>, Chen Qun
 <kuhn.chenqun@huawei.com>, Euler Robot <euler.robot@huawei.com>, "Igor
 Mitsyanko" <i.mitsyanko@gmail.com>
Subject: [PATCH v3 07/12] display/exynos4210_fimd: Remove redundant statement
 in exynos4210_fimd_update()
Date: Mon, 2 Mar 2020 21:07:10 +0800
Message-ID: <20200302130715.29440-9-kuhn.chenqun@huawei.com>
X-Mailer: git-send-email 2.21.0.windows.1
In-Reply-To: <20200302130715.29440-1-kuhn.chenqun@huawei.com>
References: <20200302130715.29440-1-kuhn.chenqun@huawei.com>
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
X-List-Received-Date: Mon, 02 Mar 2020 13:08:08 -0000

Clang static code analyzer show warning:
hw/display/exynos4210_fimd.c:1313:17: warning: Value stored to 'is_dirty'=
 is never read
                is_dirty =3D false;

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
---
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
---
 hw/display/exynos4210_fimd.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/display/exynos4210_fimd.c b/hw/display/exynos4210_fimd.c
index c1071ecd46..05d3265b76 100644
--- a/hw/display/exynos4210_fimd.c
+++ b/hw/display/exynos4210_fimd.c
@@ -1310,7 +1310,6 @@ static void exynos4210_fimd_update(void *opaque)
                 }
                 host_fb_addr +=3D inc_size;
                 fb_line_addr +=3D inc_size;
-                is_dirty =3D false;
             }
             g_free(snap);
             blend =3D true;
--=20
2.23.0



