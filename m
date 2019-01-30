Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gomYB-0008Uf-L2
	for mharc-qemu-trivial@gnu.org; Wed, 30 Jan 2019 04:52:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46538)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sgarzare@redhat.com>) id 1gomY9-0008Sm-Mm
	for qemu-trivial@nongnu.org; Wed, 30 Jan 2019 04:52:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sgarzare@redhat.com>) id 1gomY9-0000z9-0F
	for qemu-trivial@nongnu.org; Wed, 30 Jan 2019 04:52:53 -0500
Received: from mx1.redhat.com ([209.132.183.28]:48444)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sgarzare@redhat.com>)
	id 1gomY5-0000t2-0t; Wed, 30 Jan 2019 04:52:49 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 225CAC057E2D;
	Wed, 30 Jan 2019 09:52:42 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-117-213.ams2.redhat.com
	[10.36.117.213])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9E826600CC;
	Wed, 30 Jan 2019 09:52:32 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
	Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-block@nongnu.org
Date: Wed, 30 Jan 2019 10:52:31 +0100
Message-Id: <20190130095231.42081-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Wed, 30 Jan 2019 09:52:42 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] virtio-blk: remove duplicate definition of
 VirtIOBlock *s pointer
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
X-List-Received-Date: Wed, 30 Jan 2019 09:52:54 -0000

VirtIOBlock *s is already defined and initialized with req->dev
on top of virtio_blk_handle_request(), so we can remove it from
the code block of VIRTIO_BLK_T_GET_ID case.

Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 hw/block/virtio-blk.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
index f208c6ddb9..9a87b3bfac 100644
--- a/hw/block/virtio-blk.c
+++ b/hw/block/virtio-blk.c
@@ -569,8 +569,6 @@ static int virtio_blk_handle_request(VirtIOBlockReq *=
req, MultiReqBuffer *mrb)
         break;
     case VIRTIO_BLK_T_GET_ID:
     {
-        VirtIOBlock *s =3D req->dev;
-
         /*
          * NB: per existing s/n string convention the string is
          * terminated by '\0' only when shorter than buffer.
--=20
2.20.1


