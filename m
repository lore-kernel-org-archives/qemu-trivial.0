Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VfWTL-0003tk-Tl
	for mharc-qemu-trivial@gnu.org; Sun, 10 Nov 2013 09:58:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41100)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VfWTF-0003kx-VN
	for qemu-trivial@nongnu.org; Sun, 10 Nov 2013 09:58:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VfWTB-0001hj-3A
	for qemu-trivial@nongnu.org; Sun, 10 Nov 2013 09:58:37 -0500
Received: from qemu.weilnetz.de ([37.221.198.45]:33716
	helo=v2201305906712890.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VfWT1-0001fI-17; Sun, 10 Nov 2013 09:58:23 -0500
Received: by v2201305906712890.yourvserver.net (Postfix, from userid 1000)
	id E4F4D1802B2; Sun, 10 Nov 2013 15:58:19 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel <qemu-devel@nongnu.org>
Date: Sun, 10 Nov 2013 15:58:19 +0100
Message-Id: <1384095499-12255-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.198.45
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Gerd Hoffmann <kraxel@redhat.com>, Anthony Liguori <aliguori@amazon.com>
Subject: [Qemu-trivial] [PATCH] console: Remove unused debug code
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
X-List-Received-Date: Sun, 10 Nov 2013 14:58:43 -0000

The local function console_print_text_attributes is no longer used since
commit 7d6ba01c3741bc32ae252bf64a5fd3f930c2df4f.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 ui/console.c |   33 ---------------------------------
 1 file changed, 33 deletions(-)

diff --git a/ui/console.c b/ui/console.c
index 11d5e6a..61ed219 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -410,39 +410,6 @@ static const pixman_color_t color_table_rgb[2][8] = {
     }
 };
 
-#ifdef DEBUG_CONSOLE
-static void console_print_text_attributes(TextAttributes *t_attrib, char ch)
-{
-    if (t_attrib->bold) {
-        printf("b");
-    } else {
-        printf(" ");
-    }
-    if (t_attrib->uline) {
-        printf("u");
-    } else {
-        printf(" ");
-    }
-    if (t_attrib->blink) {
-        printf("l");
-    } else {
-        printf(" ");
-    }
-    if (t_attrib->invers) {
-        printf("i");
-    } else {
-        printf(" ");
-    }
-    if (t_attrib->unvisible) {
-        printf("n");
-    } else {
-        printf(" ");
-    }
-
-    printf(" fg: %d bg: %d ch:'%2X' '%c'\n", t_attrib->fgcol, t_attrib->bgcol, ch, ch);
-}
-#endif
-
 static void vga_putcharxy(QemuConsole *s, int x, int y, int ch,
                           TextAttributes *t_attrib)
 {
-- 
1.7.10.4


