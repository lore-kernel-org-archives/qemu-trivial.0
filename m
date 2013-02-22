Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1U8zl7-0001uI-0C
	for mharc-qemu-trivial@gnu.org; Fri, 22 Feb 2013 16:02:21 -0500
Received: from eggs.gnu.org ([208.118.235.92]:51669)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1U8wcs-0000EW-Ro
	for qemu-trivial@nongnu.org; Fri, 22 Feb 2013 12:41:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1U8wcI-0001W0-HE
	for qemu-trivial@nongnu.org; Fri, 22 Feb 2013 12:41:07 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:40936)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1U8wcA-0001TL-4H; Fri, 22 Feb 2013 12:40:54 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	94FC97280047; Fri, 22 Feb 2013 18:40:51 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id Ze9ZvrfFbU7r; Fri, 22 Feb 2013 18:40:47 +0100 (CET)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id EDDCE728004A; Fri, 22 Feb 2013 18:40:46 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org
Date: Fri, 22 Feb 2013 18:40:44 +0100
Message-Id: <1361554844-21054-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Anthony Liguori <aliguori@us.ibm.com>
Subject: [Qemu-trivial] =?utf-8?q?=5BPATCH=5D_ui/gtk=3A_Use_menu_item_from?=
	=?utf-8?q?_stock_for_full_screen?=
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
X-List-Received-Date: Fri, 22 Feb 2013 21:02:19 -0000

This reduces the required translations and gives a nicer menu
with an icon.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 po/de_DE.po    |    4 ----
 po/it.po       |    4 ----
 po/messages.po |    4 ----
 ui/gtk.c       |    3 ++-
 4 files changed, 2 insertions(+), 13 deletions(-)

diff --git a/po/de_DE.po b/po/de_DE.po
index cb74d7c..8755783 100644
--- a/po/de_DE.po
+++ b/po/de_DE.po
@@ -24,10 +24,6 @@ msgstr "_Datei"
 msgid "_View"
 msgstr "_Ansicht"
=20
-#: ../ui/gtk.c:1002
-msgid "_Full Screen"
-msgstr "Voll_bild"
-
 #: ../ui/gtk.c:1029
 msgid "Zoom To _Fit"
 msgstr "Auf _Fenstergr=C3=B6=C3=9Fe skalieren"
diff --git a/po/it.po b/po/it.po
index 2b23491..7d77fff 100644
--- a/po/it.po
+++ b/po/it.po
@@ -24,10 +24,6 @@ msgstr "_File"
 msgid "_View"
 msgstr "_Visualizza"
=20
-#: ../ui/gtk.c:1002
-msgid "_Full Screen"
-msgstr "_Schermo intero"
-
 #: ../ui/gtk.c:1029
 msgid "Zoom To _Fit"
 msgstr "Adatta alla _finestra"
diff --git a/po/messages.po b/po/messages.po
index a90cd6f..191e81c 100644
--- a/po/messages.po
+++ b/po/messages.po
@@ -24,10 +24,6 @@ msgstr ""
 msgid "_View"
 msgstr ""
=20
-#: ../ui/gtk.c:1002
-msgid "_Full Screen"
-msgstr ""
-
 #: ../ui/gtk.c:1029
 msgid "Zoom To _Fit"
 msgstr ""
diff --git a/ui/gtk.c b/ui/gtk.c
index 57553b2..237f7ad 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -1016,7 +1016,8 @@ static void gd_create_menus(GtkDisplayState *s)
     gtk_menu_set_accel_group(GTK_MENU(s->view_menu), accel_group);
     s->view_menu_item =3D gtk_menu_item_new_with_mnemonic(_("_View"));
=20
-    s->full_screen_item =3D gtk_check_menu_item_new_with_mnemonic(_("_Fu=
ll Screen"));
+    s->full_screen_item =3D
+        gtk_image_menu_item_new_from_stock(GTK_STOCK_FULLSCREEN, NULL);
     gtk_menu_item_set_accel_path(GTK_MENU_ITEM(s->full_screen_item),
                                  "<QEMU>/View/Full Screen");
     gtk_accel_map_add_entry("<QEMU>/View/Full Screen", GDK_KEY_f, GDK_CO=
NTROL_MASK | GDK_MOD1_MASK);
--=20
1.7.10.4


