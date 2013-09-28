Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VPrFE-0006MQ-BN
	for mharc-qemu-trivial@gnu.org; Sat, 28 Sep 2013 05:55:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48956)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VPrFC-0006Ji-5x
	for qemu-trivial@nongnu.org; Sat, 28 Sep 2013 05:55:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VPrFB-0002qc-Bz
	for qemu-trivial@nongnu.org; Sat, 28 Sep 2013 05:55:22 -0400
Received: from qemu.weilnetz.de ([2a03:4000:2:362::1]:49037
	helo=v2201305906712890.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VPrF9-0002o8-2R; Sat, 28 Sep 2013 05:55:19 -0400
Received: by v2201305906712890.yourvserver.net (Postfix, from userid 1000)
	id B6C67180296; Sat, 28 Sep 2013 11:55:15 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel <qemu-devel@nongnu.org>
Date: Sat, 28 Sep 2013 11:55:14 +0200
Message-Id: <1380362114-29476-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a03:4000:2:362::1
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Kevin Wolf <kwolf@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>, Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH] block: Remove unused assignment (fixes
	warning from clang)
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
X-List-Received-Date: Sat, 28 Sep 2013 09:55:22 -0000

blockdev.c:1929:13: warning: Value stored to 'ret' is never read
            ret = 0;
            ^     ~

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 blockdev.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/blockdev.c b/blockdev.c
index 8aa66a9..8c83f6f 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -1926,7 +1926,6 @@ void qmp_drive_mirror(const char *device, const char *target,
     } else {
         switch (mode) {
         case NEW_IMAGE_MODE_EXISTING:
-            ret = 0;
             break;
         case NEW_IMAGE_MODE_ABSOLUTE_PATHS:
             /* create new image with backing file */
-- 
1.7.10.4


