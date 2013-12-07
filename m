Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VpIFR-0008Lu-3D
	for mharc-qemu-trivial@gnu.org; Sat, 07 Dec 2013 08:48:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32861)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VpIFO-0008Hz-Aj
	for qemu-trivial@nongnu.org; Sat, 07 Dec 2013 08:48:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VpIFN-0001Rn-H8
	for qemu-trivial@nongnu.org; Sat, 07 Dec 2013 08:48:42 -0500
Received: from qemu.weilnetz.de ([2a03:4000:2:362::1]:53202
	helo=v2201305906712890.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VpIFL-0001RS-K1; Sat, 07 Dec 2013 08:48:39 -0500
Received: by v2201305906712890.yourvserver.net (Postfix, from userid 1000)
	id 22974180284; Sat,  7 Dec 2013 14:48:37 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel <qemu-devel@nongnu.org>
Date: Sat,  7 Dec 2013 14:48:05 +0100
Message-Id: <1386424088-23196-3-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1386424088-23196-1-git-send-email-sw@weilnetz.de>
References: <1386424088-23196-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a03:4000:2:362::1
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <andreas.faerber@web.de>,
	Anthony Liguori <aliguori@amazon.com>
Subject: [Qemu-trivial] =?utf-8?q?=5BPATCH_v2_2/5=5D_ui/cocoa=3A_Use_macro?=
	=?utf-8?q?_ARRAY=5FSIZE_where_possible?=
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
X-List-Received-Date: Sat, 07 Dec 2013 13:48:43 -0000

This improves readability and simplifies the code.

Cc: Andreas F=C3=A4rber <andreas.faerber@web.de>
Cc: Anthony Liguori <aliguori@amazon.com>
Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 ui/cocoa.m |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index be49179..2524f18 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -240,9 +240,8 @@ int keymap[] =3D
=20
 static int cocoa_keycode_to_qemu(int keycode)
 {
-    if((sizeof(keymap)/sizeof(int)) <=3D keycode)
-    {
-        printf("(cocoa) warning unknow keycode 0x%x\n", keycode);
+    if (ARRAY_SIZE(keymap) <=3D keycode) {
+        printf("(cocoa) warning unknown keycode 0x%x\n", keycode);
         return 0;
     }
     return keymap[keycode];
--=20
1.7.10.4


