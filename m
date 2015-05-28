Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YxwhB-0007un-Ve
	for mharc-qemu-trivial@gnu.org; Thu, 28 May 2015 08:13:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59779)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1Yxwh5-0007iI-PY
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 08:13:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1Yxwh1-0004jy-SF
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 08:13:51 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:39917)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1Yxwgs-0004hm-Fs; Thu, 28 May 2015 08:13:39 -0400
Received: from 172.24.2.119 (EHLO SZXEML429-HUB.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id BGR93437; Thu, 28 May 2015 20:10:21 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	SZXEML429-HUB.china.huawei.com (10.82.67.184) with Microsoft SMTP
	Server id 14.3.158.1; Thu, 28 May 2015 20:09:53 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 28 May 2015 20:08:25 +0800
Message-ID: <1432814932-12608-3-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
In-Reply-To: <1432814932-12608-1-git-send-email-zhaoshenglong@huawei.com>
References: <1432814932-12608-1-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020201.556705AD.0214, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 584b8a628ee07c39fff2642251ff8a1f
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, mjt@tls.msk.ru,
	shannon.zhao@linaro.org, peter.maydell@linaro.org
Subject: [Qemu-trivial] [PATCH 02/29] hw/ide/cmd646.c: Fix memory leak
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
X-List-Received-Date: Thu, 28 May 2015 12:13:55 -0000

From: Shannon Zhao <shannon.zhao@linaro.org>

valgrind complains about:
==23215== 32 bytes in 2 blocks are definitely lost in loss record 1,356 of 2,329
==23215==    at 0x4C2845D: malloc (in /usr/lib64/valgrind/vgpreload_memcheck-amd64-linux.so)
==23215==    by 0x27482B: malloc_and_trace (vl.c:2556)
==23215==    by 0x64C770E: g_malloc (in /usr/lib64/libglib-2.0.so.0.3600.3)
==23215==    by 0x2EEFD3: qemu_extend_irqs (irq.c:55)
==23215==    by 0x2EF05F: qemu_allocate_irqs (irq.c:64)
==23215==    by 0x305498: pci_cmd646_ide_realize (cmd646.c:364)
==23215==    by 0x33DB29: pci_qdev_realize (pci.c:1781)
==23215==    by 0x2EBB14: device_set_realized (qdev.c:1058)
==23215==    by 0x3C1A0E: property_set_bool (object.c:1514)
==23215==    by 0x3C0308: object_property_set (object.c:837)
==23215==    by 0x3C262A: object_property_set_qobject (qom-qobject.c:24)
==23215==    by 0x3C0577: object_property_set_bool (object.c:905)

Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
---
 hw/ide/cmd646.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/ide/cmd646.c b/hw/ide/cmd646.c
index 66fb9d9..c9703e2 100644
--- a/hw/ide/cmd646.c
+++ b/hw/ide/cmd646.c
@@ -370,6 +370,7 @@ static void pci_cmd646_ide_realize(PCIDevice *dev, Error **errp)
         d->bmdma[i].bus = &d->bus[i];
         ide_register_restart_cb(&d->bus[i]);
     }
+    g_free(irq);
 
     vmstate_register(DEVICE(dev), 0, &vmstate_ide_pci, d);
     qemu_register_reset(cmd646_reset, d);
-- 
2.0.4



