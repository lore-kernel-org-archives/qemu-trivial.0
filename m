Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T7Xij-0002kS-RV
	for mharc-qemu-trivial@gnu.org; Fri, 31 Aug 2012 16:21:37 -0400
Received: from eggs.gnu.org ([208.118.235.92]:59694)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1T7Xih-0002ec-Nc
	for qemu-trivial@nongnu.org; Fri, 31 Aug 2012 16:21:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1T7Xig-0000xA-Qp
	for qemu-trivial@nongnu.org; Fri, 31 Aug 2012 16:21:35 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:52040)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1T7Xie-0000wc-CK; Fri, 31 Aug 2012 16:21:32 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	357877280027; Fri, 31 Aug 2012 22:21:30 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id j9tgeGGOUd0G; Fri, 31 Aug 2012 22:21:23 +0200 (CEST)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id A3520728002A; Fri, 31 Aug 2012 22:21:22 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: Alexander Graf <agraf@suse.de>
Date: Fri, 31 Aug 2012 22:21:21 +0200
Message-Id: <1346444481-31727-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH] ppc405_uc: Fix buffer overflow
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
X-List-Received-Date: Fri, 31 Aug 2012 20:21:36 -0000

Report from smatch:

ppc405_uc.c:209 dcr_read_pob(12) error: buffer overflow 'pob->besr' 2 <= 2
ppc405_uc.c:232 dcr_write_pob(12) error: buffer overflow 'pob->besr' 2 <= 2

The old code reads and writes besr[POB0_BESR1 - POB0_BESR0] or besr[2]
which is one too much.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---

As this code was wrong for more than 5 years, there is no urgent need to
fix it now for QEMU 1.2.

Regards,

Stefan Weil

 hw/ppc405_uc.c |   16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/hw/ppc405_uc.c b/hw/ppc405_uc.c
index 89e5013..b52ab2f 100644
--- a/hw/ppc405_uc.c
+++ b/hw/ppc405_uc.c
@@ -191,7 +191,8 @@ enum {
 typedef struct ppc4xx_pob_t ppc4xx_pob_t;
 struct ppc4xx_pob_t {
     uint32_t bear;
-    uint32_t besr[2];
+    uint32_t besr0;
+    uint32_t besr1;
 };
 
 static uint32_t dcr_read_pob (void *opaque, int dcrn)
@@ -205,8 +206,10 @@ static uint32_t dcr_read_pob (void *opaque, int dcrn)
         ret = pob->bear;
         break;
     case POB0_BESR0:
+        ret = pob->besr0;
+        break;
     case POB0_BESR1:
-        ret = pob->besr[dcrn - POB0_BESR0];
+        ret = pob->besr1;
         break;
     default:
         /* Avoid gcc warning */
@@ -227,9 +230,12 @@ static void dcr_write_pob (void *opaque, int dcrn, uint32_t val)
         /* Read only */
         break;
     case POB0_BESR0:
+        /* Write-clear */
+        pob->besr0 &= ~val;
+        break;
     case POB0_BESR1:
         /* Write-clear */
-        pob->besr[dcrn - POB0_BESR0] &= ~val;
+        pob->besr1 &= ~val;
         break;
     }
 }
@@ -241,8 +247,8 @@ static void ppc4xx_pob_reset (void *opaque)
     pob = opaque;
     /* No error */
     pob->bear = 0x00000000;
-    pob->besr[0] = 0x0000000;
-    pob->besr[1] = 0x0000000;
+    pob->besr0 = 0x0000000;
+    pob->besr1 = 0x0000000;
 }
 
 static void ppc4xx_pob_init(CPUPPCState *env)
-- 
1.7.10


