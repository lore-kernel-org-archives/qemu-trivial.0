Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z090K-0005Ot-H1
	for mharc-qemu-trivial@gnu.org; Wed, 03 Jun 2015 09:46:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43900)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z090E-0005CG-N6
	for qemu-trivial@nongnu.org; Wed, 03 Jun 2015 09:46:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z090D-0000ug-T9
	for qemu-trivial@nongnu.org; Wed, 03 Jun 2015 09:46:42 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:53089)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Z0906-0000pi-Av; Wed, 03 Jun 2015 09:46:34 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 4FC48407B5;
	Wed,  3 Jun 2015 16:46:33 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 6636EA57;
	Wed,  3 Jun 2015 16:08:53 +0300 (MSK)
Received: (nullmailer pid 27474 invoked by uid 1000);
	Wed, 03 Jun 2015 13:08:52 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Wed,  3 Jun 2015 16:08:50 +0300
Message-Id: <de3852877f1e452321352fdb7e678f079876a41b.1433336870.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1433336870.git.mjt@msgid.tls.msk.ru>
References: <cover.1433336870.git.mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [Qemu-trivial] [PULL 30/30] configure: postfix --extra-cflags to
	QEMU_CFLAGS
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
X-List-Received-Date: Wed, 03 Jun 2015 13:46:47 -0000

From: Alex Benn=C3=A9e <alex.bennee@linaro.org>

It makes sense that extra-cflags should be appended after the normal
CFLAGS so they don't get overridden by default behaviour. This way if
you specify something like:

  ./configure --extra-cflags=3D"-O0"

You will see the requested behaviour.

Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 configure | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index 4e2f78a..69190d2 100755
--- a/configure
+++ b/configure
@@ -353,7 +353,7 @@ for opt do
   ;;
   --cpu=3D*) cpu=3D"$optarg"
   ;;
-  --extra-cflags=3D*) QEMU_CFLAGS=3D"$optarg $QEMU_CFLAGS"
+  --extra-cflags=3D*) QEMU_CFLAGS=3D"$QEMU_CFLAGS $optarg"
                     EXTRA_CFLAGS=3D"$optarg"
   ;;
   --extra-ldflags=3D*) LDFLAGS=3D"$optarg $LDFLAGS"
--=20
2.1.4


