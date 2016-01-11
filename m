Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aIY8L-0001NY-OD
	for mharc-qemu-trivial@gnu.org; Mon, 11 Jan 2016 03:47:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51979)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aIY8D-000147-5v
	for qemu-trivial@nongnu.org; Mon, 11 Jan 2016 03:47:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aIY8C-0002AT-Bk
	for qemu-trivial@nongnu.org; Mon, 11 Jan 2016 03:47:17 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:35109)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1aIY86-00027O-Gl; Mon, 11 Jan 2016 03:47:10 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 627A7403E9;
	Mon, 11 Jan 2016 11:47:08 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id AF1F6A92;
	Mon, 11 Jan 2016 11:42:00 +0300 (MSK)
Received: (nullmailer pid 28773 invoked by uid 1000);
	Mon, 11 Jan 2016 08:41:59 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon, 11 Jan 2016 11:41:43 +0300
Message-Id: <240125bc49d016da2f39637c205b04fc6ae6dcef.1452501577.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1452501577.git.mjt@msgid.tls.msk.ru>
References: <cover.1452501577.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Zhu Lingshan <lszhu@suse.com>
Subject: [Qemu-trivial] [PULL 04/19] iscsi: fix readcapacity error message
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
X-List-Received-Date: Mon, 11 Jan 2016 08:47:18 -0000

From: Zhu Lingshan <lszhu@suse.com>

fix:The error message for readcapacity 16 incorrectly mentioned
a readcapacity 10 failure, fixed the error message.

Signed-off-by: Zhu Lingshan <lszhu@suse.com>
Reviewed-by: John Snow <jsnow@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 block/iscsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/iscsi.c b/block/iscsi.c
index bd1f1bf..eb28ddc 100644
--- a/block/iscsi.c
+++ b/block/iscsi.c
@@ -1270,7 +1270,7 @@ static void iscsi_readcapacity_sync(IscsiLun *iscsilun, Error **errp)
              && retries-- > 0);
 
     if (task == NULL || task->status != SCSI_STATUS_GOOD) {
-        error_setg(errp, "iSCSI: failed to send readcapacity10 command.");
+        error_setg(errp, "iSCSI: failed to send readcapacity10/16 command");
     } else if (!iscsilun->block_size ||
                iscsilun->block_size % BDRV_SECTOR_SIZE) {
         error_setg(errp, "iSCSI: the target returned an invalid "
-- 
2.1.4


