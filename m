Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VukNe-0002CP-Sy
	for mharc-qemu-trivial@gnu.org; Sun, 22 Dec 2013 09:51:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59819)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VukNY-00022u-DX
	for qemu-trivial@nongnu.org; Sun, 22 Dec 2013 09:51:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VukNT-0000pn-DF
	for qemu-trivial@nongnu.org; Sun, 22 Dec 2013 09:51:40 -0500
Received: from qemu.weilnetz.de ([37.221.198.45]:52812
	helo=v2201305906712890.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VukNJ-0000o9-C6; Sun, 22 Dec 2013 09:51:25 -0500
Received: by v2201305906712890.yourvserver.net (Postfix, from userid 1000)
	id 4183D17FC14; Sun, 22 Dec 2013 15:51:22 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org
Date: Sun, 22 Dec 2013 15:51:22 +0100
Message-Id: <1387723882-30633-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.198.45
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	"Michael S. Tsirkin" <mst@redhat.com>
Subject: [Qemu-trivial] [PATCH] virtio: Fix return value for dummy function
	vhost_net_virtqueue_pending
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
X-List-Received-Date: Sun, 22 Dec 2013 14:51:45 -0000

cgcc complains that -ENOSYS is not a good value for 'bool'.

A dummy virtio will never have pending queue entries, so let us return
false.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---

Could we also use g_assert_not_reached or hw_error in those dummy functions?

Regards
Stefan

 hw/net/vhost_net.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
index 006576d..854997d 100644
--- a/hw/net/vhost_net.c
+++ b/hw/net/vhost_net.c
@@ -321,7 +321,7 @@ void vhost_net_ack_features(struct vhost_net *net, unsigned features)
 
 bool vhost_net_virtqueue_pending(VHostNetState *net, int idx)
 {
-    return -ENOSYS;
+    return false;
 }
 
 void vhost_net_virtqueue_mask(VHostNetState *net, VirtIODevice *dev,
-- 
1.7.10.4


