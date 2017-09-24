Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dwEMi-0008VH-D7
	for mharc-qemu-trivial@gnu.org; Sun, 24 Sep 2017 17:23:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43306)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dwEMf-0008QV-QS
	for qemu-trivial@nongnu.org; Sun, 24 Sep 2017 17:23:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dwEMe-0004Ax-Qi
	for qemu-trivial@nongnu.org; Sun, 24 Sep 2017 17:23:01 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:50031)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dwEMZ-000477-G6; Sun, 24 Sep 2017 17:22:55 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 1BDCC41C96;
	Mon, 25 Sep 2017 00:22:54 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 6452AB6E;
	Mon, 25 Sep 2017 00:22:53 +0300 (MSK)
Received: (nullmailer pid 28241 invoked by uid 1000);
	Sun, 24 Sep 2017 21:22:52 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Stefan Weil <sw@weilnetz.de>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Mon, 25 Sep 2017 00:22:19 +0300
Message-Id: <94219606725f67b0888061c39465abc74a394b00.1506288070.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1506288070.git.mjt@msgid.tls.msk.ru>
References: <cover.1506288070.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1506288070.git.mjt@msgid.tls.msk.ru>
References: <cover.1506288070.git.mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 01/31] configure: Remove unused code (found by
 shellcheck)
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
X-List-Received-Date: Sun, 24 Sep 2017 21:23:02 -0000

From: Stefan Weil <sw@weilnetz.de>

smartcard_cflags is no longer needed since commit
0b22ef0f57a8910d849602bef0940edcd0553d2c.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 configure | 1 -
 1 file changed, 1 deletion(-)

diff --git a/configure b/configure
index 133a5757ef..12d4e4ebfa 100755
--- a/configure
+++ b/configure
@@ -4229,7 +4229,6 @@ EOF
 fi
=20
 # check for smartcard support
-smartcard_cflags=3D""
 if test "$smartcard" !=3D "no"; then
     if $pkg_config libcacard; then
         libcacard_cflags=3D$($pkg_config --cflags libcacard)
--=20
2.11.0


