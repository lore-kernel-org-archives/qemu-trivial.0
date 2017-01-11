Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cRGfw-00054J-OF
	for mharc-qemu-trivial@gnu.org; Wed, 11 Jan 2017 06:02:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41953)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1cRGft-00051v-Ch
	for qemu-trivial@nongnu.org; Wed, 11 Jan 2017 06:02:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1cRGfp-0000lU-NM
	for qemu-trivial@nongnu.org; Wed, 11 Jan 2017 06:02:37 -0500
Received: from mx1.redhat.com ([209.132.183.28]:50548)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1cRGfi-0000ir-GN; Wed, 11 Jan 2017 06:02:26 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 897EEC049D59;
	Wed, 11 Jan 2017 11:02:26 +0000 (UTC)
Received: from nilsson.home.kraxel.org (ovpn-116-51.ams2.redhat.com
	[10.36.116.51])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v0BB2PDB018426; Wed, 11 Jan 2017 06:02:26 -0500
Received: by nilsson.home.kraxel.org (Postfix, from userid 500)
	id 2AEA880FD4; Wed, 11 Jan 2017 12:02:24 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-trivial@nongnu.org
Date: Wed, 11 Jan 2017 12:02:22 +0100
Message-Id: <1484132542-22520-1-git-send-email-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Wed, 11 Jan 2017 11:02:26 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] docs: sync pci-ids.txt
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
X-List-Received-Date: Wed, 11 Jan 2017 11:02:39 -0000

Three commits allocated pci ids in include/hw/pci/pci.h
without also updating docs/specs/pci-ids.txt:

  bf439db pci: Allocate PCIe host bridge PCI ID
  40d14be hw/pci: introduce PCI Expander Bridge (PXB)
  02b0743 hw/pxb: introduce pxb-pcie expander for PCIe machines

This patch updates pci-ids.txt accordingly.

Cc: qemu-trivial@nongnu.org
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
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
1.8.3.1


