Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YOUea-0005kL-IO
	for mharc-qemu-trivial@gnu.org; Thu, 19 Feb 2015 12:12:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37071)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1YOUeV-0005fe-Gm
	for qemu-trivial@nongnu.org; Thu, 19 Feb 2015 12:12:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1YOUeM-0007LU-Ks
	for qemu-trivial@nongnu.org; Thu, 19 Feb 2015 12:12:39 -0500
Received: from e06smtp13.uk.ibm.com ([195.75.94.109]:60311)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1YOUeM-0007K5-DB
	for qemu-trivial@nongnu.org; Thu, 19 Feb 2015 12:12:30 -0500
Received: from /spool/local
	by e06smtp13.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <thuth@linux.vnet.ibm.com>;
	Thu, 19 Feb 2015 17:12:28 -0000
Received: from d06dlp03.portsmouth.uk.ibm.com (9.149.20.15)
	by e06smtp13.uk.ibm.com (192.168.101.143) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Thu, 19 Feb 2015 17:12:26 -0000
Received: from b06cxnps4075.portsmouth.uk.ibm.com
	(d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
	by d06dlp03.portsmouth.uk.ibm.com (Postfix) with ESMTP id EA1091B0804B; 
	Thu, 19 Feb 2015 17:12:38 +0000 (GMT)
Received: from d06av04.portsmouth.uk.ibm.com (d06av04.portsmouth.uk.ibm.com
	[9.149.37.216])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id t1JHCQk58454640; Thu, 19 Feb 2015 17:12:26 GMT
Received: from d06av04.portsmouth.uk.ibm.com (localhost [127.0.0.1])
	by d06av04.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with
	ESMTP id t1JHCO60013660; Thu, 19 Feb 2015 10:12:25 -0700
Received: from oc7435384737.ibm.com (dyn-9-152-224-69.boeblingen.de.ibm.com
	[9.152.224.69])
	by d06av04.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with
	ESMTP id t1JHCNs5013629; Thu, 19 Feb 2015 10:12:24 -0700
From: Thomas Huth <thuth@linux.vnet.ibm.com>
To: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Date: Thu, 19 Feb 2015 18:12:20 +0100
Message-Id: <1424365943-27563-3-git-send-email-thuth@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1424365943-27563-1-git-send-email-thuth@linux.vnet.ibm.com>
References: <1424365943-27563-1-git-send-email-thuth@linux.vnet.ibm.com>
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 15021917-0013-0000-0000-00000306F35D
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.75.94.109
Cc: Thomas Huth <thuth@linux.vnet.ibm.com>,
	Anthony Liguori <aliguori@amazon.com>, Gerd Hoffmann <kraxel@redhat.com>
Subject: [Qemu-trivial] [PATCH 2/5] ui: Removed unused functions
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
X-List-Received-Date: Thu, 19 Feb 2015 17:12:43 -0000

Remove qemu_console_displaystate(), qemu_remove_kbd_event_handler(),
qemu_different_endianness_pixelformat() and cpkey(), since they are
completely unused.

Signed-off-by: Thomas Huth <thuth@linux.vnet.ibm.com>
Cc: Anthony Liguori <aliguori@amazon.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
---
 include/ui/console.h |    3 ---
 ui/console.c         |   12 ------------
 ui/d3des.c           |    9 ---------
 ui/d3des.h           |    6 ------
 ui/input-legacy.c    |    6 ------
 5 files changed, 0 insertions(+), 36 deletions(-)

diff --git a/include/ui/console.h b/include/ui/console.h
index 8a4d671..7c3b5d4 100644
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
1.7.1


