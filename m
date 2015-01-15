Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YBfyV-0008BA-4G
	for mharc-qemu-trivial@gnu.org; Thu, 15 Jan 2015 03:40:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34010)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YBfyP-00081y-Pf
	for qemu-trivial@nongnu.org; Thu, 15 Jan 2015 03:40:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YBfyP-0002iG-29
	for qemu-trivial@nongnu.org; Thu, 15 Jan 2015 03:40:13 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:37295)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YBfyI-0002bE-6P; Thu, 15 Jan 2015 03:40:06 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id C1CDE40D9E;
	Thu, 15 Jan 2015 11:30:52 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 5B00D8C4;
	Thu, 15 Jan 2015 11:30:52 +0300 (MSK)
Received: (nullmailer pid 31351 invoked by uid 1000);
	Thu, 15 Jan 2015 08:30:51 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 15 Jan 2015 11:30:44 +0300
Message-Id: <1281f8e3085b9149b8704419534f0e6f23c1fa64.1421310394.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1421310394.git.mjt@msgid.tls.msk.ru>
References: <cover.1421310394.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Greg Bellows <greg.bellows@linaro.org>, Michael Tokarev <mjt@tls.msk.ru>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [Qemu-trivial] [PULL 06/12] target-arm: Fix typo in comment
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
X-List-Received-Date: Thu, 15 Jan 2015 08:40:14 -0000

From: Stefan Weil <sw@weilnetz.de>

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Greg Bellows <greg.bellows@linaro.org>
Signed-off-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 target-arm/helper.c | 2 +-
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
2.1.4


