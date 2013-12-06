Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Vp19D-0003V8-JF
	for mharc-qemu-trivial@gnu.org; Fri, 06 Dec 2013 14:33:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53485)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Vp195-0002qH-Oi
	for qemu-trivial@nongnu.org; Fri, 06 Dec 2013 14:33:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Vp191-0002t9-Ag
	for qemu-trivial@nongnu.org; Fri, 06 Dec 2013 14:33:03 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:43834)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Vp18q-0002qR-EM; Fri, 06 Dec 2013 14:32:48 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 55DEA40DD3;
	Fri,  6 Dec 2013 23:32:47 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id CF9BB5E0;
	Fri,  6 Dec 2013 23:15:44 +0400 (MSK)
Received: (nullmailer pid 19222 invoked by uid 1000);
	Fri, 06 Dec 2013 19:15:43 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: aliguori@amazon.com
Date: Fri,  6 Dec 2013 23:15:34 +0400
Message-Id: <1386357341-19147-8-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1386357341-19147-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1386357341-19147-1-git-send-email-mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 07/14] qobject: Fix compiler warning (missing
	gnu_printf format attribute)
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
X-List-Received-Date: Fri, 06 Dec 2013 19:33:08 -0000

From: Stefan Weil <sw@weilnetz.de>

gcc 4.8.2 reports this warning when extra warnings are enabled (-Wextra):

  CC    qobject/qerror.o
qobject/qerror.c: In function =E2=80=98qerror_from_info=E2=80=99:
qobject/qerror.c:53:5: error:
 function might be possible candidate for =E2=80=98gnu_printf=E2=80=99 fo=
rmat attribute [-Werror=3Dsuggest-attribute=3Dformat]
     qerr->err_msg =3D g_strdup_vprintf(fmt, *va);
     ^

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
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


