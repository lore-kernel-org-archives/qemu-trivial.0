Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WPFZ9-0005Rj-SP
	for mharc-qemu-trivial@gnu.org; Sun, 16 Mar 2014 14:13:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37772)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1WPFZ3-0005Jl-GX
	for qemu-trivial@nongnu.org; Sun, 16 Mar 2014 14:13:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1WPFYy-0005zD-Kc
	for qemu-trivial@nongnu.org; Sun, 16 Mar 2014 14:13:37 -0400
Received: from qemu.weilnetz.de ([37.221.198.45]:58001
	helo=v2201305906712890.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1WPFYo-0005x5-M6; Sun, 16 Mar 2014 14:13:22 -0400
Received: by v2201305906712890.yourvserver.net (Postfix, from userid 1000)
	id 8B2C717FF89; Sun, 16 Mar 2014 19:13:19 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial@nongnu.org
Date: Sun, 16 Mar 2014 19:13:18 +0100
Message-Id: <1394993598-23318-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.198.45
Cc: Kevin Wolf <kwolf@redhat.com>, Stefan Weil <sw@weilnetz.de>,
	qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH] hw/ide: Add missing 'static' attributes
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
X-List-Received-Date: Sun, 16 Mar 2014 18:13:42 -0000

This fixes a warning from the static code analysis (smatch).

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 hw/ide/pci.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ide/pci.c b/hw/ide/pci.c
index 91151fc..d8b1157 100644
--- a/hw/ide/pci.c
+++ b/hw/ide/pci.c
@@ -421,7 +421,7 @@ static const VMStateDescription vmstate_bmdma_current = {
     }
 };
 
-const VMStateDescription vmstate_bmdma_status = {
+static const VMStateDescription vmstate_bmdma_status = {
     .name ="ide bmdma/status",
     .version_id = 1,
     .minimum_version_id = 1,
-- 
1.7.10.4


