Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YxwgJ-00069t-Gf
	for mharc-qemu-trivial@gnu.org; Thu, 28 May 2015 08:13:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59373)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1YxwgD-0005yT-5w
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 08:13:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1Yxwg9-0004YY-AO
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 08:12:57 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:42876)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1Yxwg1-0004Wy-7g; Thu, 28 May 2015 08:12:45 -0400
Received: from 172.24.2.119 (EHLO SZXEML429-HUB.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CMA92694; Thu, 28 May 2015 20:12:35 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	SZXEML429-HUB.china.huawei.com (10.82.67.184) with Microsoft SMTP
	Server id 14.3.158.1; Thu, 28 May 2015 20:10:22 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 28 May 2015 20:08:50 +0800
Message-ID: <1432814932-12608-28-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
In-Reply-To: <1432814932-12608-1-git-send-email-zhaoshenglong@huawei.com>
References: <1432814932-12608-1-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, mjt@tls.msk.ru,
	shannon.zhao@linaro.org, peter.maydell@linaro.org
Subject: [Qemu-trivial] [PATCH 27/29] hw/arm/tosa.c: Fix memory leak spotted
	by valgrind
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
X-List-Received-Date: Thu, 28 May 2015 12:13:01 -0000

From: Shannon Zhao <shannon.zhao@linaro.org>

valgrind complains about:
==3169== 32 bytes in 1 blocks are definitely lost in loss record 1,705 of 2,779
==3169==    at 0x4C2845D: malloc (in /usr/lib64/valgrind/vgpreload_memcheck-amd64-linux.so)
==3169==    by 0x3547D3: malloc_and_trace (vl.c:2556)
==3169==    by 0x64C770E: g_malloc (in /usr/lib64/libglib-2.0.so.0.3600.3)
==3169==    by 0x3ED9CF: qemu_extend_irqs (irq.c:55)
==3169==    by 0x3EDA5B: qemu_allocate_irqs (irq.c:64)
==3169==    by 0x28B2C3: tosa_gpio_setup (tosa.c:93)
==3169==    by 0x28B804: tosa_init (tosa.c:241)
==3169==    by 0x358B9E: main (vl.c:4249)

Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
---
 hw/arm/tosa.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/tosa.c b/hw/arm/tosa.c
index 73572eb..83eb991 100644
--- a/hw/arm/tosa.c
+++ b/hw/arm/tosa.c
@@ -112,6 +112,7 @@ static void tosa_gpio_setup(PXA2xxState *cpu,
     qdev_connect_gpio_out(scp1, TOSA_GPIO_NOTE_LED, outsignals[1]);
     qdev_connect_gpio_out(scp1, TOSA_GPIO_CHRG_ERR_LED, outsignals[2]);
     qdev_connect_gpio_out(scp1, TOSA_GPIO_WLAN_LED, outsignals[3]);
+    g_free(outsignals);
 
     qdev_connect_gpio_out(scp1, TOSA_GPIO_TC6393XB_L3V_ON, tc6393xb_l3v_get(tmio));
 
-- 
2.0.4



