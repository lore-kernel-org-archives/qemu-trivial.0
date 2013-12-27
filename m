Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Vwfqw-0000QU-9L
	for mharc-qemu-trivial@gnu.org; Fri, 27 Dec 2013 17:25:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35425)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Vwfqo-00009H-VI
	for qemu-trivial@nongnu.org; Fri, 27 Dec 2013 17:25:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Vwfqk-0000O2-Pc
	for qemu-trivial@nongnu.org; Fri, 27 Dec 2013 17:25:50 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:48428)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VwfqX-0000Lx-KO; Fri, 27 Dec 2013 17:25:33 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id A0D88438AB;
	Sat, 28 Dec 2013 02:25:32 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 1CED760D;
	Sat, 28 Dec 2013 02:07:36 +0400 (MSK)
Received: (nullmailer pid 10361 invoked by uid 1000);
	Fri, 27 Dec 2013 22:07:35 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: aliguori@amazon.com
Date: Sat, 28 Dec 2013 02:07:29 +0400
Message-Id: <1388182050-10270-17-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1388182050-10270-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1388182050-10270-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 16/17] mainstone: Fix duplicate array values
	for key 'space'
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
X-List-Received-Date: Fri, 27 Dec 2013 22:25:55 -0000

From: Stefan Weil <sw@weilnetz.de>

cgcc reported a duplicate initialisation. Mainstone includes a matrix
keyboard where two different positions map to 'space'.

QEMU uses the reversed mapping and does not map 'space' to two different
matrix positions.

Some other keys are either missing or might be mapped wrongly (cf. Linux
kernel code). Don't fix these until someone can test them with real
hardware, but add TODO comments.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/arm/mainstone.c |   13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/hw/arm/mainstone.c b/hw/arm/mainstone.c
index 276e359..d8e075e 100644
--- a/hw/arm/mainstone.c
+++ b/hw/arm/mainstone.c
@@ -75,9 +75,18 @@ static const struct keymap map[0xE0] = {
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


