Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YTINK-0006Av-1W
	for mharc-qemu-trivial@gnu.org; Wed, 04 Mar 2015 18:06:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52623)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YTINE-00061e-Kx
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 18:06:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YTIND-0005OK-Kl
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 18:06:40 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:46086)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YTIN7-0005Mc-K2; Wed, 04 Mar 2015 18:06:33 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 34DF240983;
	Thu,  5 Mar 2015 02:06:31 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 1D19794A;
	Wed,  4 Mar 2015 20:07:08 +0300 (MSK)
Received: (nullmailer pid 17530 invoked by uid 1000);
	Wed, 04 Mar 2015 17:07:05 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Wed,  4 Mar 2015 20:06:40 +0300
Message-Id: <ee97bb4ccda297d456d963ebbfa31b5e0b325355.1425488753.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1425488753.git.mjt@msgid.tls.msk.ru>
References: <cover.1425488753.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Thomas Huth <thuth@linux.vnet.ibm.com>
Subject: [Qemu-trivial] [PULL 23/47] ui: Removed unused functions
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
X-List-Received-Date: Wed, 04 Mar 2015 23:06:42 -0000

From: Thomas Huth <thuth@linux.vnet.ibm.com>

Remove qemu_console_displaystate(), qemu_remove_kbd_event_handler(),
qemu_different_endianness_pixelformat() and cpkey(), since they are
completely unused.

Signed-off-by: Thomas Huth <thuth@linux.vnet.ibm.com>
Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 include/ui/console.h |  3 ---
 ui/console.c         | 12 ------------
 ui/d3des.c           |  9 ---------
 ui/d3des.h           |  6 ------
 ui/input-legacy.c    |  6 ------
 5 files changed, 36 deletions(-)

diff --git a/include/ui/console.h b/include/ui/console.h
index 0f97d86..6e5a867 100644
--- a/include/ui/console.h
+++ b/include/ui/console.h
@@ -36,7 +36,6 @@ typedef struct QEMUPutLEDEntry QEMUPutLEDEntry;
 
 QEMUPutKbdEntry *qemu_add_kbd_event_handler(QEMUPutKBDEvent *func,
                                             void *opaque);
-void qemu_remove_kbd_event_handler(QEMUPutKbdEntry *entry);
 QEMUPutMouseEntry *qemu_add_mouse_event_handler(QEMUPutMouseEvent *func,
                                                 void *opaque, int absolute,
                                                 const char *name);
@@ -194,7 +193,6 @@ DisplaySurface *qemu_create_displaysurface_guestmem(int width, int height,
                                                     pixman_format_code_t format,
                                                     int linesize,
                                                     uint64_t addr);
-PixelFormat qemu_different_endianness_pixelformat(int bpp);
 PixelFormat qemu_default_pixelformat(int bpp);
 
 DisplaySurface *qemu_create_displaysurface(int width, int height);
@@ -322,7 +320,6 @@ void qemu_console_resize(QemuConsole *con, int width, int height);
 void qemu_console_copy(QemuConsole *con, int src_x, int src_y,
                        int dst_x, int dst_y, int w, int h);
 DisplaySurface *qemu_console_surface(QemuConsole *con);
-DisplayState *qemu_console_displaystate(QemuConsole *console);
 
 /* sdl.c */
 void sdl_display_init(DisplayState *ds, int full_screen, int no_frame);
diff --git a/ui/console.c b/ui/console.c
index 87574a7..87af6b5 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -2005,18 +2005,6 @@ DisplaySurface *qemu_console_surface(QemuConsole *console)
     return console->surface;
 }
 
-DisplayState *qemu_console_displaystate(QemuConsole *console)
-{
-    return console->ds;
-}
-
-PixelFormat qemu_different_endianness_pixelformat(int bpp)
-{
-    pixman_format_code_t fmt = qemu_default_pixman_format(bpp, false);
-    PixelFormat pf = qemu_pixelformat_from_pixman(fmt);
-    return pf;
-}
-
 PixelFormat qemu_default_pixelformat(int bpp)
 {
     pixman_format_code_t fmt = qemu_default_pixman_format(bpp, true);
diff --git a/ui/d3des.c b/ui/d3des.c
index 60c840e..5bc99b8 100644
--- a/ui/d3des.c
+++ b/ui/d3des.c
@@ -121,15 +121,6 @@ static void cookey(register unsigned long *raw1)
 	return;
 	}
 
-void cpkey(register unsigned long *into)
-{
-	register unsigned long *from, *endp;
-
-	from = KnL, endp = &KnL[32];
-	while( from < endp ) *into++ = *from++;
-	return;
-	}
-
 void usekey(register unsigned long *from)
 {
 	register unsigned long *to, *endp;
diff --git a/ui/d3des.h b/ui/d3des.h
index 70cb6b5..773667e 100644
--- a/ui/d3des.h
+++ b/ui/d3des.h
@@ -36,12 +36,6 @@ void usekey(unsigned long *);
  * Loads the internal key register with the data in cookedkey.
  */
 
-void cpkey(unsigned long *);
-/*		   cookedkey[32]
- * Copies the contents of the internal key register into the storage
- * located at &cookedkey[0].
- */
-
 void des(unsigned char *, unsigned char *);
 /*		    from[8]	      to[8]
  * Encrypts/Decrypts (according to the key currently loaded in the
diff --git a/ui/input-legacy.c b/ui/input-legacy.c
index a698a34..2d4ca19 100644
--- a/ui/input-legacy.c
+++ b/ui/input-legacy.c
@@ -143,12 +143,6 @@ QEMUPutKbdEntry *qemu_add_kbd_event_handler(QEMUPutKBDEvent *func, void *opaque)
     return entry;
 }
 
-void qemu_remove_kbd_event_handler(QEMUPutKbdEntry *entry)
-{
-    qemu_input_handler_unregister(entry->s);
-    g_free(entry);
-}
-
 static void legacy_mouse_event(DeviceState *dev, QemuConsole *src,
                                InputEvent *evt)
 {
-- 
2.1.4


