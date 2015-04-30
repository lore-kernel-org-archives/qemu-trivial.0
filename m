Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ynj1w-0002R6-Uj
	for mharc-qemu-trivial@gnu.org; Thu, 30 Apr 2015 03:37:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45057)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Ynj1r-0002EE-Js
	for qemu-trivial@nongnu.org; Thu, 30 Apr 2015 03:37:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Ynj1q-0006Bz-Jk
	for qemu-trivial@nongnu.org; Thu, 30 Apr 2015 03:37:03 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:50449)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Ynj1l-00069F-Vd; Thu, 30 Apr 2015 03:36:58 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 963B542BA6;
	Thu, 30 Apr 2015 10:36:56 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 4047B94F;
	Thu, 30 Apr 2015 08:08:58 +0300 (MSK)
Received: (nullmailer pid 4304 invoked by uid 1000);
	Thu, 30 Apr 2015 05:08:57 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 30 Apr 2015 08:08:19 +0300
Message-Id: <1656e6d2fa33bc6bd04951775cafb4ec371eedda.1430370396.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1430370396.git.mjt@msgid.tls.msk.ru>
References: <cover.1430370396.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Chih-Min Chao <cmchao@gmail.com>
Subject: [Qemu-trivial] [PULL 06/42] ui/console : remove 'struct' from
	'typedef struct' type
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
X-List-Received-Date: Thu, 30 Apr 2015 07:37:05 -0000

From: Chih-Min Chao <cmchao@gmail.com>

Signed-off-by: Chih-Min Chao <cmchao@gmail.com>
Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 ui/console.c       | 4 ++--
 ui/spice-display.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/ui/console.c b/ui/console.c
index 2927513..f5295c4 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -269,7 +269,7 @@ void graphic_hw_invalidate(QemuConsole *con)
     }
 }
 
-static void ppm_save(const char *filename, struct DisplaySurface *ds,
+static void ppm_save(const char *filename, DisplaySurface *ds,
                      Error **errp)
 {
     int width = pixman_image_get_width(ds->image);
@@ -1535,7 +1535,7 @@ void dpy_text_update(QemuConsole *con, int x, int y, int w, int h)
 void dpy_text_resize(QemuConsole *con, int w, int h)
 {
     DisplayState *s = con->ds;
-    struct DisplayChangeListener *dcl;
+    DisplayChangeListener *dcl;
 
     if (!qemu_console_is_visible(con)) {
         return;
diff --git a/ui/spice-display.c b/ui/spice-display.c
index c71a059..e293ec2 100644
--- a/ui/spice-display.c
+++ b/ui/spice-display.c
@@ -718,7 +718,7 @@ static void display_update(DisplayChangeListener *dcl,
 }
 
 static void display_switch(DisplayChangeListener *dcl,
-                           struct DisplaySurface *surface)
+                           DisplaySurface *surface)
 {
     SimpleSpiceDisplay *ssd = container_of(dcl, SimpleSpiceDisplay, dcl);
     qemu_spice_display_switch(ssd, surface);
-- 
2.1.4


