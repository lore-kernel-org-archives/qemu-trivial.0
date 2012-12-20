Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TloJm-0003Xw-2U
	for mharc-qemu-trivial@gnu.org; Thu, 20 Dec 2012 17:10:18 -0500
Received: from eggs.gnu.org ([208.118.235.92]:43093)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1TloJg-0003IZ-Rk
	for qemu-trivial@nongnu.org; Thu, 20 Dec 2012 17:10:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1TloJa-0007wK-3k
	for qemu-trivial@nongnu.org; Thu, 20 Dec 2012 17:10:12 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:45321)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1TloJR-0007kO-RL; Thu, 20 Dec 2012 17:09:57 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	309D17280049; Thu, 20 Dec 2012 23:09:56 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id kIa7Dn3pOJ2k; Thu, 20 Dec 2012 23:09:55 +0100 (CET)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id B94FD728004A; Thu, 20 Dec 2012 23:09:55 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial@nongnu.org, Anthony Liguori <aliguori@us.ibm.com>,
	Stefan Hajnoczi <stefanha@redhat.com>
Date: Thu, 20 Dec 2012 23:09:53 +0100
Message-Id: <1356041393-13853-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 78.47.199.172
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
	Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH] net: Add missing include statement (fix
	compiler warnings for MinGW)
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
X-List-Received-Date: Thu, 20 Dec 2012 22:10:16 -0000

These and some more compiler warnings were caused by a recent commit:

net/tap-win32.c:724: warning: no previous prototype for =E2=80=98tap_has_=
ufo=E2=80=99
net/tap-win32.c:729: warning: no previous prototype for =E2=80=98tap_has_=
vnet_hdr=E2=80=99
...

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 net/tap-win32.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/net/tap-win32.c b/net/tap-win32.c
index 0c63cbd..265369c 100644
--- a/net/tap-win32.c
+++ b/net/tap-win32.c
@@ -31,6 +31,7 @@
 #include "qemu-common.h"
 #include "clients.h"            /* net_init_tap */
 #include "net/net.h"
+#include "net/tap.h"            /* tap_has_ufo, ... */
 #include "sysemu/sysemu.h"
 #include "qemu/error-report.h"
 #include <stdio.h>
--=20
1.7.10.4


