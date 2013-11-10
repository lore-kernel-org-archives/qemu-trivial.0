Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VfZ8j-0002mJ-Gl
	for mharc-qemu-trivial@gnu.org; Sun, 10 Nov 2013 12:49:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36043)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VfZ8c-0002eY-Rl
	for qemu-trivial@nongnu.org; Sun, 10 Nov 2013 12:49:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VfZ8X-0001kO-Rl
	for qemu-trivial@nongnu.org; Sun, 10 Nov 2013 12:49:30 -0500
Received: from qemu.weilnetz.de ([37.221.198.45]:33946
	helo=v2201305906712890.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VfZ8N-0001aL-Tu; Sun, 10 Nov 2013 12:49:16 -0500
Received: by v2201305906712890.yourvserver.net (Postfix, from userid 1000)
	id AED0B18916F; Sun, 10 Nov 2013 18:49:12 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel <qemu-devel@nongnu.org>
Date: Sun, 10 Nov 2013 18:49:11 +0100
Message-Id: <1384105751-12815-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.198.45
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Anthony Liguori <aliguori@amazon.com>
Subject: [Qemu-trivial] [PATCH for 1.7] qga: Fix compilation for old
	versions of MinGW
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
X-List-Received-Date: Sun, 10 Nov 2013 17:49:36 -0000

While MinGW-w64 can compile the qga code, MinGW from Ubuntu lenny
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
---

This patch also fixes the same error on the MinGW buildbot.
I did not notice it earlier because I usually compile with MinGW-w64.

Regards,
Stefan

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


