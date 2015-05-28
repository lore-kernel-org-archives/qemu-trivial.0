Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YxwhQ-0008NR-Sd
	for mharc-qemu-trivial@gnu.org; Thu, 28 May 2015 08:14:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59849)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1YxwhK-0008Bg-LM
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 08:14:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1YxwhG-0004mW-U8
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 08:14:06 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:39929)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1Yxwh8-0004l8-P3; Thu, 28 May 2015 08:13:55 -0400
Received: from 172.24.2.119 (EHLO SZXEML429-HUB.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id BGR93436; Thu, 28 May 2015 20:10:21 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	SZXEML429-HUB.china.huawei.com (10.82.67.184) with Microsoft SMTP
	Server id 14.3.158.1; Thu, 28 May 2015 20:09:55 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 28 May 2015 20:08:27 +0800
Message-ID: <1432814932-12608-5-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
In-Reply-To: <1432814932-12608-1-git-send-email-zhaoshenglong@huawei.com>
References: <1432814932-12608-1-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020206.556705AD.0131, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: a6934154f1c7d391e27cf5dc8c63741e
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, mjt@tls.msk.ru,
	shannon.zhao@linaro.org, peter.maydell@linaro.org
Subject: [Qemu-trivial] [PATCH 04/29] hw/i386/pc_q35.c: Fix memory leak
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
X-List-Received-Date: Thu, 28 May 2015 12:14:11 -0000

From: Shannon Zhao <shannon.zhao@linaro.org>

valgrind complains about:
==25058== 128 bytes in 1 blocks are definitely lost in loss record 2,624 of 3,473
==25058==    at 0x4C2845D: malloc (in /usr/lib64/valgrind/vgpreload_memcheck-amd64-linux.so)
==25058==    by 0x2EB657: malloc_and_trace (vl.c:2556)
==25058==    by 0x64C71F5: ??? (in /usr/lib64/libglib-2.0.so.0.3600.3)
==25058==    by 0x64C7766: g_malloc0 (in /usr/lib64/libglib-2.0.so.0.3600.3)
==25058==    by 0x3C62B2: i8259_init (i8259.c:475)
==25058==    by 0x255AF4: pc_q35_init (pc_q35.c:232)
==25058==    by 0x2EFA22: main (vl.c:4249)

Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
---
 hw/i386/pc_q35.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index f2e3cf7..1a311dc 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -235,6 +235,7 @@ static void pc_q35_init(MachineState *machine)
     for (i = 0; i < ISA_NUM_IRQS; i++) {
         gsi_state->i8259_irq[i] = i8259[i];
     }
+    g_free(i8259);
     if (pci_enabled) {
         ioapic_init_gsi(gsi_state, "q35");
     }
-- 
2.0.4



