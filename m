Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d7GL3-0006jq-6q
	for mharc-qemu-trivial@gnu.org; Sun, 07 May 2017 03:10:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54467)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1d7GL0-0006gg-Ta
	for qemu-trivial@nongnu.org; Sun, 07 May 2017 03:10:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1d7GL0-0000jt-0P
	for qemu-trivial@nongnu.org; Sun, 07 May 2017 03:10:38 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:42251)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1d7GKv-0000hd-Hn; Sun, 07 May 2017 03:10:33 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id DA27740480;
	Sun,  7 May 2017 10:10:32 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 57C33436;
	Sun,  7 May 2017 10:02:31 +0300 (MSK)
Received: (nullmailer pid 26567 invoked by uid 1000);
	Sun, 07 May 2017 07:02:29 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Fam Zheng <famz@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Sun,  7 May 2017 10:02:17 +0300
Message-Id: <ed836aa2cb4ad78e00f07e13aabd73af71a7d4a2.1494140528.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1494140527.git.mjt@msgid.tls.msk.ru>
References: <cover.1494140527.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1494140527.git.mjt@msgid.tls.msk.ru>
References: <cover.1494140527.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 14/23] virtio-blk: Remove useless condition
 around g_free()
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
X-List-Received-Date: Sun, 07 May 2017 07:10:40 -0000

From: Fam Zheng <famz@redhat.com>

Laszlo spotted and studied this wasteful "if". He pointed out:

The original virtio_blk_free_request needed an "if" as it accesses one
field, since 671ec3f05655 ("virtio-blk: Convert VirtIOBlockReq.elem to
pointer", 2014-06-11); later on in f897bf751fbd ("virtio-blk: embed
VirtQueueElement in VirtIOBlockReq", 2014-07-09) the field became
embedded, so the "if" became unnecessary (at which point we were using
g_slice_free(), but it is the same.

Now drop it.

Reported-by: Laszlo Ersek <lersek@redhat.com>
Signed-off-by: Fam Zheng <famz@redhat.com>
Reviewed-by: Laszlo Ersek <lersek@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/block/virtio-blk.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
index 98c16a7a9a..604d37dfc8 100644
--- a/hw/block/virtio-blk.c
+++ b/hw/block/virtio-blk.c
@@ -42,9 +42,7 @@ static void virtio_blk_init_request(VirtIOBlock *s, VirtQueue *vq,
 
 static void virtio_blk_free_request(VirtIOBlockReq *req)
 {
-    if (req) {
-        g_free(req);
-    }
+    g_free(req);
 }
 
 static void virtio_blk_req_complete(VirtIOBlockReq *req, unsigned char status)
-- 
2.11.0


