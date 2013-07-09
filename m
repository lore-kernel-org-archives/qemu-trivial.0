Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Uwf3n-0005oo-TA
	for mharc-qemu-trivial@gnu.org; Tue, 09 Jul 2013 17:02:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45464)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dkoch@verizon.com>) id 1UwbtK-0001Sn-6D
	for qemu-trivial@nongnu.org; Tue, 09 Jul 2013 13:39:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dkoch@verizon.com>) id 1UwbtG-0000aK-Bb
	for qemu-trivial@nongnu.org; Tue, 09 Jul 2013 13:39:54 -0400
Received: from omzsmtpe02.verizonbusiness.com ([199.249.25.209]:12698)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dkoch@verizon.com>)
	id 1UwbtA-0000Xf-Ai; Tue, 09 Jul 2013 13:39:44 -0400
X-IronPort-Anti-Spam-Filtered: false
Received: from omzsmtpi01.vzbi.com ([165.122.46.171])
	by omzsmtpe02.verizonbusiness.com with ESMTP; 09 Jul 2013 17:39:41 +0000
From: Don Koch <dkoch@verizon.com>
X-IronPort-AV: E=Sophos;i="4.87,1029,1363132800"; d="scan'208";a="176580364"
Received: from unknown (HELO MIA20725CAS892.apps.tmrk.corp) ([162.47.0.51])
	by omzsmtpi01.vzbi.com with ESMTP; 09 Jul 2013 17:39:39 +0000
Received: from yoyo.cloudswitch.com (10.25.25.113) by
	MIA20725CAS892.apps.tmrk.corp (10.1.3.224) with Microsoft SMTP Server
	(TLS) id 14.2.318.1; Tue, 9 Jul 2013 13:36:10 -0400
To: <qemu-devel@nongnu.org>
Date: Tue, 9 Jul 2013 13:36:05 -0400
Message-ID: <1373391365-7992-1-git-send-email-dkoch@terremark.com>
X-Mailer: git-send-email 1.7.11.7
MIME-Version: 1.0
Content-Type: text/plain
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 199.249.25.209
X-Mailman-Approved-At: Tue, 09 Jul 2013 17:02:54 -0400
Cc: qemu-trivial@nongnu.org, Don Koch <dkoch@verizon.com>, mst@redhat.com
Subject: [Qemu-trivial] [PATCH] Fix BRDIGE typo.
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
X-List-Received-Date: Tue, 09 Jul 2013 17:39:58 -0000

From: Don Koch <dkoch@verizon.com>

Fix typo in PCI_CLASS_BRDIGE_PCI_INF_SUB.

Signed-off-by: Don Koch <dkoch@verizon.com>
---
 hw/pci-bridge/i82801b11.c | 2 +-
 include/hw/pci/pci_ids.h  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/pci-bridge/i82801b11.c b/hw/pci-bridge/i82801b11.c
index 5807a92..b98bfb0 100644
--- a/hw/pci-bridge/i82801b11.c
+++ b/hw/pci-bridge/i82801b11.c
@@ -69,7 +69,7 @@ static int i82801b11_bridge_initfn(PCIDevice *d)
     if (rc < 0) {
         goto err_bridge;
     }
-    pci_config_set_prog_interface(d->config, PCI_CLASS_BRDIGE_PCI_INF_SUB);
+    pci_config_set_prog_interface(d->config, PCI_CLASS_BRIDGE_PCI_INF_SUB);
     return 0;
 
 err_bridge:
diff --git a/include/hw/pci/pci_ids.h b/include/hw/pci/pci_ids.h
index 08f8161..d7933bf 100644
--- a/include/hw/pci/pci_ids.h
+++ b/include/hw/pci/pci_ids.h
@@ -39,7 +39,7 @@
 #define PCI_CLASS_BRIDGE_HOST            0x0600
 #define PCI_CLASS_BRIDGE_ISA             0x0601
 #define PCI_CLASS_BRIDGE_PCI             0x0604
-#define PCI_CLASS_BRDIGE_PCI_INF_SUB     0x01
+#define PCI_CLASS_BRIDGE_PCI_INF_SUB     0x01
 #define PCI_CLASS_BRIDGE_OTHER           0x0680
 
 #define PCI_CLASS_COMMUNICATION_SERIAL   0x0700
-- 
1.7.11.7


