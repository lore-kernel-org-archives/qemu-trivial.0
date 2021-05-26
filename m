Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lltYI-0002LK-88
	for mharc-qemu-trivial@gnu.org; Wed, 26 May 2021 09:26:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <bounce+e150fe.c2f2fe-qemu-trivial=nongnu.org@mg.ionbox.in>)
 id 1lltDS-0006Fc-Hv
 for qemu-trivial@nongnu.org; Wed, 26 May 2021 09:04:54 -0400
Received: from so254-33.mailgun.net ([198.61.254.33]:56712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1)
 (envelope-from <bounce+e150fe.c2f2fe-qemu-trivial=nongnu.org@mg.ionbox.in>)
 id 1lltDK-0005uz-0b
 for qemu-trivial@nongnu.org; Wed, 26 May 2021 09:04:54 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.ionbox.in; q=dns/txt;
 s=mailo; t=1622034290; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=OLNcZu1I595pRaKIOEt4LMrGX1wH+bVkTb4YHXgQoQY=;
 b=PrbGGtxFX1WrTA9ui95ZbH3P5m/j93A58aUkmUvqhnxdwTpsIXj2dvtGpTAu3ctn1QnDZIqQ
 P+/O2zwzBu7XqQ1tTZER5Vff0eeO8aR0kqr2tbtFPooUuccqYQE9yOqA2orR3zJwW6lkRr+e
 VUOZ7LumHtve+yFvQTEjzKMYnGpuH4A87yM3gDd1T9H8k+vEtPWuTfoJuU+d055MQeTZPpYy
 Xo+E6Mjn12la75rn3q/yapWVU/xaSJ3Djmwlb1ILmAjkGjhEFIErI54VU/V+c6JZRpROJOQO
 7NVdNsEYt08yuV2FPctjZAvlqn4x/kxTu279GNqak+8iOY9z45uLBA==
X-Mailgun-Sending-Ip: 198.61.254.33
X-Mailgun-Sid: WyI5MTBmZiIsICJxZW11LXRyaXZpYWxAbm9uZ251Lm9yZyIsICJjMmYyZmUiXQ==
Received: from mail.ionbox.in (id1.ionbox.in [117.53.47.8]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 60ae474867d156359a2cfd6d (version=TLS1.3, cipher=TLS_AES_128_GCM_SHA256);
 Wed, 26 May 2021 13:04:08 GMT
Sender: j1=ionbox.in@mg.ionbox.in
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id AD64A82CAC; Wed, 26 May 2021 20:04:03 +0700 (WIB)
From: James <j1@ionbox.in>
To: qemu-trivial@nongnu.org
Cc: James <j1@ionbox.in>
Subject: [PATCH] ui/gtk: Scale OpenGL content on GTK frontend on HiDPI
Date: Wed, 26 May 2021 23:03:18 +1000
Message-Id: <20210526130317.2903551-1-j1@ionbox.in>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
Received-SPF: pass client-ip=198.61.254.33;
 envelope-from=bounce+e150fe.c2f2fe-qemu-trivial=nongnu.org@mg.ionbox.in;
 helo=so254-33.mailgun.net
X-Spam_score_int: 0
X-Spam_score: -0.0
X-Spam_bar: /
X-Spam_report: (-0.0 / 5.0 requ) BAYES_20=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 26 May 2021 09:26:23 -0400
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
X-List-Received-Date: Wed, 26 May 2021 13:04:54 -0000

This patch will make Qemu's GTK frontend scales the rendered OpenGL content
by an integer scaling factor given by GDK. Without this patch, guest's
content will be rendered at bottom left corner when both HiDPI scaling and
OpenGL is enabled.

Signed-off-by: James <j1@ionbox.in>
---
 ui/gtk-egl.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/ui/gtk-egl.c b/ui/gtk-egl.c
index 2a2e6d3a17..a6b24c1e2d 100644
--- a/ui/gtk-egl.c
+++ b/ui/gtk-egl.c
@@ -62,7 +62,7 @@ void gd_egl_init(VirtualConsole *vc)
 void gd_egl_draw(VirtualConsole *vc)
 {
     GdkWindow *window;
-    int ww, wh;
+    int ww, wh, wsf;
 
     if (!vc->gfx.gls) {
         return;
@@ -71,6 +71,7 @@ void gd_egl_draw(VirtualConsole *vc)
     window = gtk_widget_get_window(vc->gfx.drawing_area);
     ww = gdk_window_get_width(window);
     wh = gdk_window_get_height(window);
+    wsf = gdk_window_get_scale_factor(window);
 
     if (vc->gfx.scanout_mode) {
         gd_egl_scanout_flush(&vc->gfx.dcl, 0, 0, vc->gfx.w, vc->gfx.h);
@@ -84,7 +85,7 @@ void gd_egl_draw(VirtualConsole *vc)
         eglMakeCurrent(qemu_egl_display, vc->gfx.esurface,
                        vc->gfx.esurface, vc->gfx.ectx);
 
-        surface_gl_setup_viewport(vc->gfx.gls, vc->gfx.ds, ww, wh);
+        surface_gl_setup_viewport(vc->gfx.gls, vc->gfx.ds, ww * wsf, wh * wsf);
         surface_gl_render_texture(vc->gfx.gls, vc->gfx.ds);
 
         eglSwapBuffers(qemu_egl_display, vc->gfx.esurface);
-- 
2.25.1


