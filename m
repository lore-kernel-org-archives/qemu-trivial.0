Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fKHvK-000680-JQ
	for mharc-qemu-trivial@gnu.org; Sun, 20 May 2018 02:34:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45947)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1fKHvF-00060Q-3G
	for qemu-trivial@nongnu.org; Sun, 20 May 2018 02:34:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1fKHvE-00032W-Am
	for qemu-trivial@nongnu.org; Sun, 20 May 2018 02:34:25 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:51299)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1fKHv9-0002t6-SR; Sun, 20 May 2018 02:34:20 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 085294111E;
	Sun, 20 May 2018 09:34:19 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 0562410CC;
	Sun, 20 May 2018 09:15:14 +0300 (MSK)
Received: (nullmailer pid 7414 invoked by uid 1000);
	Sun, 20 May 2018 06:15:12 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Sun, 20 May 2018 09:15:07 +0300
Message-Id: <4088b5536436090207dcf6d15e47908f74b2d8f2.1526796813.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1526796813.git.mjt@msgid.tls.msk.ru>
References: <cover.1526796813.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1526796813.git.mjt@msgid.tls.msk.ru>
References: <cover.1526796813.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 21/22] qapi/net.json: Fix the version number
 of the "vlan" removal
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
X-List-Received-Date: Sun, 20 May 2018 06:34:26 -0000

From: Thomas Huth <thuth@redhat.com>

"vlan" will be dropped in 2.13, not in 2.12. And while we're at it,
use the better wording "dropped in" instead of "removed with" (also
for the "dump" removal).

Reported-by: Stefan Hajnoczi <stefanha@redhat.com>
Reported-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qapi/net.json | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/qapi/net.json b/qapi/net.json
index b4fe4b660b..b8adf1f03f 100644
--- a/qapi/net.json
+++ b/qapi/net.json
@@ -450,7 +450,7 @@
 #
 # Since: 2.7
 #
-# 'dump' - removed with 2.12
+# 'dump': dropped in 2.12
 ##
 { 'enum': 'NetClientDriver',
   'data': [ 'none', 'nic', 'user', 'tap', 'l2tpv3', 'socket', 'vde',
@@ -498,7 +498,7 @@
 #
 # Since: 1.2
 #
-# 'vlan' - removed with 2.12
+# 'vlan': dropped in 2.13
 ##
 { 'struct': 'NetLegacy',
   'data': {
-- 
2.11.0


