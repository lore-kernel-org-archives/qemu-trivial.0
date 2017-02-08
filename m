Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cbNJU-0005HT-VQ
	for mharc-qemu-trivial@gnu.org; Wed, 08 Feb 2017 03:09:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45348)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1cbNJS-0005FV-7p
	for qemu-trivial@nongnu.org; Wed, 08 Feb 2017 03:09:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1cbNJR-0004Bz-7p
	for qemu-trivial@nongnu.org; Wed, 08 Feb 2017 03:09:14 -0500
Received: from mx1.redhat.com ([209.132.183.28]:40406)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
	id 1cbNJK-00049J-UZ; Wed, 08 Feb 2017 03:09:07 -0500
Received: from smtp.corp.redhat.com (int-mx16.intmail.prod.int.phx2.redhat.com
	[10.5.11.28])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 26193C05AA5B;
	Wed,  8 Feb 2017 08:09:07 +0000 (UTC)
Received: from localhost (ovpn-116-15.phx2.redhat.com [10.3.116.15])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 185A09244E;
	Wed,  8 Feb 2017 08:09:05 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Cc: kwolf@redhat.com, qemu-trivial@nongnu.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Date: Wed,  8 Feb 2017 12:09:00 +0400
Message-Id: <20170208080900.4092-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.74 on 10.5.11.28
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Wed, 08 Feb 2017 08:09:07 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] qcow2: remove useless NULL check
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
X-List-Received-Date: Wed, 08 Feb 2017 08:09:15 -0000

g_strdup() already handles the case where the argument is NULL.

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 block/qcow2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/block/qcow2.c b/block/qcow2.c
index 96fb8a8f16..9114218030 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -2016,8 +2016,8 @@ static int qcow2_change_backing_file(BlockDriverSta=
te *bs,
     g_free(s->image_backing_file);
     g_free(s->image_backing_format);
=20
-    s->image_backing_file =3D backing_file ? g_strdup(bs->backing_file) =
: NULL;
-    s->image_backing_format =3D backing_fmt ? g_strdup(bs->backing_forma=
t) : NULL;
+    s->image_backing_file =3D g_strdup(bs->backing_file);
+    s->image_backing_format =3D g_strdup(bs->backing_format);
=20
     return qcow2_update_header(bs);
 }
--=20
2.11.0.295.gd7dffce1c.dirty


