Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z6zic-0008G0-6a
	for mharc-qemu-trivial@gnu.org; Mon, 22 Jun 2015 07:16:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50803)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z6ziW-00085v-9V
	for qemu-trivial@nongnu.org; Mon, 22 Jun 2015 07:16:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z6ziV-0002uZ-3Y
	for qemu-trivial@nongnu.org; Mon, 22 Jun 2015 07:16:44 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:43359)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Z6ziQ-0002s3-Gu; Mon, 22 Jun 2015 07:16:38 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id CB52040C2D;
	Mon, 22 Jun 2015 14:16:30 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id BF8A5A50;
	Mon, 22 Jun 2015 14:16:30 +0300 (MSK)
Received: (nullmailer pid 9239 invoked by uid 1000);
	Mon, 22 Jun 2015 11:16:30 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon, 22 Jun 2015 14:16:08 +0300
Message-Id: <bf9320806f21a7373816741b3dd1886b915a6c36.1434971627.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1434971627.git.mjt@msgid.tls.msk.ru>
References: <cover.1434971627.git.mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [Qemu-trivial] [PULL 01/21] configure: append --extra-ldflags to
	LDFLAGS
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
X-List-Received-Date: Mon, 22 Jun 2015 11:16:49 -0000

From: Alex Benn=C3=A9e <alex.bennee@linaro.org>

The help text says --extra-ldflags is appended to LDFLAGS so make it so.

Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 configure | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index 222694f..a5d8924 100755
--- a/configure
+++ b/configure
@@ -354,7 +354,7 @@ for opt do
   --extra-cflags=3D*) QEMU_CFLAGS=3D"$QEMU_CFLAGS $optarg"
                     EXTRA_CFLAGS=3D"$optarg"
   ;;
-  --extra-ldflags=3D*) LDFLAGS=3D"$optarg $LDFLAGS"
+  --extra-ldflags=3D*) LDFLAGS=3D"$LDFLAGS $optarg"
                      EXTRA_LDFLAGS=3D"$optarg"
   ;;
   --enable-debug-info) debug_info=3D"yes"
--=20
2.1.4


