Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V4cHY-0003Yl-AJ
	for mharc-qemu-trivial@gnu.org; Wed, 31 Jul 2013 15:42:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38974)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rjones@redhat.com>) id 1V4cHP-0003Vx-3N
	for qemu-trivial@nongnu.org; Wed, 31 Jul 2013 15:41:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rjones@redhat.com>) id 1V4cHH-0000FW-7x
	for qemu-trivial@nongnu.org; Wed, 31 Jul 2013 15:41:51 -0400
Received: from mail.ukfsn.org ([5.9.116.23]:60758)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rjones@redhat.com>) id 1V4cHH-0000FG-09
	for qemu-trivial@nongnu.org; Wed, 31 Jul 2013 15:41:43 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail.ukfsn.org (Postfix) with SMTP id 1ABC1DC0ECA
	for <qemu-trivial@nongnu.org>; Wed, 31 Jul 2013 20:41:42 +0100 (BST)
Received: from crme.home.annexia.org (87-127-78-49.static.enta.net
	[87.127.78.49])
	by mail.ukfsn.org (Postfix) with ESMTPA id 6970CDC03A8;
	Wed, 31 Jul 2013 20:41:40 +0100 (BST)
From: "Richard W.M. Jones" <rjones@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 31 Jul 2013 20:41:38 +0100
Message-Id: <1375299698-16440-1-git-send-email-rjones@redhat.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-DSPAM-Result: Innocent
X-DSPAM-Processed: Wed Jul 31 20:41:42 2013
X-DSPAM-Confidence: 1.0000
X-DSPAM-Probability: 0.0023
X-DSPAM-Signature: 51f96876207517599856658
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 5.9.116.23
Cc: qemu-trivial@nongnu.org, sw@weilnetz.de
Subject: [Qemu-trivial] [PATCH v2] block/iscsi.c: Fix printf format error.
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
X-List-Received-Date: Wed, 31 Jul 2013 19:41:58 -0000

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
---
 block/iscsi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/block/iscsi.c b/block/iscsi.c
index 5f28c6a..03a1c0a 100644
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
+			 "iscsilun->block_size %u, sector_num %" PRIi64
+			 ", nb_sectors %d",
                          iscsilun->block_size, sector_num, nb_sectors);
             return 0;
     }
--=20
1.8.3.1



