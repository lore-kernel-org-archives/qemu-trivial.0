Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gs74a-0003eS-6m
	for mharc-qemu-trivial@gnu.org; Fri, 08 Feb 2019 09:24:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37195)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sgarzare@redhat.com>) id 1gs74X-0003ch-V6
	for qemu-trivial@nongnu.org; Fri, 08 Feb 2019 09:24:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sgarzare@redhat.com>) id 1gs74X-00067x-3w
	for qemu-trivial@nongnu.org; Fri, 08 Feb 2019 09:24:05 -0500
Received: from mx1.redhat.com ([209.132.183.28]:11225)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sgarzare@redhat.com>)
	id 1gs74Q-000634-2f; Fri, 08 Feb 2019 09:23:58 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0E72EC073D7D;
	Fri,  8 Feb 2019 14:23:57 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-116-173.ams2.redhat.com
	[10.36.116.173])
	by smtp.corp.redhat.com (Postfix) with ESMTP id ED05F6090D;
	Fri,  8 Feb 2019 14:23:48 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
	Kevin Wolf <kwolf@redhat.com>, qemu-trivial@nongnu.org,
	Max Reitz <mreitz@redhat.com>
Date: Fri,  8 Feb 2019 15:23:47 +0100
Message-Id: <20190208142347.214815-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Fri, 08 Feb 2019 14:23:57 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] virtio-blk: cleanup using VirtIOBlock *s and
 VirtIODevice *vdev
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
X-List-Received-Date: Fri, 08 Feb 2019 14:24:06 -0000

In several part we still using req->dev or VIRTIO_DEVICE(req->dev)
when we have already defined s and vdev pointers:
    VirtIOBlock *s =3D req->dev;
    VirtIODevice *vdev =3D VIRTIO_DEVICE(s);

Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 hw/block/virtio-blk.c | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
index 9a87b3bfac..843bb2bec8 100644
--- a/hw/block/virtio-blk.c
+++ b/hw/block/virtio-blk.c
@@ -63,9 +63,8 @@ static void virtio_blk_req_complete(VirtIOBlockReq *req=
, unsigned char status)
 static int virtio_blk_handle_rw_error(VirtIOBlockReq *req, int error,
     bool is_read)
 {
-    BlockErrorAction action =3D blk_get_error_action(req->dev->blk,
-                                                   is_read, error);
     VirtIOBlock *s =3D req->dev;
+    BlockErrorAction action =3D blk_get_error_action(s->blk, is_read, er=
ror);
=20
     if (action =3D=3D BLOCK_ERROR_ACTION_STOP) {
         /* Break the link as the next request is going to be parsed from=
 the
@@ -138,7 +137,7 @@ static void virtio_blk_flush_complete(void *opaque, i=
nt ret)
     }
=20
     virtio_blk_req_complete(req, VIRTIO_BLK_S_OK);
-    block_acct_done(blk_get_stats(req->dev->blk), &req->acct);
+    block_acct_done(blk_get_stats(s->blk), &req->acct);
     virtio_blk_free_request(req);
=20
 out:
@@ -513,7 +512,7 @@ static int virtio_blk_handle_request(VirtIOBlockReq *=
req, MultiReqBuffer *mrb)
               - sizeof(struct virtio_blk_inhdr);
     iov_discard_back(in_iov, &in_num, sizeof(struct virtio_blk_inhdr));
=20
-    type =3D virtio_ldl_p(VIRTIO_DEVICE(req->dev), &req->out.type);
+    type =3D virtio_ldl_p(vdev, &req->out.type);
=20
     /* VIRTIO_BLK_T_OUT defines the command direction. VIRTIO_BLK_T_BARR=
IER
      * is an optional flag. Although a guest should not send this flag i=
f
@@ -522,8 +521,7 @@ static int virtio_blk_handle_request(VirtIOBlockReq *=
req, MultiReqBuffer *mrb)
     case VIRTIO_BLK_T_IN:
     {
         bool is_write =3D type & VIRTIO_BLK_T_OUT;
-        req->sector_num =3D virtio_ldq_p(VIRTIO_DEVICE(req->dev),
-                                       &req->out.sector);
+        req->sector_num =3D virtio_ldq_p(vdev, &req->out.sector);
=20
         if (is_write) {
             qemu_iovec_init_external(&req->qiov, out_iov, out_num);
@@ -535,25 +533,23 @@ static int virtio_blk_handle_request(VirtIOBlockReq=
 *req, MultiReqBuffer *mrb)
                                          req->qiov.size / BDRV_SECTOR_SI=
ZE);
         }
=20
-        if (!virtio_blk_sect_range_ok(req->dev, req->sector_num,
-                                      req->qiov.size)) {
+        if (!virtio_blk_sect_range_ok(s, req->sector_num, req->qiov.size=
)) {
             virtio_blk_req_complete(req, VIRTIO_BLK_S_IOERR);
-            block_acct_invalid(blk_get_stats(req->dev->blk),
+            block_acct_invalid(blk_get_stats(s->blk),
                                is_write ? BLOCK_ACCT_WRITE : BLOCK_ACCT_=
READ);
             virtio_blk_free_request(req);
             return 0;
         }
=20
-        block_acct_start(blk_get_stats(req->dev->blk),
-                         &req->acct, req->qiov.size,
+        block_acct_start(blk_get_stats(s->blk), &req->acct, req->qiov.si=
ze,
                          is_write ? BLOCK_ACCT_WRITE : BLOCK_ACCT_READ);
=20
         /* merge would exceed maximum number of requests or IO direction
          * changes */
         if (mrb->num_reqs > 0 && (mrb->num_reqs =3D=3D VIRTIO_BLK_MAX_ME=
RGE_REQS ||
                                   is_write !=3D mrb->is_write ||
-                                  !req->dev->conf.request_merging)) {
-            virtio_blk_submit_multireq(req->dev->blk, mrb);
+                                  !s->conf.request_merging)) {
+            virtio_blk_submit_multireq(s->blk, mrb);
         }
=20
         assert(mrb->num_reqs < VIRTIO_BLK_MAX_MERGE_REQS);
--=20
2.20.1


