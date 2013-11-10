Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VfWs0-00039K-Ux
	for mharc-qemu-trivial@gnu.org; Sun, 10 Nov 2013 10:24:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44460)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VfWry-00036D-4I
	for qemu-trivial@nongnu.org; Sun, 10 Nov 2013 10:24:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VfWrx-0000mW-7l
	for qemu-trivial@nongnu.org; Sun, 10 Nov 2013 10:24:10 -0500
Received: from qemu.weilnetz.de ([2a03:4000:2:362::1]:45429
	helo=v2201305906712890.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VfWru-0000le-QS; Sun, 10 Nov 2013 10:24:06 -0500
Received: by v2201305906712890.yourvserver.net (Postfix, from userid 1000)
	id 987B71802B2; Sun, 10 Nov 2013 16:24:03 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel <qemu-devel@nongnu.org>
Date: Sun, 10 Nov 2013 16:24:02 +0100
Message-Id: <1384097042-22430-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a03:4000:2:362::1
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Anthony Liguori <aliguori@amazon.com>
Subject: [Qemu-trivial] [PATCH] gtk: Replace conditional debug messages by
	trace methods
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
X-List-Received-Date: Sun, 10 Nov 2013 15:24:11 -0000

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 trace-events |    5 +++++
 ui/gtk.c     |   19 +++++--------------
 2 files changed, 10 insertions(+), 14 deletions(-)

diff --git a/trace-events b/trace-events
index 8695e9e..360f684 100644
--- a/trace-events
+++ b/trace-events
@@ -1020,6 +1020,11 @@ displaychangelistener_register(void *dcl, const char *name) "%p [ %s ]"
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


