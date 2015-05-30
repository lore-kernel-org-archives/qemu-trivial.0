Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YybfF-00024p-RO
	for mharc-qemu-trivial@gnu.org; Sat, 30 May 2015 03:58:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52778)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1YybfC-0001x3-Ih
	for qemu-trivial@nongnu.org; Sat, 30 May 2015 03:58:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1Yybf8-0000Xi-9T
	for qemu-trivial@nongnu.org; Sat, 30 May 2015 03:58:38 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:28728)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1Yybf7-0000XF-NS; Sat, 30 May 2015 03:58:34 -0400
Received: from 172.24.2.119 (EHLO szxeml431-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id BGU05479; Sat, 30 May 2015 15:55:11 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	szxeml431-hub.china.huawei.com (10.82.67.208) with Microsoft SMTP
	Server id 14.3.158.1; Sat, 30 May 2015 15:55:00 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Sat, 30 May 2015 15:54:33 +0800
Message-ID: <1432972477-13504-4-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
In-Reply-To: <1432972477-13504-1-git-send-email-zhaoshenglong@huawei.com>
References: <1432972477-13504-1-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020206.55696CDF.0100, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 2856329b4f544d166ab7bd51402bd8e6
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org, mjt@tls.msk.ru,
	shannon.zhao@linaro.org
Subject: [Qemu-trivial] [PATCH v2 3/7] hw/m68k/an5206.c: Store irq array in
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
 hw/m68k/an5206.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/m68k/an5206.c b/hw/m68k/an5206.c
index f63ab2b..6ebf2d2 100644
--- a/hw/m68k/an5206.c
+++ b/hw/m68k/an5206.c
@@ -58,7 +58,7 @@ static void an5206_init(MachineState *machine)
     vmstate_register_ram_global(sram);
     memory_region_add_subregion(address_space_mem, AN5206_RAMBAR_ADDR, sram);
 
-    mcf5206_init(address_space_mem, AN5206_MBAR_ADDR, cpu);
+    machine->irqs = mcf5206_init(address_space_mem, AN5206_MBAR_ADDR, cpu);
 
     /* Load kernel.  */
     if (!kernel_filename) {
-- 
2.0.4



