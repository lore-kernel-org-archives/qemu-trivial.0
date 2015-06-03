Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z09d1-0003sr-FO
	for mharc-qemu-trivial@gnu.org; Wed, 03 Jun 2015 10:26:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59730)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z09cw-0003kI-Q5
	for qemu-trivial@nongnu.org; Wed, 03 Jun 2015 10:26:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z09cv-0006yv-RA
	for qemu-trivial@nongnu.org; Wed, 03 Jun 2015 10:26:42 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:43598)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Z09cq-0006vS-Gq; Wed, 03 Jun 2015 10:26:36 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id E384B407C6;
	Wed,  3 Jun 2015 17:26:33 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 4F2FAA60;
	Wed,  3 Jun 2015 16:08:54 +0300 (MSK)
Received: (nullmailer pid 27445 invoked by uid 1000);
	Wed, 03 Jun 2015 13:08:52 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Wed,  3 Jun 2015 16:08:36 +0300
Message-Id: <5105505e65ba6bc3e1dc549bcd0d1d33f3546e60.1433336870.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1433336870.git.mjt@msgid.tls.msk.ru>
References: <cover.1433336870.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Shannon Zhao <shannon.zhao@linaro.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>
Subject: [Qemu-trivial] [PULL 16/30] hw/isa/i82378.c: Fix misusing
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
X-List-Received-Date: Wed, 03 Jun 2015 14:26:43 -0000

From: Shannon Zhao <shannon.zhao@linaro.org>

Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
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
2.1.4


