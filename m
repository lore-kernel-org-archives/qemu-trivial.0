Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1a02qH-00074H-MJ
	for mharc-qemu-trivial@gnu.org; Sat, 21 Nov 2015 02:44:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37259)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1a02qF-00070s-7X
	for qemu-trivial@nongnu.org; Sat, 21 Nov 2015 02:44:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1a02qE-00024h-Fc
	for qemu-trivial@nongnu.org; Sat, 21 Nov 2015 02:44:15 -0500
Received: from [59.151.112.132] (port=29596 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>)
	id 1a02qA-00023N-5Z; Sat, 21 Nov 2015 02:44:10 -0500
X-IronPort-AV: E=Sophos;i="5.20,242,1444665600"; 
   d="scan'208";a="694415"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 21 Nov 2015 15:43:55 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id tAL7hM0c029727;
	Sat, 21 Nov 2015 15:43:22 +0800
Received: from G08FNSTD140223.g08.fujitsu.local (10.167.226.96) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Sat, 21 Nov 2015 15:44:06 +0800
From: Cao jin <caoj.fnst@cn.fujitsu.com>
To: <qemu-devel@nongnu.org>
Date: Sat, 21 Nov 2015 15:45:03 +0800
Message-ID: <1448091903-14460-1-git-send-email-caoj.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.226.96]
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Cc: qemu-trivial@nongnu.org, mst@redhat.com
Subject: [Qemu-trivial] [PATCH] PCI: add param check for api
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
X-List-Received-Date: Sat, 21 Nov 2015 07:44:16 -0000

add param check for pci_add_capability2, as it is a public API.

Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
---
 hw/pci/pci.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 168b9cc..6938f64 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -2144,6 +2144,9 @@ int pci_add_capability2(PCIDevice *pdev, uint8_t cap_id,
     uint8_t *config;
     int i, overlapping_cap;
 
+    assert(size > 0);
+    assert(offset >= PCI_CONFIG_HEADER_SIZE || !offset);
+
     if (!offset) {
         offset = pci_find_space(pdev, size);
         if (!offset) {
-- 
2.1.0


