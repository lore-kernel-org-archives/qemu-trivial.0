Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V0ur5-0001cG-S3
	for mharc-qemu-trivial@gnu.org; Sun, 21 Jul 2013 10:43:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47727)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1V0ur3-0001Zy-M1
	for qemu-trivial@nongnu.org; Sun, 21 Jul 2013 10:43:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1V0ur2-0008Qx-VJ
	for qemu-trivial@nongnu.org; Sun, 21 Jul 2013 10:43:21 -0400
Received: from [2a03:4000:2:362::1] (port=50441
	helo=v2201305906712890.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1V0ur0-0008Q1-GB; Sun, 21 Jul 2013 10:43:18 -0400
Received: by v2201305906712890.yourvserver.net (Postfix, from userid 1000)
	id D1E161837D2; Sun, 21 Jul 2013 16:43:14 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial <qemu-trivial@nongnu.org>
Date: Sun, 21 Jul 2013 16:43:14 +0200
Message-Id: <1374417794-22611-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a03:4000:2:362::1
Cc: Stefan Weil <sw@weilnetz.de>, qemu-devel <qemu-devel@nongnu.org>
Subject: [Qemu-trivial] [PATCH] exec: Remove env from list of poisoned names
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
X-List-Received-Date: Sun, 21 Jul 2013 14:43:22 -0000

The global variable env was removed some time ago, so this name may be
used without any restriction now.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 include/exec/poison.h |    1 -
 1 file changed, 1 deletion(-)

diff --git a/include/exec/poison.h b/include/exec/poison.h
index 2341a75..a4b1eca 100644
--- a/include/exec/poison.h
+++ b/include/exec/poison.h
@@ -36,7 +36,6 @@
 #pragma GCC poison TARGET_PAGE_ALIGN
 
 #pragma GCC poison CPUArchState
-#pragma GCC poison env
 
 #pragma GCC poison lduw_phys
 #pragma GCC poison ldl_phys
-- 
1.7.10.4


