Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WGYzE-0005QC-2C
	for mharc-qemu-trivial@gnu.org; Thu, 20 Feb 2014 14:08:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60215)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1WGYzB-0005Nv-9l
	for qemu-trivial@nongnu.org; Thu, 20 Feb 2014 14:08:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1WGYzA-0001KQ-HH
	for qemu-trivial@nongnu.org; Thu, 20 Feb 2014 14:08:41 -0500
Received: from qemu.weilnetz.de ([2a03:4000:2:362::1]:39163
	helo=v2201305906712890.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1WGYz7-0001JQ-KZ; Thu, 20 Feb 2014 14:08:37 -0500
Received: by v2201305906712890.yourvserver.net (Postfix, from userid 1000)
	id D4B8517FD63; Thu, 20 Feb 2014 20:08:32 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial@nongnu.org
Date: Thu, 20 Feb 2014 20:08:31 +0100
Message-Id: <1392923311-14194-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a03:4000:2:362::1
Cc: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH] stubs: Optimize dependencies for gdbstub.c
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
X-List-Received-Date: Thu, 20 Feb 2014 19:08:42 -0000

It does not need qemu-common.h. Including exec/gdbstub.h fixes a warning
from static code analyzers and avoids mismatching declarations for
xml_builtin.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 stubs/gdbstub.c |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/stubs/gdbstub.c b/stubs/gdbstub.c
index c1dbfe7..f6a4553 100644
--- a/stubs/gdbstub.c
+++ b/stubs/gdbstub.c
@@ -1,4 +1,6 @@
-#include "qemu-common.h"
+#include "stdbool.h"            /* bool (in exec/gdbstub.h) */
+#include "stddef.h"             /* NULL */
+#include "exec/gdbstub.h"       /* xml_builtin */
 
 const char *const xml_builtin[][2] = {
   { NULL, NULL }
-- 
1.7.10.4


