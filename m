Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ulctr-0007K2-Fe
	for mharc-qemu-trivial@gnu.org; Sun, 09 Jun 2013 06:31:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42902)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lekensteyn@gmail.com>) id 1Ulctm-0007D7-29
	for qemu-trivial@nongnu.org; Sun, 09 Jun 2013 06:31:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lekensteyn@gmail.com>) id 1Ulctj-0005Mh-Av
	for qemu-trivial@nongnu.org; Sun, 09 Jun 2013 06:30:57 -0400
Received: from mail-we0-x22f.google.com ([2a00:1450:400c:c03::22f]:51836)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lekensteyn@gmail.com>)
	id 1Ulcte-0005MK-7e; Sun, 09 Jun 2013 06:30:50 -0400
Received: by mail-we0-f175.google.com with SMTP id t59so4164807wes.34
	for <multiple recipients>; Sun, 09 Jun 2013 03:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:user-agent:mime-version
	:content-transfer-encoding:content-type;
	bh=JnaJaDpu3EscMaQUEZ3mW30MaABfJyAX5Fq7cc+tFp8=;
	b=GDozdnx0tEa9mAxnhQdB4lUOBzPUkuluFX9KHRkTsHUw3U7BXU0JexaOvncLLkvMqh
	k5AP7YHL+qlBQ7HBMxo7k6Pd7zqZjKpB79HwKnOJqIrQMBl/A/Zep3k1vONsixJn2fEu
	6KBtzAX4iiIUWZnDkkp7gT3VoVUtUccn67yI1op265eINQg3SxY2zIuj546T+Yv//UR5
	wt4LI7seC0z2VENW7bd2PmXBZRRPON2l1mOYS41mT5uhKDE+Rku8G4Bl2RZbp5FiWkCh
	mnxZnPm6TbCEGsgxcagNC751UQnutBtv6rfBrlXfd9A0pFeD9uTv+oydulsYh/TZbcJG
	p9CA==
X-Received: by 10.180.189.41 with SMTP id gf9mr2417257wic.32.1370773849129;
	Sun, 09 Jun 2013 03:30:49 -0700 (PDT)
Received: from al.localnet (al.lekensteyn.nl. [2001:470:1f15:b83::c0d1:f1ed])
	by mx.google.com with ESMTPSA id
	ft10sm5495661wib.7.2013.06.09.03.30.47 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 09 Jun 2013 03:30:48 -0700 (PDT)
From: Peter Wu <lekensteyn@gmail.com>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Sun, 09 Jun 2013 12:30:45 +0200
Message-ID: <11837115.9GZ72nQAUt@al>
User-Agent: KMail/4.10.4 (Linux/3.9.1-1-custom; KDE/4.10.4; x86_64; ; )
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c03::22f
Cc: Anthony Liguori <aliguori@us.ibm.com>
Subject: [Qemu-trivial] [PATCH] gtk: implement -full-screen and -no-frame
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
X-List-Received-Date: Sun, 09 Jun 2013 10:31:01 -0000

Aiming for GTK as replacement for SDL, features like -full-screen and -no-frame
should also be implemented.

Bringing the window into full-screen mode is done by faking activating the full
screen menu item with a NULL menu item (which currently is not used by
gd_menu_full_screen). This is done after showing the windows to make the cursor
and menu hidden.

Signed-off-by: Peter Wu <lekensteyn@gmail.com>
---
 include/ui/console.h |  2 +-
 ui/gtk.c             | 10 +++++++++-
 vl.c                 |  2 +-
 3 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/include/ui/console.h b/include/ui/console.h
index 4307b5f..7174ba9 100644
--- a/include/ui/console.h
+++ b/include/ui/console.h
@@ -339,6 +339,6 @@ int index_from_keycode(int code);
 
 /* gtk.c */
 void early_gtk_display_init(void);
-void gtk_display_init(DisplayState *ds);
+void gtk_display_init(DisplayState *ds, int full_screen, int no_frame);
 
 #endif
diff --git a/ui/gtk.c b/ui/gtk.c
index 3bc2842..3df2611 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -1433,7 +1433,7 @@ static const DisplayChangeListenerOps dcl_ops = {
     .dpy_cursor_define = gd_cursor_define,
 };
 
-void gtk_display_init(DisplayState *ds)
+void gtk_display_init(DisplayState *ds, int full_screen, int no_frame)
 {
     GtkDisplayState *s = g_malloc0(sizeof(*s));
     char *filename;
@@ -1457,6 +1457,10 @@ void gtk_display_init(DisplayState *ds)
     s->scale_y = 1.0;
     s->free_scale = FALSE;
 
+    if (no_frame) {
+        gtk_window_set_decorated(GTK_WINDOW(s->window), FALSE);
+    }
+
     setlocale(LC_ALL, "");
     bindtextdomain("qemu", CONFIG_QEMU_LOCALEDIR);
     textdomain("qemu");
@@ -1509,6 +1513,10 @@ void gtk_display_init(DisplayState *ds)
 
     gtk_widget_show_all(s->window);
 
+    if (full_screen) {
+        gd_menu_full_screen(NULL, s);
+    }
+
     register_displaychangelistener(&s->dcl);
 
     global_state = s;
diff --git a/vl.c b/vl.c
index 47ab45d..5a00710 100644
--- a/vl.c
+++ b/vl.c
@@ -4347,7 +4347,7 @@ int main(int argc, char **argv, char **envp)
 #endif
 #if defined(CONFIG_GTK)
     case DT_GTK:
-        gtk_display_init(ds);
+        gtk_display_init(ds, full_screen, no_frame);
         break;
 #endif
     default:
-- 
1.8.3



