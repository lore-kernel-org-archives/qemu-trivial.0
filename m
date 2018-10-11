Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gAWHp-00080y-Gl
	for mharc-qemu-trivial@gnu.org; Thu, 11 Oct 2018 04:25:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35168)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <maozhongyi@cmss.chinamobile.com>) id 1gAWHo-00080r-8L
	for qemu-trivial@nongnu.org; Thu, 11 Oct 2018 04:25:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <maozhongyi@cmss.chinamobile.com>) id 1gAWHj-0006Gw-8z
	for qemu-trivial@nongnu.org; Thu, 11 Oct 2018 04:25:36 -0400
Received: from cmccmta2.chinamobile.com ([221.176.66.80]:64475)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <maozhongyi@cmss.chinamobile.com>)
	id 1gAWHi-0005mU-Ir; Thu, 11 Oct 2018 04:25:31 -0400
Received: from spf.mail.chinamobile.com (unknown[172.16.121.11]) by
	rmmx-syy-dmz-app07-12007 (RichMail) with SMTP id
	2ee75bbf08eb999-00533; Thu, 11 Oct 2018 16:25:15 +0800 (CST)
X-RM-TRANSID: 2ee75bbf08eb999-00533
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from maozy-host.lan (unknown[112.25.154.148])
	by rmsmtp-syy-appsvr06-12006 (RichMail) with SMTP id
	2ee65bbf08e6e64-14723; Thu, 11 Oct 2018 16:25:15 +0800 (CST)
X-RM-TRANSID: 2ee65bbf08e6e64-14723
From: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
To: qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
Cc: mst@redhat.com, marcel.apfelbaum@gmail.com,
	Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
Date: Thu, 11 Oct 2018 16:25:08 +0800
Message-Id: <20181011082508.29014-1-maozhongyi@cmss.chinamobile.com>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 221.176.66.80
Subject: [Qemu-trivial] [PATCH] pci_bridge: fix typo in comment
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 11 Oct 2018 08:25:36 -0000

Signed-off-by: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
---
 hw/pci/pci_bridge.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/pci/pci_bridge.c b/hw/pci/pci_bridge.c
index 90f7208856..da8daa3ff2 100644
--- a/hw/pci/pci_bridge.c
+++ b/hw/pci/pci_bridge.c
@@ -399,7 +399,7 @@ void pci_bridge_exitfn(PCIDevice *pci_dev)
 
 /*
  * before qdev initialization(qdev_init()), this function sets bus_name and
- * map_irq callback which are necessry for pci_bridge_initfn() to
+ * map_irq callback which are necessary for pci_bridge_initfn() to
  * initialize bus.
  */
 void pci_bridge_map_irq(PCIBridge *br, const char* bus_name,
-- 
2.17.1




