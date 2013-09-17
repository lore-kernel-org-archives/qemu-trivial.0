Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VLyN8-0007KK-Ry
	for mharc-qemu-trivial@gnu.org; Tue, 17 Sep 2013 12:43:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42989)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VLyN6-0007Gk-Dr
	for qemu-trivial@nongnu.org; Tue, 17 Sep 2013 12:43:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VLyN1-0000LP-OU
	for qemu-trivial@nongnu.org; Tue, 17 Sep 2013 12:43:28 -0400
Received: from qemu.weilnetz.de ([2a03:4000:2:362::1]:60737
	helo=v2201305906712890.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VLyMz-0000Kl-36; Tue, 17 Sep 2013 12:43:21 -0400
Received: by v2201305906712890.yourvserver.net (Postfix, from userid 1000)
	id 325821806BE; Tue, 17 Sep 2013 18:43:17 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel <qemu-devel@nongnu.org>
Date: Tue, 17 Sep 2013 18:43:16 +0200
Message-Id: <1379436196-27506-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a03:4000:2:362::1
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Kevin Wolf <kwolf@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>, Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH] block: Fix compiler warning
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
X-List-Received-Date: Tue, 17 Sep 2013 16:43:29 -0000

The patch fixes a warning from gcc (Debian 4.6.3-14+rpi1) 4.6.3:

block/stream.c:141:22: error:
=E2=80=98copy=E2=80=99 may be used uninitialized in this function [-Werro=
r=3Duninitialized]

This is not a real bug - a better compiler would not complain.

Now 'copy' has always a defined value, so the check for ret >=3D 0
can be removed.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 block/stream.c |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/block/stream.c b/block/stream.c
index 078ce4a..fc19194 100644
--- a/block/stream.c
+++ b/block/stream.c
@@ -108,7 +108,7 @@ static void coroutine_fn stream_run(void *opaque)
=20
     for (sector_num =3D 0; sector_num < end; sector_num +=3D n) {
         uint64_t delay_ns =3D 0;
-        bool copy;
+        bool copy =3D false;
=20
 wait:
         /* Note that even when no rate limit is applied we need to yield
@@ -123,7 +123,6 @@ wait:
                                 STREAM_BUFFER_SIZE / BDRV_SECTOR_SIZE, &=
n);
         if (ret =3D=3D 1) {
             /* Allocated in the top, no need to copy.  */
-            copy =3D false;
         } else if (ret >=3D 0) {
             /* Copy if allocated in the intermediate images.  Limit to t=
he
              * known-unallocated area [sector_num, sector_num+n).  */
@@ -138,7 +137,7 @@ wait:
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


