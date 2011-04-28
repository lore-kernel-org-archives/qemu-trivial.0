Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QFT1Y-00011q-2t
	for mharc-qemu-trivial@gnu.org; Thu, 28 Apr 2011 11:21:00 -0400
Received: from eggs.gnu.org ([140.186.70.92]:48303)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1QFT1V-0000x6-6t
	for qemu-trivial@nongnu.org; Thu, 28 Apr 2011 11:20:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1QFT1S-0006ff-S5
	for qemu-trivial@nongnu.org; Thu, 28 Apr 2011 11:20:57 -0400
Received: from moutng.kundenserver.de ([212.227.126.186]:52318)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1QFT1S-0006dz-Gc; Thu, 28 Apr 2011 11:20:54 -0400
Received: from flocke.fritz.box (p5086FD13.dip.t-dialin.net [80.134.253.19])
	by mrelayeu.kundenserver.de (node=mrbap3) with ESMTP (Nemesis)
	id 0MKqqe-1QFT1K3Fmy-00068a; Thu, 28 Apr 2011 17:20:47 +0200
Received: from stefan by flocke.fritz.box with local (Exim 4.72)
	(envelope-from <stefan@weilnetz.de>)
	id 1QFT1K-0002BM-0J; Thu, 28 Apr 2011 17:20:46 +0200
From: Stefan Weil <weil@mail.berlios.de>
To: QEMU Developers <qemu-devel@nongnu.org>
Date: Thu, 28 Apr 2011 17:20:28 +0200
Message-Id: <1304004042-8334-4-git-send-email-weil@mail.berlios.de>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1304004042-8334-1-git-send-email-weil@mail.berlios.de>
References: <1304004042-8334-1-git-send-email-weil@mail.berlios.de>
X-Provags-ID: V02:K0:nwXCxB0TkJh/uti/8GOPhlHxO+UyfypSlDOasxysmjq
	hUs8kCliOAkLUSdd9h19Bu7R2IKm9m9ErXOuP6CN42DzP2JY9s
	6SgyBdXgUfTYpbXQt/+IMyu5elRtYwIsX3nA8ZYgelY7bdwiBk
	REuv96Tas79t8msjrUMxdLdAChSTFP60GCf8J8vrrrTckJje0R
	j7r0hus7BIojMjLiclXIjQXw4e1QACrVD0saJe0Gy371KoB4va C/xB7awMT3xfK
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 212.227.126.186
Cc: qemu-trivial@nongnu.org, Stefan Weil <weil@mail.berlios.de>
Subject: [Qemu-trivial] [PATCH 04/18] Fix typo in comment (colum -> column)
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
X-List-Received-Date: Thu, 28 Apr 2011 15:20:58 -0000

Signed-off-by: Stefan Weil <weil@mail.berlios.de>
---
 hw/ssd0303.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/hw/ssd0303.c b/hw/ssd0303.c
index 108c068..b39e259 100644
--- a/hw/ssd0303.c
+++ b/hw/ssd0303.c
@@ -93,7 +93,7 @@ static int ssd0303_send(i2c_slave *i2c, uint8_t data)
             DPRINTF("cmd 0x%02x\n", data);
             s->mode = SSD0303_IDLE;
             switch (data) {
-            case 0x00 ... 0x0f: /* Set lower colum address.  */
+            case 0x00 ... 0x0f: /* Set lower column address.  */
                 s->col = (s->col & 0xf0) | (data & 0xf);
                 break;
             case 0x10 ... 0x20: /* Set higher column address.  */
-- 
1.7.2.5


