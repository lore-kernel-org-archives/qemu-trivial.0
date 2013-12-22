Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Vuov3-0006hx-5H
	for mharc-qemu-trivial@gnu.org; Sun, 22 Dec 2013 14:42:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44718)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1Vuouv-0006ZS-Uo
	for qemu-trivial@nongnu.org; Sun, 22 Dec 2013 14:42:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1Vuouq-0001A2-W5
	for qemu-trivial@nongnu.org; Sun, 22 Dec 2013 14:42:25 -0500
Received: from qemu.weilnetz.de ([37.221.198.45]:53090
	helo=v2201305906712890.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1Vuouh-0000yx-1K; Sun, 22 Dec 2013 14:42:11 -0500
Received: by v2201305906712890.yourvserver.net (Postfix, from userid 1000)
	id 79C7F17FC14; Sun, 22 Dec 2013 20:42:07 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org
Date: Sun, 22 Dec 2013 20:42:05 +0100
Message-Id: <1387741325-14588-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.198.45
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH v3] mainstone: Fix duplicate array values for
	key 'space'
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
X-List-Received-Date: Sun, 22 Dec 2013 19:42:31 -0000

cgcc reported a duplicate initialisation. Mainstone includes a matrix
keyboard where two different positions map to 'space'.

QEMU uses the reversed mapping and does not map 'space' to two different
matrix positions.

Some other keys are either missing or might be mapped wrongly (cf. Linux
kernel code). Don't fix these until someone can test them with real
hardware, but add TODO comments.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---

v3: 
Use 2nd alternative, so there is no change of behaviour.

 hw/arm/mainstone.c |   13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/hw/arm/mainstone.c b/hw/arm/mainstone.c
index 9402c84..ffbf4bd 100644
--- a/hw/arm/mainstone.c
+++ b/hw/arm/mainstone.c
@@ -75,9 +75,18 @@ static struct keymap map[0xE0] = {
     [0x2c] = {4,3}, /* z */
     [0xc7] = {5,0}, /* Home */
     [0x2a] = {5,1}, /* shift */
-    [0x39] = {5,2}, /* space */
+    /*
+     * There are two matrix positions which map to space,
+     * but QEMU can only use one of them for the reverse
+     * mapping, so simply use the second one.
+     */
+    /* [0x39] = {5,2}, space */
     [0x39] = {5,3}, /* space */
-    [0x1c] = {5,5}, /*  enter */
+    /*
+     * Matrix position {5,4} and other keys are missing here.
+     * TODO: Compare with Linux code and test real hardware.
+     */
+    [0x1c] = {5,5}, /* enter (TODO: might be wrong) */
     [0xc8] = {6,0}, /* up */
     [0xd0] = {6,1}, /* down */
     [0xcb] = {6,2}, /* left */
-- 
1.7.10.4


