Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VdQBa-0004i9-Jd
	for mharc-qemu-trivial@gnu.org; Mon, 04 Nov 2013 14:51:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43890)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VdQBW-0004bg-GB
	for qemu-trivial@nongnu.org; Mon, 04 Nov 2013 14:51:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VdQBR-0002h4-QK
	for qemu-trivial@nongnu.org; Mon, 04 Nov 2013 14:51:38 -0500
Received: from qemu.weilnetz.de ([2a03:4000:2:362::1]:33572
	helo=v2201305906712890.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VdQBO-0002f5-M9; Mon, 04 Nov 2013 14:51:30 -0500
Received: by v2201305906712890.yourvserver.net (Postfix, from userid 1000)
	id BE1E6180021; Mon,  4 Nov 2013 20:51:26 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel <qemu-devel@nongnu.org>
Date: Mon,  4 Nov 2013 20:51:25 +0100
Message-Id: <1383594685-19332-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a03:4000:2:362::1
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Anthony Liguori <aliguori@amazon.com>
Subject: [Qemu-trivial] [PATCH] gtk: Fix compiler warnings with
	-Werror=sign-compare
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
X-List-Received-Date: Mon, 04 Nov 2013 19:51:41 -0000

With -Werror=3Dsign-compare (not enabled by default), gcc shows these err=
ors:

ui/gtk.c: In function =E2=80=98gtk_release_modifiers=E2=80=99:
ui/gtk.c:288:19: error:
 comparison between signed and unsigned integer expressions [-Werror=3Dsi=
gn-compare]
ui/gtk.c: In function =E2=80=98gd_key_event=E2=80=99:
ui/gtk.c:746:19: error:
 comparison between signed and unsigned integer expressions [-Werror=3Dsi=
gn-compare]

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 ui/gtk.c |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/ui/gtk.c b/ui/gtk.c
index b5f4f0b..79efda1 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -273,7 +273,8 @@ static void gd_update_full_redraw(GtkDisplayState *s)
=20
 static void gtk_release_modifiers(GtkDisplayState *s)
 {
-    int i, keycode;
+    unsigned i;
+    int keycode;
=20
     if (!gd_on_vga(s)) {
         return;
@@ -714,7 +715,7 @@ static gboolean gd_key_event(GtkWidget *widget, GdkEv=
entKey *key, void *opaque)
     GtkDisplayState *s =3D opaque;
     int gdk_keycode;
     int qemu_keycode;
-    int i;
+    unsigned i;
=20
     gdk_keycode =3D key->hardware_keycode;
=20
--=20
1.7.10.4


