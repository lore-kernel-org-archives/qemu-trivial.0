Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z6zpI-0003oY-9w
	for mharc-qemu-trivial@gnu.org; Mon, 22 Jun 2015 07:23:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52593)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z6zpE-0003i1-P0
	for qemu-trivial@nongnu.org; Mon, 22 Jun 2015 07:23:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z6zpA-00054w-2Z
	for qemu-trivial@nongnu.org; Mon, 22 Jun 2015 07:23:40 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:40962)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Z6zoz-00052v-AS; Mon, 22 Jun 2015 07:23:25 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 680C840C2D;
	Mon, 22 Jun 2015 14:23:24 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id D724AA71;
	Mon, 22 Jun 2015 14:16:32 +0300 (MSK)
Received: (nullmailer pid 9268 invoked by uid 1000);
	Mon, 22 Jun 2015 11:16:30 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon, 22 Jun 2015 14:16:21 +0300
Message-Id: <de3675ff51321e3f0ee3b2796a9c5d95b8f2669b.1434971627.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1434971627.git.mjt@msgid.tls.msk.ru>
References: <cover.1434971627.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Alberto Garcia <berto@igalia.com>
Subject: [Qemu-trivial] [PULL 14/21] throttle: Fix typo in the documentation
	of block_set_io_throttle
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
X-List-Received-Date: Mon, 22 Jun 2015 11:23:42 -0000

From: Alberto Garcia <berto@igalia.com>

Signed-off-by: Alberto Garcia <berto@igalia.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qapi/block-core.json | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index afa9d3d..793a01e 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -1083,7 +1083,7 @@
 #
 # I/O limits can be disabled by setting all of them to 0. In this case
 # the device will be removed from its group and the rest of its
-# members will no be affected. The 'group' parameter is ignored.
+# members will not be affected. The 'group' parameter is ignored.
 #
 # @device: The name of the device
 #
-- 
2.1.4


