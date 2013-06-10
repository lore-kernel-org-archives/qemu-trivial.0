Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Um8eJ-0005bb-HZ
	for mharc-qemu-trivial@gnu.org; Mon, 10 Jun 2013 16:25:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40100)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1Um8eH-0005X7-At
	for qemu-trivial@nongnu.org; Mon, 10 Jun 2013 16:25:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1Um8eF-0000gC-FU
	for qemu-trivial@nongnu.org; Mon, 10 Jun 2013 16:25:05 -0400
Received: from [2a03:4000:2:362::1] (port=36001
	helo=v2201305906712890.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1Um8eC-0000W8-Ak; Mon, 10 Jun 2013 16:25:00 -0400
Received: by v2201305906712890.yourvserver.net (Postfix, from userid 1000)
	id 0FB491820F8; Mon, 10 Jun 2013 22:24:57 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial <qemu-trivial@nongnu.org>
Date: Mon, 10 Jun 2013 22:24:56 +0200
Message-Id: <1370895896-10546-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a03:4000:2:362::1
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
	Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH] hw/scsi: Don't increment a boolean value
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
X-List-Received-Date: Mon, 10 Jun 2013 20:25:06 -0000

This fixes a warning from cppcheck.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
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


