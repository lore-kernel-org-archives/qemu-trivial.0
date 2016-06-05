Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b9XDb-0007QV-Gl
	for mharc-qemu-trivial@gnu.org; Sun, 05 Jun 2016 08:31:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44322)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b9XDV-0007Ko-TP
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2016 08:31:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b9XDR-000208-TG
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2016 08:31:45 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:57768)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1b9XDJ-0001wc-VX; Sun, 05 Jun 2016 08:31:34 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id A5DDC40927;
	Sun,  5 Jun 2016 15:31:30 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 25836AEB;
	Sun,  5 Jun 2016 10:43:35 +0300 (MSK)
Received: (nullmailer pid 1091 invoked by uid 1000);
	Sun, 05 Jun 2016 07:43:32 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org
Date: Sun,  5 Jun 2016 10:42:38 +0300
Message-Id: <28410d342f21f27d349de1c5a19e44369209e34f.1465112552.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1465112552.git.mjt@msgid.tls.msk.ru>
References: <cover.1465112552.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 01/52] s390x/virtio-ccw: fix spelling
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
X-List-Received-Date: Sun, 05 Jun 2016 12:31:50 -0000

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
Acked-by: Christian Borntraeger <borntraeger@de.ibm.com>
Acked-by: Cornelia Huck <cornelia.huck@de.ibm.com>
---
 hw/s390x/virtio-ccw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/s390x/virtio-ccw.c b/hw/s390x/virtio-ccw.c
index a1c1ed9..2b68e5e 100644
--- a/hw/s390x/virtio-ccw.c
+++ b/hw/s390x/virtio-ccw.c
@@ -1476,7 +1476,7 @@ static void virtio_ccw_device_plugged(DeviceState *d, Error **errp)
     int n = virtio_get_num_queues(vdev);
 
     if (virtio_get_num_queues(vdev) > VIRTIO_CCW_QUEUE_MAX) {
-        error_setg(errp, "The nubmer of virtqueues %d "
+        error_setg(errp, "The number of virtqueues %d "
                    "exceeds ccw limit %d", n,
                    VIRTIO_CCW_QUEUE_MAX);
         return;
-- 
2.1.4


