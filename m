Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dnMot-00026f-5o
	for mharc-qemu-trivial@gnu.org; Thu, 31 Aug 2017 06:35:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41048)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1dnMoo-000210-8y
	for qemu-trivial@nongnu.org; Thu, 31 Aug 2017 06:35:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1dnMon-0005bq-9V
	for qemu-trivial@nongnu.org; Thu, 31 Aug 2017 06:35:26 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40780)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
	id 1dnMoc-0005W5-Bf; Thu, 31 Aug 2017 06:35:14 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4C715883AE;
	Thu, 31 Aug 2017 10:35:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 4C715883AE
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=marcandre.lureau@redhat.com
Received: from localhost (ovpn-112-36.ams2.redhat.com [10.36.112.36])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BFAAA77DCE;
	Thu, 31 Aug 2017 10:35:08 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
	Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org (open list:dmg)
Date: Thu, 31 Aug 2017 12:34:10 +0200
Message-Id: <20170831103432.6007-8-marcandre.lureau@redhat.com>
In-Reply-To: <20170831103432.6007-1-marcandre.lureau@redhat.com>
References: <20170831103432.6007-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Thu, 31 Aug 2017 10:35:13 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PULL 07/29] dmg: use DIV_ROUND_UP
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
X-List-Received-Date: Thu, 31 Aug 2017 10:35:29 -0000

I used the clang-tidy qemu-round check to generate the fix:
https://github.com/elmarco/clang-tools-extra

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Richard Henderson <rth@twiddle.net>
---
 block/dmg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/dmg.c b/block/dmg.c
index 900ae5a678..6c0711f563 100644
--- a/block/dmg.c
+++ b/block/dmg.c
@@ -111,7 +111,7 @@ static void update_max_chunk_size(BDRVDMGState *s, ui=
nt32_t chunk,
         uncompressed_sectors =3D s->sectorcounts[chunk];
         break;
     case 1: /* copy */
-        uncompressed_sectors =3D (s->lengths[chunk] + 511) / 512;
+        uncompressed_sectors =3D DIV_ROUND_UP(s->lengths[chunk], 512);
         break;
     case 2: /* zero */
         /* as the all-zeroes block may be large, it is treated specially=
: the
--=20
2.14.1.146.gd35faa819


