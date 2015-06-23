Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z7DP6-0001dI-TI
	for mharc-qemu-trivial@gnu.org; Mon, 22 Jun 2015 21:53:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60304)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1Z7DP3-0001ZD-R9
	for qemu-trivial@nongnu.org; Mon, 22 Jun 2015 21:53:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1Z7DP2-000360-R6
	for qemu-trivial@nongnu.org; Mon, 22 Jun 2015 21:53:33 -0400
Received: from szxga01-in.huawei.com ([58.251.152.64]:28879)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1Z7DP2-00033B-3k; Mon, 22 Jun 2015 21:53:32 -0400
Received: from 172.24.2.119 (EHLO szxeml432-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CPV49914; Tue, 23 Jun 2015 09:53:26 +0800 (CST)
Received: from localhost (10.177.19.102) by szxeml432-hub.china.huawei.com
	(10.82.67.209) with Microsoft SMTP Server id 14.3.158.1;
	Tue, 23 Jun 2015 09:53:08 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Tue, 23 Jun 2015 09:53:04 +0800
Message-ID: <1435024385-9084-2-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
In-Reply-To: <1435024385-9084-1-git-send-email-arei.gonglei@huawei.com>
References: <1435024385-9084-1-git-send-email-arei.gonglei@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 58.251.152.64
Cc: qemu-trivial@nongnu.org, Gonglei <arei.gonglei@huawei.com>, mst@redhat.com
Subject: [Qemu-trivial] [PATCH 1/2] virito-pci: fix OVERRUN problem
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
X-List-Received-Date: Tue, 23 Jun 2015 01:53:35 -0000

From: Gonglei <arei.gonglei@huawei.com>

Overrunning array "proxy->guest_features" of 2 4-byte
elements at element index 2 (byte offset 8) using index
"proxy->gfselect" (which evaluates to 2). Normally, the
Linux kernel driver just read/write '0' or '1' as the
"proxy->gfselect" values, so using '<' instead of '=<' to
make coverity happy and avoid potential harm.

Cc: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Gonglei <arei.gonglei@huawei.com>
---
 hw/virtio/virtio-pci.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index d7cf34c..ce1c46e 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -977,7 +977,7 @@ static uint64_t virtio_pci_common_read(void *opaque, hwaddr addr,
         val = proxy->gfselect;
         break;
     case VIRTIO_PCI_COMMON_GF:
-        if (proxy->gfselect <= ARRAY_SIZE(proxy->guest_features)) {
+        if (proxy->gfselect < ARRAY_SIZE(proxy->guest_features)) {
             val = proxy->guest_features[proxy->gfselect];
         }
         break;
@@ -1052,7 +1052,7 @@ static void virtio_pci_common_write(void *opaque, hwaddr addr,
         proxy->gfselect = val;
         break;
     case VIRTIO_PCI_COMMON_GF:
-        if (proxy->gfselect <= ARRAY_SIZE(proxy->guest_features)) {
+        if (proxy->gfselect < ARRAY_SIZE(proxy->guest_features)) {
             proxy->guest_features[proxy->gfselect] = val;
             virtio_set_features(vdev,
                                 (((uint64_t)proxy->guest_features[1]) << 32) |
-- 
1.7.12.4



