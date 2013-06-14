Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UnRgw-00049K-RB
	for mharc-qemu-trivial@gnu.org; Fri, 14 Jun 2013 06:57:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56583)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UnRgp-0003v5-Bc
	for qemu-trivial@nongnu.org; Fri, 14 Jun 2013 06:57:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UnRgn-0006Nf-I8
	for qemu-trivial@nongnu.org; Fri, 14 Jun 2013 06:57:07 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:59844)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1UnRgi-0006DS-Jo; Fri, 14 Jun 2013 06:57:00 -0400
Received: from gandalf.tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id D68AE41664;
	Fri, 14 Jun 2013 14:56:59 +0400 (MSK)
Received: by gandalf.tls.msk.ru (Postfix, from userid 1000)
	id AD0A151E; Fri, 14 Jun 2013 14:50:47 +0400 (MSK)
From: Michael Tokarev <mjt@tls.msk.ru>
To: Anthony Liguori <aliguori@us.ibm.com>
Date: Fri, 14 Jun 2013 14:50:30 +0400
Message-Id: <1371207042-17980-15-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1371207042-17980-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1371207042-17980-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 14/26] hw/scsi: Don't increment a boolean value
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
X-List-Received-Date: Fri, 14 Jun 2013 10:57:12 -0000

From: Stefan Weil <sw@weilnetz.de>

This fixes a warning from cppcheck.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/scsi/vmw_pvscsi.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/scsi/vmw_pvscsi.c b/hw/scsi/vmw_pvscsi.c
index 48d12f4..446f723 100644
--- a/hw/scsi/vmw_pvscsi.c
+++ b/hw/scsi/vmw_pvscsi.c
@@ -389,7 +389,7 @@ pvscsi_process_completion_queue(void *opaque)
         QTAILQ_REMOVE(&s->completion_queue, pvscsi_req, next);
         pvscsi_cmp_ring_put(s, &pvscsi_req->cmp);
         g_free(pvscsi_req);
-        has_completed++;
+        has_completed = true;
     }
 
     if (has_completed) {
-- 
1.7.10.4


