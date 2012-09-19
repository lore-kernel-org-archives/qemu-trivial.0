Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TENL9-0006e1-4y
	for mharc-qemu-trivial@gnu.org; Wed, 19 Sep 2012 12:41:31 -0400
Received: from eggs.gnu.org ([208.118.235.92]:48766)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1TENL6-0006TK-1Q
	for qemu-trivial@nongnu.org; Wed, 19 Sep 2012 12:41:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1TENL5-0005ek-1O
	for qemu-trivial@nongnu.org; Wed, 19 Sep 2012 12:41:27 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:42115)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1TENKu-0005QO-LP; Wed, 19 Sep 2012 12:41:16 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	581837280032; Wed, 19 Sep 2012 18:41:15 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id n3nybJ2Ld3xM; Wed, 19 Sep 2012 18:41:15 +0200 (CEST)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id F2DBB7280033; Wed, 19 Sep 2012 18:41:14 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org
Date: Wed, 19 Sep 2012 18:41:14 +0200
Message-Id: <1348072874-2096-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH] pflash: Avoid warnings from coverity
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
X-List-Received-Date: Wed, 19 Sep 2012 16:41:29 -0000

hw/pflash_cfi01.c:209:
check_return: Calling function "bdrv_write" without checking return value (as is done elsewhere 35 out of 37 times).

hw/pflash_cfi02.c:144:
unterminated_default: The default case is not terminated by a 'break' statement.

hw/pflash_cfi02.c:238:
check_return: Calling function "bdrv_write" without checking return value (as is done elsewhere 35 out of 37 times).

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 hw/pflash_cfi01.c |    6 ++++--
 hw/pflash_cfi02.c |    7 +++++--
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/hw/pflash_cfi01.c b/hw/pflash_cfi01.c
index 56ed33f..27ae4aa 100644
--- a/hw/pflash_cfi01.c
+++ b/hw/pflash_cfi01.c
@@ -205,8 +205,10 @@ static void pflash_update(pflash_t *pfl, int offset,
         /* round to sectors */
         offset = offset >> 9;
         offset_end = (offset_end + 511) >> 9;
-        bdrv_write(pfl->bs, offset, pfl->storage + (offset << 9),
-                   offset_end - offset);
+        if (bdrv_write(pfl->bs, offset, pfl->storage + (offset << 9),
+                       offset_end - offset) == -1) {
+            fprintf(stderr, "pflash: Error writing to flash storage\n");
+        }
     }
 }
 
diff --git a/hw/pflash_cfi02.c b/hw/pflash_cfi02.c
index 3e2002e..bca7d1b 100644
--- a/hw/pflash_cfi02.c
+++ b/hw/pflash_cfi02.c
@@ -147,6 +147,7 @@ static uint32_t pflash_read (pflash_t *pfl, target_phys_addr_t offset,
         DPRINTF("%s: unknown command state: %x\n", __func__, pfl->cmd);
         pfl->wcycle = 0;
         pfl->cmd = 0;
+        /* Fall through */
     case 0x80:
         /* We accept reads during second unlock sequence... */
     case 0x00:
@@ -236,8 +237,10 @@ static void pflash_update(pflash_t *pfl, int offset,
         /* round to sectors */
         offset = offset >> 9;
         offset_end = (offset_end + 511) >> 9;
-        bdrv_write(pfl->bs, offset, pfl->storage + (offset << 9),
-                   offset_end - offset);
+        if (bdrv_write(pfl->bs, offset, pfl->storage + (offset << 9),
+                       offset_end - offset) == -1) {
+            fprintf(stderr, "pflash: Error writing to flash storage\n");
+        }
     }
 }
 
-- 
1.7.10


