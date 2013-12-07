Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VpIZM-000126-NY
	for mharc-qemu-trivial@gnu.org; Sat, 07 Dec 2013 09:09:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36027)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VpIZK-00010Z-Vc
	for qemu-trivial@nongnu.org; Sat, 07 Dec 2013 09:09:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VpIZK-00071j-4w
	for qemu-trivial@nongnu.org; Sat, 07 Dec 2013 09:09:18 -0500
Received: from qemu.weilnetz.de ([2a03:4000:2:362::1]:53255
	helo=v2201305906712890.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VpIZI-00071H-9r; Sat, 07 Dec 2013 09:09:16 -0500
Received: by v2201305906712890.yourvserver.net (Postfix, from userid 1000)
	id 02B7917F6F8; Sat,  7 Dec 2013 15:09:12 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel <qemu-devel@nongnu.org>
Date: Sat,  7 Dec 2013 15:09:12 +0100
Message-Id: <1386425352-23728-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a03:4000:2:362::1
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: [Qemu-trivial] [PATCH] qxl: Add missing trace.h (fix broken build)
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
X-List-Received-Date: Sat, 07 Dec 2013 14:09:19 -0000

Commit ac86048bcd41129b18702ba63395f222871804de removed trace.h from
console.h and ignored the fact that qxl-render.c needs this file
(it includes qxl.h which includes console.h which included trace.h).

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---

Sorry for this regression. Obviously most builds don't set CONFIG_QXL.

Regards,
Stefan

 hw/display/qxl-render.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/display/qxl-render.c b/hw/display/qxl-render.c
index d34b0c4..84f1367 100644
--- a/hw/display/qxl-render.c
+++ b/hw/display/qxl-render.c
@@ -20,6 +20,7 @@
  */
 
 #include "qxl.h"
+#include "trace.h"
 
 static void qxl_blit(PCIQXLDevice *qxl, QXLRect *rect)
 {
-- 
1.7.10.4


