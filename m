Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YUgl2-0004xx-3i
	for mharc-qemu-trivial@gnu.org; Sun, 08 Mar 2015 15:21:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32969)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@bib.uni-mannheim.de>) id 1YUgkw-0004wV-3o
	for qemu-trivial@nongnu.org; Sun, 08 Mar 2015 15:20:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@bib.uni-mannheim.de>) id 1YUgkr-0000YB-Gx
	for qemu-trivial@nongnu.org; Sun, 08 Mar 2015 15:20:54 -0400
Received: from p54acaf49.dip0.t-ipconnect.de ([84.172.175.73]:49246 helo=edv32)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@bib.uni-mannheim.de>)
	id 1YUgkr-0000XU-9x; Sun, 08 Mar 2015 15:20:49 -0400
Received: from stefan by edv32 with local (Exim 4.84)
	(envelope-from <stefan@bib.uni-mannheim.de>)
	id 1YUgBH-0001Jo-2P; Sun, 08 Mar 2015 19:44:03 +0100
From: Stefan Weil <sw@weilnetz.de>
To: QEMU Trivial <qemu-trivial@nongnu.org>
Date: Sun,  8 Mar 2015 19:44:02 +0100
Message-Id: <1425840242-5033-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 2.1.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 84.172.175.73
Cc: Stefan Weil <sw@weilnetz.de>, Anthony Green <green@moxielogic.com>,
	QEMU Developer <qemu-devel@nongnu.org>
Subject: [Qemu-trivial] [PATCH] target-moxie: Fix warnings from Sparse
	(one-bit signed bitfield)
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
X-List-Received-Date: Sun, 08 Mar 2015 19:20:58 -0000

Report from Sparse:

target-moxie/mmu.h:9:12: error: dubious one-bit signed bitfield
target-moxie/mmu.h:10:12: error: dubious one-bit signed bitfield
target-moxie/mmu.h:11:12: error: dubious one-bit signed bitfield
target-moxie/mmu.h:12:12: error: dubious one-bit signed bitfield
target-moxie/mmu.h:13:12: error: dubious one-bit signed bitfield

Cc: Anthony Green <green@moxielogic.com>
Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 target-moxie/mmu.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/target-moxie/mmu.h b/target-moxie/mmu.h
index e01ffc2..abc7929 100644
--- a/target-moxie/mmu.h
+++ b/target-moxie/mmu.h
@@ -6,11 +6,11 @@
 typedef struct {
     uint32_t phy;
     uint32_t pfn;
-    int g:1;
-    int v:1;
-    int k:1;
-    int w:1;
-    int e:1;
+    unsigned g:1;
+    unsigned v:1;
+    unsigned k:1;
+    unsigned w:1;
+    unsigned e:1;
     int cause_op;
 } MoxieMMUResult;
 
-- 
2.1.4


