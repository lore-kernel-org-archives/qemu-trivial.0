Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YyCqK-0006hV-J2
	for mharc-qemu-trivial@gnu.org; Fri, 29 May 2015 01:28:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39660)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1YyCqB-0006Nd-Ib
	for qemu-trivial@nongnu.org; Fri, 29 May 2015 01:28:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1YyCqA-0005FZ-NV
	for qemu-trivial@nongnu.org; Fri, 29 May 2015 01:28:19 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:21637)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1YyCq3-0005CR-Nj; Fri, 29 May 2015 01:28:12 -0400
Received: from 172.24.2.119 (EHLO SZXEML429-HUB.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id BGS73942; Fri, 29 May 2015 13:28:01 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	SZXEML429-HUB.china.huawei.com (10.82.67.184) with Microsoft SMTP
	Server id 14.3.158.1; Fri, 29 May 2015 13:27:53 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Fri, 29 May 2015 13:27:01 +0800
Message-ID: <1432877231-5136-4-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
In-Reply-To: <1432877231-5136-1-git-send-email-zhaoshenglong@huawei.com>
References: <1432877231-5136-1-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020203.5567F8E2.0053, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: d5106f96c5460bb23d8b367868793788
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, mjt@tls.msk.ru,
	shannon.zhao@linaro.org, peter.maydell@linaro.org
Subject: [Qemu-trivial] [PATCH v2 03/13] hw/isa/i82378.c: Fix misusing
	qemu_allocate_irqs for single irq
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
X-List-Received-Date: Fri, 29 May 2015 05:28:20 -0000

From: Shannon Zhao <shannon.zhao@linaro.org>

valgrind complains about:
==32654== 8 bytes in 1 blocks are definitely lost in loss record 476 of 4,036
==32654==    at 0x4C2845D: malloc (in /usr/lib64/valgrind/vgpreload_memcheck-amd64-linux.so)
==32654==    by 0x336F47: malloc_and_trace (vl.c:2556)
==32654==    by 0x64C770E: g_malloc (in /usr/lib64/libglib-2.0.so.0.3600.3)
==32654==    by 0x3C093B: qemu_extend_irqs (irq.c:55)
==32654==    by 0x3C09C7: qemu_allocate_irqs (irq.c:64)
==32654==    by 0x3EA4CF: i82378_realize (i82378.c:92)
==32654==    by 0x420991: pci_qdev_realize (pci.c:1781)
==32654==    by 0x3BD47C: device_set_realized (qdev.c:1058)
==32654==    by 0x4A6516: property_set_bool (object.c:1514)
==32654==    by 0x4A4E10: object_property_set (object.c:837)
==32654==    by 0x4A7132: object_property_set_qobject (qom-qobject.c:24)
==32654==    by 0x4A507F: object_property_set_bool (object.c:905)

Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
---
 hw/isa/i82378.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/hw/isa/i82378.c b/hw/isa/i82378.c
index 9da9dfc..fcf97d8 100644
--- a/hw/isa/i82378.c
+++ b/hw/isa/i82378.c
@@ -65,7 +65,6 @@ static void i82378_realize(PCIDevice *pci, Error **errp)
     uint8_t *pci_conf;
     ISABus *isabus;
     ISADevice *isa;
-    qemu_irq *out0_irq;
 
     pci_conf = pci->config;
     pci_set_word(pci_conf + PCI_COMMAND,
@@ -88,11 +87,9 @@ static void i82378_realize(PCIDevice *pci, Error **errp)
        All devices accept byte access only, except timer
      */
 
-    /* Workaround the fact that i8259 is not qdev'ified... */
-    out0_irq = qemu_allocate_irqs(i82378_request_out0_irq, s, 1);
-
     /* 2 82C59 (irq) */
-    s->i8259 = i8259_init(isabus, *out0_irq);
+    s->i8259 = i8259_init(isabus,
+                          qemu_allocate_irq(i82378_request_out0_irq, s, 0));
     isa_bus_irqs(isabus, s->i8259);
 
     /* 1 82C54 (pit) */
-- 
2.0.4



