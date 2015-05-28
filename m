Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Yxwee-0002zW-G3
	for mharc-qemu-trivial@gnu.org; Thu, 28 May 2015 08:11:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58558)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1YxweM-0002RS-Eo
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 08:11:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1YxweI-0003j8-H6
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 08:11:02 -0400
Received: from szxga01-in.huawei.com ([58.251.152.64]:45269)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1Yxwe5-0003cQ-UY; Thu, 28 May 2015 08:10:46 -0400
Received: from 172.24.2.119 (EHLO SZXEML429-HUB.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id COP98096; Thu, 28 May 2015 20:10:30 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	SZXEML429-HUB.china.huawei.com (10.82.67.184) with Microsoft SMTP
	Server id 14.3.158.1; Thu, 28 May 2015 20:10:03 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 28 May 2015 20:08:34 +0800
Message-ID: <1432814932-12608-12-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
In-Reply-To: <1432814932-12608-1-git-send-email-zhaoshenglong@huawei.com>
References: <1432814932-12608-1-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 58.251.152.64
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, mjt@tls.msk.ru,
	shannon.zhao@linaro.org, peter.maydell@linaro.org
Subject: [Qemu-trivial] [PATCH 11/29] hw/ppc/mac_oldworld.c: Fix memory leak
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
X-List-Received-Date: Thu, 28 May 2015 12:11:06 -0000

From: Shannon Zhao <shannon.zhao@linaro.org>

valgrind complains about:
==12412== 8 bytes in 1 blocks are definitely lost in loss record 448 of 3,760
==12412==    at 0x4C2845D: malloc (in /usr/lib64/valgrind/vgpreload_memcheck-amd64-linux.so)
==12412==    by 0x336F37: malloc_and_trace (vl.c:2556)
==12412==    by 0x64C71F5: ??? (in /usr/lib64/libglib-2.0.so.0.3600.3)
==12412==    by 0x64C7766: g_malloc0 (in /usr/lib64/libglib-2.0.so.0.3600.3)
==12412==    by 0x26D448: ppc_heathrow_init (mac_oldworld.c:238)
==12412==    by 0x33B302: main (vl.c:4249)

Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
---
 hw/ppc/mac_oldworld.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
index f26133d..f66b8aa 100644
--- a/hw/ppc/mac_oldworld.c
+++ b/hw/ppc/mac_oldworld.c
@@ -263,6 +263,7 @@ static void ppc_heathrow_init(MachineState *machine)
         hw_error("Only 6xx bus is supported on heathrow machine\n");
     }
     pic = heathrow_pic_init(&pic_mem, 1, heathrow_irqs);
+    g_free(heathrow_irqs);
     pci_bus = pci_grackle_init(0xfec00000, pic,
                                get_system_memory(),
                                get_system_io());
-- 
2.0.4



