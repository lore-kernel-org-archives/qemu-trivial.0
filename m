Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V5GEZ-0001DN-VE
	for mharc-qemu-trivial@gnu.org; Fri, 02 Aug 2013 10:21:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57425)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1V5GET-0000yg-D8
	for qemu-trivial@nongnu.org; Fri, 02 Aug 2013 10:21:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1V5GEO-0007Iv-Oz
	for qemu-trivial@nongnu.org; Fri, 02 Aug 2013 10:21:29 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:50438)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1V5GEE-0007Fy-8d; Fri, 02 Aug 2013 10:21:14 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id A5A0C40424;
	Fri,  2 Aug 2013 18:21:13 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 92A604A2;
	Fri,  2 Aug 2013 18:21:13 +0400 (MSK)
Received: (nullmailer pid 7225 invoked by uid 1000);
	Fri, 02 Aug 2013 14:21:12 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: Anthony Liguori <aliguori@us.ibm.com>
Date: Fri,  2 Aug 2013 18:20:46 +0400
Message-Id: <1375453248-7178-3-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1375453248-7178-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1375453248-7178-1-git-send-email-mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	"Richard W.M. Jones" <rjones@redhat.com>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 2/4] block/iscsi.c: Fix printf format error.
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
X-List-Received-Date: Fri, 02 Aug 2013 14:21:34 -0000

From: "Richard W.M. Jones" <rjones@redhat.com>

The error on armv7hl was:

block/iscsi.c: In function =E2=80=98is_request_lun_aligned=E2=80=99:
block/iscsi.c:251:26: error: format =E2=80=98%ld=E2=80=99 expects argumen=
t of type =E2=80=98long int=E2=80=99, but argument 3 has type =E2=80=98in=
t64_t=E2=80=99 [-Werror=3Dformat=3D]
                          iscsilun->block_size, sector_num, nb_sectors);
                          ^

This also splits the long line to comply with qemu coding guidelines.

Signed-off-by: Richard W.M. Jones <rjones@redhat.com>
Reviewed-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 block/iscsi.c |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/block/iscsi.c b/block/iscsi.c
index 5f28c6a..e7c1c2b 100644
--- a/block/iscsi.c
+++ b/block/iscsi.c
@@ -247,7 +247,9 @@ static bool is_request_lun_aligned(int64_t sector_num=
, int nb_sectors,
 {
     if ((sector_num * BDRV_SECTOR_SIZE) % iscsilun->block_size ||
         (nb_sectors * BDRV_SECTOR_SIZE) % iscsilun->block_size) {
-            error_report("iSCSI misaligned request: iscsilun->block_size=
 %u, sector_num %ld, nb_sectors %d",
+            error_report("iSCSI misaligned request: "
+                         "iscsilun->block_size %u, sector_num %" PRIi64
+                         ", nb_sectors %d",
                          iscsilun->block_size, sector_num, nb_sectors);
             return 0;
     }
--=20
1.7.10.4


