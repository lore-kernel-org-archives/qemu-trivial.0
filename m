Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z08XP-0007LH-F1
	for mharc-qemu-trivial@gnu.org; Wed, 03 Jun 2015 09:16:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35111)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z08XK-0007A9-6O
	for qemu-trivial@nongnu.org; Wed, 03 Jun 2015 09:16:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z08XG-0004UQ-07
	for qemu-trivial@nongnu.org; Wed, 03 Jun 2015 09:16:50 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:55386)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Z08X4-0004Kl-RX; Wed, 03 Jun 2015 09:16:35 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 80694407A4;
	Wed,  3 Jun 2015 16:16:33 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id AEB4EA5A;
	Wed,  3 Jun 2015 16:08:53 +0300 (MSK)
Received: (nullmailer pid 27461 invoked by uid 1000);
	Wed, 03 Jun 2015 13:08:52 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Wed,  3 Jun 2015 16:08:44 +0300
Message-Id: <294972ce546107f2215b3b162994b47f08aab7a4.1433336870.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1433336870.git.mjt@msgid.tls.msk.ru>
References: <cover.1433336870.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Shannon Zhao <shannon.zhao@linaro.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>
Subject: [Qemu-trivial] [PULL 24/30] hw/arm/nseries.c: Fix misusing
	qemu_allocate_irqs for single irq
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 03 Jun 2015 13:16:51 -0000

From: Shannon Zhao <shannon.zhao@linaro.org>

Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/arm/nseries.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/arm/nseries.c b/hw/arm/nseries.c
index d243159..a659e85 100644
--- a/hw/arm/nseries.c
+++ b/hw/arm/nseries.c
@@ -133,9 +133,8 @@ static void n800_mmc_cs_cb(void *opaque, int line, int level)
 
 static void n8x0_gpio_setup(struct n800_s *s)
 {
-    qemu_irq *mmc_cs = qemu_allocate_irqs(n800_mmc_cs_cb, s->mpu->mmc, 1);
-    qdev_connect_gpio_out(s->mpu->gpio, N8X0_MMC_CS_GPIO, mmc_cs[0]);
-
+    qdev_connect_gpio_out(s->mpu->gpio, N8X0_MMC_CS_GPIO,
+                          qemu_allocate_irq(n800_mmc_cs_cb, s->mpu->mmc, 0));
     qemu_irq_lower(qdev_get_gpio_in(s->mpu->gpio, N800_BAT_COVER_GPIO));
 }
 
-- 
2.1.4


