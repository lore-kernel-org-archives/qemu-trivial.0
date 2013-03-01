Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UBTHS-0007XV-5a
	for mharc-qemu-trivial@gnu.org; Fri, 01 Mar 2013 11:57:58 -0500
Received: from eggs.gnu.org ([208.118.235.92]:60416)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1UBTHN-0007M8-90
	for qemu-trivial@nongnu.org; Fri, 01 Mar 2013 11:57:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1UBTHK-0002NO-So
	for qemu-trivial@nongnu.org; Fri, 01 Mar 2013 11:57:53 -0500
Received: from
	1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.d.1.0.0.b.8.0.1.0.0.2.ip6.arpa
	([2001:8b0:1d0::1]:60872 helo=mnementh.archaic.org.uk)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1UBTHF-0002MM-3R; Fri, 01 Mar 2013 11:57:45 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.72)
	(envelope-from <pm215@archaic.org.uk>)
	id 1UBTHB-00007V-WC; Fri, 01 Mar 2013 16:57:42 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri,  1 Mar 2013 16:57:41 +0000
Message-Id: <1362157061-438-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2001:8b0:1d0::1
Cc: qemu-trivial@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, patches@linaro.org
Subject: [Qemu-trivial] [PATCH] pci_host: Drop write-only address_space field
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
X-List-Received-Date: Fri, 01 Mar 2013 16:57:56 -0000

The address_space field of PCIHostState was only ever written, never used.
Drop it completely.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Noticed this when looking at converting versatile_pci to be a subclass
of pci_host; it's nice to be able to drop the ugly fishing around in
the object struct that the two users here were doing...

 hw/pci/pci_host.h |    1 -
 hw/piix_pci.c     |    1 -
 hw/ppc/prep.c     |    1 -
 3 files changed, 3 deletions(-)

diff --git a/hw/pci/pci_host.h b/hw/pci/pci_host.h
index 1845d4d..236cd0f 100644
--- a/hw/pci/pci_host.h
+++ b/hw/pci/pci_host.h
@@ -40,7 +40,6 @@ struct PCIHostState {
     MemoryRegion conf_mem;
     MemoryRegion data_mem;
     MemoryRegion mmcfg;
-    MemoryRegion *address_space;
     uint32_t config_reg;
     PCIBus *bus;
 };
diff --git a/hw/piix_pci.c b/hw/piix_pci.c
index 6c77e49..9246983 100644
--- a/hw/piix_pci.c
+++ b/hw/piix_pci.c
@@ -244,7 +244,6 @@ static PCIBus *i440fx_common_init(const char *device_name,
 
     dev = qdev_create(NULL, "i440FX-pcihost");
     s = PCI_HOST_BRIDGE(dev);
-    s->address_space = address_space_mem;
     b = pci_bus_new(dev, NULL, pci_address_space,
                     address_space_io, 0);
     s->bus = b;
diff --git a/hw/ppc/prep.c b/hw/ppc/prep.c
index e06dded..2920911 100644
--- a/hw/ppc/prep.c
+++ b/hw/ppc/prep.c
@@ -567,7 +567,6 @@ static void ppc_prep_init(QEMUMachineInitArgs *args)
 
     dev = qdev_create(NULL, "raven-pcihost");
     pcihost = PCI_HOST_BRIDGE(dev);
-    pcihost->address_space = get_system_memory();
     object_property_add_child(qdev_get_machine(), "raven", OBJECT(dev), NULL);
     qdev_init_nofail(dev);
     pci_bus = (PCIBus *)qdev_get_child_bus(dev, "pci.0");
-- 
1.7.9.5


