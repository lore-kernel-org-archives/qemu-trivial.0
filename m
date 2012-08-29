Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T6nAs-00048f-Gg
	for mharc-qemu-trivial@gnu.org; Wed, 29 Aug 2012 14:39:34 -0400
Received: from eggs.gnu.org ([208.118.235.92]:40908)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1T6nAq-00042R-DB
	for qemu-trivial@nongnu.org; Wed, 29 Aug 2012 14:39:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1T6nAp-0003x0-FQ
	for qemu-trivial@nongnu.org; Wed, 29 Aug 2012 14:39:32 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:35174)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1T6nAn-0003wD-4C; Wed, 29 Aug 2012 14:39:29 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	BC5017280027; Wed, 29 Aug 2012 20:39:26 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id nwa1E13iW0SE; Wed, 29 Aug 2012 20:39:26 +0200 (CEST)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 0F69F728002A; Wed, 29 Aug 2012 20:39:26 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial@nongnu.org
Date: Wed, 29 Aug 2012 20:39:25 +0200
Message-Id: <1346265565-27501-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: Stefan Weil <sw@weilnetz.de>, Anthony Liguori <aliguori@us.ibm.com>,
	qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: [Qemu-trivial] [PATCH for 1.2] scsi-disk: Fix typo (uint32 ->
	uint32_t)
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
X-List-Received-Date: Wed, 29 Aug 2012 18:39:33 -0000

Cc: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 hw/scsi-disk.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/scsi-disk.c b/hw/scsi-disk.c
index 409f760..cd72afd 100644
--- a/hw/scsi-disk.c
+++ b/hw/scsi-disk.c
@@ -1461,7 +1461,7 @@ static void scsi_unmap_complete(void *opaque, int ret)
     SCSIDiskReq *r = data->r;
     SCSIDiskState *s = DO_UPCAST(SCSIDiskState, qdev, r->req.dev);
     uint64_t sector_num;
-    uint32 nb_sectors;
+    uint32_t nb_sectors;
 
     r->req.aiocb = NULL;
     if (ret < 0) {
-- 
1.7.10


