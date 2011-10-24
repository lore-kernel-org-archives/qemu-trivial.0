Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RISWy-00078k-2q
	for mharc-qemu-trivial@gnu.org; Mon, 24 Oct 2011 17:58:04 -0400
Received: from eggs.gnu.org ([140.186.70.92]:49931)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1RIQzP-0004Yx-Mh
	for qemu-trivial@nongnu.org; Mon, 24 Oct 2011 16:19:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1RIQzO-0001yi-LI
	for qemu-trivial@nongnu.org; Mon, 24 Oct 2011 16:19:19 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:41793)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1RIQzM-0001xS-2R; Mon, 24 Oct 2011 16:19:16 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	AF27B7283497; Mon, 24 Oct 2011 22:19:04 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id r-Ce4r-xICGA; Mon, 24 Oct 2011 22:18:44 +0200 (CEST)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 1F42A7283495; Mon, 24 Oct 2011 22:18:44 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org
Date: Mon, 24 Oct 2011 22:18:43 +0200
Message-Id: <1319487523-19978-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH] Fix compiler warning (always return a value)
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
X-List-Received-Date: Mon, 24 Oct 2011 21:58:01 -0000

For compilations with -DNDEBUG, the default case did not return
a value which caused a compiler warning.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 hw/ppce500_spin.c |   11 ++++++++---
 1 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/hw/ppce500_spin.c b/hw/ppce500_spin.c
index cccd940..5b5ffe0 100644
--- a/hw/ppce500_spin.c
+++ b/hw/ppce500_spin.c
@@ -168,17 +168,22 @@ static uint64_t spin_read(void *opaque, target_phys_addr_t addr, unsigned len)
 {
     SpinState *s = opaque;
     uint8_t *spin_p = &((uint8_t*)s->spin)[addr];
+    uint64_t result = 0;
 
     switch (len) {
     case 1:
-        return ldub_p(spin_p);
+        result = ldub_p(spin_p);
+        break;
     case 2:
-        return lduw_p(spin_p);
+        result = lduw_p(spin_p);
+        break;
     case 4:
-        return ldl_p(spin_p);
+        result = ldl_p(spin_p);
+        break;
     default:
         assert(0);
     }
+    return result;
 }
 
 const MemoryRegionOps spin_rw_ops = {
-- 
1.7.2.5


