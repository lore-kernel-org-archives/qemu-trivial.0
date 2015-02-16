Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YNTQW-0007uZ-3m
	for mharc-qemu-trivial@gnu.org; Mon, 16 Feb 2015 16:42:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51227)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1YNTQK-0007aB-Rb
	for qemu-trivial@nongnu.org; Mon, 16 Feb 2015 16:41:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1YNTQD-0007Q6-EC
	for qemu-trivial@nongnu.org; Mon, 16 Feb 2015 16:41:48 -0500
Received: from e06smtp16.uk.ibm.com ([195.75.94.112]:32949)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1YNTQC-0007L1-Nb
	for qemu-trivial@nongnu.org; Mon, 16 Feb 2015 16:41:41 -0500
Received: from /spool/local
	by e06smtp16.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <thuth@linux.vnet.ibm.com>;
	Mon, 16 Feb 2015 21:41:39 -0000
Received: from d06dlp03.portsmouth.uk.ibm.com (9.149.20.15)
	by e06smtp16.uk.ibm.com (192.168.101.146) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Mon, 16 Feb 2015 21:41:36 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com
	(d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
	by d06dlp03.portsmouth.uk.ibm.com (Postfix) with ESMTP id 1AE841B08061; 
	Mon, 16 Feb 2015 21:41:48 +0000 (GMT)
Received: from d06av04.portsmouth.uk.ibm.com (d06av04.portsmouth.uk.ibm.com
	[9.149.37.216])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id t1GLfab04718906; Mon, 16 Feb 2015 21:41:36 GMT
Received: from d06av04.portsmouth.uk.ibm.com (localhost [127.0.0.1])
	by d06av04.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with
	ESMTP id t1GLfZS7015902; Mon, 16 Feb 2015 14:41:35 -0700
Received: from oc7435384737.ibm.com (sig-9-81-72-150.evts.uk.ibm.com
	[9.81.72.150])
	by d06av04.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with
	ESMTP id t1GLfWRX015849; Mon, 16 Feb 2015 14:41:34 -0700
From: Thomas Huth <thuth@linux.vnet.ibm.com>
To: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Date: Mon, 16 Feb 2015 22:41:29 +0100
Message-Id: <1424122891-9390-3-git-send-email-thuth@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1424122891-9390-1-git-send-email-thuth@linux.vnet.ibm.com>
References: <1424122891-9390-1-git-send-email-thuth@linux.vnet.ibm.com>
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 15021621-0025-0000-0000-000003E81884
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.75.94.112
Cc: Thomas Huth <thuth@linux.vnet.ibm.com>,
	Anthony Liguori <aliguori@amazon.com>, Gerd Hoffmann <kraxel@redhat.com>
Subject: [Qemu-trivial] [PATCH 2/4] ui/console: Removed unused functions
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
X-List-Received-Date: Mon, 16 Feb 2015 21:41:56 -0000

Remove dpy_gfx_update_dirty(), qemu_console_get_head(),
qemu_console_get_ui_info(), qemu_console_get_width(),
qemu_console_get_height(), emu_console_displaystate(),
qemu_different_endianness_pixelformat(), void cpkey(),
qemu_pixman_linebuf_copy(), qemu_pixman_color(),
emu_remove_kbd_event_handler() and vnc_stop_worker_thread()
since they are completely unused.

Signed-off-by: Thomas Huth <thuth@linux.vnet.ibm.com>
Cc: Anthony Liguori <aliguori@amazon.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
---
 include/ui/console.h     |   11 -----
 include/ui/input.h       |    1 -
 include/ui/qemu-pixman.h |    3 -
 ui/console.c             |  103 ----------------------------------------------
 ui/d3des.c               |    9 ----
 ui/d3des.h               |    6 ---
 ui/input-legacy.c        |    6 ---
 ui/input.c               |    7 ---
 ui/qemu-pixman.c         |   19 --------
 ui/vnc-jobs.c            |   13 ------
 ui/vnc-jobs.h            |    1 -
 11 files changed, 0 insertions(+), 179 deletions(-)

diff --git a/include/ui/console.h b/include/ui/console.h
index 8a4d671..abba208 100644
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
@@ -233,10 +231,6 @@ void dpy_text_resize(QemuConsole *con, int w, int h);
 void dpy_mouse_set(QemuConsole *con, int x, int y, int on);
 void dpy_cursor_define(QemuConsole *con, QEMUCursor *cursor);
 bool dpy_cursor_define_supported(QemuConsole *con);
-void dpy_gfx_update_dirty(QemuConsole *con,
-                          MemoryRegion *address_space,
-                          uint64_t base,
-                          bool invalidate);
 bool dpy_gfx_check_format(QemuConsole *con,
                           pixman_format_code_t format);
 
@@ -310,10 +304,6 @@ bool qemu_console_is_visible(QemuConsole *con);
 bool qemu_console_is_graphic(QemuConsole *con);
 bool qemu_console_is_fixedsize(QemuConsole *con);
 int qemu_console_get_index(QemuConsole *con);
-uint32_t qemu_console_get_head(QemuConsole *con);
-QemuUIInfo *qemu_console_get_ui_info(QemuConsole *con);
-int qemu_console_get_width(QemuConsole *con, int fallback);
-int qemu_console_get_height(QemuConsole *con, int fallback);
 
 void text_consoles_set_display(DisplayState *ds);
 void console_select(unsigned int index);
@@ -322,7 +312,6 @@ void qemu_console_resize(QemuConsole *con, int width, int height);
 void qemu_console_copy(QemuConsole *con, int src_x, int src_y,
                        int dst_x, int dst_y, int w, int h);
 DisplaySurface *qemu_console_surface(QemuConsole *con);
-DisplayState *qemu_console_displaystate(QemuConsole *console);
 
 /* sdl.c */
 void sdl_display_init(DisplayState *ds, int full_screen, int no_frame);
diff --git a/include/ui/input.h b/include/ui/input.h
index 5d5ac00..d50ea9d 100644
--- a/include/ui/input.h
+++ b/include/ui/input.h
@@ -27,7 +27,6 @@ struct QemuInputHandler {
 QemuInputHandlerState *qemu_input_handler_register(DeviceState *dev,
                                                    QemuInputHandler *handler);
 void qemu_input_handler_activate(QemuInputHandlerState *s);
-void qemu_input_handler_deactivate(QemuInputHandlerState *s);
 void qemu_input_handler_unregister(QemuInputHandlerState *s);
 void qemu_input_handler_bind(QemuInputHandlerState *s,
                              const char *device_id, int head,
diff --git a/include/ui/qemu-pixman.h b/include/ui/qemu-pixman.h
index 3dee576..29c575c 100644
--- a/include/ui/qemu-pixman.h
+++ b/include/ui/qemu-pixman.h
@@ -44,13 +44,10 @@ pixman_image_t *qemu_pixman_linebuf_create(pixman_format_code_t format,
                                            int width);
 void qemu_pixman_linebuf_fill(pixman_image_t *linebuf, pixman_image_t *fb,
                               int width, int x, int y);
-void qemu_pixman_linebuf_copy(pixman_image_t *fb, int width, int x, int y,
-                              pixman_image_t *linebuf);
 pixman_image_t *qemu_pixman_mirror_create(pixman_format_code_t format,
                                           pixman_image_t *image);
 void qemu_pixman_image_unref(pixman_image_t *image);
 
-pixman_color_t qemu_pixman_color(PixelFormat *pf, uint32_t color);
 pixman_image_t *qemu_pixman_glyph_from_vgafont(int height, const uint8_t *font,
                                                unsigned int ch);
 void qemu_pixman_glyph_render(pixman_image_t *glyph,
diff --git a/ui/console.c b/ui/console.c
index 87574a7..74854dd 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -1599,67 +1599,6 @@ bool dpy_cursor_define_supported(QemuConsole *con)
     return false;
 }
 
-/*
- * Call dpy_gfx_update for all dirity scanlines.  Works for
- * DisplaySurfaces backed by guest memory (i.e. the ones created
- * using qemu_create_displaysurface_guestmem).
- */
-void dpy_gfx_update_dirty(QemuConsole *con,
-                          MemoryRegion *address_space,
-                          hwaddr base,
-                          bool invalidate)
-{
-    DisplaySurface *ds = qemu_console_surface(con);
-    int width = surface_stride(ds);
-    int height = surface_height(ds);
-    hwaddr size = width * height;
-    MemoryRegionSection mem_section;
-    MemoryRegion *mem;
-    ram_addr_t addr;
-    int first, last, i;
-    bool dirty;
-
-    mem_section = memory_region_find(address_space, base, size);
-    mem = mem_section.mr;
-    if (int128_get64(mem_section.size) != size ||
-        !memory_region_is_ram(mem_section.mr)) {
-        goto out;
-    }
-    assert(mem);
-
-    memory_region_sync_dirty_bitmap(mem);
-    addr = mem_section.offset_within_region;
-
-    first = -1;
-    last = -1;
-    for (i = 0; i < height; i++, addr += width) {
-        dirty = invalidate ||
-            memory_region_get_dirty(mem, addr, width, DIRTY_MEMORY_VGA);
-        if (dirty) {
-            if (first == -1) {
-                first = i;
-            }
-            last = i;
-        }
-        if (first != -1 && !dirty) {
-            assert(last != -1 && last >= first);
-            dpy_gfx_update(con, 0, first, surface_width(ds),
-                           last - first + 1);
-            first = -1;
-        }
-    }
-    if (first != -1) {
-        assert(last != -1 && last >= first);
-        dpy_gfx_update(con, 0, first, surface_width(ds),
-                       last - first + 1);
-    }
-
-    memory_region_reset_dirty(mem, mem_section.offset_within_region, size,
-                              DIRTY_MEMORY_VGA);
-out:
-    memory_region_unref(mem);
-}
-
 /***********************************************************/
 /* register display */
 
@@ -1796,36 +1735,6 @@ int qemu_console_get_index(QemuConsole *con)
     return con ? con->index : -1;
 }
 
-uint32_t qemu_console_get_head(QemuConsole *con)
-{
-    if (con == NULL) {
-        con = active_console;
-    }
-    return con ? con->head : -1;
-}
-
-QemuUIInfo *qemu_console_get_ui_info(QemuConsole *con)
-{
-    assert(con != NULL);
-    return &con->ui_info;
-}
-
-int qemu_console_get_width(QemuConsole *con, int fallback)
-{
-    if (con == NULL) {
-        con = active_console;
-    }
-    return con ? surface_width(con->surface) : fallback;
-}
-
-int qemu_console_get_height(QemuConsole *con, int fallback)
-{
-    if (con == NULL) {
-        con = active_console;
-    }
-    return con ? surface_height(con->surface) : fallback;
-}
-
 static void text_console_set_echo(CharDriverState *chr, bool echo)
 {
     QemuConsole *s = chr->opaque;
@@ -2005,18 +1914,6 @@ DisplaySurface *qemu_console_surface(QemuConsole *console)
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
diff --git a/ui/input.c b/ui/input.c
index 7ba99e5..50499a1 100644
--- a/ui/input.c
+++ b/ui/input.c
@@ -61,13 +61,6 @@ void qemu_input_handler_activate(QemuInputHandlerState *s)
     qemu_input_check_mode_change();
 }
 
-void qemu_input_handler_deactivate(QemuInputHandlerState *s)
-{
-    QTAILQ_REMOVE(&handlers, s, node);
-    QTAILQ_INSERT_TAIL(&handlers, s, node);
-    qemu_input_check_mode_change();
-}
-
 void qemu_input_handler_unregister(QemuInputHandlerState *s)
 {
     QTAILQ_REMOVE(&handlers, s, node);
diff --git a/ui/qemu-pixman.c b/ui/qemu-pixman.c
index 4116e15..6587c00 100644
--- a/ui/qemu-pixman.c
+++ b/ui/qemu-pixman.c
@@ -168,14 +168,6 @@ void qemu_pixman_linebuf_fill(pixman_image_t *linebuf, pixman_image_t *fb,
                            x, y, 0, 0, 0, 0, width, 1);
 }
 
-/* copy linebuf to framebuffer */
-void qemu_pixman_linebuf_copy(pixman_image_t *fb, int width, int x, int y,
-                              pixman_image_t *linebuf)
-{
-    pixman_image_composite(PIXMAN_OP_SRC, linebuf, NULL, fb,
-                           0, 0, 0, 0, x, y, width, 1);
-}
-
 pixman_image_t *qemu_pixman_mirror_create(pixman_format_code_t format,
                                           pixman_image_t *image)
 {
@@ -197,17 +189,6 @@ void qemu_pixman_image_unref(pixman_image_t *image)
     pixman_image_unref(image);
 }
 
-pixman_color_t qemu_pixman_color(PixelFormat *pf, uint32_t color)
-{
-    pixman_color_t c;
-
-    c.red   = ((color & pf->rmask) >> pf->rshift) << (16 - pf->rbits);
-    c.green = ((color & pf->gmask) >> pf->gshift) << (16 - pf->gbits);
-    c.blue  = ((color & pf->bmask) >> pf->bshift) << (16 - pf->bbits);
-    c.alpha = ((color & pf->amask) >> pf->ashift) << (16 - pf->abits);
-    return c;
-}
-
 pixman_image_t *qemu_pixman_glyph_from_vgafont(int height, const uint8_t *font,
                                                unsigned int ch)
 {
diff --git a/ui/vnc-jobs.c b/ui/vnc-jobs.c
index 68f3d77..c8ee203 100644
--- a/ui/vnc-jobs.c
+++ b/ui/vnc-jobs.c
@@ -342,16 +342,3 @@ void vnc_start_worker_thread(void)
                        QEMU_THREAD_DETACHED);
     queue = q; /* Set global queue */
 }
-
-void vnc_stop_worker_thread(void)
-{
-    if (!vnc_worker_thread_running())
-        return ;
-
-    /* Remove all jobs and wake up the thread */
-    vnc_lock_queue(queue);
-    queue->exit = true;
-    vnc_unlock_queue(queue);
-    vnc_jobs_clear(NULL);
-    qemu_cond_broadcast(&queue->cond);
-}
diff --git a/ui/vnc-jobs.h b/ui/vnc-jobs.h
index 31da103..044bf9f 100644
--- a/ui/vnc-jobs.h
+++ b/ui/vnc-jobs.h
@@ -40,7 +40,6 @@ void vnc_jobs_join(VncState *vs);
 
 void vnc_jobs_consume_buffer(VncState *vs);
 void vnc_start_worker_thread(void);
-void vnc_stop_worker_thread(void);
 
 /* Locks */
 static inline int vnc_trylock_display(VncDisplay *vd)
-- 
1.7.1


