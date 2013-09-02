Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VGSCV-0000Hc-2F
	for mharc-qemu-trivial@gnu.org; Mon, 02 Sep 2013 07:21:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48822)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VGSCO-0008WQ-GN
	for qemu-trivial@nongnu.org; Mon, 02 Sep 2013 07:21:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VGSCJ-0003GD-V2
	for qemu-trivial@nongnu.org; Mon, 02 Sep 2013 07:21:36 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:44580)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VGSCA-0003E2-U3; Mon, 02 Sep 2013 07:21:23 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 7E0B340241;
	Mon,  2 Sep 2013 15:21:21 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 21605215;
	Mon,  2 Sep 2013 15:01:58 +0400 (MSK)
Received: (nullmailer pid 14654 invoked by uid 1000);
	Mon, 02 Sep 2013 11:01:57 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: aliguori@us.ibm.com
Date: Mon,  2 Sep 2013 15:01:34 +0400
Message-Id: <1378119695-14568-15-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1378119695-14568-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1378119695-14568-1-git-send-email-mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
	qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 14/15] adlib: sort offsets in portio
	registration
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
X-List-Received-Date: Mon, 02 Sep 2013 11:21:41 -0000

From: Herv=C3=A9 Poussineau <hpoussin@reactos.org>

This fixes the following assert when -device adlib is used:
ioport.c:240: portio_list_add: Assertion `pio->offset >=3D off_last' fail=
ed.

Signed-off-by: Herv=C3=A9 Poussineau <hpoussin@reactos.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/audio/adlib.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/audio/adlib.c b/hw/audio/adlib.c
index 0c79247..bd8e9d9 100644
--- a/hw/audio/adlib.c
+++ b/hw/audio/adlib.c
@@ -284,9 +284,9 @@ static void Adlib_fini (AdlibState *s)
 }
=20
 static MemoryRegionPortio adlib_portio_list[] =3D {
-    { 0x388, 4, 1, .read =3D adlib_read, .write =3D adlib_write, },
     { 0, 4, 1, .read =3D adlib_read, .write =3D adlib_write, },
     { 0, 2, 1, .read =3D adlib_read, .write =3D adlib_write, },
+    { 0x388, 4, 1, .read =3D adlib_read, .write =3D adlib_write, },
     PORTIO_END_OF_LIST(),
 };
=20
--=20
1.7.10.4


