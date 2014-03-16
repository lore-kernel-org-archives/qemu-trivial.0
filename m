Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WPFTw-0001U7-4m
	for mharc-qemu-trivial@gnu.org; Sun, 16 Mar 2014 14:08:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37152)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1WPFTp-0001Mt-DY
	for qemu-trivial@nongnu.org; Sun, 16 Mar 2014 14:08:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1WPFTk-0004IW-H3
	for qemu-trivial@nongnu.org; Sun, 16 Mar 2014 14:08:13 -0400
Received: from qemu.weilnetz.de ([37.221.198.45]:57992
	helo=v2201305906712890.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1WPFTa-00045a-9A; Sun, 16 Mar 2014 14:07:58 -0400
Received: by v2201305906712890.yourvserver.net (Postfix, from userid 1000)
	id C689A17FF89; Sun, 16 Mar 2014 19:07:55 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial@nongnu.org
Date: Sun, 16 Mar 2014 19:07:55 +0100
Message-Id: <1394993275-23154-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.198.45
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH] target-arm: Add missing 'static' attribute
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
X-List-Received-Date: Sun, 16 Mar 2014 18:08:18 -0000

This fixes a warning from the static code analysis (smatch).

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 target-arm/machine.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target-arm/machine.c b/target-arm/machine.c
index 8f9e7d4..7ced87a 100644
--- a/target-arm/machine.c
+++ b/target-arm/machine.c
@@ -88,7 +88,7 @@ static bool m_needed(void *opaque)
     return arm_feature(env, ARM_FEATURE_M);
 }
 
-const VMStateDescription vmstate_m = {
+static const VMStateDescription vmstate_m = {
     .name = "cpu/m",
     .version_id = 1,
     .minimum_version_id = 1,
-- 
1.7.10.4


