Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dVh2s-0002Y3-VG
	for mharc-qemu-trivial@gnu.org; Thu, 13 Jul 2017 12:32:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42174)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1dVh2k-0002S2-VH
	for qemu-trivial@nongnu.org; Thu, 13 Jul 2017 12:32:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1dVh2k-00044K-1V
	for qemu-trivial@nongnu.org; Thu, 13 Jul 2017 12:32:46 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40658)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
	id 1dVh2f-0003zQ-L5; Thu, 13 Jul 2017 12:32:41 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 942AB6575F;
	Thu, 13 Jul 2017 16:32:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 942AB6575F
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=marcandre.lureau@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 942AB6575F
Received: from localhost (ovpn-112-18.ams2.redhat.com [10.36.112.18])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DAA6F7F8CB;
	Thu, 13 Jul 2017 16:32:37 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Jeff Cody <jcody@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
	Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org (open list:VHDX)
Date: Thu, 13 Jul 2017 18:31:53 +0200
Message-Id: <20170713163219.9024-4-marcandre.lureau@redhat.com>
In-Reply-To: <20170713163219.9024-1-marcandre.lureau@redhat.com>
References: <20170713163219.9024-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Thu, 13 Jul 2017 16:32:40 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH v2 03/29] vhdx: use QEMU_ALIGN_DOWN
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
X-List-Received-Date: Thu, 13 Jul 2017 16:32:53 -0000

I used the clang-tidy qemu-round check to generate the fix:
https://github.com/elmarco/clang-tools-extra

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 block/vhdx-log.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/vhdx-log.c b/block/vhdx-log.c
index 01278f3fc9..ad70706b99 100644
--- a/block/vhdx-log.c
+++ b/block/vhdx-log.c
@@ -884,7 +884,7 @@ static int vhdx_log_write(BlockDriverState *bs, BDRVV=
HDXState *s,
     }
=20
     sector_offset =3D offset % VHDX_LOG_SECTOR_SIZE;
-    file_offset =3D (offset / VHDX_LOG_SECTOR_SIZE) * VHDX_LOG_SECTOR_SI=
ZE;
+    file_offset =3D QEMU_ALIGN_DOWN(offset, VHDX_LOG_SECTOR_SIZE);
=20
     aligned_length =3D length;
=20
--=20
2.13.1.395.gf7b71de06


