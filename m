Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YYWfM-0004xT-UT
	for mharc-qemu-trivial@gnu.org; Thu, 19 Mar 2015 05:23:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35559)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YYWfL-0004tb-12
	for qemu-trivial@nongnu.org; Thu, 19 Mar 2015 05:22:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YYWfG-00035m-Qp
	for qemu-trivial@nongnu.org; Thu, 19 Mar 2015 05:22:58 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:49670)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YYWf1-0002uc-3e; Thu, 19 Mar 2015 05:22:39 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 9428141E47;
	Thu, 19 Mar 2015 12:22:36 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 78CBB921;
	Thu, 19 Mar 2015 12:05:45 +0300 (MSK)
Received: (nullmailer pid 343 invoked by uid 1000);
	Thu, 19 Mar 2015 09:05:44 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 19 Mar 2015 12:05:28 +0300
Message-Id: <6093d01194edd74e24d46028b84d9d4a0a5cba17.1426755483.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1426755483.git.mjt@msgid.tls.msk.ru>
References: <cover.1426755483.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Anthony Green <green@moxielogic.com>, Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 10/24] target-moxie: Fix warnings from Sparse
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
X-List-Received-Date: Thu, 19 Mar 2015 09:23:00 -0000

From: Stefan Weil <sw@weilnetz.de>

Report from Sparse:

target-moxie/mmu.h:9:12: error: dubious one-bit signed bitfield
target-moxie/mmu.h:10:12: error: dubious one-bit signed bitfield
target-moxie/mmu.h:11:12: error: dubious one-bit signed bitfield
target-moxie/mmu.h:12:12: error: dubious one-bit signed bitfield
target-moxie/mmu.h:13:12: error: dubious one-bit signed bitfield

Cc: Anthony Green <green@moxielogic.com>
Signed-off-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
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


