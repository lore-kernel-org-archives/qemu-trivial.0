Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZteCE-00060O-Lb
	for mharc-qemu-trivial@gnu.org; Tue, 03 Nov 2015 11:12:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46567)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1ZteC7-0005qT-69
	for qemu-trivial@nongnu.org; Tue, 03 Nov 2015 11:12:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1ZteC2-0002y8-5j
	for qemu-trivial@nongnu.org; Tue, 03 Nov 2015 11:12:23 -0500
Received: from mx1.redhat.com ([209.132.183.28]:42412)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1ZteBr-0002xV-DY; Tue, 03 Nov 2015 11:12:07 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id 75E878E69D;
	Tue,  3 Nov 2015 16:12:06 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-35.ams2.redhat.com
	[10.36.116.35])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tA3GC4Rc021866
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 3 Nov 2015 11:12:05 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id D73FF300530B; Tue,  3 Nov 2015 17:12:03 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue,  3 Nov 2015 17:12:03 +0100
Message-Id: <1446567123-32700-1-git-send-email-armbru@redhat.com>
In-Reply-To: <1446134122-32292-2-git-send-email-armbru@redhat.com>
References: <1446134122-32292-2-git-send-email-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, kraxel@redhat.com
Subject: [Qemu-trivial] [PATCH v3 1/4] ui: Use g_new() & friends where that
	makes obvious sense
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
X-List-Received-Date: Tue, 03 Nov 2015 16:12:28 -0000

g_new(T, n) is neater than g_malloc(sizeof(T) * n).  It's also safer,
for two reasons.  One, it catches multiplication overflowing size_t.
Two, it returns T * rather than void *, which lets the compiler catch
more type errors.

This commit only touches allocations with size arguments of the form
sizeof(T).  Same Coccinelle semantic patch as in commit b45c03f.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
v3: Straightforward rebase: one hunk dropped from ui/vnc.c

 ui/console.c      | 2 +-
 ui/curses.c       | 2 +-
 ui/input-legacy.c | 4 ++--
 ui/keymaps.c      | 2 +-
 ui/sdl.c          | 2 +-
 ui/vnc-jobs.c     | 6 +++---
 ui/vnc.c          | 4 ++--
 7 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/ui/console.c b/ui/console.c
index f26544e..745c354 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -450,7 +450,7 @@ static void text_console_resize(QemuConsole *s)
     if (s->width < w1)
         w1 = s->width;
 
-    cells = g_malloc(s->width * s->total_height * sizeof(TextCell));
+    cells = g_new(TextCell, s->width * s->total_height);
     for(y = 0; y < s->total_height; y++) {
         c = &cells[y * s->width];
         if (w1 > 0) {
diff --git a/ui/curses.c b/ui/curses.c
index 8edb038..db83188 100644
--- a/ui/curses.c
+++ b/ui/curses.c
@@ -382,7 +382,7 @@ void curses_display_init(DisplayState *ds, int full_screen)
 
     curses_winch_init();
 
-    dcl = (DisplayChangeListener *) g_malloc0(sizeof(DisplayChangeListener));
+    dcl = g_new0(DisplayChangeListener, 1);
     dcl->ops = &dcl_ops;
     register_displaychangelistener(dcl);
 
diff --git a/ui/input-legacy.c b/ui/input-legacy.c
index a67ed32..e0a39f0 100644
--- a/ui/input-legacy.c
+++ b/ui/input-legacy.c
@@ -206,7 +206,7 @@ QEMUPutMouseEntry *qemu_add_mouse_event_handler(QEMUPutMouseEvent *func,
 {
     QEMUPutMouseEntry *s;
 
-    s = g_malloc0(sizeof(QEMUPutMouseEntry));
+    s = g_new0(QEMUPutMouseEntry, 1);
 
     s->qemu_put_mouse_event = func;
     s->qemu_put_mouse_event_opaque = opaque;
@@ -240,7 +240,7 @@ QEMUPutLEDEntry *qemu_add_led_event_handler(QEMUPutLEDEvent *func,
 {
     QEMUPutLEDEntry *s;
 
-    s = g_malloc0(sizeof(QEMUPutLEDEntry));
+    s = g_new0(QEMUPutLEDEntry, 1);
 
     s->put_led = func;
     s->opaque = opaque;
diff --git a/ui/keymaps.c b/ui/keymaps.c
index 49410ae..1b9ba3f 100644
--- a/ui/keymaps.c
+++ b/ui/keymaps.c
@@ -109,7 +109,7 @@ static kbd_layout_t *parse_keyboard_layout(const name2keysym_t *table,
     }
 
     if (!k) {
-        k = g_malloc0(sizeof(kbd_layout_t));
+        k = g_new0(kbd_layout_t, 1);
     }
 
     for(;;) {
diff --git a/ui/sdl.c b/ui/sdl.c
index 3be2910..570cb99 100644
--- a/ui/sdl.c
+++ b/ui/sdl.c
@@ -985,7 +985,7 @@ void sdl_display_init(DisplayState *ds, int full_screen, int no_frame)
         sdl_grab_start();
     }
 
-    dcl = g_malloc0(sizeof(DisplayChangeListener));
+    dcl = g_new0(DisplayChangeListener, 1);
     dcl->ops = &dcl_ops;
     register_displaychangelistener(dcl);
 
diff --git a/ui/vnc-jobs.c b/ui/vnc-jobs.c
index 22c9abc..9512b87 100644
--- a/ui/vnc-jobs.c
+++ b/ui/vnc-jobs.c
@@ -79,7 +79,7 @@ static void vnc_unlock_queue(VncJobQueue *queue)
 
 VncJob *vnc_job_new(VncState *vs)
 {
-    VncJob *job = g_malloc0(sizeof(VncJob));
+    VncJob *job = g_new0(VncJob, 1);
 
     job->vs = vs;
     vnc_lock_queue(queue);
@@ -90,7 +90,7 @@ VncJob *vnc_job_new(VncState *vs)
 
 int vnc_job_add_rect(VncJob *job, int x, int y, int w, int h)
 {
-    VncRectEntry *entry = g_malloc0(sizeof(VncRectEntry));
+    VncRectEntry *entry = g_new0(VncRectEntry, 1);
 
     entry->rect.x = x;
     entry->rect.y = y;
@@ -298,7 +298,7 @@ disconnected:
 
 static VncJobQueue *vnc_queue_init(void)
 {
-    VncJobQueue *queue = g_malloc0(sizeof(VncJobQueue));
+    VncJobQueue *queue = g_new0(VncJobQueue, 1);
 
     qemu_cond_init(&queue->cond);
     qemu_mutex_init(&queue->mutex);
diff --git a/ui/vnc.c b/ui/vnc.c
index 7b37e3b..fcabcf9 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -2966,7 +2966,7 @@ static void vnc_refresh(DisplayChangeListener *dcl)
 static void vnc_connect(VncDisplay *vd, int csock,
                         bool skipauth, bool websocket)
 {
-    VncState *vs = g_malloc0(sizeof(VncState));
+    VncState *vs = g_new0(VncState, 1);
     int i;
 
     vs->csock = csock;
@@ -2989,7 +2989,7 @@ static void vnc_connect(VncDisplay *vd, int csock,
 
     vs->lossy_rect = g_malloc0(VNC_STAT_ROWS * sizeof (*vs->lossy_rect));
     for (i = 0; i < VNC_STAT_ROWS; ++i) {
-        vs->lossy_rect[i] = g_malloc0(VNC_STAT_COLS * sizeof (uint8_t));
+        vs->lossy_rect[i] = g_new0(uint8_t, VNC_STAT_COLS);
     }
 
     VNC_DEBUG("New client on socket %d\n", csock);
-- 
2.4.3


