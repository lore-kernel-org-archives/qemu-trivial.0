Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c1cT5-00048C-JV
	for mharc-qemu-trivial@gnu.org; Tue, 01 Nov 2016 13:03:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51374)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1c1cSz-00042Q-7E
	for qemu-trivial@nongnu.org; Tue, 01 Nov 2016 13:03:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1c1cSv-0000dU-HD
	for qemu-trivial@nongnu.org; Tue, 01 Nov 2016 13:03:17 -0400
Received: from mail.weilnetz.de ([37.221.199.173]:46555)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1c1cSo-0000bo-L8; Tue, 01 Nov 2016 13:03:06 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by mail.weilnetz.de (Postfix) with ESMTP id C45F211810AA;
	Tue,  1 Nov 2016 18:03:05 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from mail.weilnetz.de ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id BcE7q6cFuGB3; Tue,  1 Nov 2016 18:03:03 +0100 (CET)
Received: from qemu.weilnetz.de (qemu.weilnetz.de [188.68.58.204])
	by mail.weilnetz.de (Postfix) with ESMTP id 9BEDC11810A3;
	Tue,  1 Nov 2016 18:03:03 +0100 (CET)
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
	id 864324669AE; Tue,  1 Nov 2016 18:03:03 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: QEMU Developer <qemu-devel@nongnu.org>
Cc: Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>, Stefan Weil <sw@weilnetz.de>
Date: Tue,  1 Nov 2016 18:03:02 +0100
Message-Id: <20161101170302.23737-1-sw@weilnetz.de>
X-Mailer: git-send-email 2.10.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.199.173
Subject: [Qemu-trivial] [PATCH] hw/block/m25p80: Fix typo in local macro name
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
X-List-Received-Date: Tue, 01 Nov 2016 17:03:22 -0000

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 hw/block/m25p80.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index d29ff4c..09ea51f 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -121,7 +121,7 @@ typedef struct FlashPartInfo {
 #define CFG_DUMMY_CLK_LEN 4
 #define NVCFG_DUMMY_CLK_POS 12
 #define VCFG_DUMMY_CLK_POS 4
-#define EVCFG_OUT_DRIVER_STRENGHT_DEF 7
+#define EVCFG_OUT_DRIVER_STRENGTH_DEF 7
 #define EVCFG_VPP_ACCELERATOR (1 << 3)
 #define EVCFG_RESET_HOLD_ENABLED (1 << 4)
 #define NVCFG_DUAL_IO_MASK (1 << 2)
@@ -700,7 +700,7 @@ static void reset_memory(Flash *s)
                             );
 
         s->enh_volatile_cfg = 0;
-        s->enh_volatile_cfg |= EVCFG_OUT_DRIVER_STRENGHT_DEF;
+        s->enh_volatile_cfg |= EVCFG_OUT_DRIVER_STRENGTH_DEF;
         s->enh_volatile_cfg |= EVCFG_VPP_ACCELERATOR;
         s->enh_volatile_cfg |= EVCFG_RESET_HOLD_ENABLED;
         if (s->nonvolatile_cfg & NVCFG_DUAL_IO_MASK) {
-- 
2.10.1


