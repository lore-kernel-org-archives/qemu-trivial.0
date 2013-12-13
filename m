Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VrYkU-0006NZ-Cd
	for mharc-qemu-trivial@gnu.org; Fri, 13 Dec 2013 14:50:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59091)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VrYkR-0006EG-13
	for qemu-trivial@nongnu.org; Fri, 13 Dec 2013 14:50:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VrYkP-0006jb-R9
	for qemu-trivial@nongnu.org; Fri, 13 Dec 2013 14:50:06 -0500
Received: from qemu.weilnetz.de ([2a03:4000:2:362::1]:33430
	helo=v2201305906712890.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VrYkM-0006Vs-Dk; Fri, 13 Dec 2013 14:50:02 -0500
Received: by v2201305906712890.yourvserver.net (Postfix, from userid 1000)
	id 955D71802AB; Fri, 13 Dec 2013 20:49:58 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel <qemu-devel@nongnu.org>
Date: Fri, 13 Dec 2013 20:49:58 +0100
Message-Id: <1386964198-10981-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a03:4000:2:362::1
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <andreas.faerber@web.de>,
	Anthony Liguori <aliguori@amazon.com>
Subject: [Qemu-trivial] [PATCH] cocoa: Fix typo (aditional -> additional)
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
X-List-Received-Date: Fri, 13 Dec 2013 19:50:08 -0000

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 ui/cocoa.m |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index be49179..6569326 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -204,7 +204,7 @@ int keymap[] =
     200,//  126     0x7E    0xc8    E0,48   U ARROW QZ_UP
 /* completed according to http://www.libsdl.org/cgi/cvsweb.cgi/SDL12/src/video/quartz/SDL_QuartzKeys.h?rev=1.6&content-type=text/x-cvsweb-markup */
 
-/* Aditional 104 Key XP-Keyboard Scancodes from http://www.computer-engineering.org/ps2keyboard/scancodes1.html */
+/* Additional 104 Key XP-Keyboard Scancodes from http://www.computer-engineering.org/ps2keyboard/scancodes1.html */
 /*
     219 //          0xdb            e0,5b   L GUI
     220 //          0xdc            e0,5c   R GUI
-- 
1.7.9.5


