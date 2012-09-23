Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TFfsq-0004J6-K9
	for mharc-qemu-trivial@gnu.org; Sun, 23 Sep 2012 02:41:40 -0400
Received: from eggs.gnu.org ([208.118.235.92]:52865)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1TFfsn-0004Bv-UO
	for qemu-trivial@nongnu.org; Sun, 23 Sep 2012 02:41:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1TFfsn-0004aO-3w
	for qemu-trivial@nongnu.org; Sun, 23 Sep 2012 02:41:37 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:51221)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1TFfsl-0004a9-0s; Sun, 23 Sep 2012 02:41:35 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	95D07728001E; Sun, 23 Sep 2012 08:41:33 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id Z0a6orhxmOqx; Sun, 23 Sep 2012 08:41:33 +0200 (CEST)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 29A2E7280033; Sun, 23 Sep 2012 08:41:33 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org
Date: Sun, 23 Sep 2012 08:41:32 +0200
Message-Id: <1348382492-8342-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH] hw: Disable code after return statement
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
X-List-Received-Date: Sun, 23 Sep 2012 06:41:38 -0000

Report from smatch:
microdrive.c:212 md_common_read(34) info: ignoring unreachable code.
microdrive.c:273 md_common_write(33) info: ignoring unreachable code.
sd.c:343 sd_req_crc_validate(9) info: ignoring unreachable code.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 hw/ide/microdrive.c |    3 ++-
 hw/sd.c             |    2 ++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/ide/microdrive.c b/hw/ide/microdrive.c
index 64810f7..07c6f97 100644
--- a/hw/ide/microdrive.c
+++ b/hw/ide/microdrive.c
@@ -207,7 +207,7 @@ static uint16_t md_common_read(void *opaque, uint32_t at)
     case 0x0:	/* Even RD Data */
     case 0x8:
         return ide_data_readw(&s->bus, 0);
-
+#if 0
         /* TODO: 8-bit accesses */
         if (s->cycle)
             ret = s->io >> 8;
@@ -217,6 +217,7 @@ static uint16_t md_common_read(void *opaque, uint32_t at)
         }
         s->cycle = !s->cycle;
         return ret;
+#endif
     case 0x9:	/* Odd RD Data */
         return s->io >> 8;
     case 0xd:	/* Error */
diff --git a/hw/sd.c b/hw/sd.c
index ec26407..62a7751 100644
--- a/hw/sd.c
+++ b/hw/sd.c
@@ -340,7 +340,9 @@ static int sd_req_crc_validate(SDRequest *req)
     buffer[3] = (req->arg >> 8) & 0xff;
     buffer[4] = (req->arg >> 0) & 0xff;
     return 0;
+#if 0
     return sd_crc7(buffer, 5) != req->crc;	/* TODO */
+#endif
 }
 
 static void sd_response_r1_make(SDState *sd, uint8_t *response)
-- 
1.7.10


