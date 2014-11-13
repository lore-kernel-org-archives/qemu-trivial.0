Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XokKk-0005Ce-3Z
	for mharc-qemu-trivial@gnu.org; Wed, 12 Nov 2014 21:40:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41091)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XokKe-00058q-8K
	for qemu-trivial@nongnu.org; Wed, 12 Nov 2014 21:40:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XokKZ-0005mS-6t
	for qemu-trivial@nongnu.org; Wed, 12 Nov 2014 21:40:24 -0500
Received: from szxga03-in.huawei.com ([119.145.14.66]:57977)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1XokKI-0005Xv-MT; Wed, 12 Nov 2014 21:40:03 -0500
Received: from 172.24.2.119 (EHLO szxeml413-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id AXA62731; Thu, 13 Nov 2014 10:39:54 +0800 (CST)
Received: from localhost (10.177.19.102) by szxeml413-hub.china.huawei.com
	(10.82.67.152) with Microsoft SMTP Server id 14.3.158.1;
	Thu, 13 Nov 2014 10:39:44 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 13 Nov 2014 10:39:32 +0800
Message-ID: <1415846372-12756-1-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020206.546419FB.0085, ss=1, re=0.001, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 82cfbecbf16fc289b699e8a1543fed51
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: qemu-trivial@nongnu.org, Gonglei <arei.gonglei@huawei.com>,
	peter.huangpeng@huawei.com, mst@redhat.com
Subject: [Qemu-trivial] [PATCH] virtio-bus: avoid breaking build when open
	DEBUG switch
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
X-List-Received-Date: Thu, 13 Nov 2014 02:40:29 -0000

From: Gonglei <arei.gonglei@huawei.com>

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
---
 hw/virtio/virtio-bus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/virtio/virtio-bus.c b/hw/virtio/virtio-bus.c
index eb77019..dfd2d8c 100644
--- a/hw/virtio/virtio-bus.c
+++ b/hw/virtio/virtio-bus.c
@@ -58,7 +58,7 @@ void virtio_bus_reset(VirtioBusState *bus)
 {
     VirtIODevice *vdev = virtio_bus_get_device(bus);
 
-    DPRINTF("%s: reset device.\n", qbus->name);
+    DPRINTF("%s: reset device.\n", BUS(bus)->name);
     if (vdev != NULL) {
         virtio_reset(vdev);
     }
-- 
1.7.12.4



