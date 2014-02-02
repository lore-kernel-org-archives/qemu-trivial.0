Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1W9zzk-00041B-Ij
	for mharc-qemu-trivial@gnu.org; Sun, 02 Feb 2014 11:34:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41927)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1W9zyp-000378-T4
	for qemu-trivial@nongnu.org; Sun, 02 Feb 2014 11:34:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1W9zxN-0002kS-Gm
	for qemu-trivial@nongnu.org; Sun, 02 Feb 2014 11:33:11 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:42265)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1W9zlU-00083U-9j; Sun, 02 Feb 2014 11:19:24 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id F34D940228;
	Sun,  2 Feb 2014 20:12:45 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id D63DA615;
	Sun,  2 Feb 2014 20:12:45 +0400 (MSK)
Received: (nullmailer pid 1644 invoked by uid 1000);
	Sun, 02 Feb 2014 16:12:45 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: aliguori@amazon.com
Date: Sun,  2 Feb 2014 20:12:39 +0400
Message-Id: <1391357563-1592-4-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1391357563-1592-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1391357563-1592-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org,
	qemu-stable@nongnu.org
Subject: [Qemu-trivial] [PULL 3/7] i386: Add missing include file for
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
X-List-Received-Date: Sun, 02 Feb 2014 16:34:07 -0000

From: Stefan Weil <sw@weilnetz.de>

Instead of packing BiosLinkerLoaderEntry, an unused global variable called
QEMU_PACKED was created (detected by smatch static code analysis).

Including qemu-common.h gets the right definition and also includes some
standard include files which now can be removed here.

Cc: qemu-stable@nongnu.org
Signed-off-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
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


