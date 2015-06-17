Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z53ay-0000sY-C0
	for mharc-qemu-trivial@gnu.org; Tue, 16 Jun 2015 23:00:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58611)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1Z53av-0000sJ-2p
	for qemu-trivial@nongnu.org; Tue, 16 Jun 2015 23:00:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1Z53aq-0005de-7s
	for qemu-trivial@nongnu.org; Tue, 16 Jun 2015 23:00:52 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:52019)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1Z53ap-0005Ty-L0; Tue, 16 Jun 2015 23:00:48 -0400
Received: from 172.24.2.119 (EHLO szxeml434-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CND85246; Wed, 17 Jun 2015 11:00:36 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	szxeml434-hub.china.huawei.com (10.82.67.225) with Microsoft SMTP
	Server id 14.3.158.1; Wed, 17 Jun 2015 11:00:26 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Wed, 17 Jun 2015 10:59:58 +0800
Message-ID: <1434510002-6976-5-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
In-Reply-To: <1434510002-6976-1-git-send-email-zhaoshenglong@huawei.com>
References: <1434510002-6976-1-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: qemu-trivial@nongnu.org, mjt@tls.msk.ru, shannon.zhao@linaro.org
Subject: [Qemu-trivial] [PATCH v3 4/8] hw/m68k/an5206.c: Store irq array in
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
X-List-Received-Date: Wed, 17 Jun 2015 03:00:54 -0000

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



