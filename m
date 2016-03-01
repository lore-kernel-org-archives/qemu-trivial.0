Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aagrM-0003eN-Kq
	for mharc-qemu-trivial@gnu.org; Tue, 01 Mar 2016 04:44:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59058)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1aagrK-0003bN-JG
	for qemu-trivial@nongnu.org; Tue, 01 Mar 2016 04:44:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1aagrJ-0007D6-KM
	for qemu-trivial@nongnu.org; Tue, 01 Mar 2016 04:44:50 -0500
Received: from [59.151.112.132] (port=44571 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>)
	id 1aagrC-00076v-JJ; Tue, 01 Mar 2016 04:44:45 -0500
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="4065963"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 01 Mar 2016 17:44:21 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id D98AF42B4AF3;
	Tue,  1 Mar 2016 17:44:15 +0800 (CST)
Received: from G08FNSTD140223.g08.fujitsu.local (10.167.226.69) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Tue, 1 Mar 2016 17:44:15 +0800
From: Cao jin <caoj.fnst@cn.fujitsu.com>
To: <qemu-devel@nongnu.org>
Date: Tue, 1 Mar 2016 17:45:24 +0800
Message-ID: <1456825524-10805-1-git-send-email-caoj.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.226.69]
X-yoursite-MailScanner-ID: D98AF42B4AF3.ABABB
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: caoj.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Cc: qemu-trivial@nongnu.org, marcel@redhat.com, mst@redhat.com
Subject: [Qemu-trivial] [PATCH] pxb: cleanup
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
X-List-Received-Date: Tue, 01 Mar 2016 09:44:51 -0000

Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
---
BTW: this doc seems little out of date, since pxb has already support Q35.

 docs/pci_expander_bridge.txt        | 6 +++---
 hw/pci-bridge/pci_expander_bridge.c | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/docs/pci_expander_bridge.txt b/docs/pci_expander_bridge.txt
index e7c8fe9..3675027 100644
--- a/docs/pci_expander_bridge.txt
+++ b/docs/pci_expander_bridge.txt
@@ -24,8 +24,8 @@ A detailed command line would be:
 -object memory-backend-ram,size=1024M,policy=bind,host-nodes=0,id=ram-node0 -numa node,nodeid=0,cpus=0,memdev=ram-node0
 -object memory-backend-ram,size=1024M,policy=bind,host-nodes=1,id=ram-node1 -numa node,nodeid=1,cpus=1,memdev=ram-node1
 -device pxb,id=bridge1,bus=pci.0,numa_node=1,bus_nr=4 -netdev user,id=nd -device e1000,bus=bridge1,addr=0x4,netdev=nd
--device pxb,id=bridge2,bus=pci.0,numa_node=0,bus_nr=8, -device e1000,bus=bridge2,addr=0x3
--device pxb,id=bridge3,bus=pci.0,bus_nr=40, -drive if=none,id=drive0,file=[img] -device virtio-blk-pci,drive=drive0,scsi=off,bus=bridge3,addr=1
+-device pxb,id=bridge2,bus=pci.0,numa_node=0,bus_nr=8 -device e1000,bus=bridge2,addr=0x3
+-device pxb,id=bridge3,bus=pci.0,bus_nr=40 -drive if=none,id=drive0,file=[img] -device virtio-blk-pci,drive=drive0,scsi=off,bus=bridge3,addr=1
 
 Here you have:
  - 2 NUMA nodes for the guest, 0 and 1. (both mapped to the same NUMA node in host, but you can and should put it in different host NUMA nodes)
@@ -43,7 +43,7 @@ Implementation
 ==============
 The PXB is composed by:
 - HostBridge (TYPE_PXB_HOST)
-  The host bridge allows to register and query the PXB's rPCI root bus in QEMU.
+  The host bridge allows to register and query the PXB's PCI root bus in QEMU.
 - PXBDev(TYPE_PXB_DEVICE)
   It is a regular PCI Device that resides on the piix host-bridge bus and its bus uses the same PCI domain.
   However, the bus behind is exposed through ACPI as a primary PCI bus and starts a new PCI hierarchy.
diff --git a/hw/pci-bridge/pci_expander_bridge.c b/hw/pci-bridge/pci_expander_bridge.c
index d23b8da..5e7e546 100644
--- a/hw/pci-bridge/pci_expander_bridge.c
+++ b/hw/pci-bridge/pci_expander_bridge.c
@@ -283,7 +283,7 @@ static void pxb_dev_exitfn(PCIDevice *pci_dev)
 }
 
 static Property pxb_dev_properties[] = {
-    /* Note: 0 is not a legal a PXB bus number. */
+    /* Note: 0 is not a legal PXB bus number. */
     DEFINE_PROP_UINT8("bus_nr", PXBDev, bus_nr, 0),
     DEFINE_PROP_UINT16("numa_node", PXBDev, numa_node, NUMA_NODE_UNASSIGNED),
     DEFINE_PROP_END_OF_LIST(),
-- 
2.1.0




