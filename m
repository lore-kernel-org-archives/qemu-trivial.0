Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TvEv4-0003Vo-QN
	for mharc-qemu-trivial@gnu.org; Tue, 15 Jan 2013 17:23:46 -0500
Received: from eggs.gnu.org ([208.118.235.92]:49046)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1TvEv0-0003IT-As
	for qemu-trivial@nongnu.org; Tue, 15 Jan 2013 17:23:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1TvEuw-0007fV-U4
	for qemu-trivial@nongnu.org; Tue, 15 Jan 2013 17:23:42 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:55532)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1TvEuq-0007eC-RV; Tue, 15 Jan 2013 17:23:33 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	8D90D7280056; Tue, 15 Jan 2013 23:23:30 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id o4gVqaalPjGC; Tue, 15 Jan 2013 23:23:25 +0100 (CET)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 427D17280057; Tue, 15 Jan 2013 23:23:25 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial@nongnu.org
Date: Tue, 15 Jan 2013 23:23:23 +0100
Message-Id: <1358288603-28102-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 78.47.199.172
Cc: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH] hw/tpci200: Fix compiler warning (redefined
	symbol with MinGW)
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
X-List-Received-Date: Tue, 15 Jan 2013 22:23:46 -0000

STATUS_TIMEOUT is defined in winnt.h:

  CC    hw/tpci200.o
hw/tpci200.c:34:0:
 warning: "STATUS_TIMEOUT" redefined [enabled by default]
/usr/lib/gcc/x86_64-w64-mingw32/4.6/../../../../x86_64-w64-mingw32/include/winnt.h:1036:0:
 note: this is the location of the previous definition

Fix the compiler warning by adding a prefix.
The same prefix is also added to STATUS_INT and STATUS_ERR_ANY to
preserve uniformity of all three symbols.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 hw/tpci200.c |   24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/hw/tpci200.c b/hw/tpci200.c
index e082bca..c2a63ee 100644
--- a/hw/tpci200.c
+++ b/hw/tpci200.c
@@ -30,9 +30,9 @@
 #define IP_ID_SPACE_ADDR_MASK  0x3F
 #define IP_INT_SPACE_ADDR_MASK 0x3F
 
-#define STATUS_INT(IP, INTNO) BIT((IP) * 2 + (INTNO))
-#define STATUS_TIMEOUT(IP)    BIT((IP) + 12)
-#define STATUS_ERR_ANY        0xF00
+#define TPCI200_STATUS_INT(IP, INTNO) BIT((IP) * 2 + (INTNO))
+#define TPCI200_STATUS_TIMEOUT(IP)    BIT((IP) + 12)
+#define TPCI200_STATUS_ERR_ANY        0xF00
 
 #define CTRL_CLKRATE          BIT(0)
 #define CTRL_RECOVER          BIT(1)
@@ -119,9 +119,9 @@ static void tpci200_set_irq(void *opaque, int intno, int level)
 
     /* Update the interrupt status in the IP STATUS register */
     if (level) {
-        dev->status |=  STATUS_INT(ip_n, intno);
+        dev->status |=  TPCI200_STATUS_INT(ip_n, intno);
     } else {
-        dev->status &= ~STATUS_INT(ip_n, intno);
+        dev->status &= ~TPCI200_STATUS_INT(ip_n, intno);
     }
 
     /* Return if there are no changes */
@@ -147,7 +147,7 @@ static void tpci200_set_irq(void *opaque, int intno, int level)
         for (i = 0; i < N_MODULES; i++) {
             for (j = 0; j < 2; j++) {
                 if (dev->ctrl[i] & CTRL_INT_EDGE(j)) {
-                    level_status &= ~STATUS_INT(i, j);
+                    level_status &= ~TPCI200_STATUS_INT(i, j);
                 }
             }
         }
@@ -269,23 +269,23 @@ static void tpci200_write_las0(void *opaque, hwaddr addr, uint64_t val,
                 IPackDevice *ip = ipack_device_find(&s->bus, i);
 
                 if (ip != NULL) {
-                    if (val & STATUS_INT(i, 0)) {
+                    if (val & TPCI200_STATUS_INT(i, 0)) {
                         DPRINTF("Clear IP %c INT0# status\n", 'A' + i);
                         qemu_irq_lower(ip->irq[0]);
                     }
-                    if (val & STATUS_INT(i, 1)) {
+                    if (val & TPCI200_STATUS_INT(i, 1)) {
                         DPRINTF("Clear IP %c INT1# status\n", 'A' + i);
                         qemu_irq_lower(ip->irq[1]);
                     }
                 }
 
-                if (val & STATUS_TIMEOUT(i)) {
+                if (val & TPCI200_STATUS_TIMEOUT(i)) {
                     DPRINTF("Clear IP %c timeout\n", 'A' + i);
-                    s->status &= ~STATUS_TIMEOUT(i);
+                    s->status &= ~TPCI200_STATUS_TIMEOUT(i);
                 }
             }
 
-            if (val & STATUS_ERR_ANY) {
+            if (val & TPCI200_STATUS_ERR_ANY) {
                 DPRINTF("Unexpected write to STATUS register: 0x%x\n",
                         (unsigned) val);
             }
@@ -337,7 +337,7 @@ static uint64_t tpci200_read_las1(void *opaque, hwaddr addr, unsigned size)
             /* Read address 0 to ACK IP INT0# and address 2 to ACK IP INT1# */
             if (offset == 0 || offset == 2) {
                 unsigned intno = offset / 2;
-                bool int_set = s->status & STATUS_INT(ip_n, intno);
+                bool int_set = s->status & TPCI200_STATUS_INT(ip_n, intno);
                 bool int_edge_sensitive = s->ctrl[ip_n] & CTRL_INT_EDGE(intno);
                 if (int_set && !int_edge_sensitive) {
                     qemu_irq_lower(ip->irq[intno]);
-- 
1.7.10.4


