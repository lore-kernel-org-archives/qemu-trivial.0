Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b30p3-0004ve-J0
	for mharc-qemu-trivial@gnu.org; Wed, 18 May 2016 08:43:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39136)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b30p1-0004tb-Ct
	for qemu-trivial@nongnu.org; Wed, 18 May 2016 08:43:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b30p0-00031K-G5
	for qemu-trivial@nongnu.org; Wed, 18 May 2016 08:43:31 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:50622)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1b30ov-0002yT-0b; Wed, 18 May 2016 08:43:25 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id B9B8D41788;
	Wed, 18 May 2016 15:43:19 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id D4BE4ADA;
	Wed, 18 May 2016 15:43:18 +0300 (MSK)
Received: (nullmailer pid 20478 invoked by uid 1000);
	Wed, 18 May 2016 12:43:18 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Date: Wed, 18 May 2016 15:43:17 +0300
Message-Id: <1463575397-20438-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PATCH trivial] s390x/virtio-ccw: fix spelling
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
X-List-Received-Date: Wed, 18 May 2016 12:43:32 -0000

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/s390x/virtio-ccw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/s390x/virtio-ccw.c b/hw/s390x/virtio-ccw.c
index d51642d..5e77b27 100644
--- a/hw/s390x/virtio-ccw.c
+++ b/hw/s390x/virtio-ccw.c
@@ -1475,7 +1475,7 @@ static void virtio_ccw_device_plugged(DeviceState *d, Error **errp)
     int n = virtio_get_num_queues(vdev);
 
     if (virtio_get_num_queues(vdev) > VIRTIO_CCW_QUEUE_MAX) {
-        error_setg(errp, "The nubmer of virtqueues %d "
+        error_setg(errp, "The number of virtqueues %d "
                    "exceeds ccw limit %d", n,
                    VIRTIO_CCW_QUEUE_MAX);
         return;
-- 
2.1.4


