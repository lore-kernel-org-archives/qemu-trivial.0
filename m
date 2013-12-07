Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VpDVx-0000ar-Dg
	for mharc-qemu-trivial@gnu.org; Sat, 07 Dec 2013 03:45:29 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51429)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VpDVv-0000Yj-Ks
	for qemu-trivial@nongnu.org; Sat, 07 Dec 2013 03:45:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VpDVu-0005OQ-R1
	for qemu-trivial@nongnu.org; Sat, 07 Dec 2013 03:45:27 -0500
Received: from qemu.weilnetz.de ([2a03:4000:2:362::1]:52893
	helo=v2201305906712890.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VpDVs-0005No-1k; Sat, 07 Dec 2013 03:45:24 -0500
Received: by v2201305906712890.yourvserver.net (Postfix, from userid 1000)
	id A127C1802AD; Sat,  7 Dec 2013 09:45:21 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel <qemu-devel@nongnu.org>
Date: Sat,  7 Dec 2013 09:45:21 +0100
Message-Id: <1386405921-18219-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a03:4000:2:362::1
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <andreas.faerber@web.de>,
	Anthony Liguori <aliguori@amazon.com>
Subject: [Qemu-trivial] [PATCH] ui/cocoa: Use macro ARRAY_SIZE were possible
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
X-List-Received-Date: Sat, 07 Dec 2013 08:45:28 -0000

This improves readability and simplifies the code.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---

Please note that I could not test this patch.

Regards, Stefan

 ui/cocoa.m |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index be49179..2524f18 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -240,9 +240,8 @@ int keymap[] =
 
 static int cocoa_keycode_to_qemu(int keycode)
 {
-    if((sizeof(keymap)/sizeof(int)) <= keycode)
-    {
-        printf("(cocoa) warning unknow keycode 0x%x\n", keycode);
+    if (ARRAY_SIZE(keymap) <= keycode) {
+        printf("(cocoa) warning unknown keycode 0x%x\n", keycode);
         return 0;
     }
     return keymap[keycode];
-- 
1.7.10.4


