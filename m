Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Um8SE-0003bV-MB
	for mharc-qemu-trivial@gnu.org; Mon, 10 Jun 2013 16:12:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38002)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1Um8SC-0003Xb-Lh
	for qemu-trivial@nongnu.org; Mon, 10 Jun 2013 16:12:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1Um8S7-00057V-Vi
	for qemu-trivial@nongnu.org; Mon, 10 Jun 2013 16:12:36 -0400
Received: from qemu.weilnetz.de ([37.221.198.45]:52545
	helo=v2201305906712890.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1Um8S5-000561-Lg; Mon, 10 Jun 2013 16:12:29 -0400
Received: by v2201305906712890.yourvserver.net (Postfix, from userid 1000)
	id 019611820DC; Mon, 10 Jun 2013 22:12:25 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial <qemu-trivial@nongnu.org>
Date: Mon, 10 Jun 2013 22:12:25 +0200
Message-Id: <1370895145-10114-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.198.45
Cc: Stefan Weil <sw@weilnetz.de>, qemu-devel <qemu-devel@nongnu.org>
Subject: [Qemu-trivial] [PATCH] device tree: Fix cppcheck warning
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
X-List-Received-Date: Mon, 10 Jun 2013 20:12:38 -0000

Fix this cppcheck warning:

Checking device_tree.c...
device_tree.c:216: style:
 Checking if unsigned variable 'r' is less than zero.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 device_tree.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/device_tree.c b/device_tree.c
index 56af24b..69be9da 100644
--- a/device_tree.c
+++ b/device_tree.c
@@ -213,7 +213,7 @@ uint32_t qemu_devtree_get_phandle(void *fdt, const char *path)
     uint32_t r;
 
     r = fdt_get_phandle(fdt, findnode_nofail(fdt, path));
-    if (r <= 0) {
+    if (r == 0) {
         fprintf(stderr, "%s: Couldn't get phandle for %s: %s\n", __func__,
                 path, fdt_strerror(r));
         exit(1);
-- 
1.7.10.4


