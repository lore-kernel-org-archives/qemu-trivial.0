Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1grp7k-0004o7-QR
	for mharc-qemu-trivial@gnu.org; Thu, 07 Feb 2019 14:14:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49986)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1grp7j-0004ms-LN
	for qemu-trivial@nongnu.org; Thu, 07 Feb 2019 14:14:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1grp7i-0007Vd-V4
	for qemu-trivial@nongnu.org; Thu, 07 Feb 2019 14:14:11 -0500
Received: from mx1.redhat.com ([209.132.183.28]:50022)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1grp7b-0007Qd-BD; Thu, 07 Feb 2019 14:14:03 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 62EB77AE8B;
	Thu,  7 Feb 2019 19:14:02 +0000 (UTC)
Received: from blue.redhat.com (ovpn-116-162.phx2.redhat.com [10.3.116.162])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EDF9917A62;
	Thu,  7 Feb 2019 19:14:01 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	qemu-block@nongnu.org (open list:Network Block Dev...)
Date: Thu,  7 Feb 2019 13:13:57 -0600
Message-Id: <20190207191357.6665-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Thu, 07 Feb 2019 19:14:02 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] nbd/server: Kill pointless shadowed variable
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
X-List-Received-Date: Thu, 07 Feb 2019 19:14:12 -0000

lgtm.com pointed out that commit 678ba275 introduced a shadowed
declaration of local variable 'bs'; thankfully, the inner 'bs'
obtained by 'blk_bs(blk)' matches the outer one given that we had
'blk_insert_bs(blk, bs, errp)' a few lines earlier, and there are
no later uses of 'bs' beyond the scope of the 'if (bitmap)' to
care if we change the value stored in 'bs' while traveling the
backing chain to find a bitmap.  So simply get rid of the extra
declaration.

Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Eric Blake <eblake@redhat.com>
---

I plan to queue this through my NBD tree, unless the trivial
tree happens to do a pull request first.

 nbd/server.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/nbd/server.c b/nbd/server.c
index 838c150d8ca..0910d09a6d4 100644
--- a/nbd/server.c
+++ b/nbd/server.c
@@ -1495,7 +1495,6 @@ NBDExport *nbd_export_new(BlockDriverState *bs, uin=
t64_t dev_offset,

     if (bitmap) {
         BdrvDirtyBitmap *bm =3D NULL;
-        BlockDriverState *bs =3D blk_bs(blk);

         while (true) {
             bm =3D bdrv_find_dirty_bitmap(bs, bitmap);
--=20
2.20.1


