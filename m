Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RYQ2g-0007ch-Fe
	for mharc-qemu-trivial@gnu.org; Wed, 07 Dec 2011 17:32:46 -0500
Received: from eggs.gnu.org ([140.186.70.92]:60955)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1RYQ2c-0007OJ-U0
	for qemu-trivial@nongnu.org; Wed, 07 Dec 2011 17:32:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1RYQ2a-0000KD-Rz
	for qemu-trivial@nongnu.org; Wed, 07 Dec 2011 17:32:41 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:35287)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1RYQ2Z-0000F6-41; Wed, 07 Dec 2011 17:32:39 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	875EE728188A; Wed,  7 Dec 2011 23:32:16 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id wnw5DIeIBJPp; Wed,  7 Dec 2011 23:31:47 +0100 (CET)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 45251728188E; Wed,  7 Dec 2011 23:31:47 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org
Date: Wed,  7 Dec 2011 23:31:46 +0100
Message-Id: <1323297106-27312-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH] tcg: Remove redundant declarations of
	TCG_TARGET_REG_BITS
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
X-List-Received-Date: Wed, 07 Dec 2011 22:32:44 -0000

TCG_TARGET_REG_BITS is declared in tcg.h for all TCG targets.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 tcg/i386/tcg-target.h |    5 -----
 1 files changed, 0 insertions(+), 5 deletions(-)

diff --git a/tcg/i386/tcg-target.h b/tcg/i386/tcg-target.h
index 7756e7b..adbb036 100644
--- a/tcg/i386/tcg-target.h
+++ b/tcg/i386/tcg-target.h
@@ -23,11 +23,6 @@
  */
 #define TCG_TARGET_I386 1
 
-#if defined(__x86_64__)
-# define TCG_TARGET_REG_BITS 64
-#else
-# define TCG_TARGET_REG_BITS 32
-#endif
 //#define TCG_TARGET_WORDS_BIGENDIAN
 
 #if TCG_TARGET_REG_BITS == 64
-- 
1.7.2.5


