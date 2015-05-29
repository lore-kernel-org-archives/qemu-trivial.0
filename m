Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YyD0d-0006Gc-Vb
	for mharc-qemu-trivial@gnu.org; Fri, 29 May 2015 01:39:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42614)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1YyD0b-0006FU-Lc
	for qemu-trivial@nongnu.org; Fri, 29 May 2015 01:39:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1YyD0Y-0000er-82
	for qemu-trivial@nongnu.org; Fri, 29 May 2015 01:39:05 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:25173)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1YyD0X-0000ea-Kq; Fri, 29 May 2015 01:39:02 -0400
Received: from 172.24.2.119 (EHLO SZXEML429-HUB.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id BGS74890; Fri, 29 May 2015 13:38:50 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	SZXEML429-HUB.china.huawei.com (10.82.67.184) with Microsoft SMTP
	Server id 14.3.158.1; Fri, 29 May 2015 13:38:42 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Fri, 29 May 2015 13:38:34 +0800
Message-ID: <1432877914-13552-1-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020204.5567FB6B.006D, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 8bb665d00a7629fbf5d6d9bcaf2f3a79
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: qemu-trivial@nongnu.org, mjt@tls.msk.ru, shannon.zhao@linaro.org
Subject: [Qemu-trivial] [PATCH v2] hw/arm/omap_sx1.c: Fix memory leak
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
X-List-Received-Date: Fri, 29 May 2015 05:39:06 -0000

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
    This is split from my previous patchset [1]
    [1] [PATCH 00/29] Fix memory leak relevant to calling qemu_allocate_irqs
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



