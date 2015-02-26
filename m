Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YQyUJ-0001Vf-To
	for mharc-qemu-trivial@gnu.org; Thu, 26 Feb 2015 08:28:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57093)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1YQyUH-0001RC-QF
	for qemu-trivial@nongnu.org; Thu, 26 Feb 2015 08:28:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1YQyUB-0007dH-Hk
	for qemu-trivial@nongnu.org; Thu, 26 Feb 2015 08:28:21 -0500
Received: from e06smtp17.uk.ibm.com ([195.75.94.113]:47845)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1YQyUB-0007cq-8S
	for qemu-trivial@nongnu.org; Thu, 26 Feb 2015 08:28:15 -0500
Received: from /spool/local
	by e06smtp17.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <thuth@linux.vnet.ibm.com>;
	Thu, 26 Feb 2015 13:28:14 -0000
Received: from d06dlp02.portsmouth.uk.ibm.com (9.149.20.14)
	by e06smtp17.uk.ibm.com (192.168.101.147) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Thu, 26 Feb 2015 13:28:12 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com
	(d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
	by d06dlp02.portsmouth.uk.ibm.com (Postfix) with ESMTP id 33F33219005E; 
	Thu, 26 Feb 2015 13:28:05 +0000 (GMT)
Received: from d06av04.portsmouth.uk.ibm.com (d06av04.portsmouth.uk.ibm.com
	[9.149.37.216])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id t1QDSCmr12124594; Thu, 26 Feb 2015 13:28:12 GMT
Received: from d06av04.portsmouth.uk.ibm.com (localhost [127.0.0.1])
	by d06av04.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with
	ESMTP id t1QDSBa0032723; Thu, 26 Feb 2015 06:28:11 -0700
Received: from oc7435384737.ibm.com (sig-9-79-14-249.uk.ibm.com [9.79.14.249])
	by d06av04.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with
	ESMTP id t1QDS8Wu032630; Thu, 26 Feb 2015 06:28:10 -0700
From: Thomas Huth <thuth@linux.vnet.ibm.com>
To: qemu-trivial@nongnu.org
Date: Thu, 26 Feb 2015 14:28:08 +0100
Message-Id: <1424957288-24408-4-git-send-email-thuth@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1424957288-24408-1-git-send-email-thuth@linux.vnet.ibm.com>
References: <1424957288-24408-1-git-send-email-thuth@linux.vnet.ibm.com>
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 15022613-0029-0000-0000-00000385CC20
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.75.94.113
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@linux.vnet.ibm.com>
Subject: [Qemu-trivial] [PATCH 3/3] xen: Remove xen_cmos_set_s3_resume()
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
X-List-Received-Date: Thu, 26 Feb 2015 13:28:22 -0000

The function is not used anymore, and thus can be deleted.

Signed-off-by: Thomas Huth <thuth@linux.vnet.ibm.com>
Acked-by: Stefano Stabellini <stefano.stabellini@eu.citrix.com>
---
 include/hw/xen/xen.h |    1 -
 xen-hvm-stub.c       |    4 ----
 2 files changed, 0 insertions(+), 5 deletions(-)

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
1.7.1


