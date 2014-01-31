Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1W9MDW-0001kc-JN
	for mharc-qemu-trivial@gnu.org; Fri, 31 Jan 2014 17:05:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55811)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1W9MDT-0001gF-1F
	for qemu-trivial@nongnu.org; Fri, 31 Jan 2014 17:05:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1W9MDN-0008QJ-4B
	for qemu-trivial@nongnu.org; Fri, 31 Jan 2014 17:05:38 -0500
Received: from qemu.weilnetz.de ([2a03:4000:2:362::1]:40916
	helo=v2201305906712890.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1W9MDK-0008Od-F2; Fri, 31 Jan 2014 17:05:30 -0500
Received: by v2201305906712890.yourvserver.net (Postfix, from userid 1000)
	id E305C17F986; Fri, 31 Jan 2014 23:05:25 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial@nongnu.org
Date: Fri, 31 Jan 2014 23:05:24 +0100
Message-Id: <1391205924-28586-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a03:4000:2:362::1
Cc: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org,
	Anthony Liguori <aliguori@amazon.com>, qemu-stable@nongnu.org
Subject: [Qemu-trivial] [PATCH] i386: Add missing include file for
	QEMU_PACKED
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
X-List-Received-Date: Fri, 31 Jan 2014 22:05:40 -0000

Instead of packing BiosLinkerLoaderEntry, an unused global variable called
QEMU_PACKED was created (detected by smatch static code analysis).

Including qemu-common.h gets the right definition and also includes some
standard include files which now can be removed here.

Cc: qemu-stable@nongnu.org
Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 hw/i386/bios-linker-loader.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/i386/bios-linker-loader.c b/hw/i386/bios-linker-loader.c
index fd23611..aa56184 100644
--- a/hw/i386/bios-linker-loader.c
+++ b/hw/i386/bios-linker-loader.c
@@ -18,11 +18,10 @@
  * with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
+#include "qemu-common.h"
 #include "bios-linker-loader.h"
 #include "hw/nvram/fw_cfg.h"
 
-#include <string.h>
-#include <assert.h>
 #include "qemu/bswap.h"
 
 #define BIOS_LINKER_LOADER_FILESZ FW_CFG_MAX_FILE_PATH
-- 
1.7.10.4


