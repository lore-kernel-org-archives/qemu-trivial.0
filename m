Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1a9D1j-0007Um-NF
	for mharc-qemu-trivial@gnu.org; Wed, 16 Dec 2015 09:25:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53686)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lszhu@suse.com>) id 1a93tw-0003ZG-GB
	for qemu-trivial@nongnu.org; Tue, 15 Dec 2015 23:41:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lszhu@suse.com>) id 1a93tv-0003tw-QH
	for qemu-trivial@nongnu.org; Tue, 15 Dec 2015 23:41:20 -0500
Received: from smtp2.provo.novell.com ([137.65.250.81]:46218)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lszhu@suse.com>)
	id 1a93to-0003kH-3p; Tue, 15 Dec 2015 23:41:12 -0500
Received: from lszhu.apac.novell.com (prv-ext-foundry1int.gns.novell.com
	[137.65.251.240])
	by smtp2.provo.novell.com with ESMTP (TLS encrypted);
	Tue, 15 Dec 2015 21:40:59 -0700
From: Zhu Lingshan <lszhu@suse.com>
To: qemu-block@nongnu.org
Date: Wed, 16 Dec 2015 12:40:40 +0800
Message-Id: <1450240840-563-1-git-send-email-lszhu@suse.com>
X-Mailer: git-send-email 2.6.2
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 137.65.250.81
X-Mailman-Approved-At: Wed, 16 Dec 2015 09:25:58 -0500
Cc: Zhu Lingshan <lszhu@suse.com>, qemu-trivial@nongnu.org, pl@kamp.de,
	qemu-devel@nongnu.org, ronniesahlberg@gmail.com, pbonzini@redhat.com
Subject: [Qemu-trivial] [PATCH] iscsi: fix readcapacity error message
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
X-List-Received-Date: Wed, 16 Dec 2015 04:41:21 -0000

fix:The error message for readcapacity 16 incorrectly mentioned
a readcapacity 10 failure, fixed the error message.

Signed-off-by: Zhu Lingshan <lszhu@suse.com>
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
2.6.2


