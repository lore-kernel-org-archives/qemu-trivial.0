Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dVh3h-0003fx-LM
	for mharc-qemu-trivial@gnu.org; Thu, 13 Jul 2017 12:33:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42680)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1dVh3e-0003c4-Bw
	for qemu-trivial@nongnu.org; Thu, 13 Jul 2017 12:33:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1dVh3a-0004dz-Ew
	for qemu-trivial@nongnu.org; Thu, 13 Jul 2017 12:33:42 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58664)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
	id 1dVh3V-0004b0-W6; Thu, 13 Jul 2017 12:33:34 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E34E07F406;
	Thu, 13 Jul 2017 16:33:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com E34E07F406
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=marcandre.lureau@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com E34E07F406
Received: from localhost (ovpn-112-18.ams2.redhat.com [10.36.112.18])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8F5057EE6C;
	Thu, 13 Jul 2017 16:33:30 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
	qemu-block@nongnu.org (open list:vpc)
Date: Thu, 13 Jul 2017 18:31:59 +0200
Message-Id: <20170713163219.9024-10-marcandre.lureau@redhat.com>
In-Reply-To: <20170713163219.9024-1-marcandre.lureau@redhat.com>
References: <20170713163219.9024-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Thu, 13 Jul 2017 16:33:33 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH v2 09/29] vpc: use DIV_ROUND_UP
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
X-List-Received-Date: Thu, 13 Jul 2017 16:33:43 -0000

I used the clang-tidy qemu-round check to generate the fix:
https://github.com/elmarco/clang-tools-extra

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 block/vpc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/block/vpc.c b/block/vpc.c
index 9a6f8173a5..c88dc72491 100644
--- a/block/vpc.c
+++ b/block/vpc.c
@@ -760,7 +760,7 @@ static int calculate_geometry(int64_t total_sectors, =
uint16_t* cyls,
     } else {
         *secs_per_cyl =3D 17;
         cyls_times_heads =3D total_sectors / *secs_per_cyl;
-        *heads =3D (cyls_times_heads + 1023) / 1024;
+        *heads =3D DIV_ROUND_UP(cyls_times_heads, 1024);
=20
         if (*heads < 4) {
             *heads =3D 4;
@@ -813,7 +813,7 @@ static int create_dynamic_disk(BlockBackend *blk, uin=
t8_t *buf,
     offset =3D 3 * 512;
=20
     memset(buf, 0xFF, 512);
-    for (i =3D 0; i < (num_bat_entries * 4 + 511) / 512; i++) {
+    for (i =3D 0; i < DIV_ROUND_UP(num_bat_entries * 4, 512); i++) {
         ret =3D blk_pwrite(blk, offset, buf, 512, 0);
         if (ret < 0) {
             goto fail;
--=20
2.13.1.395.gf7b71de06


