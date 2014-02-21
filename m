Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WGw9h-0006Il-Jw
	for mharc-qemu-trivial@gnu.org; Fri, 21 Feb 2014 14:53:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50286)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1WGw9a-00069X-VN
	for qemu-trivial@nongnu.org; Fri, 21 Feb 2014 14:53:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1WGw9V-00066I-Sx
	for qemu-trivial@nongnu.org; Fri, 21 Feb 2014 14:52:58 -0500
Received: from qemu.weilnetz.de ([37.221.198.45]:49183
	helo=v2201305906712890.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1WGw9L-00064x-Td; Fri, 21 Feb 2014 14:52:44 -0500
Received: by v2201305906712890.yourvserver.net (Postfix, from userid 1000)
	id CBC3917F70D; Fri, 21 Feb 2014 20:52:39 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial@nongnu.org
Date: Fri, 21 Feb 2014 20:52:39 +0100
Message-Id: <1393012359-2953-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.198.45
Cc: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org,
	Richard Henderson <rth@twiddle.net>
Subject: [Qemu-trivial] [PATCH] tcg: Fix typo in comment (dependancies ->
	dependencies)
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
X-List-Received-Date: Fri, 21 Feb 2014 19:53:03 -0000

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 tcg/tcg.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index ffc851e..f1e0763 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -41,7 +41,7 @@
 #include "qemu/host-utils.h"
 #include "qemu/timer.h"
 
-/* Note: the long term plan is to reduce the dependancies on the QEMU
+/* Note: the long term plan is to reduce the dependencies on the QEMU
    CPU definitions. Currently they are used for qemu_ld/st
    instructions */
 #define NO_CPU_IO_DEFS
-- 
1.7.10.4


