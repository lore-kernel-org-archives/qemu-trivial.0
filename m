Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UnRiE-0006ig-6I
	for mharc-qemu-trivial@gnu.org; Fri, 14 Jun 2013 06:58:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56974)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UnRi7-0006W6-Om
	for qemu-trivial@nongnu.org; Fri, 14 Jun 2013 06:58:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UnRi6-0006gK-3V
	for qemu-trivial@nongnu.org; Fri, 14 Jun 2013 06:58:27 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:33574)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1UnRi0-0006d5-3T; Fri, 14 Jun 2013 06:58:20 -0400
Received: from gandalf.tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 5929841660;
	Fri, 14 Jun 2013 14:58:19 +0400 (MSK)
Received: by gandalf.tls.msk.ru (Postfix, from userid 1000)
	id 56AC3529; Fri, 14 Jun 2013 14:50:48 +0400 (MSK)
From: Michael Tokarev <mjt@tls.msk.ru>
To: Anthony Liguori <aliguori@us.ibm.com>
Date: Fri, 14 Jun 2013 14:50:42 +0400
Message-Id: <1371207042-17980-27-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1371207042-17980-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1371207042-17980-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Hu Tao <hutao@cn.fujitsu.com>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 26/26] piix: fix some printf errors when debug
	is enabled
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
X-List-Received-Date: Fri, 14 Jun 2013 10:58:30 -0000

From: Hu Tao <hutao@cn.fujitsu.com>

And use PRIxxx macros if possible.

Signed-off-by: Hu Tao <hutao@cn.fujitsu.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/acpi/piix4.c |   12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
index e6525ac..756df3b 100644
--- a/hw/acpi/piix4.c
+++ b/hw/acpi/piix4.c
@@ -518,7 +518,7 @@ static uint64_t gpe_readb(void *opaque, hwaddr addr, unsigned width)
     PIIX4PMState *s = opaque;
     uint32_t val = acpi_gpe_ioport_readb(&s->ar, addr);
 
-    PIIX4_DPRINTF("gpe read %x == %x\n", addr, val);
+    PIIX4_DPRINTF("gpe read %" HWADDR_PRIx " == %" PRIu32 "\n", addr, val);
     return val;
 }
 
@@ -530,7 +530,7 @@ static void gpe_writeb(void *opaque, hwaddr addr, uint64_t val,
     acpi_gpe_ioport_writeb(&s->ar, addr, val);
     pm_update_sci(s);
 
-    PIIX4_DPRINTF("gpe write %x <== %d\n", addr, val);
+    PIIX4_DPRINTF("gpe write %" HWADDR_PRIx " <== %" PRIu64 "\n", addr, val);
 }
 
 static const MemoryRegionOps piix4_gpe_ops = {
@@ -553,15 +553,15 @@ static uint64_t pci_read(void *opaque, hwaddr addr, unsigned int size)
         /* Manufacture an "up" value to cause a device check on any hotplug
          * slot with a device.  Extra device checks are harmless. */
         val = s->pci0_slot_device_present & s->pci0_hotplug_enable;
-        PIIX4_DPRINTF("pci_up_read %x\n", val);
+        PIIX4_DPRINTF("pci_up_read %" PRIu32 "\n", val);
         break;
     case PCI_DOWN_BASE - PCI_HOTPLUG_ADDR:
         val = s->pci0_status.down;
-        PIIX4_DPRINTF("pci_down_read %x\n", val);
+        PIIX4_DPRINTF("pci_down_read %" PRIu32 "\n", val);
         break;
     case PCI_EJ_BASE - PCI_HOTPLUG_ADDR:
         /* No feature defined yet */
-        PIIX4_DPRINTF("pci_features_read %x\n", val);
+        PIIX4_DPRINTF("pci_features_read %" PRIu32 "\n", val);
         break;
     case PCI_RMV_BASE - PCI_HOTPLUG_ADDR:
         val = s->pci0_hotplug_enable;
@@ -579,7 +579,7 @@ static void pci_write(void *opaque, hwaddr addr, uint64_t data,
     switch (addr) {
     case PCI_EJ_BASE - PCI_HOTPLUG_ADDR:
         acpi_piix_eject_slot(opaque, (uint32_t)data);
-        PIIX4_DPRINTF("pciej write %" HWADDR_PRIx " <== % " PRIu64 "\n",
+        PIIX4_DPRINTF("pciej write %" HWADDR_PRIx " <== %" PRIu64 "\n",
                       addr, data);
         break;
     default:
-- 
1.7.10.4


