Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1a0rCR-000424-Km
	for mharc-qemu-trivial@gnu.org; Mon, 23 Nov 2015 08:30:31 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33692)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1a0rCK-0003wE-0M
	for qemu-trivial@nongnu.org; Mon, 23 Nov 2015 08:30:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1a0rCJ-00009T-8B
	for qemu-trivial@nongnu.org; Mon, 23 Nov 2015 08:30:23 -0500
Received: from [59.151.112.132] (port=29380 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>)
	id 1a0rC7-0008Pp-5L; Mon, 23 Nov 2015 08:30:13 -0500
X-IronPort-AV: E=Sophos;i="5.20,242,1444665600"; 
   d="scan'208";a="747990"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.6])
	by heian.cn.fujitsu.com with ESMTP; 23 Nov 2015 21:29:44 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 6F55340925CA;
	Mon, 23 Nov 2015 21:17:26 +0800 (CST)
Received: from G08FNSTD140223.g08.fujitsu.local (10.167.226.96) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Mon, 23 Nov 2015 21:18:11 +0800
From: Cao jin <caoj.fnst@cn.fujitsu.com>
To: <qemu-devel@nongnu.org>
Date: Mon, 23 Nov 2015 21:19:12 +0800
Message-ID: <1448284752-18538-1-git-send-email-caoj.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.226.96]
X-yoursite-MailScanner-Information: Please contact the ISP for more information
X-yoursite-MailScanner-ID: 6F55340925CA.A9AE0
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: caoj.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Cc: qemu-trivial@nongnu.org, mst@redhat.com
Subject: [Qemu-trivial] [PATCH] PCI Trivial: remove superfluous code
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
X-List-Received-Date: Mon, 23 Nov 2015 13:30:29 -0000

remove superfluous code in do_pci_register_device(). See its caller:
pci_qdev_realize()

Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
---
 hw/pci/pci.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 168b9cc..4d16da0 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -878,7 +878,6 @@ static PCIDevice *do_pci_register_device(PCIDevice *pci_dev, PCIBus *bus,
        return NULL;
     }
 
-    pci_dev->devfn = devfn;
     dma_as = pci_device_iommu_address_space(pci_dev);
 
     memory_region_init_alias(&pci_dev->bus_master_enable_region,
-- 
2.1.0


-- 
This message has been scanned for viruses and
dangerous content by FCNIC, and is
believed to be clean.


