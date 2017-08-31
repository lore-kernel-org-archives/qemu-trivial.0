Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dnMov-0002AP-1f
	for mharc-qemu-trivial@gnu.org; Thu, 31 Aug 2017 06:35:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41154)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1dnMot-00027C-Iz
	for qemu-trivial@nongnu.org; Thu, 31 Aug 2017 06:35:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1dnMos-0005fI-Er
	for qemu-trivial@nongnu.org; Thu, 31 Aug 2017 06:35:31 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41062)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
	id 1dnMom-0005az-4z; Thu, 31 Aug 2017 06:35:24 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4210E883AC;
	Thu, 31 Aug 2017 10:35:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 4210E883AC
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=marcandre.lureau@redhat.com
Received: from localhost (ovpn-112-36.ams2.redhat.com [10.36.112.36])
	by smtp.corp.redhat.com (Postfix) with ESMTP id ADA4F92B93;
	Thu, 31 Aug 2017 10:35:20 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
	qemu-block@nongnu.org (open list:vvfat)
Date: Thu, 31 Aug 2017 12:34:13 +0200
Message-Id: <20170831103432.6007-11-marcandre.lureau@redhat.com>
In-Reply-To: <20170831103432.6007-1-marcandre.lureau@redhat.com>
References: <20170831103432.6007-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Thu, 31 Aug 2017 10:35:23 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PULL 10/29] vvfat: use DIV_ROUND_UP
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
X-List-Received-Date: Thu, 31 Aug 2017 10:35:32 -0000

I used the clang-tidy qemu-round check to generate the fix:
https://github.com/elmarco/clang-tools-extra

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Richard Henderson <rth@twiddle.net>
---
 block/vvfat.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/block/vvfat.c b/block/vvfat.c
index a9e207f7f0..c54fa94651 100644
--- a/block/vvfat.c
+++ b/block/vvfat.c
@@ -449,7 +449,7 @@ static direntry_t *create_long_filename(BDRVVVFATStat=
e *s, const char *filename)
         return NULL;
     }
=20
-    number_of_entries =3D (length * 2 + 25) / 26;
+    number_of_entries =3D DIV_ROUND_UP(length * 2, 26);
=20
     for(i=3D0;i<number_of_entries;i++) {
         entry=3Darray_get_next(&(s->directory));
@@ -2554,7 +2554,7 @@ static int commit_one_file(BDRVVVFATState* s,
                 (size > offset && c >=3D2 && !fat_eof(s, c)));
=20
         ret =3D vvfat_read(s->bs, cluster2sector(s, c),
-            (uint8_t*)cluster, (rest_size + 0x1ff) / 0x200);
+            (uint8_t*)cluster, DIV_ROUND_UP(rest_size, 0x200));
=20
         if (ret < 0) {
             qemu_close(fd);
--=20
2.14.1.146.gd35faa819


