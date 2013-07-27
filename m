Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V2z0Y-00020J-HD
	for mharc-qemu-trivial@gnu.org; Sat, 27 Jul 2013 03:33:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40270)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1V2z0S-0001nl-7W
	for qemu-trivial@nongnu.org; Sat, 27 Jul 2013 03:33:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1V2z0Q-0005ew-2n
	for qemu-trivial@nongnu.org; Sat, 27 Jul 2013 03:33:36 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:49684)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1V2z0M-0005dA-1k; Sat, 27 Jul 2013 03:33:30 -0400
Received: from gandalf.tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 243A442FBD;
	Sat, 27 Jul 2013 11:33:29 +0400 (MSK)
Received: by gandalf.tls.msk.ru (Postfix, from userid 1000)
	id 3FF66202318; Sat, 27 Jul 2013 11:33:28 +0400 (MSK)
From: Michael Tokarev <mjt@tls.msk.ru>
To: anthony@codemonkey.ws
Date: Sat, 27 Jul 2013 11:33:16 +0400
Message-Id: <1374910406-15273-2-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1374910406-15273-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1374910406-15273-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL trivial 01/11] aes: Remove unused code (NDEBUG,
	u16)
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
X-List-Received-Date: Sat, 27 Jul 2013 07:33:37 -0000

From: Stefan Weil <sw@weilnetz.de>

The current code includes assert.h very early (from qemu-common.h),
so the definition of NDEBUG was without any effect.

In the initial version from 2004, NDEBUG was used to disable the assertions.
Those assertions are not in time critical code, so it is no longer
reasonable to disable them and the definition of NDEBUG can be removed.

Type u16 is also unused and therefore does not need a type definition.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 util/aes.c |    5 -----
 1 file changed, 5 deletions(-)

diff --git a/util/aes.c b/util/aes.c
index 91e97fa..4b4d88e 100644
--- a/util/aes.c
+++ b/util/aes.c
@@ -30,12 +30,7 @@
 #include "qemu-common.h"
 #include "qemu/aes.h"
 
-#ifndef NDEBUG
-#define NDEBUG
-#endif
-
 typedef uint32_t u32;
-typedef uint16_t u16;
 typedef uint8_t u8;
 
 /* This controls loop-unrolling in aes_core.c */
-- 
1.7.10.4


