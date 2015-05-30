Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YybfE-00020l-9h
	for mharc-qemu-trivial@gnu.org; Sat, 30 May 2015 03:58:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52752)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1YybfB-0001us-7U
	for qemu-trivial@nongnu.org; Sat, 30 May 2015 03:58:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1Yybf7-0000XR-WD
	for qemu-trivial@nongnu.org; Sat, 30 May 2015 03:58:37 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:28721)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1Yybf7-0000X3-Ds; Sat, 30 May 2015 03:58:33 -0400
Received: from 172.24.2.119 (EHLO szxeml431-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id BGU05482; Sat, 30 May 2015 15:55:11 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	szxeml431-hub.china.huawei.com (10.82.67.208) with Microsoft SMTP
	Server id 14.3.158.1; Sat, 30 May 2015 15:55:03 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Sat, 30 May 2015 15:54:35 +0800
Message-ID: <1432972477-13504-6-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
In-Reply-To: <1432972477-13504-1-git-send-email-zhaoshenglong@huawei.com>
References: <1432972477-13504-1-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020201.55696CE0.000C, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: c2324483f50d8e162f9ddf521a4959ea
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org, mjt@tls.msk.ru,
	shannon.zhao@linaro.org
Subject: [Qemu-trivial] [PATCH v2 5/7] hw/arm/palm.c: Store irq array in
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
X-List-Received-Date: Sat, 30 May 2015 07:58:38 -0000

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



