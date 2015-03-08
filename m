Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YUfqs-0002nR-5h
	for mharc-qemu-trivial@gnu.org; Sun, 08 Mar 2015 14:22:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50483)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1YUfqp-0002kR-WB
	for qemu-trivial@nongnu.org; Sun, 08 Mar 2015 14:22:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1YUfqp-0007QG-AH
	for qemu-trivial@nongnu.org; Sun, 08 Mar 2015 14:22:55 -0400
Received: from qemu.weilnetz.de ([37.221.198.45]:46112)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1YUfqk-0007PS-Ta; Sun, 08 Mar 2015 14:22:51 -0400
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
	id CAFE217F9E9; Sun,  8 Mar 2015 19:22:48 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: QEMU Trivial <qemu-trivial@nongnu.org>
Date: Sun,  8 Mar 2015 19:22:48 +0100
Message-Id: <1425838968-28635-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.198.45
Cc: Stefan Weil <sw@weilnetz.de>, Andrzej Zaborowski <balrogg@gmail.com>,
	QEMU Developer <qemu-devel@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [Qemu-trivial] [PATCH 4/7] arm/nseries: Fix warnings from Sparse
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
X-List-Received-Date: Sun, 08 Mar 2015 18:22:57 -0000

Sparse report:

arm/nseries.c:1406:5: warning: returning void-valued expression
arm/nseries.c:1411:5: warning: returning void-valued expression

Cc: Andrzej Zaborowski <balrogg@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 hw/arm/nseries.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/arm/nseries.c b/hw/arm/nseries.c
index 4d7be5e..f59adc1 100644
--- a/hw/arm/nseries.c
+++ b/hw/arm/nseries.c
@@ -1403,12 +1403,12 @@ static struct arm_boot_info n810_binfo = {
 
 static void n800_init(MachineState *machine)
 {
-    return n8x0_init(machine, &n800_binfo, 800);
+    n8x0_init(machine, &n800_binfo, 800);
 }
 
 static void n810_init(MachineState *machine)
 {
-    return n8x0_init(machine, &n810_binfo, 810);
+    n8x0_init(machine, &n810_binfo, 810);
 }
 
 static QEMUMachine n800_machine = {
-- 
2.1.4


