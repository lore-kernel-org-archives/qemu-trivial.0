Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dVh4F-0004dU-LQ
	for mharc-qemu-trivial@gnu.org; Thu, 13 Jul 2017 12:34:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43017)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1dVh4D-0004aj-DI
	for qemu-trivial@nongnu.org; Thu, 13 Jul 2017 12:34:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1dVh4C-0005Lg-I6
	for qemu-trivial@nongnu.org; Thu, 13 Jul 2017 12:34:17 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50950)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
	id 1dVh4A-0005IA-8p; Thu, 13 Jul 2017 12:34:14 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3A1F8B66E;
	Thu, 13 Jul 2017 16:34:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 3A1F8B66E
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=marcandre.lureau@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 3A1F8B66E
Received: from localhost (ovpn-112-18.ams2.redhat.com [10.36.112.18])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8F67379C7F;
	Thu, 13 Jul 2017 16:34:05 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
Date: Thu, 13 Jul 2017 18:32:04 +0200
Message-Id: <20170713163219.9024-15-marcandre.lureau@redhat.com>
In-Reply-To: <20170713163219.9024-1-marcandre.lureau@redhat.com>
References: <20170713163219.9024-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Thu, 13 Jul 2017 16:34:13 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH v2 14/29] virtio-gpu: use DIV_ROUND_UP
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
X-List-Received-Date: Thu, 13 Jul 2017 16:34:18 -0000

I used the clang-tidy qemu-round check to generate the fix:
https://github.com/elmarco/clang-tools-extra

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 hw/display/virtio-gpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index 0506d2c1b0..669f36f8bb 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -408,7 +408,7 @@ static void virtio_gpu_transfer_to_host_2d(VirtIOGPU =
*g,
     }
=20
     format =3D pixman_image_get_format(res->image);
-    bpp =3D (PIXMAN_FORMAT_BPP(format) + 7) / 8;
+    bpp =3D DIV_ROUND_UP(PIXMAN_FORMAT_BPP(format), 8);
     stride =3D pixman_image_get_stride(res->image);
=20
     if (t2d.offset || t2d.r.x || t2d.r.y ||
@@ -570,7 +570,7 @@ static void virtio_gpu_set_scanout(VirtIOGPU *g,
     scanout =3D &g->scanout[ss.scanout_id];
=20
     format =3D pixman_image_get_format(res->image);
-    bpp =3D (PIXMAN_FORMAT_BPP(format) + 7) / 8;
+    bpp =3D DIV_ROUND_UP(PIXMAN_FORMAT_BPP(format), 8);
     offset =3D (ss.r.x * bpp) + ss.r.y * pixman_image_get_stride(res->im=
age);
     if (!scanout->ds || surface_data(scanout->ds)
         !=3D ((uint8_t *)pixman_image_get_data(res->image) + offset) ||
--=20
2.13.1.395.gf7b71de06


