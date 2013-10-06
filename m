Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VSky0-00075S-IO
	for mharc-qemu-trivial@gnu.org; Sun, 06 Oct 2013 05:49:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49775)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VSkxv-0006uG-Gt
	for qemu-trivial@nongnu.org; Sun, 06 Oct 2013 05:49:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VSkxr-0006Ux-IU
	for qemu-trivial@nongnu.org; Sun, 06 Oct 2013 05:49:31 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:59902)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VSkxa-0006PY-70; Sun, 06 Oct 2013 05:49:10 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 3D21540CAE;
	Sun,  6 Oct 2013 13:49:09 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 6622852C;
	Sun,  6 Oct 2013 13:33:04 +0400 (MSK)
Received: (nullmailer pid 25820 invoked by uid 1000);
	Sun, 06 Oct 2013 09:33:02 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: aliguori@us.ibm.com
Date: Sun,  6 Oct 2013 13:32:55 +0400
Message-Id: <1381051979-25742-11-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1381051979-25742-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1381051979-25742-1-git-send-email-mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org,
	qemu-stable <qemu-stable@nongnu.org>
Subject: [Qemu-trivial] [PULL 10/14] qemu-char: Fix potential out of bounds
	access to local arrays
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
X-List-Received-Date: Sun, 06 Oct 2013 09:49:35 -0000

From: Stefan Weil <sw@weilnetz.de>

Latest gcc-4.8 supports a new option -fsanitize=3Daddress which activates
an AddressSanitizer. This AddressSanitizer stops the QEMU system emulatio=
n
very early because two character arrays of size 8 are potentially written
with 9 bytes.

Commit 6ea314d91439741e95772dfbab98b4135e04bebb added the code.

There is no obvious reason why width or height could need 8 characters,
so reduce it to 7 characters which together with the terminating '\0'
fit into the arrays.

Cc: qemu-stable <qemu-stable@nongnu.org>
Signed-off-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: Alex Benn=C3=A9e <alex@bennee.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qemu-char.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/qemu-char.c b/qemu-char.c
index f7f5464..6d393e6 100644
--- a/qemu-char.c
+++ b/qemu-char.c
@@ -2989,11 +2989,11 @@ QemuOpts *qemu_chr_parse_compat(const char *label=
, const char *filename)
     if (strstart(filename, "vc", &p)) {
         qemu_opt_set(opts, "backend", "vc");
         if (*p =3D=3D ':') {
-            if (sscanf(p+1, "%8[0-9]x%8[0-9]", width, height) =3D=3D 2) =
{
+            if (sscanf(p+1, "%7[0-9]x%7[0-9]", width, height) =3D=3D 2) =
{
                 /* pixels */
                 qemu_opt_set(opts, "width", width);
                 qemu_opt_set(opts, "height", height);
-            } else if (sscanf(p+1, "%8[0-9]Cx%8[0-9]C", width, height) =3D=
=3D 2) {
+            } else if (sscanf(p+1, "%7[0-9]Cx%7[0-9]C", width, height) =3D=
=3D 2) {
                 /* chars */
                 qemu_opt_set(opts, "cols", width);
                 qemu_opt_set(opts, "rows", height);
--=20
1.7.10.4


