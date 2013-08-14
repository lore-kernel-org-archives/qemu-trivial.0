Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V9Xgi-0003zj-M7
	for mharc-qemu-trivial@gnu.org; Wed, 14 Aug 2013 05:48:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52291)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hpoussin@reactos.org>) id 1V9Xgc-0003r4-7k
	for qemu-trivial@nongnu.org; Wed, 14 Aug 2013 05:48:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <hpoussin@reactos.org>) id 1V9XgV-0000AX-NP
	for qemu-trivial@nongnu.org; Wed, 14 Aug 2013 05:48:14 -0400
Received: from smtp1-g21.free.fr ([2a01:e0c:1:1599::10]:34995)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hpoussin@reactos.org>)
	id 1V9XgK-000075-2w; Wed, 14 Aug 2013 05:47:56 -0400
Received: from localhost.localdomain (unknown [82.227.227.196])
	by smtp1-g21.free.fr (Postfix) with ESMTP id 4B7C494016F;
	Wed, 14 Aug 2013 11:47:49 +0200 (CEST)
From: =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>
To: qemu-devel@nongnu.org
Date: Wed, 14 Aug 2013 11:49:04 +0200
Message-Id: <1376473744-18435-1-git-send-email-hpoussin@reactos.org>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a01:e0c:1:1599::10
Cc: qemu-trivial@nongnu.org,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
	aliguori@us.ibm.com, av1474@comtv.ru
Subject: [Qemu-trivial] [PATCH for-1.6] adlib: sort offsets in portio
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
X-List-Received-Date: Wed, 14 Aug 2013 09:48:20 -0000

This fixes the following assert when -device adlib is used:
ioport.c:240: portio_list_add: Assertion `pio->offset >=3D off_last' fail=
ed.

Signed-off-by: Herv=C3=A9 Poussineau <hpoussin@reactos.org>
---
 hw/audio/adlib.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/audio/adlib.c b/hw/audio/adlib.c
index 0421d47..db4a953 100644
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


