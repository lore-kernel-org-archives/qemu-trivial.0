Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Rw8we-0001Mn-Qp
	for mharc-qemu-trivial@gnu.org; Sat, 11 Feb 2012 04:08:36 -0500
Received: from eggs.gnu.org ([140.186.70.92]:60906)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1Rw8wa-0001AX-RE
	for qemu-trivial@nongnu.org; Sat, 11 Feb 2012 04:08:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1Rw8wZ-00083H-Rw
	for qemu-trivial@nongnu.org; Sat, 11 Feb 2012 04:08:32 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:34905)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1Rw8w2-00080e-CV; Sat, 11 Feb 2012 04:07:58 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	7E1567280012; Sat, 11 Feb 2012 10:07:56 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id 9HuDMILyxaI8; Sat, 11 Feb 2012 10:07:55 +0100 (CET)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id E789D7280013; Sat, 11 Feb 2012 10:07:55 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org
Date: Sat, 11 Feb 2012 10:07:55 +0100
Message-Id: <1328951275-23481-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.8.3
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH] tcg: Remove unneeded include statements
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
X-List-Received-Date: Sat, 11 Feb 2012 09:08:33 -0000

The standard include files are already included in qemu-common.h.

malloc.h and alloca.h were needed for alloca() which was removed
from TCG code some years ago when switching from dyngen to TCG
(see commit 49516bc0d622112caac9df628caf19010fda8b67).

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 tcg/tcg.c |   12 ------------
 1 files changed, 0 insertions(+), 12 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 6f9328e..023cb51 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -33,18 +33,6 @@
 #define NDEBUG
 #endif
 
-#include <stdarg.h>
-#include <stdlib.h>
-#include <stdio.h>
-#include <string.h>
-#include <inttypes.h>
-#ifdef _WIN32
-#include <malloc.h>
-#endif
-#ifdef _AIX
-#include <alloca.h>
-#endif
-
 #include "qemu-common.h"
 #include "cache-utils.h"
 #include "host-utils.h"
-- 
1.7.8.3


