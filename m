Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SER3s-0007A5-Rn
	for mharc-qemu-trivial@gnu.org; Sun, 01 Apr 2012 16:07:40 -0400
Received: from eggs.gnu.org ([208.118.235.92]:45014)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1SER3q-00073U-BX
	for qemu-trivial@nongnu.org; Sun, 01 Apr 2012 16:07:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1SER3o-0000nA-Nd
	for qemu-trivial@nongnu.org; Sun, 01 Apr 2012 16:07:37 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:41248)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1SER3l-0000mi-JO; Sun, 01 Apr 2012 16:07:33 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	0A91672800AE; Sun,  1 Apr 2012 22:07:31 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id Z+0kOXpS3PA8; Sun,  1 Apr 2012 22:07:30 +0200 (CEST)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 9858B72800B2; Sun,  1 Apr 2012 22:07:30 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org
Date: Sun,  1 Apr 2012 22:07:30 +0200
Message-Id: <1333310850-28767-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.9
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: [Qemu-trivial] [PATCH] qxl: Add missing GCC_FMT_ATTR and fix format
	specifier
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
X-List-Received-Date: Sun, 01 Apr 2012 20:07:39 -0000

val is an uint64_t, therefore %d was not correct.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 hw/qxl.c |    2 +-
 hw/qxl.h |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/qxl.c b/hw/qxl.c
index 47a162e..85028dd 100644
--- a/hw/qxl.c
+++ b/hw/qxl.c
@@ -1370,7 +1370,7 @@ async_common:
     case QXL_IO_DESTROY_SURFACE_WAIT:
         if (val >= NUM_SURFACES) {
             qxl_guest_bug(d, "QXL_IO_DESTROY_SURFACE (async=%d):"
-                             "%d >= NUM_SURFACES", async, val);
+                             "%" PRIu64 " >= NUM_SURFACES", async, val);
             goto cancel_async;
         }
         qxl_spice_destroy_surface_wait(d, val, async);
diff --git a/hw/qxl.h b/hw/qxl.h
index 11a0db3..cbb1e2d 100644
--- a/hw/qxl.h
+++ b/hw/qxl.h
@@ -127,7 +127,7 @@ typedef struct PCIQXLDevice {
 
 /* qxl.c */
 void *qxl_phys2virt(PCIQXLDevice *qxl, QXLPHYSICAL phys, int group_id);
-void qxl_guest_bug(PCIQXLDevice *qxl, const char *msg, ...);
+void qxl_guest_bug(PCIQXLDevice *qxl, const char *msg, ...) GCC_FMT_ATTR(2, 3);
 
 void qxl_spice_update_area(PCIQXLDevice *qxl, uint32_t surface_id,
                            struct QXLRect *area, struct QXLRect *dirty_rects,
-- 
1.7.2.5


