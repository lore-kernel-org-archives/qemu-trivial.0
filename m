Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V3Jwu-0000O6-VL
	for mharc-qemu-trivial@gnu.org; Sun, 28 Jul 2013 01:55:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36962)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1V3Jwo-0000Ex-HC
	for qemu-trivial@nongnu.org; Sun, 28 Jul 2013 01:55:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1V3Jwj-0008It-Gq
	for qemu-trivial@nongnu.org; Sun, 28 Jul 2013 01:55:14 -0400
Received: from qemu.weilnetz.de ([37.221.198.45]:51868
	helo=v2201305906712890.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1V3JwZ-00081S-Kh; Sun, 28 Jul 2013 01:54:59 -0400
Received: by v2201305906712890.yourvserver.net (Postfix, from userid 1000)
	id 2BEF21819C6; Sun, 28 Jul 2013 07:54:56 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial <qemu-trivial@nongnu.org>
Date: Sun, 28 Jul 2013 07:54:55 +0200
Message-Id: <1374990895-25584-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.198.45
Cc: Stefan Weil <sw@weilnetz.de>, Jan Kiszka <jan.kiszka@web.de>,
	qemu-devel <qemu-devel@nongnu.org>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [Qemu-trivial] [PATCH] musicpal: Fix typo in name of local function
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
X-List-Received-Date: Sun, 28 Jul 2013 05:55:19 -0000

The misspelling was spotted by Andreas F=C3=A4rber.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 hw/arm/musicpal.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/musicpal.c b/hw/arm/musicpal.c
index b06d442..ddddd27 100644
--- a/hw/arm/musicpal.c
+++ b/hw/arm/musicpal.c
@@ -534,7 +534,7 @@ static void lcd_invalidate(void *opaque)
 {
 }
=20
-static void musicpal_lcd_gpio_brigthness_in(void *opaque, int irq, int l=
evel)
+static void musicpal_lcd_gpio_brightness_in(void *opaque, int irq, int l=
evel)
 {
     musicpal_lcd_state *s =3D opaque;
     s->brightness &=3D ~(1 << irq);
@@ -619,7 +619,7 @@ static int musicpal_lcd_init(SysBusDevice *dev)
     s->con =3D graphic_console_init(DEVICE(dev), &musicpal_gfx_ops, s);
     qemu_console_resize(s->con, 128*3, 64*3);
=20
-    qdev_init_gpio_in(&dev->qdev, musicpal_lcd_gpio_brigthness_in, 3);
+    qdev_init_gpio_in(&dev->qdev, musicpal_lcd_gpio_brightness_in, 3);
=20
     return 0;
 }
--=20
1.7.10.4


