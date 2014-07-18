Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1X88qx-0007jM-UP
	for mharc-qemu-trivial@gnu.org; Fri, 18 Jul 2014 10:09:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36941)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1X88qr-0007WF-2X
	for qemu-trivial@nongnu.org; Fri, 18 Jul 2014 10:09:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1X88qm-0001jl-0t
	for qemu-trivial@nongnu.org; Fri, 18 Jul 2014 10:09:33 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:55784)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1X88qb-0001d3-21; Fri, 18 Jul 2014 10:09:17 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id DD60F4386C;
	Fri, 18 Jul 2014 18:09:14 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id C463B6BB;
	Fri, 18 Jul 2014 18:09:14 +0400 (MSK)
Received: (nullmailer pid 633 invoked by uid 1000);
	Fri, 18 Jul 2014 14:09:14 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Fri, 18 Jul 2014 18:09:12 +0400
Message-Id: <1405692553-564-8-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1405692553-564-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1405692553-564-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 7/8] migration: Add missing 'static' attribute
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
X-List-Received-Date: Fri, 18 Jul 2014 14:09:38 -0000

From: Stefan Weil <sw@weilnetz.de>

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
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


