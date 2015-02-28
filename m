Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YRlz5-0002I2-VE
	for mharc-qemu-trivial@gnu.org; Sat, 28 Feb 2015 13:19:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59504)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1YRlz4-0002HA-3h
	for qemu-trivial@nongnu.org; Sat, 28 Feb 2015 13:19:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1YRlz3-0002Td-8R
	for qemu-trivial@nongnu.org; Sat, 28 Feb 2015 13:19:26 -0500
Received: from qemu.weilnetz.de ([37.221.198.45]:54244)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1YRlyz-0002T6-6u; Sat, 28 Feb 2015 13:19:21 -0500
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
	id 9DED417F93E; Sat, 28 Feb 2015 19:19:18 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: QEMU Trivial <qemu-trivial@nongnu.org>
Date: Sat, 28 Feb 2015 19:19:17 +0100
Message-Id: <1425147557-17216-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.198.45
Cc: Stefan Weil <sw@weilnetz.de>, QEMU Developer <qemu-devel@nongnu.org>
Subject: [Qemu-trivial] [PATCH] vhost_net: Add missing 'static' attribute
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
X-List-Received-Date: Sat, 28 Feb 2015 18:19:26 -0000

This fixes a warning from smatch.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 hw/net/vhost_net.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
index 4e3a061..ebfb6db 100644
--- a/hw/net/vhost_net.c
+++ b/hw/net/vhost_net.c
@@ -56,7 +56,7 @@ static const int kernel_feature_bits[] = {
 };
 
 /* Features supported by others. */
-const int user_feature_bits[] = {
+static const int user_feature_bits[] = {
     VIRTIO_F_NOTIFY_ON_EMPTY,
     VIRTIO_RING_F_INDIRECT_DESC,
     VIRTIO_RING_F_EVENT_IDX,
-- 
1.7.10.4


