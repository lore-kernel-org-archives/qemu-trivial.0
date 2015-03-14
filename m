Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YWfQN-0006Jw-0A
	for mharc-qemu-trivial@gnu.org; Sat, 14 Mar 2015 02:19:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48569)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1YWfQK-0006G9-Qi
	for qemu-trivial@nongnu.org; Sat, 14 Mar 2015 02:19:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1YWfQD-0004Bm-BJ
	for qemu-trivial@nongnu.org; Sat, 14 Mar 2015 02:19:48 -0400
Received: from e06smtp10.uk.ibm.com ([195.75.94.106]:33860)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1YWfQD-0004B7-1P
	for qemu-trivial@nongnu.org; Sat, 14 Mar 2015 02:19:41 -0400
Received: from /spool/local
	by e06smtp10.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <thuth@linux.vnet.ibm.com>;
	Sat, 14 Mar 2015 06:19:39 -0000
Received: from d06dlp01.portsmouth.uk.ibm.com (9.149.20.13)
	by e06smtp10.uk.ibm.com (192.168.101.140) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Sat, 14 Mar 2015 06:19:37 -0000
Received: from b06cxnps4074.portsmouth.uk.ibm.com
	(d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
	by d06dlp01.portsmouth.uk.ibm.com (Postfix) with ESMTP id 2B4BD17D805A; 
	Sat, 14 Mar 2015 06:20:00 +0000 (GMT)
Received: from d06av07.portsmouth.uk.ibm.com (d06av07.portsmouth.uk.ibm.com
	[9.149.37.248])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id t2E6JacV46596242; Sat, 14 Mar 2015 06:19:36 GMT
Received: from d06av07.portsmouth.uk.ibm.com (localhost [127.0.0.1])
	by d06av07.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with
	ESMTP id t2E6Ja9Q013402; Sat, 14 Mar 2015 02:19:36 -0400
Received: from oc7435384737.ibm.com (sig-9-84-84-76.evts.de.ibm.com
	[9.84.84.76])
	by d06av07.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with
	ESMTP id t2E6JYkV013361; Sat, 14 Mar 2015 02:19:36 -0400
From: Thomas Huth <thuth@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Sat, 14 Mar 2015 07:19:30 +0100
Message-Id: <1426313974-25607-4-git-send-email-thuth@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1426313974-25607-1-git-send-email-thuth@linux.vnet.ibm.com>
References: <1426313974-25607-1-git-send-email-thuth@linux.vnet.ibm.com>
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 15031406-0041-0000-0000-0000039465FB
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.75.94.106
Cc: Thomas Huth <thuth@linux.vnet.ibm.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
Subject: [Qemu-trivial] [PATCH v2 3/7] pci: Remove unused function
	ich9_d2pbr_init()
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
X-List-Received-Date: Sat, 14 Mar 2015 06:19:49 -0000

The function ich9_d2pbr_init() is completely unused and
thus can be deleted.

Signed-off-by: Thomas Huth <thuth@linux.vnet.ibm.com>
Cc: Michael S. Tsirkin <mst@redhat.com>
---
 hw/pci-bridge/i82801b11.c |   21 ---------------------
 include/hw/i386/ich9.h    |    1 -
 2 files changed, 0 insertions(+), 22 deletions(-)

diff --git a/hw/pci-bridge/i82801b11.c b/hw/pci-bridge/i82801b11.c
index 14cd7fd..7e79bc0 100644
--- a/hw/pci-bridge/i82801b11.c
+++ b/hw/pci-bridge/i82801b11.c
@@ -101,27 +101,6 @@ static const TypeInfo i82801b11_bridge_info = {
     .class_init    = i82801b11_bridge_class_init,
 };
 
-PCIBus *ich9_d2pbr_init(PCIBus *bus, int devfn, int sec_bus)
-{
-    PCIDevice *d;
-    PCIBridge *br;
-    char buf[16];
-    DeviceState *qdev;
-
-    d = pci_create_multifunction(bus, devfn, true, "i82801b11-bridge");
-    if (!d) {
-        return NULL;
-    }
-    br = PCI_BRIDGE(d);
-    qdev = DEVICE(d);
-
-    snprintf(buf, sizeof(buf), "pci.%d", sec_bus);
-    pci_bridge_map_irq(br, buf, pci_swizzle_map_irq_fn);
-    qdev_init_nofail(qdev);
-
-    return pci_bridge_get_sec_bus(br);
-}
-
 static void d2pbr_register(void)
 {
     type_register_static(&i82801b11_bridge_info);
diff --git a/include/hw/i386/ich9.h b/include/hw/i386/ich9.h
index 59ea25b..5cede9b 100644
--- a/include/hw/i386/ich9.h
+++ b/include/hw/i386/ich9.h
@@ -19,7 +19,6 @@ void ich9_lpc_set_irq(void *opaque, int irq_num, int level);
 int ich9_lpc_map_irq(PCIDevice *pci_dev, int intx);
 PCIINTxRoute ich9_route_intx_pin_to_irq(void *opaque, int pirq_pin);
 void ich9_lpc_pm_init(PCIDevice *pci_lpc);
-PCIBus *ich9_d2pbr_init(PCIBus *bus, int devfn, int sec_bus);
 I2CBus *ich9_smb_init(PCIBus *bus, int devfn, uint32_t smb_io_base);
 
 #define ICH9_CC_SIZE                            (16 * 1024)     /* 16KB */
-- 
1.7.1


