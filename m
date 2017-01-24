Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cVzqK-0000jr-P5
	for mharc-qemu-trivial@gnu.org; Tue, 24 Jan 2017 07:04:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47354)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cVzqI-0000hJ-JY
	for qemu-trivial@nongnu.org; Tue, 24 Jan 2017 07:04:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cVzqH-00009n-Qy
	for qemu-trivial@nongnu.org; Tue, 24 Jan 2017 07:04:54 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:53487)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1cVzqC-00005R-B4; Tue, 24 Jan 2017 07:04:48 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id E9E124212E;
	Tue, 24 Jan 2017 15:04:47 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 109B2574;
	Tue, 24 Jan 2017 12:39:44 +0300 (MSK)
Received: (nullmailer pid 12649 invoked by uid 1000);
	Tue, 24 Jan 2017 09:39:41 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Tue, 24 Jan 2017 12:39:24 +0300
Message-Id: <6e7ae46c2c12c3fef093792ca1aff2d4fcf30868.1485250702.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1485250702.git.mjt@msgid.tls.msk.ru>
References: <cover.1485250702.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1485250702.git.mjt@msgid.tls.msk.ru>
References: <cover.1485250702.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 20/31] docs: sync pci-ids.txt
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
X-List-Received-Date: Tue, 24 Jan 2017 12:04:55 -0000

From: Gerd Hoffmann <kraxel@redhat.com>

Three commits allocated pci ids in include/hw/pci/pci.h
without also updating docs/specs/pci-ids.txt:

  bf439db pci: Allocate PCIe host bridge PCI ID
  40d14be hw/pci: introduce PCI Expander Bridge (PXB)
  02b0743 hw/pxb: introduce pxb-pcie expander for PCIe machines

This patch updates pci-ids.txt accordingly.

Cc: qemu-trivial@nongnu.org
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 docs/specs/pci-ids.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/docs/specs/pci-ids.txt b/docs/specs/pci-ids.txt
index fd27c67..16fdb0c 100644
--- a/docs/specs/pci-ids.txt
+++ b/docs/specs/pci-ids.txt
@@ -57,7 +57,10 @@ PCI devices (other than virtio):
 1b36:0005  PCI test device (docs/specs/pci-testdev.txt)
 1b36:0006  PCI Rocker Ethernet switch device
 1b36:0007  PCI SD Card Host Controller Interface (SDHCI)
+1b36:0008  PCIe host bridge
+1b36:0009  PCI Expander Bridge (-device pxb)
 1b36:000a  PCI-PCI bridge (multiseat)
+1b36:000b  PCIe Expander Bridge (-device pxb-pcie)
 
 All these devices are documented in docs/specs.
 
-- 
2.1.4


