Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dHYIi-000281-SZ
	for mharc-qemu-trivial@gnu.org; Sun, 04 Jun 2017 12:22:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39366)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dHYIc-00022q-Ij
	for qemu-trivial@nongnu.org; Sun, 04 Jun 2017 12:22:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dHYIb-0004WP-PQ
	for qemu-trivial@nongnu.org; Sun, 04 Jun 2017 12:22:42 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:42225)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dHYIW-0004OA-DT; Sun, 04 Jun 2017 12:22:36 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 4FEA3404E4;
	Sun,  4 Jun 2017 19:22:33 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id E36BE5E8;
	Sun,  4 Jun 2017 18:45:28 +0300 (MSK)
Received: (nullmailer pid 16366 invoked by uid 1000);
	Sun, 04 Jun 2017 15:45:27 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Kamil Rytarowski <n54@gmx.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Sun,  4 Jun 2017 18:45:10 +0300
Message-Id: <271f37abb510607ca7650e40951284692a67579a.1496591095.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1496591095.git.mjt@msgid.tls.msk.ru>
References: <cover.1496591095.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1496591095.git.mjt@msgid.tls.msk.ru>
References: <cover.1496591095.git.mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 06/22] configure: Detect native NetBSD
 curses(3)
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sun, 04 Jun 2017 16:22:43 -0000

From: Kamil Rytarowski <n54@gmx.com>

NetBSD ships with traditional BSD curses with compatibility with ncurses.
qemu works nicely with the basesystem version of curses(3) from NetBSD.

The only mismatch between curses(3) and ncurses is the lack of
curses_version() in the NetBSD version. This function is used solely in
the configure script, therefore eliminate it from the curses(3) detection=
.

With this change applied, configure detects correctly curses frontend.

Signed-off-by: Kamil Rytarowski <n54@gmx.com>
Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 configure | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/configure b/configure
index 21944eaa05..fbb6a93c99 100755
--- a/configure
+++ b/configure
@@ -3042,14 +3042,13 @@ if test "$curses" !=3D "no" ; then
 #include <curses.h>
 #include <wchar.h>
 int main(void) {
-  const char *s =3D curses_version();
   wchar_t wch =3D L'w';
   setlocale(LC_ALL, "");
   resize_term(0, 0);
   addwstr(L"wide chars\n");
   addnwstr(&wch, 1);
   add_wch(WACS_DEGREE);
-  return s !=3D 0;
+  return 0;
 }
 EOF
   IFS=3D:
--=20
2.11.0


