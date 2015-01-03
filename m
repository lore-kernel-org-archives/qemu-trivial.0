Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Y7Oy3-00047D-PK
	for mharc-qemu-trivial@gnu.org; Sat, 03 Jan 2015 08:42:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42839)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1Y7Oy1-00042c-VL
	for qemu-trivial@nongnu.org; Sat, 03 Jan 2015 08:42:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1Y7Oy1-0000hZ-9a
	for qemu-trivial@nongnu.org; Sat, 03 Jan 2015 08:42:09 -0500
Received: from qemu.weilnetz.de ([37.221.198.45]:42701)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1Y7Oxz-0000gu-Ih; Sat, 03 Jan 2015 08:42:07 -0500
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
	id E67F717FF89; Sat,  3 Jan 2015 14:42:04 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: QEMU Trivial <qemu-trivial@nongnu.org>
Date: Sat,  3 Jan 2015 14:41:38 +0100
Message-Id: <1420292499-8596-3-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1420292499-8596-1-git-send-email-sw@weilnetz.de>
References: <1420292499-8596-1-git-send-email-sw@weilnetz.de>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.198.45
Cc: Stefan Weil <sw@weilnetz.de>, Greg Bellows <greg.bellows@linaro.org>,
	QEMU Developer <qemu-devel@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [Qemu-trivial] [PATCH 2/3] target-arm: Fix typo in comment
	(seperately -> separately)
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
X-List-Received-Date: Sat, 03 Jan 2015 13:42:11 -0000

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Greg Bellows <greg.bellows@linaro.org>
Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 target-arm/helper.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target-arm/helper.c b/target-arm/helper.c
index 3ef0f1f..1a5e067 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -972,7 +972,7 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
      * The override is necessary because of the overly-broad TLB_LOCKDOWN
      * definition.
      */
-     /* MAIR0/1 are defined seperately from their 64-bit counterpart which
+     /* MAIR0/1 are defined separately from their 64-bit counterpart which
       * allows them to assign the correct fieldoffset based on the endianness
       * handled in the field definitions.
       */
-- 
1.7.10.4


