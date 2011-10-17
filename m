Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RFskz-0005Gq-9H
	for mharc-qemu-trivial@gnu.org; Mon, 17 Oct 2011 15:21:53 -0400
Received: from eggs.gnu.org ([140.186.70.92]:55671)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1RFskx-0005C7-Dk
	for qemu-trivial@nongnu.org; Mon, 17 Oct 2011 15:21:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1RFskw-0007Sm-Kc
	for qemu-trivial@nongnu.org; Mon, 17 Oct 2011 15:21:51 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:60112)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1RFskr-0007RY-If; Mon, 17 Oct 2011 15:21:45 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	C3A5E72833E9; Mon, 17 Oct 2011 21:21:23 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id dKCgsuQdYNqI; Mon, 17 Oct 2011 21:21:03 +0200 (CEST)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 3765672834F6; Mon, 17 Oct 2011 21:21:03 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org
Date: Mon, 17 Oct 2011 21:20:59 +0200
Message-Id: <1318879259-3052-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	"Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>
Subject: [Qemu-trivial] [PATCH] hw/9pfs: Fix missing parentheses
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
X-List-Received-Date: Mon, 17 Oct 2011 19:21:52 -0000

cppcheck report:
hw/9pfs/virtio-9p.c:2385:
 style: Boolean result is used in bitwise operation.
 Clarify expression with parentheses
hw/9pfs/virtio-9p.c:2531:
 style: Boolean result is used in bitwise operation.
 Clarify expression with parentheses

Cc: Aneesh Kumar K.V <aneesh.kumar@linux.vnet.ibm.com>
Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 hw/9pfs/virtio-9p.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/9pfs/virtio-9p.c b/hw/9pfs/virtio-9p.c
index c01c31a..df0b22a 100644
--- a/hw/9pfs/virtio-9p.c
+++ b/hw/9pfs/virtio-9p.c
@@ -2382,7 +2382,7 @@ static void v9fs_remove(void *opaque)
         goto out_nofid;
     }
     /* if fs driver is not path based, return EOPNOTSUPP */
-    if (!pdu->s->ctx.flags & PATHNAME_FSCONTEXT) {
+    if (!(pdu->s->ctx.flags & PATHNAME_FSCONTEXT)) {
         err = -EOPNOTSUPP;
         goto out_err;
     }
@@ -2528,7 +2528,7 @@ static void v9fs_rename(void *opaque)
     }
     BUG_ON(fidp->fid_type != P9_FID_NONE);
     /* if fs driver is not path based, return EOPNOTSUPP */
-    if (!pdu->s->ctx.flags & PATHNAME_FSCONTEXT) {
+    if (!(pdu->s->ctx.flags & PATHNAME_FSCONTEXT)) {
         err = -EOPNOTSUPP;
         goto out;
     }
-- 
1.7.0.4


