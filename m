Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ROnb7-0007dR-5y
	for mharc-qemu-trivial@gnu.org; Fri, 11 Nov 2011 04:40:33 -0500
Received: from eggs.gnu.org ([140.186.70.92]:35117)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1ROnaw-00073F-2Y
	for qemu-trivial@nongnu.org; Fri, 11 Nov 2011 04:40:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1ROnav-00022I-8i
	for qemu-trivial@nongnu.org; Fri, 11 Nov 2011 04:40:22 -0500
Received: from oxygen.pond.sub.org ([78.46.104.156]:46903)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>)
	id 1ROnas-00020E-Dv; Fri, 11 Nov 2011 04:40:18 -0500
Received: from blackfin.pond.sub.org (p5B32B59E.dip.t-dialin.net
	[91.50.181.158])
	by oxygen.pond.sub.org (Postfix) with ESMTPA id 68B379FFC4;
	Fri, 11 Nov 2011 10:40:10 +0100 (CET)
Received: by blackfin.pond.sub.org (Postfix, from userid 500)
	id C52C76006E; Fri, 11 Nov 2011 10:40:09 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 11 Nov 2011 10:40:06 +0100
Message-Id: <1321004409-3274-3-git-send-email-armbru@redhat.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <1321004409-3274-1-git-send-email-armbru@redhat.com>
References: <1321004409-3274-1-git-send-email-armbru@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 78.46.104.156
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH 2/5] ui: Plug memory leaks on
	parse_keyboard_layout() error path
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
X-List-Received-Date: Fri, 11 Nov 2011 09:40:23 -0000

Spotted by Coverity.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 ui/keymaps.c |   12 +++++++-----
 1 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/ui/keymaps.c b/ui/keymaps.c
index f54a114..f55a2aa 100644
--- a/ui/keymaps.c
+++ b/ui/keymaps.c
@@ -92,15 +92,17 @@ static kbd_layout_t *parse_keyboard_layout(const name2keysym_t *table,
     int len;
 
     filename = qemu_find_file(QEMU_FILE_TYPE_KEYMAP, language);
-
-    if (!k)
-	k = g_malloc0(sizeof(kbd_layout_t));
-    if (!(filename && (f = fopen(filename, "r")))) {
+    f = filename ? fopen(filename, "r") : NULL;
+    g_free(filename);
+    if (!f) {
 	fprintf(stderr,
 		"Could not read keymap file: '%s'\n", language);
 	return NULL;
     }
-    g_free(filename);
+
+    if (!k)
+	k = g_malloc0(sizeof(kbd_layout_t));
+
     for(;;) {
 	if (fgets(line, 1024, f) == NULL)
             break;
-- 
1.7.6.4


