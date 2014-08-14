Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XHv32-00025d-4l
	for mharc-qemu-trivial@gnu.org; Thu, 14 Aug 2014 09:26:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43348)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XHpWO-0005SN-8L
	for qemu-trivial@nongnu.org; Thu, 14 Aug 2014 03:32:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XHpWJ-0006Q9-Ez
	for qemu-trivial@nongnu.org; Thu, 14 Aug 2014 03:32:28 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:5084)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>)
	id 1XHpW6-0006Kb-AW; Thu, 14 Aug 2014 03:32:11 -0400
Received: from 172.24.2.119 (EHLO szxeml419-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id BYE11831; Thu, 14 Aug 2014 15:30:57 +0800 (CST)
Received: from localhost (10.177.22.69) by szxeml419-hub.china.huawei.com
	(10.82.67.158) with Microsoft SMTP Server id 14.3.158.1;
	Thu, 14 Aug 2014 15:29:52 +0800
From: zhanghailiang <zhang.zhanghailiang@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 14 Aug 2014 15:29:14 +0800
Message-ID: <1408001361-13580-4-git-send-email-zhang.zhanghailiang@huawei.com>
X-Mailer: git-send-email 1.9.2.msysgit.0
In-Reply-To: <1408001361-13580-1-git-send-email-zhang.zhanghailiang@huawei.com>
References: <1408001361-13580-1-git-send-email-zhang.zhanghailiang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.22.69]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
X-Mailman-Approved-At: Thu, 14 Aug 2014 09:26:29 -0400
Cc: kwolf@redhat.com, lkurusa@redhat.com,
	zhanghailiang <zhang.zhanghailiang@huawei.com>, mst@redhat.com,
	qemu-trivial@nongnu.org, jan.kiszka@siemens.com,
	riku.voipio@iki.fi, mjt@tls.msk.ru, peter.huangpeng@huawei.com,
	lcapitulino@redhat.com, stefanha@redhat.com,
	luonengjun@huawei.com, pbonzini@redhat.com,
	alex.bennee@linaro.org, rth@twiddle.net
Subject: [Qemu-trivial] [PATCH v6 03/10] virtio-blk: fix reference a pointer
	which might be freed
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
X-List-Received-Date: Thu, 14 Aug 2014 07:32:33 -0000

In function virtio_blk_handle_request, it may freed memory pointed by req,
So do not access member of req after calling this function.

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
---
 hw/block/virtio-blk.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
index c241c50..54a853a 100644
--- a/hw/block/virtio-blk.c
+++ b/hw/block/virtio-blk.c
@@ -458,7 +458,7 @@ static void virtio_blk_handle_output(VirtIODevice *vdev, VirtQueue *vq)
 static void virtio_blk_dma_restart_bh(void *opaque)
 {
     VirtIOBlock *s = opaque;
-    VirtIOBlockReq *req = s->rq;
+    VirtIOBlockReq *req = s->rq, *next = NULL;
     MultiReqBuffer mrb = {
         .num_writes = 0,
     };
@@ -469,8 +469,9 @@ static void virtio_blk_dma_restart_bh(void *opaque)
     s->rq = NULL;
 
     while (req) {
+        next = req->next;
         virtio_blk_handle_request(req, &mrb);
-        req = req->next;
+        req = next;
     }
 
     virtio_submit_multiwrite(s->bs, &mrb);
-- 
1.7.12.4



