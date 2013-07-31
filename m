Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V4OXC-0007rn-05
	for mharc-qemu-trivial@gnu.org; Wed, 31 Jul 2013 01:01:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43522)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1V4OX4-0007j7-2Q
	for qemu-trivial@nongnu.org; Wed, 31 Jul 2013 01:01:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1V4OWz-0006GW-4d
	for qemu-trivial@nongnu.org; Wed, 31 Jul 2013 01:01:05 -0400
Received: from qemu.weilnetz.de ([37.221.198.45]:57376
	helo=v2201305906712890.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1V4OWp-0006C9-7f; Wed, 31 Jul 2013 01:00:51 -0400
Received: by v2201305906712890.yourvserver.net (Postfix, from userid 1000)
	id BBD7D17F93A; Wed, 31 Jul 2013 07:00:47 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial <qemu-trivial@nongnu.org>
Date: Wed, 31 Jul 2013 07:00:47 +0200
Message-Id: <1375246847-30624-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.198.45
Cc: Stefan Weil <sw@weilnetz.de>, Anthony Liguori <aliguori@us.ibm.com>,
	qemu-devel <qemu-devel@nongnu.org>
Subject: [Qemu-trivial] [PATCH for 1.6] hw/core: Fix wrong left shift (build
	regression)
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
X-List-Received-Date: Wed, 31 Jul 2013 05:01:12 -0000

Shifting a long int (32 bit) by 40 bit positions won't work.
Compiler message:

hw/core/qdev-properties.c: In function =E2=80=98print_size=E2=80=99:
hw/core/qdev-properties.c:1180:5: warning: left shift count >=3D width of=
 type

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 hw/core/qdev-properties.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
index 8d43a8d..e82ab87 100644
--- a/hw/core/qdev-properties.c
+++ b/hw/core/qdev-properties.c
@@ -1177,7 +1177,7 @@ static int print_size(DeviceState *dev, Property *p=
rop, char *dest, size_t len)
     int i =3D 0;
     uint64_t div;
=20
-    for (div =3D (long int)1 << 40; !(*ptr / div) ; div >>=3D 10) {
+    for (div =3D 1ULL << 40; !(*ptr / div); div >>=3D 10) {
         i++;
     }
     return snprintf(dest, len, "%0.03f%c", (double)*ptr/div, suffixes[i]=
);
--=20
1.7.10.4


