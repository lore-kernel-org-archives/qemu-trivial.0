Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QIxwb-0001jD-QW
	for mharc-qemu-trivial@gnu.org; Sun, 08 May 2011 02:58:21 -0400
Received: from eggs.gnu.org ([140.186.70.92]:56061)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1QIxwa-0001gS-4f
	for qemu-trivial@nongnu.org; Sun, 08 May 2011 02:58:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1QIxwZ-000503-4x
	for qemu-trivial@nongnu.org; Sun, 08 May 2011 02:58:20 -0400
Received: from moutng.kundenserver.de ([212.227.126.187]:49235)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1QIxwW-0004zk-GI; Sun, 08 May 2011 02:58:16 -0400
Received: from flocke.fritz.box (p54ADA2B4.dip.t-dialin.net [84.173.162.180])
	by mrelayeu.kundenserver.de (node=mreu2) with ESMTP (Nemesis)
	id 0LvxEH-1Pgsvo1zTB-017iKQ; Sun, 08 May 2011 08:58:13 +0200
Received: from stefan by flocke.fritz.box with local (Exim 4.72)
	(envelope-from <stefan@weilnetz.de>)
	id 1QIxwS-0007RN-CN; Sun, 08 May 2011 08:58:12 +0200
From: Stefan Weil <weil@mail.berlios.de>
To: QEMU Developers <qemu-devel@nongnu.org>
Date: Sun,  8 May 2011 08:58:11 +0200
Message-Id: <1304837891-28573-1-git-send-email-weil@mail.berlios.de>
X-Mailer: git-send-email 1.7.2.5
X-Provags-ID: V02:K0:n5CAwPvPYIxYZlZOBw4QfGtMvtJKWe8jGoBOBn2XZem
	QxPLGFZfEz/rvrWzH8uad0d0QGeaQYvuWGBNq8NRVDFH9HTCk2
	Un9kZK+lTmZVuJbho2rhgJDoGm7xfysyM9KO7giQSGMXA95Njl
	d5DYeF0DMm1TUiQkvgpTV7ZpxQ5YkZ5fUWoqvpZX3gGbnQ3k5Q
	lKEX3mR9Ss8oRSWKjwZ1Qxlfs8CHoZvCf6zyczkQhShSadOAtc prZrupuWZamrU
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 212.227.126.187
Cc: qemu-trivial@nongnu.org, Stefan Weil <weil@mail.berlios.de>
Subject: [Qemu-trivial] [PATCH] ac97: Remove unused local variables
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
X-List-Received-Date: Sun, 08 May 2011 06:58:21 -0000

cppcheck report:
hw/ac97.c:1004: style:
 Variable 'written' is assigned a value that is never used
hw/ac97.c:1072: style:
 Variable 'written' is assigned a value that is never used

Signed-off-by: Stefan Weil <weil@mail.berlios.de>
---
 hw/ac97.c |    6 +-----
 1 files changed, 1 insertions(+), 5 deletions(-)

diff --git a/hw/ac97.c b/hw/ac97.c
index d71072d..a946c1a 100644
--- a/hw/ac97.c
+++ b/hw/ac97.c
@@ -1001,8 +1001,6 @@ static int write_audio (AC97LinkState *s, AC97BusMasterRegs *r,
 
 static void write_bup (AC97LinkState *s, int elapsed)
 {
-    int written = 0;
-
     dolog ("write_bup\n");
     if (!(s->bup_flag & BUP_SET)) {
         if (s->bup_flag & BUP_LAST) {
@@ -1026,7 +1024,6 @@ static void write_bup (AC97LinkState *s, int elapsed)
                 return;
             temp -= copied;
             elapsed -= copied;
-            written += copied;
         }
     }
 }
@@ -1069,7 +1066,7 @@ static int read_audio (AC97LinkState *s, AC97BusMasterRegs *r,
 static void transfer_audio (AC97LinkState *s, int index, int elapsed)
 {
     AC97BusMasterRegs *r = &s->bm_regs[index];
-    int written = 0, stop = 0;
+    int stop = 0;
 
     if (s->invalid_freq[index]) {
         AUD_log ("ac97", "attempt to use voice %d with invalid frequency %d\n",
@@ -1114,7 +1111,6 @@ static void transfer_audio (AC97LinkState *s, int index, int elapsed)
         switch (index) {
         case PO_INDEX:
             temp = write_audio (s, r, elapsed, &stop);
-            written += temp;
             elapsed -= temp;
             r->picb -= (temp >> 1);
             break;
-- 
1.7.2.5


