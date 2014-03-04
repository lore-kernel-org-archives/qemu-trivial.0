Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WKimd-0001Vn-Pk
	for mharc-qemu-trivial@gnu.org; Tue, 04 Mar 2014 01:24:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60496)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WKimS-0001Dw-4i
	for qemu-trivial@nongnu.org; Tue, 04 Mar 2014 01:24:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WKimN-0004Be-PU
	for qemu-trivial@nongnu.org; Tue, 04 Mar 2014 01:24:44 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:36273)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WKimE-00048p-PF; Tue, 04 Mar 2014 01:24:30 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 328724084D;
	Tue,  4 Mar 2014 10:24:30 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 536D765F;
	Tue,  4 Mar 2014 10:16:04 +0400 (MSK)
Received: (nullmailer pid 16581 invoked by uid 1000);
	Tue, 04 Mar 2014 06:16:03 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue,  4 Mar 2014 10:15:54 +0400
Message-Id: <1393913761-16516-7-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1393913761-16516-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1393913761-16516-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 06/13] stubs: Optimize dependencies for
	gdbstub.c
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
X-List-Received-Date: Tue, 04 Mar 2014 06:24:50 -0000

From: Stefan Weil <sw@weilnetz.de>

It does not need qemu-common.h. Including exec/gdbstub.h fixes a warning
from static code analyzers and avoids mismatching declarations for
xml_builtin.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
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


