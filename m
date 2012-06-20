Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ShNRg-0006Bj-3t
	for mharc-qemu-trivial@gnu.org; Wed, 20 Jun 2012 12:07:52 -0400
Received: from eggs.gnu.org ([208.118.235.92]:41832)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1ShNRZ-0005qC-5c
	for qemu-trivial@nongnu.org; Wed, 20 Jun 2012 12:07:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1ShNRS-0003sz-EY
	for qemu-trivial@nongnu.org; Wed, 20 Jun 2012 12:07:44 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:42665)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1ShNRH-0003rI-OO; Wed, 20 Jun 2012 12:07:27 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	D56307280025; Wed, 20 Jun 2012 18:07:25 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id 3mtgmv9PvOQN; Wed, 20 Jun 2012 18:07:25 +0200 (CEST)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 03D9E72800C1; Wed, 20 Jun 2012 18:07:24 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial <qemu-trivial@nongnu.org>
Date: Wed, 20 Jun 2012 18:07:24 +0200
Message-Id: <1340208444-14440-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 78.47.199.172
Cc: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH] tci: Support INDEX_op_bswap64_i64
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
X-List-Received-Date: Wed, 20 Jun 2012 16:07:51 -0000

Running the Windows 7 (64 bit) boot process needs INDEX_op_bswap64_i64.
It was already implemented, but untested. Remove the TODO() statement.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 tci.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/tci.c b/tci.c
index e40c080..01d365a 100644
--- a/tci.c
+++ b/tci.c
@@ -1036,7 +1036,6 @@ tcg_target_ulong tcg_qemu_tb_exec(CPUArchState *cpustate, uint8_t *tb_ptr)
 #endif
 #if TCG_TARGET_HAS_bswap64_i64
         case INDEX_op_bswap64_i64:
-            TODO();
             t0 = *tb_ptr++;
             t1 = tci_read_r64(&tb_ptr);
             tci_write_reg64(t0, bswap64(t1));
-- 
1.7.10


