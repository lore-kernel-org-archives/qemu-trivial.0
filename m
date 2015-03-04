Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YTD4K-0002M9-RZ
	for mharc-qemu-trivial@gnu.org; Wed, 04 Mar 2015 12:26:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41769)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YTD4I-0002HH-Gf
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 12:26:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YTD4H-00055E-MJ
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 12:26:46 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:37105)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YTD44-0004xy-Ap; Wed, 04 Mar 2015 12:26:32 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 32BB3408A6;
	Wed,  4 Mar 2015 20:26:31 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id BB84A96E;
	Wed,  4 Mar 2015 20:07:10 +0300 (MSK)
Received: (nullmailer pid 17534 invoked by uid 1000);
	Wed, 04 Mar 2015 17:07:05 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Wed,  4 Mar 2015 20:06:42 +0300
Message-Id: <a3893b94a222e96c9203aa6b5cb6a8980515eba7.1425488753.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1425488753.git.mjt@msgid.tls.msk.ru>
References: <cover.1425488753.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Thomas Huth <thuth@linux.vnet.ibm.com>
Subject: [Qemu-trivial] [PULL 25/47] xen: Remove xen_cmos_set_s3_resume()
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
X-List-Received-Date: Wed, 04 Mar 2015 17:26:47 -0000

From: Thomas Huth <thuth@linux.vnet.ibm.com>

The function is not used anymore, and thus can be deleted.

Signed-off-by: Thomas Huth <thuth@linux.vnet.ibm.com>
Acked-by: Stefano Stabellini <stefano.stabellini@eu.citrix.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 include/hw/xen/xen.h | 1 -
 xen-hvm-stub.c       | 4 ----
 2 files changed, 5 deletions(-)

diff --git a/include/hw/xen/xen.h b/include/hw/xen/xen.h
index b0ed04c..4356af4 100644
--- a/include/hw/xen/xen.h
+++ b/include/hw/xen/xen.h
@@ -32,7 +32,6 @@ int xen_pci_slot_get_pirq(PCIDevice *pci_dev, int irq_num);
 void xen_piix3_set_irq(void *opaque, int irq_num, int level);
 void xen_piix_pci_write_config_client(uint32_t address, uint32_t val, int len);
 void xen_hvm_inject_msi(uint64_t addr, uint32_t data);
-void xen_cmos_set_s3_resume(void *opaque, int irq, int level);
 
 qemu_irq *xen_interrupt_controller_init(void);
 
diff --git a/xen-hvm-stub.c b/xen-hvm-stub.c
index 2d98696..46867d8 100644
--- a/xen-hvm-stub.c
+++ b/xen-hvm-stub.c
@@ -30,10 +30,6 @@ void xen_hvm_inject_msi(uint64_t addr, uint32_t data)
 {
 }
 
-void xen_cmos_set_s3_resume(void *opaque, int irq, int level)
-{
-}
-
 void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size, MemoryRegion *mr)
 {
 }
-- 
2.1.4


