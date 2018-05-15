Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fIW74-0004Oy-0e
	for mharc-qemu-trivial@gnu.org; Tue, 15 May 2018 05:19:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48701)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1fIW6y-0004Hs-L6
	for qemu-trivial@nongnu.org; Tue, 15 May 2018 05:19:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1fIW6x-0001ZC-HK
	for qemu-trivial@nongnu.org; Tue, 15 May 2018 05:19:12 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:34946 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1fIW6t-0001VD-2t; Tue, 15 May 2018 05:19:07 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 727E741AE7D1;
	Tue, 15 May 2018 09:19:06 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-49.ams2.redhat.com
	[10.36.116.49])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 764C7112D18C;
	Tue, 15 May 2018 09:19:02 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id B2EBA3EBB6; Tue, 15 May 2018 11:19:01 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>, Peter Wu <peter@lekensteyn.nl>
Date: Tue, 15 May 2018 11:18:53 +0200
Message-Id: <20180515091901.27774-3-kraxel@redhat.com>
In-Reply-To: <20180515091901.27774-1-kraxel@redhat.com>
References: <20180515091901.27774-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Tue, 15 May 2018 09:19:06 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Tue, 15 May 2018 09:19:06 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'kraxel@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-trivial] [PULL 02/10] gtk: make it possible to hide the menu
 bar
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
X-List-Received-Date: Tue, 15 May 2018 09:19:13 -0000

From: Peter Wu <peter@lekensteyn.nl>

Saves some space and disables the F10 button as side-effect.

Fixes: https://bugs.launchpad.net/qemu/+bug/1726910
Signed-off-by: Peter Wu <peter@lekensteyn.nl>
Message-Id: <20180510230739.28459-1-peter@lekensteyn.nl>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/gtk.c | 46 +++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 45 insertions(+), 1 deletion(-)

diff --git a/ui/gtk.c b/ui/gtk.c
index bb3214cffb..9e5390f2c2 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -145,6 +145,7 @@
 #define GDK_KEY_2 GDK_2
 #define GDK_KEY_f GDK_f
 #define GDK_KEY_g GDK_g
+#define GDK_KEY_m GDK_m
 #define GDK_KEY_q GDK_q
 #define GDK_KEY_plus GDK_plus
 #define GDK_KEY_equal GDK_equal
@@ -208,6 +209,7 @@ struct GtkDisplayState {
 
     GtkWidget *show_tabs_item;
     GtkWidget *untabify_item;
+    GtkWidget *show_menubar_item;
 
     GtkWidget *vbox;
     GtkWidget *notebook;
@@ -1387,6 +1389,30 @@ static void gd_menu_untabify(GtkMenuItem *item, void *opaque)
     }
 }
 
+static void gd_menu_show_menubar(GtkMenuItem *item, void *opaque)
+{
+    GtkDisplayState *s = opaque;
+    VirtualConsole *vc = gd_vc_find_current(s);
+
+    if (s->full_screen) {
+        return;
+    }
+
+    if (gtk_check_menu_item_get_active(
+                GTK_CHECK_MENU_ITEM(s->show_menubar_item))) {
+        gtk_widget_show(s->menu_bar);
+    } else {
+        gtk_widget_hide(s->menu_bar);
+    }
+    gd_update_windowsize(vc);
+}
+
+static void gd_accel_show_menubar(void *opaque)
+{
+    GtkDisplayState *s = opaque;
+    gtk_menu_item_activate(GTK_MENU_ITEM(s->show_menubar_item));
+}
+
 static void gd_menu_full_screen(GtkMenuItem *item, void *opaque)
 {
     GtkDisplayState *s = opaque;
@@ -1403,7 +1429,10 @@ static void gd_menu_full_screen(GtkMenuItem *item, void *opaque)
     } else {
         gtk_window_unfullscreen(GTK_WINDOW(s->window));
         gd_menu_show_tabs(GTK_MENU_ITEM(s->show_tabs_item), s);
-        gtk_widget_show(s->menu_bar);
+        if (gtk_check_menu_item_get_active(
+                    GTK_CHECK_MENU_ITEM(s->show_menubar_item))) {
+            gtk_widget_show(s->menu_bar);
+        }
         s->full_screen = FALSE;
         if (vc->type == GD_VC_GFX) {
             vc->gfx.scale_x = 1.0;
@@ -2036,6 +2065,8 @@ static void gd_connect_signals(GtkDisplayState *s)
                      G_CALLBACK(gd_menu_show_tabs), s);
     g_signal_connect(s->untabify_item, "activate",
                      G_CALLBACK(gd_menu_untabify), s);
+    g_signal_connect(s->show_menubar_item, "activate",
+                     G_CALLBACK(gd_menu_show_menubar), s);
 
     g_signal_connect(s->window, "delete-event",
                      G_CALLBACK(gd_window_close), s);
@@ -2272,6 +2303,19 @@ static GtkWidget *gd_create_menu_view(GtkDisplayState *s)
     s->untabify_item = gtk_menu_item_new_with_mnemonic(_("Detach Tab"));
     gtk_menu_shell_append(GTK_MENU_SHELL(view_menu), s->untabify_item);
 
+    s->show_menubar_item = gtk_check_menu_item_new_with_mnemonic(
+            _("Show Menubar"));
+    gtk_check_menu_item_set_active(GTK_CHECK_MENU_ITEM(s->show_menubar_item),
+                                   TRUE);
+    gtk_accel_group_connect(s->accel_group, GDK_KEY_m, HOTKEY_MODIFIERS, 0,
+            g_cclosure_new_swap(G_CALLBACK(gd_accel_show_menubar), s, NULL));
+#if GTK_CHECK_VERSION(3, 8, 0)
+    gtk_accel_label_set_accel(
+            GTK_ACCEL_LABEL(gtk_bin_get_child(GTK_BIN(s->show_menubar_item))),
+            GDK_KEY_m, HOTKEY_MODIFIERS);
+#endif
+    gtk_menu_shell_append(GTK_MENU_SHELL(view_menu), s->show_menubar_item);
+
     return view_menu;
 }
 
-- 
2.9.3


