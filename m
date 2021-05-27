Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lmB09-00035I-0e
	for mharc-qemu-trivial@gnu.org; Thu, 27 May 2021 04:04:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <bounce+e150fe.c2f2fe-qemu-trivial=nongnu.org@mg.ionbox.in>)
 id 1lmB07-00033A-Fp
 for qemu-trivial@nongnu.org; Thu, 27 May 2021 04:04:19 -0400
Received: from m43-9.mailgun.net ([69.72.43.9]:45922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1)
 (envelope-from <bounce+e150fe.c2f2fe-qemu-trivial=nongnu.org@mg.ionbox.in>)
 id 1lmB02-0002x5-OQ
 for qemu-trivial@nongnu.org; Thu, 27 May 2021 04:04:18 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.ionbox.in; q=dns/txt;
 s=mailo; t=1622102655; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=MGkbXwPhQIpmYO1AY/Pk+zemXAjZ1PHMv4PjKMdiMwc=;
 b=BFerZXhtsbLN4/Qe1AegiRRnJC96EgRYc2U85gITAPkyj5p2uz1wi2FKcKSvGqNHpZIV7TCL
 4v/4KY3O6XQ408zdZRtB1uhORQfoNaruyIWcdTHCRsFNmjT55ONveYUEkFMPPQJtbF6amyjU
 sTr8G3G/1s4JaThSxju4hk5zVLlz+ggHK52+JlhZF4Fja5PB9d1Tq1yzZwbB7DTLU3H2Iwnn
 duOk8Wb1NMIiB/I2L5F0BzlwdGCYWgcZnUezTyvO83IGf7997jtS5o6PP+osYv0UT43VJ8YT
 ozjuvC5qqGUWieXess/xHLClE1MiAHOLNq8jta17USQPCCDx4pgbyw==
X-Mailgun-Sending-Ip: 69.72.43.9
X-Mailgun-Sid: WyI5MTBmZiIsICJxZW11LXRyaXZpYWxAbm9uZ251Lm9yZyIsICJjMmYyZmUiXQ==
Received: from mail.ionbox.in (id1.ionbox.in [117.53.47.8]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 60af52698dd30e785f77e200 (version=TLS1.3, cipher=TLS_AES_128_GCM_SHA256);
 Thu, 27 May 2021 08:03:53 GMT
Sender: j1=ionbox.in@mg.ionbox.in
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id AAB0982CC9; Thu, 27 May 2021 15:03:46 +0700 (WIB)
From: James <j1@ionbox.in>
To: qemu-trivial@nongnu.org
Cc: James <j1@ionbox.in>
Subject: [PATCH] ui/gtk: Add an option to disable automatic guest resize
Date: Thu, 27 May 2021 18:02:45 +1000
Message-Id: <20210527080244.3160053-1-j1@ionbox.in>
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
X-List-Received-Date: Thu, 27 May 2021 08:04:19 -0000

This patch added an option in the GTK frontend to disable automatic guest
resize when the host window is resized. The purpose of this is to prevent
resolution change loop when zooming in and/or changing guest resolution.

This patch does not include an option to disable automatic guest resize from
command line, but I can add one if desired. As a result, I've set the option
to be enabled by default.

Signed-off-by: James <j1@ionbox.in>
---
 include/ui/gtk.h |  1 +
 ui/gtk.c         | 21 +++++++++++++++++----
 2 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/include/ui/gtk.h b/include/ui/gtk.h
index 9516670ebc..6d61543226 100644
--- a/include/ui/gtk.h
+++ b/include/ui/gtk.h
@@ -111,6 +111,7 @@ struct GtkDisplayState {
     GtkWidget *zoom_fit_item;
     GtkWidget *grab_item;
     GtkWidget *grab_on_hover_item;
+    GtkWidget *update_on_resize_item;
 
     int nb_vcs;
     VirtualConsole vc[MAX_VCS];
diff --git a/ui/gtk.c b/ui/gtk.c
index 98046f577b..f1a2b67906 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -671,12 +671,15 @@ static gboolean gd_window_close(GtkWidget *widget, GdkEvent *event,
 
 static void gd_set_ui_info(VirtualConsole *vc, gint width, gint height)
 {
+    GtkDisplayState *s = vc->s;
     QemuUIInfo info;
 
-    memset(&info, 0, sizeof(info));
-    info.width = width;
-    info.height = height;
-    dpy_set_ui_info(vc->gfx.dcl.con, &info);
+    if (gtk_check_menu_item_get_active(GTK_CHECK_MENU_ITEM(s->update_on_resize_item))) {
+        memset(&info, 0, sizeof(info));
+        info.width = width;
+        info.height = height;
+        dpy_set_ui_info(vc->gfx.dcl.con, &info);
+    }
 }
 
 #if defined(CONFIG_OPENGL)
@@ -2114,6 +2117,12 @@ static GtkWidget *gd_create_menu_view(GtkDisplayState *s)
     separator = gtk_separator_menu_item_new();
     gtk_menu_shell_append(GTK_MENU_SHELL(view_menu), separator);
 
+    s->update_on_resize_item = gtk_check_menu_item_new_with_mnemonic(_("Update Guest Resolution On Resize"));
+    gtk_menu_shell_append(GTK_MENU_SHELL(view_menu), s->update_on_resize_item);
+
+    separator = gtk_separator_menu_item_new();
+    gtk_menu_shell_append(GTK_MENU_SHELL(view_menu), separator);
+
     /* gfx */
     for (vc = 0;; vc++) {
         con = qemu_console_lookup_by_index(vc);
@@ -2267,6 +2276,10 @@ static void gtk_display_init(DisplayState *ds, DisplayOptions *opts)
         opts->u.gtk.grab_on_hover) {
         gtk_menu_item_activate(GTK_MENU_ITEM(s->grab_on_hover_item));
     }
+
+    /* Follow old behaviour. */
+    gtk_menu_item_activate(GTK_MENU_ITEM(s->update_on_resize_item));
+
     gd_clipboard_init(s);
 }
 
-- 
2.25.1


