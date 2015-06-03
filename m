Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z09d9-00047v-4a
	for mharc-qemu-trivial@gnu.org; Wed, 03 Jun 2015 10:26:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59782)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z09d2-0003uz-T1
	for qemu-trivial@nongnu.org; Wed, 03 Jun 2015 10:26:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z09cy-000702-UL
	for qemu-trivial@nongnu.org; Wed, 03 Jun 2015 10:26:48 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:57910)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Z09cq-0006vW-GL; Wed, 03 Jun 2015 10:26:36 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id EF55E407C8;
	Wed,  3 Jun 2015 17:26:33 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id C2604A65;
	Wed,  3 Jun 2015 16:08:54 +0300 (MSK)
Received: (nullmailer pid 27437 invoked by uid 1000);
	Wed, 03 Jun 2015 13:08:52 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Wed,  3 Jun 2015 16:08:32 +0300
Message-Id: <9f9b026dc60398224fb035eb27ae0ed083d2d66f.1433336870.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1433336870.git.mjt@msgid.tls.msk.ru>
References: <cover.1433336870.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Shannon Zhao <shannon.zhao@linaro.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>
Subject: [Qemu-trivial] [PULL 12/30] hw/arm/omap_sx1.c: Fix memory leak
	spotted by valgrind
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
X-List-Received-Date: Wed, 03 Jun 2015 14:26:51 -0000

From: Shannon Zhao <shannon.zhao@linaro.org>

Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/arm/omap_sx1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/omap_sx1.c b/hw/arm/omap_sx1.c
index 671e02c..4b0f7f9 100644
--- a/hw/arm/omap_sx1.c
+++ b/hw/arm/omap_sx1.c
@@ -103,7 +103,6 @@ static void sx1_init(MachineState *machine, const int version)
     struct omap_mpu_state_s *mpu;
     MemoryRegion *address_space = get_system_memory();
     MemoryRegion *flash = g_new(MemoryRegion, 1);
-    MemoryRegion *flash_1 = g_new(MemoryRegion, 1);
     MemoryRegion *cs = g_new(MemoryRegion, 4);
     static uint32_t cs0val = 0x00213090;
     static uint32_t cs1val = 0x00215070;
@@ -165,6 +164,7 @@ static void sx1_init(MachineState *machine, const int version)
 
     if ((version == 1) &&
             (dinfo = drive_get(IF_PFLASH, 0, fl_idx)) != NULL) {
+        MemoryRegion *flash_1 = g_new(MemoryRegion, 1);
         memory_region_init_ram(flash_1, NULL, "omap_sx1.flash1-0", flash1_size,
                                &error_abort);
         vmstate_register_ram_global(flash_1);
-- 
2.1.4


