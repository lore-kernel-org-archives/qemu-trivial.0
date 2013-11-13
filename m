Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VgaE8-0002FG-Td
	for mharc-qemu-trivial@gnu.org; Wed, 13 Nov 2013 08:11:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56249)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VgaDz-0001w8-Br
	for qemu-trivial@nongnu.org; Wed, 13 Nov 2013 08:11:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VgaDu-0001n9-IY
	for qemu-trivial@nongnu.org; Wed, 13 Nov 2013 08:11:15 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:44570)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VgaDg-0001ka-6q; Wed, 13 Nov 2013 08:10:56 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 00D1B4175B;
	Wed, 13 Nov 2013 17:10:53 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 73D4253F;
	Wed, 13 Nov 2013 17:01:26 +0400 (MSK)
Received: (nullmailer pid 16065 invoked by uid 1000);
	Wed, 13 Nov 2013 13:01:24 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: Anthony Liguori <aliguori@amazon.com>
Date: Wed, 13 Nov 2013 17:01:19 +0400
Message-Id: <1384347680-15976-16-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1384347680-15976-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1384347680-15976-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 15/16] gtk: Replace conditional debug messages
	by trace methods
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
X-List-Received-Date: Wed, 13 Nov 2013 13:11:20 -0000

From: Stefan Weil <sw@weilnetz.de>

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 trace-events |    5 +++++
 ui/gtk.c     |   19 +++++--------------
 2 files changed, 10 insertions(+), 14 deletions(-)

diff --git a/trace-events b/trace-events
index d196234..bc6788f 100644
--- a/trace-events
+++ b/trace-events
@@ -1022,6 +1022,11 @@ displaychangelistener_register(void *dcl, const char *name) "%p [ %s ]"
 displaychangelistener_unregister(void *dcl, const char *name) "%p [ %s ]"
 ppm_save(const char *filename, void *display_surface) "%s surface=%p"
 
+# ui/gtk.c
+gd_switch(int width, int height) "width=%d, height=%d"
+gd_update(int x, int y, int w, int h) "x=%d, y=%d, w=%d, h=%d"
+gd_key_event(int gdk_keycode, int qemu_keycode, const char *action) "translated GDK keycode %d to QEMU keycode %d (%s)"
+
 # hw/display/vmware_vga.c
 vmware_value_read(uint32_t index, uint32_t value) "index %d, value 0x%x"
 vmware_value_write(uint32_t index, uint32_t value) "index %d, value 0x%x"
diff --git a/ui/gtk.c b/ui/gtk.c
index b5f4f0b..6316f5b 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -53,6 +53,7 @@
 #include <vte/vte.h>
 #include <math.h>
 
+#include "trace.h"
 #include "ui/console.h"
 #include "sysemu/sysemu.h"
 #include "qmp-commands.h"
@@ -60,14 +61,6 @@
 #include "keymaps.h"
 #include "sysemu/char.h"
 
-//#define DEBUG_GTK
-
-#ifdef DEBUG_GTK
-#define DPRINTF(fmt, ...) printf(fmt, ## __VA_ARGS__)
-#else
-#define DPRINTF(fmt, ...) do { } while (0)
-#endif
-
 #define MAX_VCS 10
 
 
@@ -302,7 +295,7 @@ static void gd_update(DisplayChangeListener *dcl,
     int fbw, fbh;
     int ww, wh;
 
-    DPRINTF("update(x=%d, y=%d, w=%d, h=%d)\n", x, y, w, h);
+    trace_gd_update(x, y, w, h);
 
     if (s->convert) {
         pixman_image_composite(PIXMAN_OP_SRC, s->ds->image, NULL, s->convert,
@@ -396,8 +389,7 @@ static void gd_switch(DisplayChangeListener *dcl,
     GtkDisplayState *s = container_of(dcl, GtkDisplayState, dcl);
     bool resized = true;
 
-    DPRINTF("resize(width=%d, height=%d)\n",
-            surface_width(surface), surface_height(surface));
+    trace_gd_switch(surface_width(surface), surface_height(surface));
 
     if (s->surface) {
         cairo_surface_destroy(s->surface);
@@ -732,9 +724,8 @@ static gboolean gd_key_event(GtkWidget *widget, GdkEventKey *key, void *opaque)
         qemu_keycode = 0;
     }
 
-    DPRINTF("translated GDK keycode %d to QEMU keycode %d (%s)\n",
-            gdk_keycode, qemu_keycode,
-            (key->type == GDK_KEY_PRESS) ? "down" : "up");
+    trace_gd_key_event(gdk_keycode, qemu_keycode,
+                       (key->type == GDK_KEY_PRESS) ? "down" : "up");
 
     for (i = 0; i < ARRAY_SIZE(modifier_keycode); i++) {
         if (qemu_keycode == modifier_keycode[i]) {
-- 
1.7.10.4


