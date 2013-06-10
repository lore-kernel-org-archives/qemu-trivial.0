Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Um6T2-0002eN-Kl
	for mharc-qemu-trivial@gnu.org; Mon, 10 Jun 2013 14:05:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34911)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lekensteyn@gmail.com>) id 1Um6So-0002KA-Hp
	for qemu-trivial@nongnu.org; Mon, 10 Jun 2013 14:05:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lekensteyn@gmail.com>) id 1Um6Sf-0006Ip-WA
	for qemu-trivial@nongnu.org; Mon, 10 Jun 2013 14:05:06 -0400
Received: from mail-wi0-x235.google.com ([2a00:1450:400c:c05::235]:61046)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lekensteyn@gmail.com>)
	id 1Um6SV-0006EU-Uj; Mon, 10 Jun 2013 14:04:48 -0400
Received: by mail-wi0-f181.google.com with SMTP id hq4so1167608wib.14
	for <multiple recipients>; Mon, 10 Jun 2013 11:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:user-agent:mime-version
	:content-transfer-encoding:content-type;
	bh=UAOwuyKhYrSxRblTrmPP9uSEX/d5i+LDUTbtx00pkeQ=;
	b=f568lXLNIS2kw04Rcxr64CYExa9WABmoWdtJXgWQ6Wpg/0qFus2RXJjEXD9W4VNrby
	0THLdoNGIv+YjzcV9oJ3o6AqXJYvYkr5bWH9rQ//4K9BrMNnTkE+03YArlRZRUxnd8vJ
	SHdBoGIJuaq6I7C0qlIm1rhUDdKHNk7Y2RkOJ6fqJo1wj2ZvQHm2IvKu0hRMw3QgGK7o
	rcTaACtbQf2MWLWMqlfRCMA1eY63GwbeSZC9CUYla/Ml2uZU6slYrT6JnLf61uQR5vjE
	SOJNo2X3jvRWtFGy7nLXX/aYyX9z2Vhk6Yja1yfqMlIwDh9WedqcylaO5mM//FcfPIdR
	z/tg==
X-Received: by 10.180.185.225 with SMTP id ff1mr5287123wic.36.1370887487062;
	Mon, 10 Jun 2013 11:04:47 -0700 (PDT)
Received: from al.localnet (al.lekensteyn.nl. [2001:470:1f15:b83::c0d1:f1ed])
	by mx.google.com with ESMTPSA id
	d10sm13099013wik.0.2013.06.10.11.04.45 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 10 Jun 2013 11:04:46 -0700 (PDT)
From: Peter Wu <lekensteyn@gmail.com>
To: Anthony Liguori <aliguori@us.ibm.com>
Date: Mon, 10 Jun 2013 20:04:43 +0200
Message-ID: <1502140.O0l1epaFmp@al>
User-Agent: KMail/4.10.4 (Linux/3.9.1-1-custom; KDE/4.10.4; x86_64; ; )
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::235
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH v2] gtk: implement -full-screen
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
X-List-Received-Date: Mon, 10 Jun 2013 18:05:19 -0000

Aiming for GTK as replacement for SDL, a feature like -full-screen should also
be implemented.

Bringing the window into full-screen mode is done by activating the "Fullscreen"
menu item. This is done after showing the windows to make the cursor and menu
hidden.

v2: drop -no-frame implementation, use booleans instead of ints and ensure
    consistency between ui state and menu.

Signed-off-by: Peter Wu <lekensteyn@gmail.com>
---
 include/ui/console.h | 2 +-
 ui/gtk.c             | 6 +++++-
 vl.c                 | 2 +-
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
index 3bc2842..1c625c0 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -1433,7 +1433,7 @@ static const DisplayChangeListenerOps dcl_ops = {
     .dpy_cursor_define = gd_cursor_define,
 };
 
-void gtk_display_init(DisplayState *ds)
+void gtk_display_init(DisplayState *ds, bool full_screen)
 {
     GtkDisplayState *s = g_malloc0(sizeof(*s));
     char *filename;
@@ -1509,6 +1509,10 @@ void gtk_display_init(DisplayState *ds)
 
     gtk_widget_show_all(s->window);
 
+    if (full_screen) {
+        gtk_menu_item_activate(GTK_MENU_ITEM(s->full_screen_item));
+    }
+
     register_displaychangelistener(&s->dcl);
 
     global_state = s;
diff --git a/vl.c b/vl.c
index 47ab45d..cfd2d3e 100644
--- a/vl.c
+++ b/vl.c
@@ -4347,7 +4347,7 @@ int main(int argc, char **argv, char **envp)
 #endif
 #if defined(CONFIG_GTK)
     case DT_GTK:
-        gtk_display_init(ds);
+        gtk_display_init(ds, full_screen);
         break;
 #endif
     default:
-- 
1.8.3


