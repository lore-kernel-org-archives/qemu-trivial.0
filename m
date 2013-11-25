Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Vl22K-0008D6-Lr
	for mharc-qemu-trivial@gnu.org; Mon, 25 Nov 2013 14:41:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33980)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Vl22E-00082E-Af
	for qemu-trivial@nongnu.org; Mon, 25 Nov 2013 14:41:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Vl229-00064y-OW
	for qemu-trivial@nongnu.org; Mon, 25 Nov 2013 14:41:30 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:33009)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Vl21z-0005y7-5g; Mon, 25 Nov 2013 14:41:15 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id A2F8C43358;
	Mon, 25 Nov 2013 23:41:07 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 8E8B4207;
	Mon, 25 Nov 2013 23:41:07 +0400 (MSK)
Received: (nullmailer pid 13234 invoked by uid 1000);
	Mon, 25 Nov 2013 19:41:07 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: Anthony Liguori <aliguori@amazon.com>
Date: Mon, 25 Nov 2013 23:41:04 +0400
Message-Id: <1385408466-13183-2-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1385408466-13183-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1385408466-13183-1-git-send-email-mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 1/3] qobject: Fix compiler warning (missing
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
X-List-Received-Date: Mon, 25 Nov 2013 19:41:35 -0000

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


