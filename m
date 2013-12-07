Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VpDC6-0003bl-4w
	for mharc-qemu-trivial@gnu.org; Sat, 07 Dec 2013 03:24:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49062)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VpDC3-0003Yb-Ad
	for qemu-trivial@nongnu.org; Sat, 07 Dec 2013 03:24:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VpDC2-0008RR-H9
	for qemu-trivial@nongnu.org; Sat, 07 Dec 2013 03:24:55 -0500
Received: from qemu.weilnetz.de ([2a03:4000:2:362::1]:52863
	helo=v2201305906712890.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VpDC0-0008RA-CX; Sat, 07 Dec 2013 03:24:52 -0500
Received: by v2201305906712890.yourvserver.net (Postfix, from userid 1000)
	id 0C30E1802AD; Sat,  7 Dec 2013 09:24:48 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel <qemu-devel@nongnu.org>
Date: Sat,  7 Dec 2013 09:24:48 +0100
Message-Id: <1386404688-17375-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a03:4000:2:362::1
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Jia Liu <proljc@gmail.com>
Subject: [Qemu-trivial] [PATCH] openrisc: Fix spelling in comment
	(transaltion -> translation)
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
X-List-Received-Date: Sat, 07 Dec 2013 08:24:56 -0000

I also removed two hyphens in the same comment.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 target-openrisc/translate.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target-openrisc/translate.c b/target-openrisc/translate.c
index 91c60eb..b381477 100644
--- a/target-openrisc/translate.c
+++ b/target-openrisc/translate.c
@@ -112,7 +112,7 @@ void openrisc_translate_init(void)
     }
 }
 
-/* Writeback SR_F transaltion-space to execution-space.  */
+/* Writeback SR_F translation space to execution space.  */
 static inline void wb_SR_F(void)
 {
     int label;
-- 
1.7.10.4


