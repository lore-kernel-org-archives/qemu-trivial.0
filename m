Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bktfC-0004oO-78
	for mharc-qemu-trivial@gnu.org; Fri, 16 Sep 2016 09:58:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59460)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1bktf5-0004j3-B2
	for qemu-trivial@nongnu.org; Fri, 16 Sep 2016 09:58:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1bktf0-0008J5-3g
	for qemu-trivial@nongnu.org; Fri, 16 Sep 2016 09:58:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56364)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>)
	id 1bktes-0006Vy-BD; Fri, 16 Sep 2016 09:58:26 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 07AD9345593;
	Fri, 16 Sep 2016 13:56:33 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-112-33.ams2.redhat.com [10.36.112.33])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u8GDuHk8024127; Fri, 16 Sep 2016 09:56:31 -0400
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>
Date: Fri, 16 Sep 2016 15:55:57 +0200
Message-Id: <1474034177-17663-7-git-send-email-lvivier@redhat.com>
In-Reply-To: <1474034177-17663-1-git-send-email-lvivier@redhat.com>
References: <1474034177-17663-1-git-send-email-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Fri, 16 Sep 2016 13:56:33 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 06/26] graphics: use exit(EXIT_SUCCESS) and
 exit(EXIT_FAILURE)
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 16 Sep 2016 13:58:44 -0000

This patch is the result of coccinelle script
scripts/coccinelle/exit.cocci

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
CC: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/console-gl.c |  2 +-
 ui/console.c    |  2 +-
 ui/curses.c     |  4 ++--
 ui/gtk.c        |  2 +-
 ui/sdl.c        |  8 ++++----
 ui/sdl2.c       |  2 +-
 ui/spice-core.c | 22 +++++++++++-----------
 ui/vnc.c        |  4 ++--
 8 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/ui/console-gl.c b/ui/console-gl.c
index 5165e21..42627fb 100644
--- a/ui/console-gl.c
+++ b/ui/console-gl.c
@@ -46,7 +46,7 @@ ConsoleGLState *console_gl_init_context(void)
     gls->texture_blit_prog = qemu_gl_create_compile_link_program
         (texture_blit_vert_src, texture_blit_frag_src);
     if (!gls->texture_blit_prog) {
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     gls->texture_blit_vao =
diff --git a/ui/console.c b/ui/console.c
index 3940762..bef0678 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -1389,7 +1389,7 @@ void register_displaychangelistener(DisplayChangeListener *dcl)
         if (dcl->con->gl) {
             fprintf(stderr, "can't register two opengl displays (%s, %s)\n",
                     dcl->ops->dpy_name, dcl->con->gl->ops->dpy_name);
-            exit(1);
+            exit(EXIT_FAILURE);
         }
         dcl->con->gl = dcl;
     }
diff --git a/ui/curses.c b/ui/curses.c
index d06f724..ea5834d 100644
--- a/ui/curses.c
+++ b/ui/curses.c
@@ -408,7 +408,7 @@ static void curses_keyboard_setup(void)
     if(keyboard_layout) {
         kbd_layout = init_keyboard_layout(name2keysym, keyboard_layout);
         if (!kbd_layout)
-            exit(1);
+            exit(EXIT_FAILURE);
     }
 }
 
@@ -425,7 +425,7 @@ void curses_display_init(DisplayState *ds, int full_screen)
 #ifndef _WIN32
     if (!isatty(1)) {
         fprintf(stderr, "We need a terminal output\n");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 #endif
 
diff --git a/ui/gtk.c b/ui/gtk.c
index 58d20ee..39d456a 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -2158,7 +2158,7 @@ void gtk_display_init(DisplayState *ds, bool full_screen, bool grab_on_hover)
 
     if (!gtkinit) {
         fprintf(stderr, "gtk initialization failed\n");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     s->window = gtk_window_new(GTK_WINDOW_TOPLEVEL);
diff --git a/ui/sdl.c b/ui/sdl.c
index d8cf5bc..d2d67aa 100644
--- a/ui/sdl.c
+++ b/ui/sdl.c
@@ -92,7 +92,7 @@ static void sdl_update(DisplayChangeListener *dcl,
         } else {
             if (sdl_zoom_blit(guest_screen, real_screen, SMOOTHING_ON, &rec) < 0) {
                 fprintf(stderr, "Zoom blit failed\n");
-                exit(1);
+                exit(EXIT_FAILURE);
             }
         }
     } 
@@ -122,7 +122,7 @@ static void do_sdl_resize(int width, int height, int bpp)
         if (!tmp_screen) {
             fprintf(stderr, "Could not open SDL display (%dx%dx%d): %s\n",
                     width, height, bpp, SDL_GetError());
-            exit(1);
+            exit(EXIT_FAILURE);
         }
     } else {
         /*
@@ -957,7 +957,7 @@ void sdl_display_init(DisplayState *ds, int full_screen, int no_frame)
     if(keyboard_layout) {
         kbd_layout = init_keyboard_layout(name2keysym, keyboard_layout);
         if (!kbd_layout)
-            exit(1);
+            exit(EXIT_FAILURE);
     }
 
     if (no_frame)
@@ -987,7 +987,7 @@ void sdl_display_init(DisplayState *ds, int full_screen, int no_frame)
     if (SDL_Init (flags)) {
         fprintf(stderr, "Could not initialize SDL(%s) - exiting\n",
                 SDL_GetError());
-        exit(1);
+        exit(EXIT_FAILURE);
     }
     vi = SDL_GetVideoInfo();
     host_format = *(vi->vfmt);
diff --git a/ui/sdl2.c b/ui/sdl2.c
index 30d2a3c..73891aa 100644
--- a/ui/sdl2.c
+++ b/ui/sdl2.c
@@ -783,7 +783,7 @@ void sdl_display_init(DisplayState *ds, int full_screen, int no_frame)
     if (SDL_Init(flags)) {
         fprintf(stderr, "Could not initialize SDL(%s) - exiting\n",
                 SDL_GetError());
-        exit(1);
+        exit(EXIT_FAILURE);
     }
     SDL_SetHint(SDL_HINT_GRAB_KEYBOARD, "1");
 
diff --git a/ui/spice-core.c b/ui/spice-core.c
index da05054..859cba6 100644
--- a/ui/spice-core.c
+++ b/ui/spice-core.c
@@ -333,7 +333,7 @@ static int parse_name(const char *string, const char *optname,
         return value;
     }
     error_report("spice: invalid %s: %s", optname, string);
-    exit(1);
+    exit(EXIT_FAILURE);
 }
 
 static const char *stream_video_names[] = {
@@ -605,7 +605,7 @@ static int add_channel(void *opaque, const char *name, const char *value,
         if (!*tls_port) {
             error_report("spice: tried to setup tls-channel"
                          " without specifying a TLS port");
-            exit(1);
+            exit(EXIT_FAILURE);
         }
         security = SPICE_CHANNEL_SECURITY_SSL;
     }
@@ -622,7 +622,7 @@ static int add_channel(void *opaque, const char *name, const char *value,
     }
     if (rc != 0) {
         error_report("spice: failed to set channel security for %s", value);
-        exit(1);
+        exit(EXIT_FAILURE);
     }
     return 0;
 }
@@ -661,11 +661,11 @@ void qemu_spice_init(void)
     tls_port = qemu_opt_get_number(opts, "tls-port", 0);
     if (port < 0 || port > 65535) {
         error_report("spice port is out of range");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
     if (tls_port < 0 || tls_port > 65535) {
         error_report("spice tls-port is out of range");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
     password = qemu_opt_get(opts, "password");
 
@@ -736,7 +736,7 @@ void qemu_spice_init(void)
     if (qemu_opt_get_bool(opts, "sasl", 0)) {
         if (spice_server_set_sasl(spice_server, 1) == -1) {
             error_report("spice: failed to enable sasl");
-            exit(1);
+            exit(EXIT_FAILURE);
         }
         auth = "sasl";
     }
@@ -755,7 +755,7 @@ void qemu_spice_init(void)
 #else
         error_report("this qemu build does not support the "
                      "\"disable-agent-file-xfer\" option");
-        exit(1);
+        exit(EXIT_FAILURE);
 #endif
     }
 
@@ -803,7 +803,7 @@ void qemu_spice_init(void)
     spice_server_set_sasl_appname(spice_server, "qemu");
     if (spice_server_init(spice_server, &core_interface) != 0) {
         error_report("failed to initialize spice server");
-        exit(1);
+        exit(EXIT_FAILURE);
     };
     using_spice = 1;
 
@@ -831,11 +831,11 @@ void qemu_spice_init(void)
         if ((port != 0) || (tls_port != 0)) {
             error_report("SPICE GL support is local-only for now and "
                          "incompatible with -spice port/tls-port");
-            exit(1);
+            exit(EXIT_FAILURE);
         }
         if (egl_rendernode_init() != 0) {
             error_report("Failed to initialize EGL render node for SPICE GL");
-            exit(1);
+            exit(EXIT_FAILURE);
         }
         display_opengl = 1;
     }
@@ -847,7 +847,7 @@ int qemu_spice_add_interface(SpiceBaseInstance *sin)
     if (!spice_server) {
         if (QTAILQ_FIRST(&qemu_spice_opts.head) != NULL) {
             error_report("Oops: spice configured but not active");
-            exit(1);
+            exit(EXIT_FAILURE);
         }
         /*
          * Create a spice server instance.
diff --git a/ui/vnc.c b/ui/vnc.c
index 76a3273..796d857 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -3154,7 +3154,7 @@ void vnc_display_init(const char *id)
     }
 
     if (!vs->kbd_layout)
-        exit(1);
+        exit(EXIT_FAILURE);
 
     vs->share_policy = VNC_SHARE_POLICY_ALLOW_EXCLUSIVE;
     vs->connections_limit = 32;
@@ -3929,7 +3929,7 @@ int vnc_init_func(void *opaque, QemuOpts *opts, Error **errp)
     vnc_display_open(id, &local_err);
     if (local_err != NULL) {
         error_reportf_err(local_err, "Failed to start VNC server: ");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
     return 0;
 }
-- 
2.5.5


