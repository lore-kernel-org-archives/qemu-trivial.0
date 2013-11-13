Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VgaE6-0002Bn-VO
	for mharc-qemu-trivial@gnu.org; Wed, 13 Nov 2013 08:11:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56244)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VgaDy-0001vS-La
	for qemu-trivial@nongnu.org; Wed, 13 Nov 2013 08:11:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VgaDu-0001n2-3c
	for qemu-trivial@nongnu.org; Wed, 13 Nov 2013 08:11:14 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:53341)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VgaDf-0001ju-Eg; Wed, 13 Nov 2013 08:10:55 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id EEBE64175A;
	Wed, 13 Nov 2013 17:10:52 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 0047452F;
	Wed, 13 Nov 2013 17:01:25 +0400 (MSK)
Received: (nullmailer pid 16055 invoked by uid 1000);
	Wed, 13 Nov 2013 13:01:24 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: Anthony Liguori <aliguori@amazon.com>
Date: Wed, 13 Nov 2013 17:01:15 +0400
Message-Id: <1384347680-15976-12-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1384347680-15976-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1384347680-15976-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 11/16] console: Remove unused debug code
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
X-List-Received-Date: Wed, 13 Nov 2013 13:11:19 -0000

From: Stefan Weil <sw@weilnetz.de>

The local function console_print_text_attributes is no longer used since
commit 7d6ba01c3741bc32ae252bf64a5fd3f930c2df4f.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 ui/console.c |   33 ---------------------------------
 1 file changed, 33 deletions(-)

diff --git a/ui/console.c b/ui/console.c
index aad4fc9..199ba69 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -409,39 +409,6 @@ static const pixman_color_t color_table_rgb[2][8] = {
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


