Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fFcs4-0002Gt-8E
	for mharc-qemu-trivial@gnu.org; Mon, 07 May 2018 05:55:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45253)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1fFcrz-0002Bk-EN
	for qemu-trivial@nongnu.org; Mon, 07 May 2018 05:55:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1fFcry-0005Ic-JP
	for qemu-trivial@nongnu.org; Mon, 07 May 2018 05:55:47 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:41654 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1fFcrv-0005E3-W7; Mon, 07 May 2018 05:55:44 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 80B23406E970;
	Mon,  7 May 2018 09:55:43 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-99.ams2.redhat.com
	[10.36.116.99])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 547C3111F3DA;
	Mon,  7 May 2018 09:55:40 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id B2ECF51BA8; Mon,  7 May 2018 11:55:39 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>, Markus Armbruster <armbru@redhat.com>
Date: Mon,  7 May 2018 11:55:38 +0200
Message-Id: <20180507095539.19584-4-kraxel@redhat.com>
In-Reply-To: <20180507095539.19584-1-kraxel@redhat.com>
References: <20180507095539.19584-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Mon, 07 May 2018 09:55:43 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Mon, 07 May 2018 09:55:43 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'kraxel@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-trivial] [PATCH v2 3/4] ui: switch gtk display to qapi parser
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
X-List-Received-Date: Mon, 07 May 2018 09:55:48 -0000

Drop the gtk option parser from parse_display(), so parse_display_qapi()
will handle it instead.

With this change the parser will accept gl=core and gl=es too, gtk
must catch the unsupported gles variant now.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/gtk.c |  6 +++++-
 vl.c     | 32 --------------------------------
 2 files changed, 5 insertions(+), 33 deletions(-)

diff --git a/ui/gtk.c b/ui/gtk.c
index bb3214cffb..7859b506ea 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -2434,7 +2434,11 @@ static void early_gtk_display_init(DisplayOptions *opts)
     }
 
     assert(opts->type == DISPLAY_TYPE_GTK);
-    if (opts->has_gl && opts->gl) {
+    if (opts->has_gl && opts->gl != DISPLAYGL_MODE_OFF) {
+        if (opts->gl == DISPLAYGL_MODE_ES) {
+            error_report("gtk: opengl es not supported");
+            return;
+        }
 #if defined(CONFIG_OPENGL)
 #if defined(CONFIG_GTK_GL) && defined(GDK_WINDOWING_WAYLAND)
         if (GDK_IS_WAYLAND_DISPLAY(gdk_display_get_default())) {
diff --git a/vl.c b/vl.c
index 1bd6758f3a..03ac9a2cbb 100644
--- a/vl.c
+++ b/vl.c
@@ -2185,38 +2185,6 @@ static void parse_display(const char *p)
             error_report("VNC requires a display argument vnc=<display>");
             exit(1);
         }
-    } else if (strstart(p, "gtk", &opts)) {
-        dpy.type = DISPLAY_TYPE_GTK;
-        while (*opts) {
-            const char *nextopt;
-
-            if (strstart(opts, ",grab_on_hover=", &nextopt)) {
-                opts = nextopt;
-                dpy.u.gtk.has_grab_on_hover = true;
-                if (strstart(opts, "on", &nextopt)) {
-                    dpy.u.gtk.grab_on_hover = true;
-                } else if (strstart(opts, "off", &nextopt)) {
-                    dpy.u.gtk.grab_on_hover = false;
-                } else {
-                    goto invalid_gtk_args;
-                }
-            } else if (strstart(opts, ",gl=", &nextopt)) {
-                opts = nextopt;
-                dpy.has_gl = true;
-                if (strstart(opts, "on", &nextopt)) {
-                    dpy.gl = DISPLAYGL_MODE_ON;
-                } else if (strstart(opts, "off", &nextopt)) {
-                    dpy.gl = DISPLAYGL_MODE_OFF;
-                } else {
-                    goto invalid_gtk_args;
-                }
-            } else {
-            invalid_gtk_args:
-                error_report("invalid GTK option string");
-                exit(1);
-            }
-            opts = nextopt;
-        }
     } else {
         parse_display_qapi(p);
     }
-- 
2.9.3


