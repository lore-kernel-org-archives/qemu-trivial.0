Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T8zlQ-0001XV-L8
	for mharc-qemu-trivial@gnu.org; Tue, 04 Sep 2012 16:30:24 -0400
Received: from eggs.gnu.org ([208.118.235.92]:54876)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1T8zlK-0001Im-Cf
	for qemu-trivial@nongnu.org; Tue, 04 Sep 2012 16:30:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1T8zlJ-0004AL-3C
	for qemu-trivial@nongnu.org; Tue, 04 Sep 2012 16:30:18 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:47975)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1T8zl7-0003pw-5v; Tue, 04 Sep 2012 16:30:05 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	0E30E7280029; Tue,  4 Sep 2012 22:30:03 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id LBiRdW+V9xZ4; Tue,  4 Sep 2012 22:30:02 +0200 (CEST)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 450B0728002B; Tue,  4 Sep 2012 22:30:02 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial@nongnu.org
Date: Tue,  4 Sep 2012 22:30:01 +0200
Message-Id: <1346790601-14439-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH] hw/xics: Fix one-bit signed bitfields
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
X-List-Received-Date: Tue, 04 Sep 2012 20:30:23 -0000

Report from smatch:

xics.c:169:19: error: dubious one-bit signed bitfield
xics.c:170:15: error: dubious one-bit signed bitfield
xics.c:171:19: error: dubious one-bit signed bitfield
xics.c:172:25: error: dubious one-bit signed bitfield

Instead of replacing 'int' by 'unsigned', 'bool' was used because
all 4 values are boolean values.

Replacing 0 and 1 in the assignments by false and true
looks better for those boolean values.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 hw/xics.c |   22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/hw/xics.c b/hw/xics.c
index b674771..8a2f70f 100644
--- a/hw/xics.c
+++ b/hw/xics.c
@@ -166,10 +166,10 @@ struct ics_irq_state {
     uint8_t priority;
     uint8_t saved_priority;
     enum xics_irq_type type;
-    int asserted:1;
-    int sent:1;
-    int rejected:1;
-    int masked_pending:1;
+    bool asserted:1;
+    bool sent:1;
+    bool rejected:1;
+    bool masked_pending:1;
 };
 
 struct ics_state {
@@ -192,7 +192,7 @@ static void resend_msi(struct ics_state *ics, int srcno)
 
     /* FIXME: filter by server#? */
     if (irq->rejected) {
-        irq->rejected = 0;
+        irq->rejected = false;
         if (irq->priority != 0xff) {
             icp_irq(ics->icp, irq->server, srcno + ics->offset,
                     irq->priority);
@@ -205,7 +205,7 @@ static void resend_lsi(struct ics_state *ics, int srcno)
     struct ics_irq_state *irq = ics->irqs + srcno;
 
     if ((irq->priority != 0xff) && irq->asserted && !irq->sent) {
-        irq->sent = 1;
+        irq->sent = true;
         icp_irq(ics->icp, irq->server, srcno + ics->offset, irq->priority);
     }
 }
@@ -216,7 +216,7 @@ static void set_irq_msi(struct ics_state *ics, int srcno, int val)
 
     if (val) {
         if (irq->priority == 0xff) {
-            irq->masked_pending = 1;
+            irq->masked_pending = true;
             /* masked pending */ ;
         } else  {
             icp_irq(ics->icp, irq->server, srcno + ics->offset, irq->priority);
@@ -252,7 +252,7 @@ static void write_xive_msi(struct ics_state *ics, int srcno)
         return;
     }
 
-    irq->masked_pending = 0;
+    irq->masked_pending = false;
     icp_irq(ics->icp, irq->server, srcno + ics->offset, irq->priority);
 }
 
@@ -281,8 +281,8 @@ static void ics_reject(struct ics_state *ics, int nr)
 {
     struct ics_irq_state *irq = ics->irqs + nr - ics->offset;
 
-    irq->rejected = 1; /* Irrelevant but harmless for LSI */
-    irq->sent = 0; /* Irrelevant but harmless for MSI */
+    irq->rejected = true; /* Irrelevant but harmless for LSI */
+    irq->sent = false; /* Irrelevant but harmless for MSI */
 }
 
 static void ics_resend(struct ics_state *ics)
@@ -307,7 +307,7 @@ static void ics_eoi(struct ics_state *ics, int nr)
     struct ics_irq_state *irq = ics->irqs + srcno;
 
     if (irq->type == XICS_LSI) {
-        irq->sent = 0;
+        irq->sent = false;
     }
 }
 
-- 
1.7.10


