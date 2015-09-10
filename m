Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZZxzq-0000zJ-24
	for mharc-qemu-trivial@gnu.org; Thu, 10 Sep 2015 05:18:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37635)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1ZZxzh-0000lY-RB
	for qemu-trivial@nongnu.org; Thu, 10 Sep 2015 05:18:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1ZZxzg-0004an-Lx
	for qemu-trivial@nongnu.org; Thu, 10 Sep 2015 05:18:13 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39080)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>)
	id 1ZZxza-0004ZV-DH; Thu, 10 Sep 2015 05:18:06 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id E9FAFC0AA273;
	Thu, 10 Sep 2015 09:18:05 +0000 (UTC)
Received: from redhat.com (ovpn-116-92.ams2.redhat.com [10.36.116.92])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with SMTP
	id t8A9I370019822; Thu, 10 Sep 2015 05:18:04 -0400
Date: Thu, 10 Sep 2015 12:18:03 +0300
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Message-ID: <1441876643-7467-8-git-send-email-mst@redhat.com>
References: <1441876643-7467-1-git-send-email-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1441876643-7467-1-git-send-email-mst@redhat.com>
X-Mutt-Fcc: =sent
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Laszlo Ersek <lersek@redhat.com>, Don Koch <dkoch@verizon.com>
Subject: [Qemu-trivial] [PULL 7/7] hw/pci: fix pci_update_mappings() trace
	events
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
X-List-Received-Date: Thu, 10 Sep 2015 09:18:19 -0000

From: Laszlo Ersek <lersek@redhat.com>

The current trace prototypes and (matching) trace calls lead to
"unorthodox" PCI BDF notation in at least the stderr trace backend. For
example, the four BARs of a QXL video card at 00:01.0 (bus 0, slot 1,
function 0) are traced like this (PID and timestamps removed):

  pci_update_mappings_add d=0x7f14a73bf890 00:00.1 0,0x84000000+0x4000000
  pci_update_mappings_add d=0x7f14a73bf890 00:00.1 1,0x80000000+0x4000000
  pci_update_mappings_add d=0x7f14a73bf890 00:00.1 2,0x88200000+0x2000
  pci_update_mappings_add d=0x7f14a73bf890 00:00.1 3,0xd060+0x20

The slot and function values are in reverse order.

Stick with the conventional BDF notation.

Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Don Koch <dkoch@verizon.com>
Cc: qemu-trivial@nongnu.org
Fixes: 7828d75045
Signed-off-by: Laszlo Ersek <lersek@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/pci/pci.c | 4 ++--
 trace-events | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index eba7ca2..ccea628 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -1154,16 +1154,16 @@ static void pci_update_mappings(PCIDevice *d)
         /* now do the real mapping */
         if (r->addr != PCI_BAR_UNMAPPED) {
             trace_pci_update_mappings_del(d, pci_bus_num(d->bus),
-                                          PCI_FUNC(d->devfn),
                                           PCI_SLOT(d->devfn),
+                                          PCI_FUNC(d->devfn),
                                           i, r->addr, r->size);
             memory_region_del_subregion(r->address_space, r->memory);
         }
         r->addr = new_addr;
         if (r->addr != PCI_BAR_UNMAPPED) {
             trace_pci_update_mappings_add(d, pci_bus_num(d->bus),
-                                          PCI_FUNC(d->devfn),
                                           PCI_SLOT(d->devfn),
+                                          PCI_FUNC(d->devfn),
                                           i, r->addr, r->size);
             memory_region_add_subregion_overlap(r->address_space,
                                                 r->addr, r->memory, 1);
diff --git a/trace-events b/trace-events
index 0a82f0c..1684a95 100644
--- a/trace-events
+++ b/trace-events
@@ -1303,8 +1303,8 @@ spapr_pci_lsi_set(const char *busname, int pin, uint32_t irq) "%s PIN%d IRQ %u"
 spapr_pci_msi_retry(unsigned config_addr, unsigned req_num, unsigned max_irqs) "Guest device at %x asked %u, have only %u"
 
 # hw/pci/pci.c
-pci_update_mappings_del(void *d, uint32_t bus, uint32_t func, uint32_t slot, int bar, uint64_t addr, uint64_t size) "d=%p %02x:%02x.%x %d,%#"PRIx64"+%#"PRIx64
-pci_update_mappings_add(void *d, uint32_t bus, uint32_t func, uint32_t slot, int bar, uint64_t addr, uint64_t size) "d=%p %02x:%02x.%x %d,%#"PRIx64"+%#"PRIx64
+pci_update_mappings_del(void *d, uint32_t bus, uint32_t slot, uint32_t func, int bar, uint64_t addr, uint64_t size) "d=%p %02x:%02x.%x %d,%#"PRIx64"+%#"PRIx64
+pci_update_mappings_add(void *d, uint32_t bus, uint32_t slot, uint32_t func, int bar, uint64_t addr, uint64_t size) "d=%p %02x:%02x.%x %d,%#"PRIx64"+%#"PRIx64
 
 # hw/net/pcnet.c
 pcnet_s_reset(void *s) "s=%p"
-- 
MST


