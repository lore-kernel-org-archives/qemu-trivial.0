Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1W7QIs-0005Iu-KP
	for mharc-qemu-trivial@gnu.org; Sun, 26 Jan 2014 09:03:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55669)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1W7QIm-0005B0-IE
	for qemu-trivial@nongnu.org; Sun, 26 Jan 2014 09:03:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1W7QIh-0002Z0-NH
	for qemu-trivial@nongnu.org; Sun, 26 Jan 2014 09:03:08 -0500
Received: from qemu.weilnetz.de ([37.221.198.45]:40523
	helo=v2201305906712890.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1W7QIL-0002Xk-Fz; Sun, 26 Jan 2014 09:02:41 -0500
Received: by v2201305906712890.yourvserver.net (Postfix, from userid 1000)
	id EB79017F6D7; Sun, 26 Jan 2014 15:02:37 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial@nongnu.org
Date: Sun, 26 Jan 2014 15:02:29 +0100
Message-Id: <1390744949-28850-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.198.45
Cc: Stefan Weil <sw@weilnetz.de>, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
	Alexander Graf <agraf@suse.de>
Subject: [Qemu-trivial] [PATCH] hw/ppc: Remove unused defines
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
X-List-Received-Date: Sun, 26 Jan 2014 14:03:13 -0000

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 hw/ppc/ppc4xx_devs.c |    2 --
 1 file changed, 2 deletions(-)

diff --git a/hw/ppc/ppc4xx_devs.c b/hw/ppc/ppc4xx_devs.c
index 239aada..9160ee7 100644
--- a/hw/ppc/ppc4xx_devs.c
+++ b/hw/ppc/ppc4xx_devs.c
@@ -27,8 +27,6 @@
 #include "qemu/log.h"
 #include "exec/address-spaces.h"
 
-//#define DEBUG_MMIO
-//#define DEBUG_UNASSIGNED
 #define DEBUG_UIC
 
 
-- 
1.7.10.4


