Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QFT1a-00014n-2E
	for mharc-qemu-trivial@gnu.org; Thu, 28 Apr 2011 11:21:02 -0400
Received: from eggs.gnu.org ([140.186.70.92]:48382)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1QFT1X-000119-LJ
	for qemu-trivial@nongnu.org; Thu, 28 Apr 2011 11:21:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1QFT1U-0006gj-DG
	for qemu-trivial@nongnu.org; Thu, 28 Apr 2011 11:20:59 -0400
Received: from moutng.kundenserver.de ([212.227.126.186]:55921)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1QFT1T-0006eX-M5; Thu, 28 Apr 2011 11:20:56 -0400
Received: from flocke.fritz.box (p5086FD13.dip.t-dialin.net [80.134.253.19])
	by mrelayeu.kundenserver.de (node=mrbap1) with ESMTP (Nemesis)
	id 0Lr48R-1Pc1b92Ect-00dtCT; Thu, 28 Apr 2011 17:20:49 +0200
Received: from stefan by flocke.fritz.box with local (Exim 4.72)
	(envelope-from <stefan@weilnetz.de>)
	id 1QFT1L-0002BP-Mu; Thu, 28 Apr 2011 17:20:47 +0200
From: Stefan Weil <weil@mail.berlios.de>
To: QEMU Developers <qemu-devel@nongnu.org>
Date: Thu, 28 Apr 2011 17:20:29 +0200
Message-Id: <1304004042-8334-5-git-send-email-weil@mail.berlios.de>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1304004042-8334-1-git-send-email-weil@mail.berlios.de>
References: <1304004042-8334-1-git-send-email-weil@mail.berlios.de>
X-Provags-ID: V02:K0:2BW0cdz4pmv+gclJgE6R/f6J5U9iqeqaQ37sCpmQgkg
	SoK9wPF7IOZkn3JNnaHo81Jz4srvWkqhFkPeGUgiFSi2u7KUlA
	XplACfFPllNuRsnbSuDAuzhHApXP3xMTLor5VGdUSmUA4Aucdi
	Ozs3q/QT3YhiRBJ7qlsY62zh1HFdUqauDfpdcZE1MlS7Y64ErN
	5RN4WdPDTlvO5YhOGKEDCp+iNp1K74QhqUzdEOaL5K/UQnn2Gh AA1Yf23vPUIeG
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 212.227.126.186
Cc: qemu-trivial@nongnu.org, Stefan Weil <weil@mail.berlios.de>
Subject: [Qemu-trivial] [PATCH 05/18] Fix typo in comment (auxilliary ->
	auxiliary)
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
X-List-Received-Date: Thu, 28 Apr 2011 15:21:00 -0000

Signed-off-by: Stefan Weil <weil@mail.berlios.de>
---
 hw/pci_regs.h |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/hw/pci_regs.h b/hw/pci_regs.h
index dd0bed4..5a5ab89 100644
--- a/hw/pci_regs.h
+++ b/hw/pci_regs.h
@@ -223,7 +223,7 @@
 #define  PCI_PM_CAP_PME_CLOCK	0x0008	/* PME clock required */
 #define  PCI_PM_CAP_RESERVED    0x0010  /* Reserved field */
 #define  PCI_PM_CAP_DSI		0x0020	/* Device specific initialization */
-#define  PCI_PM_CAP_AUX_POWER	0x01C0	/* Auxilliary power support mask */
+#define  PCI_PM_CAP_AUX_POWER	0x01C0	/* Auxiliary power support mask */
 #define  PCI_PM_CAP_D1		0x0200	/* D1 power state support */
 #define  PCI_PM_CAP_D2		0x0400	/* D2 power state support */
 #define  PCI_PM_CAP_PME		0x0800	/* PME pin supported */
-- 
1.7.2.5


