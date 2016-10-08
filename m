Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bsogh-0003cL-Sq
	for mharc-qemu-trivial@gnu.org; Sat, 08 Oct 2016 06:17:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57036)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bsoge-0003Z1-BR
	for qemu-trivial@nongnu.org; Sat, 08 Oct 2016 06:17:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bsogd-0000FF-Bp
	for qemu-trivial@nongnu.org; Sat, 08 Oct 2016 06:17:00 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:58907)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bsogY-00008u-Jz; Sat, 08 Oct 2016 06:16:54 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 3B5D840EE2;
	Sat,  8 Oct 2016 13:16:50 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 1DCB8B2C;
	Sat,  8 Oct 2016 11:58:15 +0300 (MSK)
Received: (nullmailer pid 19223 invoked by uid 1000);
	Sat, 08 Oct 2016 08:58:13 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Sat,  8 Oct 2016 11:57:47 +0300
Message-Id: <e69f7d2510ab93ed4828ed69452f9c7c84f3f33a.1475917008.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1475917008.git.mjt@msgid.tls.msk.ru>
References: <cover.1475917008.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1475917008.git.mjt@msgid.tls.msk.ru>
References: <cover.1475917008.git.mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 01/26] qemu-options.hx: fix -chardev ringbuf
 typos
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
X-List-Received-Date: Sat, 08 Oct 2016 10:17:01 -0000

From: Stefan Hajnoczi <stefanha@redhat.com>

Clean up the documentation for -chardev ringbuf.  There is a stray
closing parenthesis and the comma is unnecessary.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qemu-options.hx | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index 01f01df..b1fbdb0 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -2374,7 +2374,7 @@ console with the given dimensions.
 @item -chardev ringbuf ,id=3D@var{id} [,size=3D@var{size}]
=20
 Create a ring buffer with fixed size @option{size}.
-@var{size} must be a power of two, and defaults to @code{64K}).
+@var{size} must be a power of two and defaults to @code{64K}.
=20
 @item -chardev file ,id=3D@var{id} ,path=3D@var{path}
=20
--=20
2.1.4


