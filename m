Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1av35T-0005mw-Gt
	for mharc-qemu-trivial@gnu.org; Tue, 26 Apr 2016 09:31:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38315)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhoujie2011@cn.fujitsu.com>) id 1auwHv-0003EJ-0Z
	for qemu-trivial@nongnu.org; Tue, 26 Apr 2016 02:16:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhoujie2011@cn.fujitsu.com>) id 1auwHu-0007Fg-35
	for qemu-trivial@nongnu.org; Tue, 26 Apr 2016 02:15:58 -0400
Received: from [59.151.112.132] (port=34591 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhoujie2011@cn.fujitsu.com>)
	id 1auwHm-0007Bz-9X; Tue, 26 Apr 2016 02:15:50 -0400
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="5958483"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 26 Apr 2016 14:15:35 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id E96D1408D295;
	Tue, 26 Apr 2016 14:15:30 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.226.45) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Tue, 26 Apr 2016 14:15:30 +0800
From: Zhou Jie <zhoujie2011@cn.fujitsu.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-trivial@nongnu.org>, <balrogg@gmail.com>, Zhou Jie
	<zhoujie2011@cn.fujitsu.com>
Date: Tue, 26 Apr 2016 14:15:08 +0800
Message-ID: <1461651308-894-1-git-send-email-zhoujie2011@cn.fujitsu.com>
X-Mailer: git-send-email 2.5.5
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.226.45]
X-yoursite-MailScanner-ID: E96D1408D295.A61CC
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhoujie2011@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
X-Mailman-Approved-At: Tue, 26 Apr 2016 09:31:31 -0400
Subject: [Qemu-trivial] [PATCH] hw/arm/nseries: Allocating Large sized
 arrays to heap
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Apr 2016 06:16:02 -0000

n8x0_init has a huge stack usage of 65536 bytes approx.
Moving large arrays to heap to reduce stack usage.

Signed-off-by: Zhou Jie <zhoujie2011@cn.fujitsu.com>
---
 hw/arm/nseries.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/arm/nseries.c b/hw/arm/nseries.c
index 5382505..c7068c0 100644
--- a/hw/arm/nseries.c
+++ b/hw/arm/nseries.c
@@ -1364,7 +1364,7 @@ static void n8x0_init(MachineState *machine,
 
     if (option_rom[0].name &&
         (machine->boot_order[0] == 'n' || !machine->kernel_filename)) {
-        uint8_t nolo_tags[0x10000];
+        uint8_t *nolo_tags = g_new(uint8_t, 0x10000);
         /* No, wait, better start at the ROM.  */
         s->mpu->cpu->env.regs[15] = OMAP2_Q2_BASE + 0x400000;
 
@@ -1383,6 +1383,7 @@ static void n8x0_init(MachineState *machine,
 
         n800_setup_nolo_tags(nolo_tags);
         cpu_physical_memory_write(OMAP2_SRAM_BASE, nolo_tags, 0x10000);
+        g_free(nolo_tags);
     }
 }
 
-- 
2.5.5




