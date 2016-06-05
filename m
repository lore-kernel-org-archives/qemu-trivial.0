Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b9Sit-00033Q-Cl
	for mharc-qemu-trivial@gnu.org; Sun, 05 Jun 2016 03:43:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58954)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b9Sim-0002yf-T6
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2016 03:43:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b9Sil-0004Q5-Un
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2016 03:43:44 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:40236)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1b9Sig-0004OR-8G; Sun, 05 Jun 2016 03:43:38 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id C14054090F;
	Sun,  5 Jun 2016 10:43:32 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 4874DAD6;
	Sun,  5 Jun 2016 10:43:32 +0300 (MSK)
Received: (nullmailer pid 1101 invoked by uid 1000);
	Sun, 05 Jun 2016 07:43:32 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Stefan Weil <sw@weilnetz.de>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Sun,  5 Jun 2016 10:42:43 +0300
Message-Id: <288bd72ef6caff7154430ce4de9094481eabf14c.1465112552.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1465112552.git.mjt@msgid.tls.msk.ru>
References: <cover.1465112552.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 06/52] target-moxie: Remove unused struct
 elements
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sun, 05 Jun 2016 07:43:45 -0000

From: Stefan Weil <sw@weilnetz.de>

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
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


