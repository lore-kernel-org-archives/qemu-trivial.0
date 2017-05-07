Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d7GUk-0004OG-PL
	for mharc-qemu-trivial@gnu.org; Sun, 07 May 2017 03:20:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56065)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1d7GUh-0004KK-9G
	for qemu-trivial@nongnu.org; Sun, 07 May 2017 03:20:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1d7GUg-00036Z-Et
	for qemu-trivial@nongnu.org; Sun, 07 May 2017 03:20:39 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:39367)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1d7GUc-00034f-2h; Sun, 07 May 2017 03:20:34 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id D7C8C4047F;
	Sun,  7 May 2017 10:20:32 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 353A5433;
	Sun,  7 May 2017 10:02:30 +0300 (MSK)
Received: (nullmailer pid 26552 invoked by uid 1000);
	Sun, 07 May 2017 07:02:29 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Date: Sun,  7 May 2017 10:02:10 +0300
Message-Id: <21a9ad2f159e4cafd090cc2b47ce322e024c7363.1494140528.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1494140527.git.mjt@msgid.tls.msk.ru>
References: <cover.1494140527.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1494140527.git.mjt@msgid.tls.msk.ru>
References: <cover.1494140527.git.mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 07/23] device_tree: fix compiler warnings
 (clang 5)
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
X-List-Received-Date: Sun, 07 May 2017 07:20:40 -0000

From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

static code analyzer complain:

device_tree.c:155:18: warning: Null pointer passed as an argument to a 'n=
onnull' parameter
    while ((de =3D readdir(d)) !=3D NULL) {
                 ^~~~~~~~~~

Reported-by: Clang Static Analyzer
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 device_tree.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/device_tree.c b/device_tree.c
index 6e06320830..a24ddff02b 100644
--- a/device_tree.c
+++ b/device_tree.c
@@ -148,6 +148,7 @@ static void read_fstree(void *fdt, const char *dirnam=
e)
     d =3D opendir(dirname);
     if (!d) {
         error_setg(&error_fatal, "%s cannot open %s", __func__, dirname)=
;
+        return;
     }
=20
     while ((de =3D readdir(d)) !=3D NULL) {
--=20
2.11.0


