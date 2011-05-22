Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QO7N9-0001Iy-H4
	for mharc-qemu-trivial@gnu.org; Sun, 22 May 2011 08:03:03 -0400
Received: from eggs.gnu.org ([140.186.70.92]:33754)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1QO7N2-0001IL-7u
	for qemu-trivial@nongnu.org; Sun, 22 May 2011 08:03:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1QO7N1-0002zj-4d
	for qemu-trivial@nongnu.org; Sun, 22 May 2011 08:02:56 -0400
Received: from moutng.kundenserver.de ([212.227.17.10]:49408)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1QO7N0-0002zA-Ne; Sun, 22 May 2011 08:02:55 -0400
Received: from flocke.weilnetz.de (p5086EED0.dip.t-dialin.net [80.134.238.208])
	by mrelayeu.kundenserver.de (node=mrbap4) with ESMTP (Nemesis)
	id 0MOAIW-1QKnzC0v4u-005aGd; Sun, 22 May 2011 14:02:42 +0200
Received: from stefan by flocke.weilnetz.de with local (Exim 4.72)
	(envelope-from <stefan@weilnetz.de>)
	id 1QO7Mn-0001Bm-9s; Sun, 22 May 2011 14:02:41 +0200
From: Stefan Weil <weil@mail.berlios.de>
To: QEMU Developers <qemu-devel@nongnu.org>
Date: Sun, 22 May 2011 14:02:39 +0200
Message-Id: <1306065760-4541-1-git-send-email-weil@mail.berlios.de>
X-Mailer: git-send-email 1.7.2.5
X-Provags-ID: V02:K0:Rqfpy0ETTGC13m9OmhYgRkwNX1MQ+QIBz5xTlKrjNcr
	7+9ZwW4XXiYTbvuttGwQv/Zglkkbvov1twprQcwZjtSDlTncl1
	/Jh9Ig3Dai+LCtRfKlBZZ93hNO7PXy3gMOyUgQ7mBvT14bNz+z
	PZDvBHlrZ4WoEbGtZqnA23/b9duDtVAul2W61AKmMzrV1BVr7y
	bl6zfOb/ycnGQ/2UndMTGRMZwHeLMn9M24ioTi3O3+li36Dl4w rdGK9Rdw664U3
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 212.227.17.10
Cc: qemu-trivial@nongnu.org, Stefan Weil <weil@mail.berlios.de>
Subject: [Qemu-trivial] [PATCH 1/2] pflash_cfi02: Fix a typo in debug code
	(TARGET_FMT_pld -> TARGET_FMT_plx)
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
X-List-Received-Date: Sun, 22 May 2011 12:03:01 -0000

Thanks to Tobias Hoffmann <th55@gmx.de> for this patch.

Signed-off-by: Stefan Weil <weil@mail.berlios.de>
---
 hw/pflash_cfi02.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/hw/pflash_cfi02.c b/hw/pflash_cfi02.c
index 8fdafe6..725cd1e 100644
--- a/hw/pflash_cfi02.c
+++ b/hw/pflash_cfi02.c
@@ -188,7 +188,7 @@ static uint32_t pflash_read (pflash_t *pfl, target_phys_addr_t offset,
         default:
             goto flash_read;
         }
-        DPRINTF("%s: ID " TARGET_FMT_pld " %x\n", __func__, boff, ret);
+        DPRINTF("%s: ID " TARGET_FMT_plx " %x\n", __func__, boff, ret);
         break;
     case 0xA0:
     case 0x10:
-- 
1.7.2.5


