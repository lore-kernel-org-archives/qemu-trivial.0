Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XqDQX-0001Cs-M9
	for mharc-qemu-trivial@gnu.org; Sun, 16 Nov 2014 22:56:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55129)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1XqDQP-00019Q-7y
	for qemu-trivial@nongnu.org; Sun, 16 Nov 2014 22:56:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1XqDQE-0003pl-9r
	for qemu-trivial@nongnu.org; Sun, 16 Nov 2014 22:56:25 -0500
Received: from e23smtp08.au.ibm.com ([202.81.31.141]:34675)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1XqDQD-0003iq-Mx
	for qemu-trivial@nongnu.org; Sun, 16 Nov 2014 22:56:14 -0500
Received: from /spool/local
	by e23smtp08.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <aik@ozlabs.ru>;
	Mon, 17 Nov 2014 13:56:07 +1000
Received: from d23dlp03.au.ibm.com (202.81.31.214)
	by e23smtp08.au.ibm.com (202.81.31.205) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Mon, 17 Nov 2014 13:56:04 +1000
Received: from d23relay08.au.ibm.com (d23relay08.au.ibm.com [9.185.71.33])
	by d23dlp03.au.ibm.com (Postfix) with ESMTP id EDB4D3578053;
	Mon, 17 Nov 2014 14:56:01 +1100 (EST)
Received: from d23av03.au.ibm.com (d23av03.au.ibm.com [9.190.234.97])
	by d23relay08.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
	sAH3tX7j42467370; Mon, 17 Nov 2014 14:55:41 +1100
Received: from d23av03.au.ibm.com (localhost [127.0.0.1])
	by d23av03.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
	sAH3tSdp007578; Mon, 17 Nov 2014 14:55:28 +1100
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
	by d23av03.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
	sAH3tSWa006798; Mon, 17 Nov 2014 14:55:28 +1100
Received: from bran.ozlabs.ibm.com (haven.au.ibm.com [9.192.253.15])
	by ozlabs.au.ibm.com (Postfix) with ESMTP id AB2E1A0118;
	Mon, 17 Nov 2014 14:54:58 +1100 (AEDT)
Received: from ka1.ozlabs.ibm.com (ka1.ozlabs.ibm.com [10.61.145.11])
	by bran.ozlabs.ibm.com (Postfix) with ESMTP id 4D15416AA3E;
	Mon, 17 Nov 2014 14:54:58 +1100 (AEDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: qemu-devel@nongnu.org
Date: Mon, 17 Nov 2014 14:54:56 +1100
Message-Id: <1416196496-10637-1-git-send-email-aik@ozlabs.ru>
X-Mailer: git-send-email 2.0.0
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 14111703-0029-0000-0000-0000009BCD37
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 202.81.31.141
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Alexander Graf <agraf@suse.de>,
	Gavin Shan <gwshan@linux.vnet.ibm.com>, qemu-trivial@nongnu.org,
	qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Subject: [Qemu-trivial] [RFC PATCH] spapr-pci: Enable huge BARs
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
X-List-Received-Date: Mon, 17 Nov 2014 03:56:33 -0000

At the moment sPAPR only supports 512MB window for MMIO BARs. However
modern devices might want bigger 64bit BARs.

This adds another 64bit MMIO window per PHB and advertises it via
the PHB's "ranges" property in the device tree. The new window is 1TB long
and starts from 1TB offset on a PCI address space.

Older (<3.12) kernels expect BARs to have the same offset on both bus
and memory address spaces. Since we are getting now another MMIO region,
we either have to add (0xA000.0000 - 0x8000.0000) offset to
its bus offset OR simply put MMIO range at the same offset as on the bus.
This puts 32bit MMIO space at 0x8000.0000 offset in RAM and IO space
at 0xA000.0000 (used to be vice versa).

While we are here, let's increase PHB address spacing from 64GB to 16TB
in order not to touch it again any time soon.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---

I am not sure about <3.12 kernels, the info is from Ben.


---
 hw/ppc/spapr_pci.c          | 18 ++++++++++++++++++
 include/hw/pci-host/spapr.h | 15 ++++++++++-----
 2 files changed, 28 insertions(+), 5 deletions(-)

diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
index 21b95b3..8507464 100644
--- a/hw/ppc/spapr_pci.c
+++ b/hw/ppc/spapr_pci.c
@@ -495,6 +495,7 @@ static void spapr_phb_realize(DeviceState *dev, Error **errp)
 
         if ((sphb->buid != -1) || (sphb->dma_liobn != -1)
             || (sphb->mem_win_addr != -1)
+            || (sphb->mem64_win_addr != -1)
             || (sphb->io_win_addr != -1)) {
             error_setg(errp, "Either \"index\" or other parameters must"
                        " be specified for PAPR PHB, not both");
@@ -507,6 +508,7 @@ static void spapr_phb_realize(DeviceState *dev, Error **errp)
         windows_base = SPAPR_PCI_WINDOW_BASE
             + sphb->index * SPAPR_PCI_WINDOW_SPACING;
         sphb->mem_win_addr = windows_base + SPAPR_PCI_MMIO_WIN_OFF;
+        sphb->mem64_win_addr = windows_base + SPAPR_PCI_MMIO64_WIN_OFF;
         sphb->io_win_addr = windows_base + SPAPR_PCI_IO_WIN_OFF;
     }
 
@@ -550,6 +552,14 @@ static void spapr_phb_realize(DeviceState *dev, Error **errp)
     memory_region_add_subregion(get_system_memory(), sphb->mem_win_addr,
                                 &sphb->memwindow);
 
+    sprintf(namebuf, "%s.mmio64-alias", sphb->dtbusname);
+    memory_region_init_alias(&sphb->mem64window, OBJECT(sphb),
+                             namebuf, &sphb->memspace,
+                             SPAPR_PCI_MEM64_WIN_BUS_OFFSET,
+                             sphb->mem64_win_size);
+    memory_region_add_subregion(get_system_memory(), sphb->mem64_win_addr,
+                                &sphb->mem64window);
+
     /* Initialize IO regions */
     sprintf(namebuf, "%s.io", sphb->dtbusname);
     memory_region_init(&sphb->iospace, OBJECT(sphb),
@@ -675,6 +685,9 @@ static Property spapr_phb_properties[] = {
     DEFINE_PROP_UINT64("mem_win_addr", sPAPRPHBState, mem_win_addr, -1),
     DEFINE_PROP_UINT64("mem_win_size", sPAPRPHBState, mem_win_size,
                        SPAPR_PCI_MMIO_WIN_SIZE),
+    DEFINE_PROP_UINT64("mem64_win_addr", sPAPRPHBState, mem64_win_addr, -1),
+    DEFINE_PROP_UINT64("mem64_win_size", sPAPRPHBState, mem64_win_size,
+                       SPAPR_PCI_MMIO64_WIN_SIZE),
     DEFINE_PROP_UINT64("io_win_addr", sPAPRPHBState, io_win_addr, -1),
     DEFINE_PROP_UINT64("io_win_size", sPAPRPHBState, io_win_size,
                        SPAPR_PCI_IO_WIN_SIZE),
@@ -878,6 +891,11 @@ int spapr_populate_pci_dt(sPAPRPHBState *phb,
             cpu_to_be64(phb->mem_win_addr),
             cpu_to_be64(memory_region_size(&phb->memwindow)),
         },
+        {
+            cpu_to_be32(b_ss(3)), cpu_to_be64(SPAPR_PCI_MEM64_WIN_BUS_OFFSET),
+            cpu_to_be64(phb->mem64_win_addr),
+            cpu_to_be64(memory_region_size(&phb->mem64window)),
+        },
     };
     uint64_t bus_reg[] = { cpu_to_be64(phb->buid), 0 };
     uint32_t interrupt_map_mask[] = {
diff --git a/include/hw/pci-host/spapr.h b/include/hw/pci-host/spapr.h
index 4ea2a0d..4072f0d 100644
--- a/include/hw/pci-host/spapr.h
+++ b/include/hw/pci-host/spapr.h
@@ -70,7 +70,9 @@ struct sPAPRPHBState {
 
     MemoryRegion memspace, iospace;
     hwaddr mem_win_addr, mem_win_size, io_win_addr, io_win_size;
+    hwaddr mem64_win_addr, mem64_win_size;
     MemoryRegion memwindow, iowindow, msiwindow;
+    MemoryRegion mem64window;
 
     uint32_t dma_liobn;
     AddressSpace iommu_as;
@@ -96,16 +98,19 @@ struct sPAPRPHBVFIOState {
 
 #define SPAPR_PCI_BASE_BUID          0x800000020000000ULL
 
-#define SPAPR_PCI_WINDOW_BASE        0x10000000000ULL
-#define SPAPR_PCI_WINDOW_SPACING     0x1000000000ULL
-#define SPAPR_PCI_MMIO_WIN_OFF       0xA0000000
+#define SPAPR_PCI_WINDOW_BASE        0x100000000000ULL
+#define SPAPR_PCI_WINDOW_SPACING     0x100000000000ULL
+#define SPAPR_PCI_MMIO_WIN_OFF       0x80000000
 #define SPAPR_PCI_MMIO_WIN_SIZE      0x20000000
-#define SPAPR_PCI_IO_WIN_OFF         0x80000000
+#define SPAPR_PCI_MMIO64_WIN_OFF     0x10000000000ULL
+#define SPAPR_PCI_MMIO64_WIN_SIZE    0x10000000000ULL
+#define SPAPR_PCI_IO_WIN_OFF         0xA0000000
 #define SPAPR_PCI_IO_WIN_SIZE        0x10000
 
 #define SPAPR_PCI_MSI_WINDOW         0x40000000000ULL
 
-#define SPAPR_PCI_MEM_WIN_BUS_OFFSET 0x80000000ULL
+#define SPAPR_PCI_MEM_WIN_BUS_OFFSET   SPAPR_PCI_MMIO_WIN_OFF
+#define SPAPR_PCI_MEM64_WIN_BUS_OFFSET SPAPR_PCI_MMIO64_WIN_OFF
 
 static inline qemu_irq spapr_phb_lsi_qirq(struct sPAPRPHBState *phb, int pin)
 {
-- 
2.0.0


