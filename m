Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S1HGI-0008M1-TU
	for mharc-qemu-trivial@gnu.org; Sat, 25 Feb 2012 08:02:06 -0500
Received: from eggs.gnu.org ([208.118.235.92]:37514)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1S1HGC-0007wS-3C
	for qemu-trivial@nongnu.org; Sat, 25 Feb 2012 08:02:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1S1HG7-0007C8-9a
	for qemu-trivial@nongnu.org; Sat, 25 Feb 2012 08:01:59 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:41784)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1S1HFx-0007Av-Bt; Sat, 25 Feb 2012 08:01:45 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	1B3307280099; Sat, 25 Feb 2012 14:01:44 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id k8K+-LAfZoMn; Sat, 25 Feb 2012 14:01:43 +0100 (CET)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 68838728009A; Sat, 25 Feb 2012 14:01:43 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: QEMU Trivial <qemu-trivial@nongnu.org>
Date: Sat, 25 Feb 2012 14:01:42 +0100
Message-Id: <1330174902-12364-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.9
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 78.47.199.172
Cc: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH] block/vmdk: Fix warning from splint
	(comparision of unsigned value)
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
X-List-Received-Date: Sat, 25 Feb 2012 13:02:05 -0000

l1_entry_sectors will never be less than 0.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 block/vmdk.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/block/vmdk.c b/block/vmdk.c
index 5623ac1..45c003a 100644
--- a/block/vmdk.c
+++ b/block/vmdk.c
@@ -453,7 +453,7 @@ static int vmdk_open_vmdk4(BlockDriverState *bs,
     }
     l1_entry_sectors = le32_to_cpu(header.num_gtes_per_gte)
                         * le64_to_cpu(header.granularity);
-    if (l1_entry_sectors <= 0) {
+    if (l1_entry_sectors == 0) {
         return -EINVAL;
     }
     l1_size = (le64_to_cpu(header.capacity) + l1_entry_sectors - 1)
-- 
1.7.9


