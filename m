Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lmEn2-0007Dh-0n
	for mharc-qemu-trivial@gnu.org; Thu, 27 May 2021 08:07:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <bounce+e150fe.c2f2fe-qemu-trivial=nongnu.org@mg.ionbox.in>)
 id 1lmEmv-0007Ah-RX
 for qemu-trivial@nongnu.org; Thu, 27 May 2021 08:06:58 -0400
Received: from m43-9.mailgun.net ([69.72.43.9]:60875)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1)
 (envelope-from <bounce+e150fe.c2f2fe-qemu-trivial=nongnu.org@mg.ionbox.in>)
 id 1lmEmk-0003PZ-6W
 for qemu-trivial@nongnu.org; Thu, 27 May 2021 08:06:57 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.ionbox.in; q=dns/txt;
 s=mailo; t=1622117212; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=wQ99x7tDKGkVBkDfotlZleKi3ihM/VLRz2cnhq9MtC4=;
 b=A+rc0HevgLaMQS8X2yk6zntnz21H2RuL7gs1QTBBQskS/m+zbQppV0Um2/ImYye1KZbxBapA
 h+lRbjpB7cYDY/YArTIlw1k7D/cT/g4CPVAXKSg8Mau+OKcbRWlVKZQiCY2SQOT7xeOxLJBz
 55hlTUn0u0enCAQ7bCT7AUsa0/DX7KBoHKmwi/avPm3asO3sCCdC2RgIoC2ojXedu82aeSZd
 f/7h+f69a0O/9OgS2OnCT3DvXw0dAYde7+RLuWKKQRHYSqZ+OyeNlcn4dt0hCkL/wPgEXdFe
 7Q6aa4rkIN4V4z0Q/toIoGiUcvV862sxs2S5MSZlC7Ec6ICME23zow==
X-Mailgun-Sending-Ip: 69.72.43.9
X-Mailgun-Sid: WyI5MTBmZiIsICJxZW11LXRyaXZpYWxAbm9uZ251Lm9yZyIsICJjMmYyZmUiXQ==
Received: from mail.ionbox.in (id1.ionbox.in [117.53.47.8]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 60af8b4067d156359a229a8b (version=TLS1.3, cipher=TLS_AES_128_GCM_SHA256);
 Thu, 27 May 2021 12:06:24 GMT
Sender: j1=ionbox.in@mg.ionbox.in
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BDC4E836B4; Thu, 27 May 2021 19:06:18 +0700 (WIB)
From: James <j1@ionbox.in>
To: qemu-trivial@nongnu.org
Cc: James <j1@ionbox.in>
Subject: [PATCH] ui/gtk: Properly scale OpenGL content on GTK frontend
Date: Thu, 27 May 2021 22:05:32 +1000
Message-Id: <20210527120531.3268650-1-j1@ionbox.in>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
Received-SPF: pass client-ip=69.72.43.9;
 envelope-from=bounce+e150fe.c2f2fe-qemu-trivial=nongnu.org@mg.ionbox.in;
 helo=m43-9.mailgun.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 27 May 2021 12:06:59 -0000

This patch enables proper aspect ratio scaling on virgl enabled guests on
GTK OpenGL mode (previously guest framebuffer is stretched). This patch also
enables proper HiDPI scaling on the same scenario (previously guest would
appear smaller and resides on bottom-left on the screen if GTK scaling value
is more than 1).

At the moment the glClear function call is commented out. I'm afraid that it
will damage performance on certain GPUs. I think that I will submit another
patch for UI/GTK so that the ww, wh, fbw, fbh, and other values are only
computed when guest resolution changes or the GTK window is resized. What do
you think about this?

Note that this is not to be confused with my previous patch. That one fix
HiDPI scaling when OpenGL mode is enabled, but without virgl support from
guest (e.g. when in BIOS or host's OpenGL failed to initialise).

Signed-off-by: James <j1@ionbox.in>
---
 include/ui/egl-helpers.h |  3 +++
 ui/egl-helpers.c         | 18 ++++++++++++++++--
 ui/gtk-egl.c             | 32 ++++++++++++++++++++++++--------
 3 files changed, 43 insertions(+), 10 deletions(-)

diff --git a/include/ui/egl-helpers.h b/include/ui/egl-helpers.h
index f1bf8f97fc..76c3932b41 100644
--- a/include/ui/egl-helpers.h
+++ b/include/ui/egl-helpers.h
@@ -16,6 +16,8 @@ extern DisplayGLMode qemu_egl_mode;
 typedef struct egl_fb {
     int width;
     int height;
+    int offset_x;
+    int offset_y;
     GLuint texture;
     GLuint framebuffer;
     bool delete_texture;
@@ -27,6 +29,7 @@ void egl_fb_setup_for_tex(egl_fb *fb, int width, int height,
                           GLuint texture, bool delete);
 void egl_fb_setup_new_tex(egl_fb *fb, int width, int height);
 void egl_fb_blit(egl_fb *dst, egl_fb *src, bool flip);
+void egl_fb_clear(egl_fb *dst);
 void egl_fb_read(DisplaySurface *dst, egl_fb *src);
 
 void egl_texture_blit(QemuGLShader *gls, egl_fb *dst, egl_fb *src, bool flip);
diff --git a/ui/egl-helpers.c b/ui/egl-helpers.c
index 6d0cb2b5cb..e4cf100a74 100644
--- a/ui/egl-helpers.c
+++ b/ui/egl-helpers.c
@@ -47,6 +47,8 @@ void egl_fb_destroy(egl_fb *fb)
 
     fb->width = 0;
     fb->height = 0;
+    fb->offset_x = 0;
+    fb->offset_y = 0;
     fb->texture = 0;
     fb->framebuffer = 0;
 }
@@ -55,6 +57,8 @@ void egl_fb_setup_default(egl_fb *fb, int width, int height)
 {
     fb->width = width;
     fb->height = height;
+    fb->offset_x = 0;
+    fb->offset_y = 0;
     fb->framebuffer = 0; /* default framebuffer */
 }
 
@@ -65,6 +69,8 @@ void egl_fb_setup_for_tex(egl_fb *fb, int width, int height,
 
     fb->width = width;
     fb->height = height;
+    fb->offset_x = 0;
+    fb->offset_y = 0;
     fb->texture = texture;
     fb->delete_texture = delete;
     if (!fb->framebuffer) {
@@ -94,14 +100,22 @@ void egl_fb_blit(egl_fb *dst, egl_fb *src, bool flip)
 
     glBindFramebuffer(GL_READ_FRAMEBUFFER, src->framebuffer);
     glBindFramebuffer(GL_DRAW_FRAMEBUFFER, dst->framebuffer);
-    glViewport(0, 0, dst->width, dst->height);
+    glViewport(dst->offset_x, dst->offset_y, 
+               dst->width + dst->offset_x, dst->height + dst->offset_y);
     y1 = flip ? src->height : 0;
     y2 = flip ? 0 : src->height;
     glBlitFramebuffer(0, y1, src->width, y2,
-                      0, 0, dst->width, dst->height,
+                      dst->offset_x, dst->offset_y,
+                      dst->width + dst->offset_x, dst->height + dst->offset_y,
                       GL_COLOR_BUFFER_BIT, GL_LINEAR);
 }
 
+void egl_fb_clear(egl_fb *dst)
+{
+    glBindFramebuffer(GL_DRAW_FRAMEBUFFER, dst->framebuffer);
+    glClear(GL_COLOR_BUFFER_BIT);
+}
+
 void egl_fb_read(DisplaySurface *dst, egl_fb *src)
 {
     glBindFramebuffer(GL_READ_FRAMEBUFFER, src->framebuffer);
diff --git a/ui/gtk-egl.c b/ui/gtk-egl.c
index 2a2e6d3a17..c440434b4c 100644
--- a/ui/gtk-egl.c
+++ b/ui/gtk-egl.c
@@ -62,7 +62,8 @@ void gd_egl_init(VirtualConsole *vc)
 void gd_egl_draw(VirtualConsole *vc)
 {
     GdkWindow *window;
-    int ww, wh;
+    int ww, wh, wsf;
+    double scale;
 
     if (!vc->gfx.gls) {
         return;
@@ -71,12 +72,15 @@ void gd_egl_draw(VirtualConsole *vc)
     window = gtk_widget_get_window(vc->gfx.drawing_area);
     ww = gdk_window_get_width(window);
     wh = gdk_window_get_height(window);
+    wsf = gdk_window_get_scale_factor(window);
 
     if (vc->gfx.scanout_mode) {
         gd_egl_scanout_flush(&vc->gfx.dcl, 0, 0, vc->gfx.w, vc->gfx.h);
 
-        vc->gfx.scale_x = (double)ww / vc->gfx.w;
-        vc->gfx.scale_y = (double)wh / vc->gfx.h;
+        scale = MIN((double)ww / vc->gfx.w, (double)wh / vc->gfx.h);
+        vc->gfx.scale_x = scale;
+        vc->gfx.scale_y = scale;
+
     } else {
         if (!vc->gfx.ds) {
             return;
@@ -84,7 +88,7 @@ void gd_egl_draw(VirtualConsole *vc)
         eglMakeCurrent(qemu_egl_display, vc->gfx.esurface,
                        vc->gfx.esurface, vc->gfx.ectx);
 
-        surface_gl_setup_viewport(vc->gfx.gls, vc->gfx.ds, ww, wh);
+        surface_gl_setup_viewport(vc->gfx.gls, vc->gfx.ds, ww * wsf, wh * wsf);
         surface_gl_render_texture(vc->gfx.gls, vc->gfx.ds);
 
         eglSwapBuffers(qemu_egl_display, vc->gfx.esurface);
@@ -262,7 +266,8 @@ void gd_egl_scanout_flush(DisplayChangeListener *dcl,
 {
     VirtualConsole *vc = container_of(dcl, VirtualConsole, gfx.dcl);
     GdkWindow *window;
-    int ww, wh;
+    int ww, wh, wsf;
+    int fbw, fbh;
 
     if (!vc->gfx.scanout_mode) {
         return;
@@ -275,9 +280,18 @@ void gd_egl_scanout_flush(DisplayChangeListener *dcl,
                    vc->gfx.esurface, vc->gfx.ectx);
 
     window = gtk_widget_get_window(vc->gfx.drawing_area);
-    ww = gdk_window_get_width(window);
-    wh = gdk_window_get_height(window);
-    egl_fb_setup_default(&vc->gfx.win_fb, ww, wh);
+    wsf = gdk_window_get_scale_factor(window);
+    ww = gdk_window_get_width(window) * wsf;
+    wh = gdk_window_get_height(window) * wsf;
+    fbw = wsf * vc->gfx.guest_fb.width * vc->gfx.scale_x;
+    fbh = wsf * vc->gfx.guest_fb.height * vc->gfx.scale_y;
+    egl_fb_setup_default(&vc->gfx.win_fb, fbw, fbh);
+    if (ww > fbw) {
+        vc->gfx.win_fb.offset_x = (ww - fbw) / 2;
+    } else {
+        vc->gfx.win_fb.offset_y = (wh - fbh) / 2;
+    }
+    
     if (vc->gfx.cursor_fb.texture) {
         egl_texture_blit(vc->gfx.gls, &vc->gfx.win_fb, &vc->gfx.guest_fb,
                          vc->gfx.y0_top);
@@ -286,6 +300,8 @@ void gd_egl_scanout_flush(DisplayChangeListener *dcl,
                           vc->gfx.cursor_x, vc->gfx.cursor_y,
                           vc->gfx.scale_x, vc->gfx.scale_y);
     } else {
+        /* will enable this on later patches */
+        /* egl_fb_clear(&vc->gfx.win_fb); */
         egl_fb_blit(&vc->gfx.win_fb, &vc->gfx.guest_fb, !vc->gfx.y0_top);
     }
 
-- 
2.25.1


