Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RS5fx-0006sa-H4
	for mharc-qemu-trivial@gnu.org; Sun, 20 Nov 2011 06:35:09 -0500
Received: from eggs.gnu.org ([140.186.70.92]:37582)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1RS5fu-0006lX-N7
	for qemu-trivial@nongnu.org; Sun, 20 Nov 2011 06:35:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1RS5ft-0001Ah-JZ
	for qemu-trivial@nongnu.org; Sun, 20 Nov 2011 06:35:06 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:40804)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1RS5fr-00018W-2a; Sun, 20 Nov 2011 06:35:03 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	F02687281888; Sun, 20 Nov 2011 12:34:51 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id 7KZgXoDj67qP; Sun, 20 Nov 2011 12:34:31 +0100 (CET)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id AB0A0728188B; Sun, 20 Nov 2011 12:34:31 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org
Date: Sun, 20 Nov 2011 12:34:30 +0100
Message-Id: <1321788870-27848-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH] Include zlib.h using #include <>
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
X-List-Received-Date: Sun, 20 Nov 2011 11:35:08 -0000

zlib.h is not a local include file, therefore it should be included
using <> instead of "".

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 block/vmdk.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/block/vmdk.c b/block/vmdk.c
index e53a2f0..96f7d5d 100644
--- a/block/vmdk.c
+++ b/block/vmdk.c
@@ -26,7 +26,7 @@
 #include "qemu-common.h"
 #include "block_int.h"
 #include "module.h"
-#include "zlib.h"
+#include <zlib.h>
 
 #define VMDK3_MAGIC (('C' << 24) | ('O' << 16) | ('W' << 8) | 'D')
 #define VMDK4_MAGIC (('K' << 24) | ('D' << 16) | ('M' << 8) | 'V')
-- 
1.7.2.5


