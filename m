Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1X4Eqv-000180-RK
	for mharc-qemu-trivial@gnu.org; Mon, 07 Jul 2014 15:45:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56511)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1X4EIB-0000KK-Ou
	for qemu-trivial@nongnu.org; Mon, 07 Jul 2014 15:09:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1X4EIA-0005Lc-VO
	for qemu-trivial@nongnu.org; Mon, 07 Jul 2014 15:09:35 -0400
Received: from qemu.weilnetz.de ([2a03:4000:2:362::1]:47173)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1X4EI9-0005L1-4x; Mon, 07 Jul 2014 15:09:33 -0400
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
	id 13F9217FA16; Mon,  7 Jul 2014 21:09:31 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org
Date: Mon,  7 Jul 2014 21:09:30 +0200
Message-Id: <1404760170-29967-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a03:4000:2:362::1
Cc: qemu-trivial@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>, Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH] migration: Add missing 'static' attribute
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
X-List-Received-Date: Mon, 07 Jul 2014 19:45:28 -0000

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 block-migration.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block-migration.c b/block-migration.c
index 25a0388..73cdd07 100644
--- a/block-migration.c
+++ b/block-migration.c
@@ -861,7 +861,7 @@ static bool block_is_active(void *opaque)
     return block_mig_state.blk_enable == 1;
 }
 
-SaveVMHandlers savevm_block_handlers = {
+static SaveVMHandlers savevm_block_handlers = {
     .set_params = block_set_params,
     .save_live_setup = block_save_setup,
     .save_live_iterate = block_save_iterate,
-- 
1.7.10.4


