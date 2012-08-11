Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T0HPw-0004P8-Sw
	for mharc-qemu-trivial@gnu.org; Sat, 11 Aug 2012 15:32:12 -0400
Received: from eggs.gnu.org ([208.118.235.92]:37024)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1T0HPu-0004Gu-BN
	for qemu-trivial@nongnu.org; Sat, 11 Aug 2012 15:32:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1T0HPs-0000A9-Ef
	for qemu-trivial@nongnu.org; Sat, 11 Aug 2012 15:32:10 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:60359)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1T0HPo-00009a-7R; Sat, 11 Aug 2012 15:32:04 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	139F77280031; Sat, 11 Aug 2012 21:32:03 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id duj+ZCv8+qLV; Sat, 11 Aug 2012 21:32:02 +0200 (CEST)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id B10ED72800CC; Sat, 11 Aug 2012 21:32:02 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial@nongnu.org
Date: Sat, 11 Aug 2012 21:32:02 +0200
Message-Id: <1344713522-5229-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH] framebuffer: Fix spelling in comment (leight
	-> height)
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
X-List-Received-Date: Sat, 11 Aug 2012 19:32:11 -0000

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 hw/framebuffer.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/framebuffer.c b/hw/framebuffer.c
index f4747cd..85a00a5 100644
--- a/hw/framebuffer.c
+++ b/hw/framebuffer.c
@@ -28,7 +28,7 @@ void framebuffer_update_display(
     MemoryRegion *address_space,
     target_phys_addr_t base,
     int cols, /* Width in pixels.  */
-    int rows, /* Leight in pixels.  */
+    int rows, /* Height in pixels.  */
     int src_width, /* Length of source line, in bytes.  */
     int dest_row_pitch, /* Bytes between adjacent horizontal output pixels.  */
     int dest_col_pitch, /* Bytes between adjacent vertical output pixels.  */
-- 
1.7.10


