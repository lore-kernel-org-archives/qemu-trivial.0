Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bUrmO-0007Vj-Vb
	for mharc-qemu-trivial@gnu.org; Wed, 03 Aug 2016 04:43:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59442)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <xiecl.fnst@cn.fujitsu.com>) id 1bUrmL-0007PK-19
	for qemu-trivial@nongnu.org; Wed, 03 Aug 2016 04:43:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <xiecl.fnst@cn.fujitsu.com>) id 1bUrmJ-0002DH-5W
	for qemu-trivial@nongnu.org; Wed, 03 Aug 2016 04:43:52 -0400
Received: from [59.151.112.132] (port=27974 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <xiecl.fnst@cn.fujitsu.com>)
	id 1bUrmC-0002A4-E2; Wed, 03 Aug 2016 04:43:44 -0400
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="9481007"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 03 Aug 2016 16:43:28 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 080EA42CA540;
	Wed,  3 Aug 2016 16:43:25 +0800 (CST)
Received: from changlox.g08.fujitsu.local (10.167.225.55) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Wed, 3 Aug 2016 16:43:24 +0800
From: Changlong Xie <xiecl.fnst@cn.fujitsu.com>
To: qemu devel <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>, 
	qemu trival <qemu-trivial@nongnu.org>
Date: Wed, 3 Aug 2016 16:49:07 +0800
Message-ID: <1470214147-32560-1-git-send-email-xiecl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.3
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.55]
X-yoursite-MailScanner-ID: 080EA42CA540.ACC13
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xiecl.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Subject: [Qemu-trivial] [PATCH] virtio-blk: rename virtio_device_info to
 virtio_blk_info
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
X-List-Received-Date: Wed, 03 Aug 2016 08:43:56 -0000

The old one is confusing with @virtio_device_info in virtio.c,
so make it more appropriate.

Signed-off-by: Changlong Xie <xiecl.fnst@cn.fujitsu.com>
---
 hw/block/virtio-blk.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
index 475a822..a3a9e63 100644
--- a/hw/block/virtio-blk.c
+++ b/hw/block/virtio-blk.c
@@ -987,7 +987,7 @@ static void virtio_blk_class_init(ObjectClass *klass, void *data)
     vdc->load = virtio_blk_load_device;
 }
 
-static const TypeInfo virtio_device_info = {
+static const TypeInfo virtio_blk_info = {
     .name = TYPE_VIRTIO_BLK,
     .parent = TYPE_VIRTIO_DEVICE,
     .instance_size = sizeof(VirtIOBlock),
@@ -997,7 +997,7 @@ static const TypeInfo virtio_device_info = {
 
 static void virtio_register_types(void)
 {
-    type_register_static(&virtio_device_info);
+    type_register_static(&virtio_blk_info);
 }
 
 type_init(virtio_register_types)
-- 
1.9.3




