Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z53b4-0000vL-9w
	for mharc-qemu-trivial@gnu.org; Tue, 16 Jun 2015 23:01:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58677)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1Z53az-0000su-K6
	for qemu-trivial@nongnu.org; Tue, 16 Jun 2015 23:00:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1Z53at-0005oZ-VQ
	for qemu-trivial@nongnu.org; Tue, 16 Jun 2015 23:00:57 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:52530)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1Z53at-0005hu-BN; Tue, 16 Jun 2015 23:00:51 -0400
Received: from 172.24.2.119 (EHLO szxeml434-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id BHU84682; Wed, 17 Jun 2015 11:00:44 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	szxeml434-hub.china.huawei.com (10.82.67.225) with Microsoft SMTP
	Server id 14.3.158.1; Wed, 17 Jun 2015 11:00:30 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Wed, 17 Jun 2015 11:00:00 +0800
Message-ID: <1434510002-6976-7-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
In-Reply-To: <1434510002-6976-1-git-send-email-zhaoshenglong@huawei.com>
References: <1434510002-6976-1-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020201.5580E2DC.00D1, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 30158c6c866eb6b261c8e8dc65f31034
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: qemu-trivial@nongnu.org, mjt@tls.msk.ru, shannon.zhao@linaro.org
Subject: [Qemu-trivial] [PATCH v3 6/8] hw/arm/palm.c: Store irq array in
	MachineState to fix memory leak
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
X-List-Received-Date: Wed, 17 Jun 2015 03:00:59 -0000

From: Shannon Zhao <shannon.zhao@linaro.org>

Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
---
 hw/arm/palm.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/arm/palm.c b/hw/arm/palm.c
index 7f1cfb8..6fe28e5 100644
--- a/hw/arm/palm.c
+++ b/hw/arm/palm.c
@@ -156,7 +156,7 @@ static void palmte_onoff_gpios(void *opaque, int line, int level)
     }
 }
 
-static void palmte_gpio_setup(struct omap_mpu_state_s *cpu)
+static qemu_irq *palmte_gpio_setup(struct omap_mpu_state_s *cpu)
 {
     qemu_irq *misc_gpio;
 
@@ -183,6 +183,8 @@ static void palmte_gpio_setup(struct omap_mpu_state_s *cpu)
     qemu_irq_raise(omap_mpuio_in_get(cpu->mpuio)[6]);
     qemu_irq_raise(omap_mpuio_in_get(cpu->mpuio)[7]);
     qemu_irq_raise(omap_mpuio_in_get(cpu->mpuio)[11]);
+
+    return misc_gpio;
 }
 
 static struct arm_boot_info palmte_binfo = {
@@ -236,7 +238,7 @@ static void palmte_init(MachineState *machine)
 
     qemu_add_kbd_event_handler(palmte_button_event, mpu);
 
-    palmte_gpio_setup(mpu);
+    machine->irqs = palmte_gpio_setup(mpu);
 
     /* Setup initial (reset) machine state */
     if (nb_option_roms) {
-- 
2.0.4



