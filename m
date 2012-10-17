Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TOXok-0006tC-MM
	for mharc-qemu-trivial@gnu.org; Wed, 17 Oct 2012 13:54:06 -0400
Received: from eggs.gnu.org ([208.118.235.92]:60625)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1TOXoh-0006im-Cu
	for qemu-trivial@nongnu.org; Wed, 17 Oct 2012 13:54:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1TOXoc-0006BF-FQ
	for qemu-trivial@nongnu.org; Wed, 17 Oct 2012 13:54:03 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:37872)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1TOXoX-0006AJ-Ce; Wed, 17 Oct 2012 13:53:53 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	52214728003B; Wed, 17 Oct 2012 19:53:51 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id CfVZzUFm8l-4; Wed, 17 Oct 2012 19:53:50 +0200 (CEST)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id D74507280041; Wed, 17 Oct 2012 19:53:50 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: Anthony Liguori <aliguori@us.ibm.com>, Stefan Hajnoczi <stefanha@gmail.com>
Date: Wed, 17 Oct 2012 19:53:50 +0200
Message-Id: <1350496430-14429-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH] net/tap-win32: Fix compiler warning caused
	by missing include statement
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
X-List-Received-Date: Wed, 17 Oct 2012 17:54:04 -0000

The include file for net_init_tap was missing:

net/tap-win32.c:703:
 warning: no previous prototype for =E2=80=98net_init_tap=E2=80=99

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 net/tap-win32.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/net/tap-win32.c b/net/tap-win32.c
index f1801e2..22dad3f 100644
--- a/net/tap-win32.c
+++ b/net/tap-win32.c
@@ -29,6 +29,7 @@
 #include "tap.h"
=20
 #include "qemu-common.h"
+#include "clients.h"            /* net_init_tap */
 #include "net.h"
 #include "sysemu.h"
 #include "qemu-error.h"
--=20
1.7.10.4


