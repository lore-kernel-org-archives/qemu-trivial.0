Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Vi6ef-0006E6-Cu
	for mharc-qemu-trivial@gnu.org; Sun, 17 Nov 2013 13:01:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55080)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1Vi6eZ-00065b-JM
	for qemu-trivial@nongnu.org; Sun, 17 Nov 2013 13:01:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1Vi6eV-0001zp-1J
	for qemu-trivial@nongnu.org; Sun, 17 Nov 2013 13:00:59 -0500
Received: from qemu.weilnetz.de ([37.221.198.45]:43944
	helo=v2201305906712890.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1Vi6eL-0001yj-Ia; Sun, 17 Nov 2013 13:00:45 -0500
Received: by v2201305906712890.yourvserver.net (Postfix, from userid 1000)
	id 4CA99180136; Sun, 17 Nov 2013 19:00:43 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: Anthony Liguori <aliguori@amazon.com>
Date: Sun, 17 Nov 2013 19:00:42 +0100
Message-Id: <1384711242-8978-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.198.45
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	qemu-devel <qemu-devel@nongnu.org>
Subject: [Qemu-trivial] [PATCH for 1.7] qobject: Fix compiler warning
	(missing gnu_printf format attribute)
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
X-List-Received-Date: Sun, 17 Nov 2013 18:01:04 -0000

gcc 4.8.2 reports this warning when extra warnings are enabled (-Wextra):

  CC    qobject/qerror.o
qobject/qerror.c: In function =E2=80=98qerror_from_info=E2=80=99:
qobject/qerror.c:53:5: error:
 function might be possible candidate for =E2=80=98gnu_printf=E2=80=99 fo=
rmat attribute [-Werror=3Dsuggest-attribute=3Dformat]
     qerr->err_msg =3D g_strdup_vprintf(fmt, *va);
     ^

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---

Note: checkpatch.pl wrongly reports an error.

 qobject/qerror.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/qobject/qerror.c b/qobject/qerror.c
index 3aee1cf..fc8331a 100644
--- a/qobject/qerror.c
+++ b/qobject/qerror.c
@@ -42,8 +42,8 @@ static QError *qerror_new(void)
  *
  * Return strong reference.
  */
-static QError *qerror_from_info(ErrorClass err_class, const char *fmt,
-                                va_list *va)
+static QError * GCC_FMT_ATTR(2, 0)
+qerror_from_info(ErrorClass err_class, const char *fmt, va_list *va)
 {
     QError *qerr;
=20
--=20
1.7.10.4


