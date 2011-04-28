Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QFT1h-0001In-6G
	for mharc-qemu-trivial@gnu.org; Thu, 28 Apr 2011 11:21:09 -0400
Received: from eggs.gnu.org ([140.186.70.92]:48472)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1QFT1a-00015S-ER
	for qemu-trivial@nongnu.org; Thu, 28 Apr 2011 11:21:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1QFT1Y-0006jO-VN
	for qemu-trivial@nongnu.org; Thu, 28 Apr 2011 11:21:02 -0400
Received: from moutng.kundenserver.de ([212.227.126.186]:49329)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1QFT1T-0006eV-Im; Thu, 28 Apr 2011 11:20:56 -0400
Received: from flocke.fritz.box (p5086FD13.dip.t-dialin.net [80.134.253.19])
	by mrelayeu.kundenserver.de (node=mrbap2) with ESMTP (Nemesis)
	id 0MZ776-1QW2TE2kJA-00LaoI; Thu, 28 Apr 2011 17:20:49 +0200
Received: from stefan by flocke.fritz.box with local (Exim 4.72)
	(envelope-from <stefan@weilnetz.de>)
	id 1QFT1L-0002BY-S9; Thu, 28 Apr 2011 17:20:47 +0200
From: Stefan Weil <weil@mail.berlios.de>
To: QEMU Developers <qemu-devel@nongnu.org>
Date: Thu, 28 Apr 2011 17:20:33 +0200
Message-Id: <1304004042-8334-9-git-send-email-weil@mail.berlios.de>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1304004042-8334-1-git-send-email-weil@mail.berlios.de>
References: <1304004042-8334-1-git-send-email-weil@mail.berlios.de>
X-Provags-ID: V02:K0:EwJagtky+95ZkKwXzzDQOpxeJvJQovbeqq/4cw+AU0z
	YBhEkqQlc1eOnag7bMe/av1NAR9wBySb6QWnzYJpWHa0pt+XGE
	NgVgOCOx4bfNeYlt21FTBP7AKdevWFmnc2T7hy+dJfouJLzgPP
	5DOSniiGJwI8Z7e2h+kCxDH9ly83dmU6ML4Khb/9Ne5Ep7Hxy2
	jMom54kS8owGpuQ9bpfgA1U78E4kzCSAmSNF5XM/6SE/6GyRMi z2Mz7mvOM2t8W
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 212.227.126.186
Cc: qemu-trivial@nongnu.org, Stefan Weil <weil@mail.berlios.de>
Subject: [Qemu-trivial] [PATCH 09/18] Fix typos in comments (imediately ->
	immediately)
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
X-List-Received-Date: Thu, 28 Apr 2011 15:21:03 -0000

Signed-off-by: Stefan Weil <weil@mail.berlios.de>
---
 hw/lan9118.c       |    2 +-
 hw/syborg_serial.c |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/lan9118.c b/hw/lan9118.c
index 2dc8d18..4c42fe9 100644
--- a/hw/lan9118.c
+++ b/hw/lan9118.c
@@ -721,7 +721,7 @@ static void do_phy_write(lan9118_state *s, int reg, uint32_t val)
             break;
         }
         s->phy_control = val & 0x7980;
-        /* Complete autonegotiation imediately.  */
+        /* Complete autonegotiation immediately.  */
         if (val & 0x1000) {
             s->phy_status |= 0x0020;
         }
diff --git a/hw/syborg_serial.c b/hw/syborg_serial.c
index df2950f..2ef7175 100644
--- a/hw/syborg_serial.c
+++ b/hw/syborg_serial.c
@@ -126,7 +126,7 @@ static void do_dma_tx(SyborgSerialState *s, uint32_t count)
         s->dma_tx_ptr += count;
     }
     /* QEMU char backends do not have a nonblocking mode, so we transmit all
-       the data imediately and the interrupt status will be unchanged.  */
+       the data immediately and the interrupt status will be unchanged.  */
 }
 
 /* Initiate RX DMA, and transfer data from the FIFO.  */
-- 
1.7.2.5


