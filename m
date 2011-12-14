Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RaiN9-0006nQ-VD
	for mharc-qemu-trivial@gnu.org; Wed, 14 Dec 2011 01:31:23 -0500
Received: from eggs.gnu.org ([140.186.70.92]:42679)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1RaiN6-0006aP-B2
	for qemu-trivial@nongnu.org; Wed, 14 Dec 2011 01:31:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1RaiN5-0005Gq-Bz
	for qemu-trivial@nongnu.org; Wed, 14 Dec 2011 01:31:20 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:58342)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1RaiN3-0005En-88; Wed, 14 Dec 2011 01:31:17 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	C8998728188B; Wed, 14 Dec 2011 07:30:54 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id b90eRYBiy4hw; Wed, 14 Dec 2011 07:30:25 +0100 (CET)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 6090C7281C24; Wed, 14 Dec 2011 07:30:25 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org
Date: Wed, 14 Dec 2011 07:30:24 +0100
Message-Id: <1323844224-22432-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH] doc: Remove Symbian Virtual Platform
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
X-List-Received-Date: Wed, 14 Dec 2011 06:31:21 -0000

Commit d396a657baec8c6b7aa0c888746e0e2f78303650 removed the code
for SVP, so the documentation needs this update.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 qemu-doc.texi |   23 -----------------------
 1 files changed, 0 insertions(+), 23 deletions(-)

diff --git a/qemu-doc.texi b/qemu-doc.texi
index 9c3cb62..11f4166 100644
--- a/qemu-doc.texi
+++ b/qemu-doc.texi
@@ -107,7 +107,6 @@ For system emulation, the following hardware targets are supported:
 @item MusicPal (MV88W8618 ARM processor)
 @item Gumstix "Connex" and "Verdex" motherboards (PXA255/270).
 @item Siemens SX1 smartphone (OMAP310 processor)
-@item Syborg SVP base model (ARM Cortex-A8).
 @item AXIS-Devboard88 (CRISv32 ETRAX-FS).
 @item Petalogix Spartan 3aDSP1800 MMU ref design (MicroBlaze).
 @item Avnet LX60/LX110/LX200 boards (Xtensa)
@@ -2079,28 +2078,6 @@ Secure Digital card connected to OMAP MMC/SD host
 Three on-chip UARTs
 @end itemize
 
-The "Syborg" Symbian Virtual Platform base model includes the following
-elements:
-
-@itemize @minus
-@item
-ARM Cortex-A8 CPU
-@item
-Interrupt controller
-@item
-Timer
-@item
-Real Time Clock
-@item
-Keyboard
-@item
-Framebuffer
-@item
-Touchscreen
-@item
-UARTs
-@end itemize
-
 A Linux 2.6 test image is available on the QEMU web site. More
 information is available in the QEMU mailing-list archive.
 
-- 
1.7.2.5


