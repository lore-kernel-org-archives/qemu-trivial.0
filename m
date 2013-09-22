Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VNd14-0003v8-Uy
	for mharc-qemu-trivial@gnu.org; Sun, 22 Sep 2013 02:19:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36358)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VNd0y-0003mL-JP
	for qemu-trivial@nongnu.org; Sun, 22 Sep 2013 02:19:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VNd0t-0005Fk-Nt
	for qemu-trivial@nongnu.org; Sun, 22 Sep 2013 02:19:28 -0400
Received: from qemu.weilnetz.de ([37.221.198.45]:58226
	helo=v2201305906712890.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VNd0j-0005EJ-Nx; Sun, 22 Sep 2013 02:19:13 -0400
Received: by v2201305906712890.yourvserver.net (Postfix, from userid 1000)
	id 77E8E17FE86; Sun, 22 Sep 2013 08:19:11 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel <qemu-devel@nongnu.org>
Date: Sun, 22 Sep 2013 08:19:10 +0200
Message-Id: <1379830750-23801-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.198.45
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Kevin Wolf <kwolf@redhat.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <andreas.faerber@web.de>,
	Stefan Hajnoczi <stefanha@redhat.com>, Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH v2] block: Fix compiler warning
	(-Werror=uninitialized)
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
X-List-Received-Date: Sun, 22 Sep 2013 06:19:33 -0000

The patch fixes a warning from gcc (Debian 4.6.3-14+rpi1) 4.6.3:

block/stream.c:141:22: error:
=E2=80=98copy=E2=80=99 may be used uninitialized in this function [-Werro=
r=3Duninitialized]

This is not a real bug - a better compiler would not complain.

Now 'copy' has always a defined value, so the check for ret >=3D 0
can be removed.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---

v2:

As noted by Andreas F=C3=A4rber, 'copy' must be set to false after the go=
to label.
Thanks for this hint.

Regards,
Stefan

 block/stream.c |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/block/stream.c b/block/stream.c
index 078ce4a..45837f4 100644
--- a/block/stream.c
+++ b/block/stream.c
@@ -119,11 +119,12 @@ wait:
             break;
         }
=20
+        copy =3D false;
+
         ret =3D bdrv_is_allocated(bs, sector_num,
                                 STREAM_BUFFER_SIZE / BDRV_SECTOR_SIZE, &=
n);
         if (ret =3D=3D 1) {
             /* Allocated in the top, no need to copy.  */
-            copy =3D false;
         } else if (ret >=3D 0) {
             /* Copy if allocated in the intermediate images.  Limit to t=
he
              * known-unallocated area [sector_num, sector_num+n).  */
@@ -138,7 +139,7 @@ wait:
             copy =3D (ret =3D=3D 1);
         }
         trace_stream_one_iteration(s, sector_num, n, ret);
-        if (ret >=3D 0 && copy) {
+        if (copy) {
             if (s->common.speed) {
                 delay_ns =3D ratelimit_calculate_delay(&s->limit, n);
                 if (delay_ns > 0) {
--=20
1.7.10.4


