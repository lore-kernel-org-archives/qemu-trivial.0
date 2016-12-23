Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cKFL8-0002gN-QC
	for mharc-qemu-trivial@gnu.org; Thu, 22 Dec 2016 21:12:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44221)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1cKFL6-0002ew-1g
	for qemu-trivial@nongnu.org; Thu, 22 Dec 2016 21:12:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1cKFL5-0002hL-68
	for qemu-trivial@nongnu.org; Thu, 22 Dec 2016 21:12:07 -0500
Received: from [59.151.112.132] (port=43152 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>)
	id 1cKFL0-0002Yl-K4; Thu, 22 Dec 2016 21:12:02 -0500
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="14197996"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 23 Dec 2016 10:11:50 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 3D7DF477B1E9;
	Fri, 23 Dec 2016 10:11:51 +0800 (CST)
Received: from G08FNSTD140223.g08.fujitsu.local (10.167.226.69) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Fri, 23 Dec 2016 10:11:51 +0800
From: Cao jin <caoj.fnst@cn.fujitsu.com>
To: <qemu-devel@nongnu.org>
CC: <mst@redhat.com>, <marcel@redhat.com>, <qemu-trivial@nongnu.org>
Date: Fri, 23 Dec 2016 10:16:30 +0800
Message-ID: <1482459390-14386-1-git-send-email-caoj.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.226.69]
X-yoursite-MailScanner-ID: 3D7DF477B1E9.AB18E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: caoj.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Subject: [Qemu-trivial] [PATCH] pcie: remove duplicate assertion
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
X-List-Received-Date: Fri, 23 Dec 2016 02:12:08 -0000

"size >= 8" connote "size > 0"

Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
---
 hw/pci/pcie.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
index 39b10b852d91..f864c5cd5458 100644
--- a/hw/pci/pcie.c
+++ b/hw/pci/pcie.c
@@ -668,7 +668,6 @@ void pcie_add_capability(PCIDevice *dev,
     uint16_t next;
 
     assert(offset >= PCI_CONFIG_SPACE_SIZE);
-    assert(offset < offset + size);
     assert(offset + size <= PCIE_CONFIG_SPACE_SIZE);
     assert(size >= 8);
     assert(pci_is_express(dev));
-- 
2.1.0




