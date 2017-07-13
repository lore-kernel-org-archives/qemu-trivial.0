Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dVh30-0002hK-Q9
	for mharc-qemu-trivial@gnu.org; Thu, 13 Jul 2017 12:33:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42270)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1dVh2y-0002fQ-OZ
	for qemu-trivial@nongnu.org; Thu, 13 Jul 2017 12:33:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1dVh2v-0004AJ-JW
	for qemu-trivial@nongnu.org; Thu, 13 Jul 2017 12:33:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:62094)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
	id 1dVh2q-00047D-BA; Thu, 13 Jul 2017 12:32:52 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 427ED80C1A;
	Thu, 13 Jul 2017 16:32:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 427ED80C1A
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=marcandre.lureau@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 427ED80C1A
Received: from localhost (ovpn-112-18.ams2.redhat.com [10.36.112.18])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 05C3F7EA34;
	Thu, 13 Jul 2017 16:32:41 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
Date: Thu, 13 Jul 2017 18:31:54 +0200
Message-Id: <20170713163219.9024-5-marcandre.lureau@redhat.com>
In-Reply-To: <20170713163219.9024-1-marcandre.lureau@redhat.com>
References: <20170713163219.9024-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Thu, 13 Jul 2017 16:32:51 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH v2 04/29] vhost: use QEMU_ALIGN_DOWN
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
X-List-Received-Date: Thu, 13 Jul 2017 16:33:01 -0000

I used the clang-tidy qemu-round check to generate the fix:
https://github.com/elmarco/clang-tools-extra

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/vhost.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index 6eddb099b0..0049a2c0b3 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -70,7 +70,7 @@ static void vhost_dev_sync_region(struct vhost_dev *dev=
,
     uint64_t end =3D MIN(mlast, rlast);
     vhost_log_chunk_t *from =3D log + start / VHOST_LOG_CHUNK;
     vhost_log_chunk_t *to =3D log + end / VHOST_LOG_CHUNK + 1;
-    uint64_t addr =3D (start / VHOST_LOG_CHUNK) * VHOST_LOG_CHUNK;
+    uint64_t addr =3D QEMU_ALIGN_DOWN(start, VHOST_LOG_CHUNK);
=20
     if (end < start) {
         return;
--=20
2.13.1.395.gf7b71de06


