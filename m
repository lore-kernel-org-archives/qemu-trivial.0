Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Yxwff-0004v6-B2
	for mharc-qemu-trivial@gnu.org; Thu, 28 May 2015 08:12:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59114)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1YxwfY-0004gx-Cg
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 08:12:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1YxwfU-0004Pu-Km
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 08:12:16 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:42477)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1YxwfM-0004KO-D3; Thu, 28 May 2015 08:12:04 -0400
Received: from 172.24.2.119 (EHLO SZXEML429-HUB.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CMA92615; Thu, 28 May 2015 20:11:54 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	SZXEML429-HUB.china.huawei.com (10.82.67.184) with Microsoft SMTP
	Server id 14.3.158.1; Thu, 28 May 2015 20:10:18 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 28 May 2015 20:08:47 +0800
Message-ID: <1432814932-12608-25-git-send-email-zhaoshenglong@huawei.com>
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
Subject: [Qemu-trivial] [PATCH 24/29] hw/arm/omap_sx1.c: Fix memory leak
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
X-List-Received-Date: Thu, 28 May 2015 12:12:20 -0000

From: Shannon Zhao <shannon.zhao@linaro.org>

valgrind complains about:
==19440== 248 bytes in 1 blocks are definitely lost in loss record 2,340 of 2,934
==19440==    at 0x4C2845D: malloc (in /usr/lib64/valgrind/vgpreload_memcheck-amd64-linux.so)
==19440==    by 0x354793: malloc_and_trace (vl.c:2556)
==19440==    by 0x64C770E: g_malloc (in /usr/lib64/libglib-2.0.so.0.3600.3)
==19440==    by 0x2833DB: sx1_init (omap_sx1.c:106)
==19440==    by 0x2838C9: sx1_init_v2 (omap_sx1.c:217)
==19440==    by 0x358B5E: main (vl.c:4249)

Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
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
2.0.4



