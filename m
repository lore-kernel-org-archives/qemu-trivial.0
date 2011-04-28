Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QFT6L-0001T8-UQ
	for mharc-qemu-trivial@gnu.org; Thu, 28 Apr 2011 11:25:57 -0400
Received: from eggs.gnu.org ([140.186.70.92]:52714)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1QFT6J-0001PK-Eu
	for qemu-trivial@nongnu.org; Thu, 28 Apr 2011 11:25:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1QFT6I-0007dg-3t
	for qemu-trivial@nongnu.org; Thu, 28 Apr 2011 11:25:55 -0400
Received: from moutng.kundenserver.de ([212.227.17.10]:64451)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1QFT6H-0007dL-PA; Thu, 28 Apr 2011 11:25:54 -0400
Received: from flocke.fritz.box (p5086FD13.dip.t-dialin.net [80.134.253.19])
	by mrelayeu.kundenserver.de (node=mrbap0) with ESMTP (Nemesis)
	id 0MYtKV-1QKGMk2K0p-00VGOC; Thu, 28 Apr 2011 17:20:50 +0200
Received: from stefan by flocke.fritz.box with local (Exim 4.72)
	(envelope-from <stefan@weilnetz.de>)
	id 1QFT1M-0002C1-5n; Thu, 28 Apr 2011 17:20:48 +0200
From: Stefan Weil <weil@mail.berlios.de>
To: QEMU Developers <qemu-devel@nongnu.org>
Date: Thu, 28 Apr 2011 17:20:42 +0200
Message-Id: <1304004042-8334-18-git-send-email-weil@mail.berlios.de>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1304004042-8334-1-git-send-email-weil@mail.berlios.de>
References: <1304004042-8334-1-git-send-email-weil@mail.berlios.de>
X-Provags-ID: V02:K0:OVCbCsYm9y8KZFgup1Rw7xH/QamT3uTKhJFQm9RWMZO
	WE176ZRJ80GilndE/GA4USB1vCg6ElcywgAjI2r4lQ+767BwDm
	8axPNY8M7eanIJDwlE+Gnax/OOSyuZLi7P4t5Owt/PJLpdf3Ie
	ktmGQWGbctyQn4Az4ePiOREHqwLje7wPuzdWSBsQgHgDSEbDfn
	+3rL5AxFd2FepU+mRt78fOJeBRlHxtRJC+CpuKzYMFGdsZnTWK gfQOH4R7INVjN
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 212.227.17.10
Cc: qemu-trivial@nongnu.org, Stefan Weil <weil@mail.berlios.de>
Subject: [Qemu-trivial] [PATCH 18/18] Fix typos in comment (threshhold ->
	threshold, mapp -> map)
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
X-List-Received-Date: Thu, 28 Apr 2011 15:25:56 -0000

Signed-off-by: Stefan Weil <weil@mail.berlios.de>
---
 hw/xilinx_axidma.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/xilinx_axidma.c b/hw/xilinx_axidma.c
index e32534f..571a5b0 100644
--- a/hw/xilinx_axidma.c
+++ b/hw/xilinx_axidma.c
@@ -134,10 +134,10 @@ static inline int stream_idle(struct AXIStream *s)
 static void stream_reset(struct AXIStream *s)
 {
     s->regs[R_DMASR] = DMASR_HALTED;  /* starts up halted.  */
-    s->regs[R_DMACR] = 1 << 16; /* Starts with one in compl threshhold.  */
+    s->regs[R_DMACR] = 1 << 16; /* Starts with one in compl threshold.  */
 }
 
-/* Mapp an offset addr into a channel index.  */
+/* Map an offset addr into a channel index.  */
 static inline int streamid_from_addr(target_phys_addr_t addr)
 {
     int sid;
-- 
1.7.2.5


