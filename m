Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TmOgA-0002vN-CE
	for mharc-qemu-trivial@gnu.org; Sat, 22 Dec 2012 07:59:50 -0500
Received: from eggs.gnu.org ([208.118.235.92]:52339)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1TmOg2-0002Yt-Ri
	for qemu-trivial@nongnu.org; Sat, 22 Dec 2012 07:59:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1TmOfu-0003Rr-KS
	for qemu-trivial@nongnu.org; Sat, 22 Dec 2012 07:59:42 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:51071)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1TmOfm-0003QD-7s; Sat, 22 Dec 2012 07:59:26 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	7CEE57280049; Sat, 22 Dec 2012 13:59:24 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id LloIULumB2+J; Sat, 22 Dec 2012 13:59:23 +0100 (CET)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id DEB6A728004C; Sat, 22 Dec 2012 13:59:23 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial@nongnu.org
Date: Sat, 22 Dec 2012 13:59:22 +0100
Message-Id: <1356181162-20825-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 78.47.199.172
Cc: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH] hw/mcf5206: Reduce size of lookup table
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
X-List-Received-Date: Sat, 22 Dec 2012 12:59:49 -0000

This typically reduces the size from 512 bytes to 128 bytes.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 hw/mcf5206.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/mcf5206.c b/hw/mcf5206.c
index fe7a488..d8c0059 100644
--- a/hw/mcf5206.c
+++ b/hw/mcf5206.c
@@ -359,7 +359,7 @@ static void m5206_mbar_write(m5206_mbar_state *s, uint32_t offset,
 
 /* Internal peripherals use a variety of register widths.
    This lookup table allows a single routine to handle all of them.  */
-static const int m5206_mbar_width[] =
+static const uint8_t m5206_mbar_width[] =
 {
   /* 000-040 */ 1, 1, 1, 1,  1, 1, 1, 1,  1, 1, 1, 1,  2, 2, 2, 2,
   /* 040-080 */ 1, 2, 2, 2,  4, 1, 2, 4,  1, 2, 4, 2,  2, 4, 2, 2,
-- 
1.7.10.4


