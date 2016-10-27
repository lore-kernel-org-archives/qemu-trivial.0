Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bzjcu-00076A-L8
	for mharc-qemu-trivial@gnu.org; Thu, 27 Oct 2016 08:17:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42540)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1bzjcn-00071b-Qj
	for qemu-trivial@nongnu.org; Thu, 27 Oct 2016 08:17:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1bzjcm-0003qu-Qb
	for qemu-trivial@nongnu.org; Thu, 27 Oct 2016 08:17:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48134)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1bzjcg-0003nV-Pg; Thu, 27 Oct 2016 08:17:30 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E3922711C6;
	Thu, 27 Oct 2016 12:17:29 +0000 (UTC)
Received: from thh440s.redhat.com (ovpn-116-58.ams2.redhat.com [10.36.116.58])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id u9RCHSJH025352; Thu, 27 Oct 2016 08:17:28 -0400
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-trivial@nongnu.org
Date: Thu, 27 Oct 2016 14:17:27 +0200
Message-Id: <1477570647-7100-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Thu, 27 Oct 2016 12:17:30 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] ui/gtk: Fix non-working DELETE key
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
X-List-Received-Date: Thu, 27 Oct 2016 12:17:43 -0000

GTK generates key events for the delete key with key->string[0] = 0x7f
... but this does not work right with the readline_handle_byte()
function in util/readline.c, since this treats the keycode 127 as
backspace. So let's add a special case for the GTK delete key to make
this key behave right in the monitor interface of the GTK ui.

Buglink: https://bugs.launchpad.net/qemu/+bug/1619438
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 ui/gtk.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/ui/gtk.c b/ui/gtk.c
index 25e6d99..ab280e4 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -1051,7 +1051,9 @@ static gboolean gd_text_key_down(GtkWidget *widget,
     VirtualConsole *vc = opaque;
     QemuConsole *con = vc->gfx.dcl.con;
 
-    if (key->length) {
+    if (key->keyval == GDK_KEY_Delete) {
+        kbd_put_qcode_console(con, Q_KEY_CODE_DELETE);
+    } else if (key->length) {
         kbd_put_string_console(con, key->string, key->length);
     } else {
         int num = gd_map_keycode(vc->s, gtk_widget_get_display(widget),
-- 
1.8.3.1


