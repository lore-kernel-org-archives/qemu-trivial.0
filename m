Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VKBZK-0008MD-TY
	for mharc-qemu-trivial@gnu.org; Thu, 12 Sep 2013 14:24:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54560)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VKBZI-0008JT-Nk
	for qemu-trivial@nongnu.org; Thu, 12 Sep 2013 14:24:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VKBZH-0005UL-Im
	for qemu-trivial@nongnu.org; Thu, 12 Sep 2013 14:24:40 -0400
Received: from qemu.weilnetz.de ([2a03:4000:2:362::1]:50214
	helo=v2201305906712890.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VKBZD-0005TD-VX; Thu, 12 Sep 2013 14:24:36 -0400
Received: by v2201305906712890.yourvserver.net (Postfix, from userid 1000)
	id 8B91118171C; Thu, 12 Sep 2013 20:24:32 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel <qemu-devel@nongnu.org>
Date: Thu, 12 Sep 2013 20:24:31 +0200
Message-Id: <1379010271-18503-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a03:4000:2:362::1
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH] MAINTAINERS: Add missing entry to filelist
	for TCI target
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
X-List-Received-Date: Thu, 12 Sep 2013 18:24:41 -0000

tci.c is also a maintained part of the TCI implementation.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 MAINTAINERS |    1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d128ed0..4d634f2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -842,6 +842,7 @@ TCI target
 M: Stefan Weil <sw@weilnetz.de>
 S: Maintained
 F: tcg/tci/
+F: tci.c
 
 Stable branches
 ---------------
-- 
1.7.10.4


