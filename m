Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aj8S0-0004uf-13
	for mharc-qemu-trivial@gnu.org; Thu, 24 Mar 2016 12:49:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35504)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1aj8Rx-0004pB-4V
	for qemu-trivial@nongnu.org; Thu, 24 Mar 2016 12:49:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1aj8Rw-0004CB-D1
	for qemu-trivial@nongnu.org; Thu, 24 Mar 2016 12:49:33 -0400
Received: from qemu.weilnetz.de ([37.221.198.45]:42378)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1aj8Rq-0004Bu-KM; Thu, 24 Mar 2016 12:49:26 -0400
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
	id 732A717F69A; Thu, 24 Mar 2016 17:49:23 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: QEMU Developer <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>
Date: Thu, 24 Mar 2016 17:49:22 +0100
Message-Id: <1458838162-11034-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 2.1.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 37.221.198.45
Cc: Stefan Weil <sw@weilnetz.de>, Anthony Green <green@moxielogic.com>
Subject: [Qemu-trivial] [PATCH] target-moxie: Remove unused struct elements
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
X-List-Received-Date: Thu, 24 Mar 2016 16:49:34 -0000

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 target-moxie/mmu.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/target-moxie/mmu.h b/target-moxie/mmu.h
index abc7929..284a44d 100644
--- a/target-moxie/mmu.h
+++ b/target-moxie/mmu.h
@@ -6,11 +6,6 @@
 typedef struct {
     uint32_t phy;
     uint32_t pfn;
-    unsigned g:1;
-    unsigned v:1;
-    unsigned k:1;
-    unsigned w:1;
-    unsigned e:1;
     int cause_op;
 } MoxieMMUResult;
 
-- 
2.1.4


