Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UnRgu-00046V-UV
	for mharc-qemu-trivial@gnu.org; Fri, 14 Jun 2013 06:57:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56590)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UnRgp-0003vQ-Ne
	for qemu-trivial@nongnu.org; Fri, 14 Jun 2013 06:57:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UnRgn-0006NY-Eq
	for qemu-trivial@nongnu.org; Fri, 14 Jun 2013 06:57:07 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:34929)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1UnRgi-0006DH-BJ; Fri, 14 Jun 2013 06:57:00 -0400
Received: from gandalf.tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 912AE41660;
	Fri, 14 Jun 2013 14:56:59 +0400 (MSK)
Received: by gandalf.tls.msk.ru (Postfix, from userid 1000)
	id 7968851B; Fri, 14 Jun 2013 14:50:47 +0400 (MSK)
From: Michael Tokarev <mjt@tls.msk.ru>
To: Anthony Liguori <aliguori@us.ibm.com>
Date: Fri, 14 Jun 2013 14:50:26 +0400
Message-Id: <1371207042-17980-11-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1371207042-17980-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1371207042-17980-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Peter Wu <lekensteyn@gmail.com>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 10/26] gtk: implement -full-screen
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
X-List-Received-Date: Fri, 14 Jun 2013 10:57:09 -0000

From: Peter Wu <lekensteyn@gmail.com>

Aiming for GTK as replacement for SDL, a feature like -full-screen should also
be implemented.

Bringing the window into full-screen mode is done by activating the "Fullscreen"
menu item. This is done after showing the windows to make the cursor and menu
hidden.

v2: drop -no-frame implementation, use booleans instead of ints and ensure
    consistency between ui state and menu.

Signed-off-by: Peter Wu <lekensteyn@gmail.com>
Reviewed-by: Anthony Liguori <aliguori@us.ibm.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 include/ui/console.h |    2 +-
 ui/gtk.c             |    6 +++++-
 vl.c                 |    2 +-
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/include/ui/console.h b/include/ui/console.h
index 4307b5f..f1d79f9 100644
--- a/include/ui/console.h
+++ b/include/ui/console.h
@@ -339,6 +339,6 @@ int index_from_keycode(int code);
 
 /* gtk.c */
 void early_gtk_display_init(void);
-void gtk_display_init(DisplayState *ds);
+void gtk_display_init(DisplayState *ds, bool full_screen);
 
 #endif
diff --git a/ui/gtk.c b/ui/gtk.c
index 63f6081..e314dba 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -1435,7 +1435,7 @@ static const DisplayChangeListenerOps dcl_ops = {
     .dpy_cursor_define = gd_cursor_define,
 };
 
-void gtk_display_init(DisplayState *ds)
+void gtk_display_init(DisplayState *ds, bool full_screen)
 {
     GtkDisplayState *s = g_malloc0(sizeof(*s));
     char *filename;
@@ -1511,6 +1511,10 @@ void gtk_display_init(DisplayState *ds)
 
     gtk_widget_show_all(s->window);
 
+    if (full_screen) {
+        gtk_menu_item_activate(GTK_MENU_ITEM(s->full_screen_item));
+    }
+
     register_displaychangelistener(&s->dcl);
 
     global_state = s;
diff --git a/vl.c b/vl.c
index 180fdde..169c807 100644
--- a/vl.c
+++ b/vl.c
@@ -4348,7 +4348,7 @@ int main(int argc, char **argv, char **envp)
 #endif
 #if defined(CONFIG_GTK)
     case DT_GTK:
-        gtk_display_init(ds);
+        gtk_display_init(ds, full_screen);
         break;
 #endif
     default:
-- 
1.7.10.4


