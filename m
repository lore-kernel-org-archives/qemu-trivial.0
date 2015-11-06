Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Zugvr-00033S-7W
	for mharc-qemu-trivial@gnu.org; Fri, 06 Nov 2015 08:19:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38536)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Zugvj-0002qj-TP
	for qemu-trivial@nongnu.org; Fri, 06 Nov 2015 08:19:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Zugvj-0002HO-3e
	for qemu-trivial@nongnu.org; Fri, 06 Nov 2015 08:19:47 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:43023)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Zugve-0002Co-DD; Fri, 06 Nov 2015 08:19:42 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id C406340DD9;
	Fri,  6 Nov 2015 16:19:39 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id CB856AC1;
	Fri,  6 Nov 2015 15:44:04 +0300 (MSK)
Received: (nullmailer pid 31682 invoked by uid 1000);
	Fri, 06 Nov 2015 12:44:03 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Fri,  6 Nov 2015 15:43:42 +0300
Message-Id: <6ba9fe86957c3c8febf74c2495d901ac4061a673.1446813769.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1446813768.git.mjt@msgid.tls.msk.ru>
References: <cover.1446813768.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Cao jin <caoj.fnst@cn.fujitsu.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 05/24] fix bad indentation in
	pcie_cap_slot_write_config()
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
X-List-Received-Date: Fri, 06 Nov 2015 13:19:48 -0000

From: Cao jin <caoj.fnst@cn.fujitsu.com>

bad indentation conflicts with CODING_STYLE doc

Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/pci/pcie.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
index 32c65c2..0eab29d 100644
--- a/hw/pci/pcie.c
+++ b/hw/pci/pcie.c
@@ -426,13 +426,13 @@ void pcie_cap_slot_write_config(PCIDevice *dev,
      */
     if ((sltsta & PCI_EXP_SLTSTA_PDS) && (val & PCI_EXP_SLTCTL_PCC) &&
         ((val & PCI_EXP_SLTCTL_PIC_OFF) == PCI_EXP_SLTCTL_PIC_OFF)) {
-            PCIBus *sec_bus = pci_bridge_get_sec_bus(PCI_BRIDGE(dev));
-            pci_for_each_device(sec_bus, pci_bus_num(sec_bus),
-                                pcie_unplug_device, NULL);
+        PCIBus *sec_bus = pci_bridge_get_sec_bus(PCI_BRIDGE(dev));
+        pci_for_each_device(sec_bus, pci_bus_num(sec_bus),
+                            pcie_unplug_device, NULL);
 
-            pci_word_test_and_clear_mask(exp_cap + PCI_EXP_SLTSTA,
-                                         PCI_EXP_SLTSTA_PDS);
-            pci_word_test_and_set_mask(exp_cap + PCI_EXP_SLTSTA,
+        pci_word_test_and_clear_mask(exp_cap + PCI_EXP_SLTSTA,
+                                     PCI_EXP_SLTSTA_PDS);
+        pci_word_test_and_set_mask(exp_cap + PCI_EXP_SLTSTA,
                                        PCI_EXP_SLTSTA_PDC);
     }
 
-- 
2.1.4


