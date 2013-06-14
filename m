Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UnRfP-0001o0-0L
	for mharc-qemu-trivial@gnu.org; Fri, 14 Jun 2013 06:55:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56160)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UnRfJ-0001cE-0Z
	for qemu-trivial@nongnu.org; Fri, 14 Jun 2013 06:55:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UnRfH-0005s5-59
	for qemu-trivial@nongnu.org; Fri, 14 Jun 2013 06:55:32 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:47571)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1UnRf9-0005pM-W8; Fri, 14 Jun 2013 06:55:24 -0400
Received: from gandalf.tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 480184165A;
	Fri, 14 Jun 2013 14:55:23 +0400 (MSK)
Received: by gandalf.tls.msk.ru (Postfix, from userid 1000)
	id 9E8CB51D; Fri, 14 Jun 2013 14:50:47 +0400 (MSK)
From: Michael Tokarev <mjt@tls.msk.ru>
To: Anthony Liguori <aliguori@us.ibm.com>
Date: Fri, 14 Jun 2013 14:50:29 +0400
Message-Id: <1371207042-17980-14-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1371207042-17980-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1371207042-17980-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 13/26] device tree: Fix cppcheck warning
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
X-List-Received-Date: Fri, 14 Jun 2013 10:55:34 -0000

From: Stefan Weil <sw@weilnetz.de>

Fix this cppcheck warning:

Checking device_tree.c...
device_tree.c:216: style:
 Checking if unsigned variable 'r' is less than zero.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
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


