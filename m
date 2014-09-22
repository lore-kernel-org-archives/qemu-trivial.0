Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XVyiu-0007Bz-Na
	for mharc-qemu-trivial@gnu.org; Mon, 22 Sep 2014 04:11:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43812)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XVyio-000722-Lu
	for qemu-trivial@nongnu.org; Mon, 22 Sep 2014 04:11:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XVyik-0006Di-AO
	for qemu-trivial@nongnu.org; Mon, 22 Sep 2014 04:11:46 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:48409)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XVyiS-00062E-Vh; Mon, 22 Sep 2014 04:11:25 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id B93E545D0B;
	Mon, 22 Sep 2014 12:11:18 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 6EC3E6D9;
	Mon, 22 Sep 2014 12:11:18 +0400 (MSK)
Received: (nullmailer pid 17000 invoked by uid 1000);
	Mon, 22 Sep 2014 08:11:18 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon, 22 Sep 2014 12:11:15 +0400
Message-Id: <1411373477-16938-8-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1411373477-16938-1-git-send-email-mjt@tls.msk.ru>
References: <1411373477-16938-1-git-send-email-mjt@tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Adelina Tuvenie <atuvenie@cloudbasesolutions.com>,
	Adelina Tuvenie <adelinatuvenie@gmail.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 7/9] block: allow creation of fixed vhdx images
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 22 Sep 2014 08:11:51 -0000

From: Adelina Tuvenie <adelinatuvenie@gmail.com>

When trying to create a fixed vhd image qemu-img will return the
following error:

 qemu-img: test.vhdx: Could not create image: Cannot allocate memory

This happens because of a incorrect check in vhdx.c. Specifficaly,
in vhdx_create_bat(), after allocating memory for the BAT entry,
there is a check to determine if the allocation was unsuccsessful.
The error comes from the fact that it checks if s->bat isn't NULL,
which is true in case of succsessful allocation,  and exits with
error ENOMEM.

Signed-off-by: Adelina Tuvenie <atuvenie@cloudbasesolutions.com>
Acked-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 block/vhdx.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/vhdx.c b/block/vhdx.c
index 796b7bd..5bf292e 100644
--- a/block/vhdx.c
+++ b/block/vhdx.c
@@ -1593,7 +1593,7 @@ static int vhdx_create_bat(BlockDriverState *bs, BDRVVHDXState *s,
                 bdrv_has_zero_init(bs) == 0) {
         /* for a fixed file, the default BAT entry is not zero */
         s->bat = g_try_malloc0(length);
-        if (length && s->bat != NULL) {
+        if (length && s->bat == NULL) {
             ret = -ENOMEM;
             goto exit;
         }
-- 
1.7.10.4


