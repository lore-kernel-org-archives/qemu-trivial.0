Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dc8O4-0004zf-6U
	for mharc-qemu-trivial@gnu.org; Mon, 31 Jul 2017 06:57:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60724)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dc8Nz-0004tr-9s
	for qemu-trivial@nongnu.org; Mon, 31 Jul 2017 06:57:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dc8Ny-0004nd-Jy
	for qemu-trivial@nongnu.org; Mon, 31 Jul 2017 06:57:19 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:53617)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dc8Nt-0004hl-Bs; Mon, 31 Jul 2017 06:57:13 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 3B86142AC5;
	Mon, 31 Jul 2017 13:57:09 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 1E9A7B8B;
	Mon, 31 Jul 2017 13:21:46 +0300 (MSK)
Received: (nullmailer pid 5587 invoked by uid 1000);
	Mon, 31 Jul 2017 10:21:45 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Date: Mon, 31 Jul 2017 13:21:43 +0300
Message-Id: <f31fd5cfd7cc4291ec5dd7d31bdce72cea69144f.1501496350.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1501496349.git.mjt@msgid.tls.msk.ru>
References: <cover.1501496349.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1501496349.git.mjt@msgid.tls.msk.ru>
References: <cover.1501496349.git.mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 24/25] docs: fix broken paths to
 docs/config/ich9-ehci-uhci.cfg
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
X-List-Received-Date: Mon, 31 Jul 2017 10:57:20 -0000

From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

With the move of some docs/ to docs/devel/ on ac06724a71,
a reference path was not updated.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 docs/usb2.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/usb2.txt b/docs/usb2.txt
index b9e7548073..09df45b5b1 100644
--- a/docs/usb2.txt
+++ b/docs/usb2.txt
@@ -50,7 +50,7 @@ companion controllers with two ports each.
 There is a config file in docs which will do all this for you, just
 try ...
=20
-    qemu -readconfig docs/ich9-ehci-uhci.cfg
+    qemu -readconfig docs/config/ich9-ehci-uhci.cfg
=20
 ... then use "bus=3Dehci.0" to assign your usb devices to that bus.
=20
--=20
2.11.0


