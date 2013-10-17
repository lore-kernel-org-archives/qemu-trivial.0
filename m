Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VWtAn-0005eA-4d
	for mharc-qemu-trivial@gnu.org; Thu, 17 Oct 2013 15:23:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36971)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VWtAf-0005Wf-Vh
	for qemu-trivial@nongnu.org; Thu, 17 Oct 2013 15:23:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VWtAb-0000Ks-2V
	for qemu-trivial@nongnu.org; Thu, 17 Oct 2013 15:23:45 -0400
Received: from qemu.weilnetz.de ([37.221.198.45]:42823
	helo=v2201305906712890.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VWtAR-0000D4-4y; Thu, 17 Oct 2013 15:23:31 -0400
Received: by v2201305906712890.yourvserver.net (Postfix, from userid 1000)
	id DACE018029F; Thu, 17 Oct 2013 21:23:26 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel <qemu-devel@nongnu.org>
Date: Thu, 17 Oct 2013 21:23:26 +0200
Message-Id: <1382037806-9393-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.198.45
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Anthony Liguori <aliguori@amazon.com>,
	Stefan Hajnoczi <stefanha@redhat.com>
Subject: [Qemu-trivial] [PATCH] virtio: Remove unneeded memcpy
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
X-List-Received-Date: Thu, 17 Oct 2013 19:23:51 -0000

Report from valgrind:

==19521== Source and destination overlap in memcpy(0x31d38938, 0x31d38938, 64)
==19521==    at 0x4A0A343: memcpy@@GLIBC_2.14 (in
/usr/lib64/valgrind/vgpreload_memcheck-amd64-linux.so)
==19521==    by 0x42774E: virtio_blk_device_init (virtio-blk.c:686)
==19521==    by 0x46EE9E: virtio_device_init (virtio.c:1158)
==19521==    by 0x25405E: device_realize (qdev.c:178)
==19521==    by 0x2559B5: device_set_realized (qdev.c:699)
==19521==    by 0x3A819B: property_set_bool (object.c:1315)
==19521==    by 0x3A6CE0: object_property_set (object.c:803)

Valgrind is right: blk == &s->blks, so it is a memcpy of 64 byte with
source == destination which can be removed.

Reported-by: Dave Airlie <airlied@gmail.com>
Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 hw/block/virtio-blk.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
index 49a23c3..13f6d82 100644
--- a/hw/block/virtio-blk.c
+++ b/hw/block/virtio-blk.c
@@ -703,7 +703,6 @@ static int virtio_blk_device_init(VirtIODevice *vdev)
 
     s->bs = blk->conf.bs;
     s->conf = &blk->conf;
-    memcpy(&(s->blk), blk, sizeof(struct VirtIOBlkConf));
     s->rq = NULL;
     s->sector_mask = (s->conf->logical_block_size / BDRV_SECTOR_SIZE) - 1;
 
-- 
1.7.9.5


