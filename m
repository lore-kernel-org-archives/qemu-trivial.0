Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T7lBA-0000tp-Iz
	for mharc-qemu-trivial@gnu.org; Sat, 01 Sep 2012 06:43:52 -0400
Received: from eggs.gnu.org ([208.118.235.92]:36567)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1T7lB7-0000k2-EP
	for qemu-trivial@nongnu.org; Sat, 01 Sep 2012 06:43:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1T7lB6-0003Oy-J0
	for qemu-trivial@nongnu.org; Sat, 01 Sep 2012 06:43:49 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:50412)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1T7lB4-0003OM-Fe; Sat, 01 Sep 2012 06:43:46 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	52B147280021; Sat,  1 Sep 2012 12:43:45 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id 212-be6PRzyW; Sat,  1 Sep 2012 12:43:44 +0200 (CEST)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id CB451728002B; Sat,  1 Sep 2012 12:43:44 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: Mathieu Sonet <contact@elasticsheep.com>
Date: Sat,  1 Sep 2012 12:43:41 +0200
Message-Id: <1346496221-11188-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH] lm4549: Fix buffer overflow
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
X-List-Received-Date: Sat, 01 Sep 2012 10:43:50 -0000

Report from smatch:
lm4549.c:234 lm4549_write_samples(14) error:
 buffer overflow 's->buffer' 1024 <= 1024

There must be enough space to add two entries starting with index
s->buffer_level, therefore the old check was wrong.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 hw/lm4549.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/lm4549.c b/hw/lm4549.c
index 80b3ec4..e0137d5 100644
--- a/hw/lm4549.c
+++ b/hw/lm4549.c
@@ -224,7 +224,7 @@ uint32_t lm4549_write_samples(lm4549_state *s, uint32_t left, uint32_t right)
        This model supports 16-bit playback.
     */
 
-    if (s->buffer_level >= LM4549_BUFFER_SIZE) {
+    if (s->buffer_level > LM4549_BUFFER_SIZE - 2) {
         DPRINTF("write_sample Buffer full\n");
         return 0;
     }
-- 
1.7.10


