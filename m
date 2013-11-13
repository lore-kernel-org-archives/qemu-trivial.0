Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Vga4r-0000Uw-Uh
	for mharc-qemu-trivial@gnu.org; Wed, 13 Nov 2013 08:01:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54005)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Vga4k-0000GZ-FF
	for qemu-trivial@nongnu.org; Wed, 13 Nov 2013 08:01:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Vga4f-0006wb-K3
	for qemu-trivial@nongnu.org; Wed, 13 Nov 2013 08:01:42 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:60081)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Vga4U-0006rM-GH; Wed, 13 Nov 2013 08:01:26 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 033F141757;
	Wed, 13 Nov 2013 17:01:25 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id D3CD5525;
	Wed, 13 Nov 2013 17:01:24 +0400 (MSK)
Received: (nullmailer pid 16053 invoked by uid 1000);
	Wed, 13 Nov 2013 13:01:24 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: Anthony Liguori <aliguori@amazon.com>
Date: Wed, 13 Nov 2013 17:01:14 +0400
Message-Id: <1384347680-15976-11-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1384347680-15976-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1384347680-15976-1-git-send-email-mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 10/16] qga: Fix compilation for old versions
	of MinGW
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
X-List-Received-Date: Wed, 13 Nov 2013 13:01:47 -0000

From: Stefan Weil <sw@weilnetz.de>

While MinGW-w64 can compile the qga code, MinGW from Debian lenny
(gcc-mingw32 4.4.2-3) shows these errors:

In file included from qga/vss-win32.c:17:
qga/vss-win32/requester.h:31:
 error: expected =C2=BB=3D=C2=AB, =C2=BB,=C2=AB, =C2=BB;=C2=AB, =C2=BBasm=
=C2=AB or =C2=BB__attribute__=C2=AB before =C2=BBrequester_init=C2=AB
qga/vss-win32/requester.h:32:
 error: expected =C2=BB=3D=C2=AB, =C2=BB,=C2=AB, =C2=BB;=C2=AB, =C2=BBasm=
=C2=AB or =C2=BB__attribute__=C2=AB before =C2=BBrequester_deinit=C2=AB

The macro STDAPI is unknown, so add the missing include file which
defines it.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qga/vss-win32/requester.h |    1 +
 1 file changed, 1 insertion(+)

diff --git a/qga/vss-win32/requester.h b/qga/vss-win32/requester.h
index cffec01..374f9b8 100644
--- a/qga/vss-win32/requester.h
+++ b/qga/vss-win32/requester.h
@@ -13,6 +13,7 @@
 #ifndef VSS_WIN32_REQUESTER_H
 #define VSS_WIN32_REQUESTER_H
=20
+#include <basetyps.h>           /* STDAPI */
 #include "qemu/compiler.h"
=20
 #ifdef __cplusplus
--=20
1.7.10.4


