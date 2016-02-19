Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aWpYL-0005Rs-Mf
	for mharc-qemu-trivial@gnu.org; Fri, 19 Feb 2016 13:13:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52871)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1aWpYK-0005Q5-1V
	for qemu-trivial@nongnu.org; Fri, 19 Feb 2016 13:13:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1aWpYJ-0003tc-9Y
	for qemu-trivial@nongnu.org; Fri, 19 Feb 2016 13:13:15 -0500
Received: from mx1.redhat.com ([209.132.183.28]:43607)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>)
	id 1aWpYE-0003rx-ES; Fri, 19 Feb 2016 13:13:10 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id 1DE8FBE02E;
	Fri, 19 Feb 2016 18:13:09 +0000 (UTC)
Received: from rhlaptop.redhat.com (vpn-61-139.rdu2.redhat.com [10.10.61.139])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id u1JID812024416; Fri, 19 Feb 2016 13:13:08 -0500
From: Wei Huang <wei@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 19 Feb 2016 12:13:07 -0600
Message-Id: <1455905587-4347-1-git-send-email-wei@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, mst@redhat.com
Subject: [Qemu-trivial] [PATCH 1/1] virtio-rng: fix condition checking on
	period_ms
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
X-List-Received-Date: Fri, 19 Feb 2016 18:13:17 -0000

The condition checking on vrng->conf.period_ms appears to be wrong,
conflicting with the error comment following it.

Signed-off-by: Wei Huang <wei@redhat.com>
---
 hw/virtio/virtio-rng.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/virtio/virtio-rng.c b/hw/virtio/virtio-rng.c
index 473c044..a06427c 100644
--- a/hw/virtio/virtio-rng.c
+++ b/hw/virtio/virtio-rng.c
@@ -149,7 +149,7 @@ static void virtio_rng_device_realize(DeviceState *dev, Error **errp)
     VirtIORNG *vrng = VIRTIO_RNG(dev);
     Error *local_err = NULL;
 
-    if (!vrng->conf.period_ms > 0) {
+    if (!(vrng->conf.period_ms > 0)) {
         error_setg(errp, "'period' parameter expects a positive integer");
         return;
     }
-- 
2.4.3


