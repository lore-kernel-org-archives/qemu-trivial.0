Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YybfF-000243-I2
	for mharc-qemu-trivial@gnu.org; Sat, 30 May 2015 03:58:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52773)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1YybfC-0001wZ-8H
	for qemu-trivial@nongnu.org; Sat, 30 May 2015 03:58:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1Yybf8-0000Xa-0d
	for qemu-trivial@nongnu.org; Sat, 30 May 2015 03:58:38 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:28724)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1Yybf7-0000X5-Do; Sat, 30 May 2015 03:58:33 -0400
Received: from 172.24.2.119 (EHLO szxeml431-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id BGU05481; Sat, 30 May 2015 15:55:11 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	szxeml431-hub.china.huawei.com (10.82.67.208) with Microsoft SMTP
	Server id 14.3.158.1; Sat, 30 May 2015 15:55:04 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Sat, 30 May 2015 15:54:36 +0800
Message-ID: <1432972477-13504-7-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
In-Reply-To: <1432972477-13504-1-git-send-email-zhaoshenglong@huawei.com>
References: <1432972477-13504-1-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020203.55696CDF.00AE, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: a0dc772afec6f99e8f9d52bf2a31bad0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org, mjt@tls.msk.ru,
	shannon.zhao@linaro.org
Subject: [Qemu-trivial] [PATCH v2 6/7] hw/arm/spitz.c: Store irq array in
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
X-List-Received-Date: Sat, 30 May 2015 07:58:39 -0000

From: Shannon Zhao <shannon.zhao@linaro.org>

Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
---
 hw/arm/spitz.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/hw/arm/spitz.c b/hw/arm/spitz.c
index 5bf032a..454919d 100644
--- a/hw/arm/spitz.c
+++ b/hw/arm/spitz.c
@@ -812,8 +812,8 @@ static void spitz_out_switch(void *opaque, int line, int level)
 #define SPITZ_SCP2_BACKLIGHT_ON		8
 #define SPITZ_SCP2_MIC_BIAS		9
 
-static void spitz_scoop_gpio_setup(PXA2xxState *cpu,
-                DeviceState *scp0, DeviceState *scp1)
+static qemu_irq *spitz_scoop_gpio_setup(PXA2xxState *cpu,
+                     DeviceState *scp0, DeviceState *scp1)
 {
     qemu_irq *outsignals = qemu_allocate_irqs(spitz_out_switch, cpu, 8);
 
@@ -828,6 +828,8 @@ static void spitz_scoop_gpio_setup(PXA2xxState *cpu,
     }
 
     qdev_connect_gpio_out(scp0, SPITZ_SCP_ADC_TEMP_ON, outsignals[6]);
+
+    return outsignals;
 }
 
 #define SPITZ_GPIO_HSYNC		22
@@ -928,7 +930,7 @@ static void spitz_common_init(MachineState *machine,
         scp1 = sysbus_create_simple("scoop", 0x08800040, NULL);
     }
 
-    spitz_scoop_gpio_setup(mpu, scp0, scp1);
+    machine->irqs = spitz_scoop_gpio_setup(mpu, scp0, scp1);
 
     spitz_gpio_setup(mpu, (model == akita) ? 1 : 2);
 
-- 
2.0.4



