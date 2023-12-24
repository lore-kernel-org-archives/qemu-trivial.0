Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rHMtB-00020E-K4
	for mharc-qemu-trivial@gnu.org; Sun, 24 Dec 2023 06:43:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan@weilnetz.de>)
 id 1rHMtA-0001zt-9b; Sun, 24 Dec 2023 06:43:24 -0500
Received: from mail.weilnetz.de ([37.120.169.71]
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefan@weilnetz.de>)
 id 1rHMt8-0006WU-DL; Sun, 24 Dec 2023 06:43:24 -0500
Received: from qemu.weilnetz.de (qemu.weilnetz.de [188.68.58.204])
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTP id 05CAEDA0553;
 Sun, 24 Dec 2023 12:43:17 +0100 (CET)
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
 id 7D27646001A; Sun, 24 Dec 2023 12:43:17 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>
Cc: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 Stefan Weil <sw@weilnetz.de>
Subject: [PATCH] virtio-blk: Fix potential nullpointer read access in
 virtio_blk_data_plane_destroy
Date: Sun, 24 Dec 2023 12:43:14 +0100
Message-Id: <20231224114314.420360-1-sw@weilnetz.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=37.120.169.71; envelope-from=stefan@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sun, 24 Dec 2023 11:43:24 -0000

Fixes: CID 1532828
Fixes: b6948ab01d ("virtio-blk: add iothread-vq-mapping parameter")
Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 hw/block/dataplane/virtio-blk.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/block/dataplane/virtio-blk.c b/hw/block/dataplane/virtio-blk.c
index 6debd4401e..97a302cf49 100644
--- a/hw/block/dataplane/virtio-blk.c
+++ b/hw/block/dataplane/virtio-blk.c
@@ -152,7 +152,7 @@ bool virtio_blk_data_plane_create(VirtIODevice *vdev, VirtIOBlkConf *conf,
 void virtio_blk_data_plane_destroy(VirtIOBlockDataPlane *s)
 {
     VirtIOBlock *vblk;
-    VirtIOBlkConf *conf = s->conf;
+    VirtIOBlkConf *conf;
 
     if (!s) {
         return;
@@ -160,6 +160,7 @@ void virtio_blk_data_plane_destroy(VirtIOBlockDataPlane *s)
 
     vblk = VIRTIO_BLK(s->vdev);
     assert(!vblk->dataplane_started);
+    conf = s->conf;
 
     if (conf->iothread_vq_mapping_list) {
         IOThreadVirtQueueMappingList *node;
-- 
2.39.2


