Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V4c59-00083Y-MG
	for mharc-qemu-trivial@gnu.org; Wed, 31 Jul 2013 15:29:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55075)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rjones@redhat.com>) id 1V4blw-0001zC-0T
	for qemu-trivial@nongnu.org; Wed, 31 Jul 2013 15:09:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rjones@redhat.com>) id 1V4blm-0007kS-62
	for qemu-trivial@nongnu.org; Wed, 31 Jul 2013 15:09:19 -0400
Received: from mail.ukfsn.org ([5.9.116.23]:59034)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rjones@redhat.com>) id 1V4bll-0007i6-WB
	for qemu-trivial@nongnu.org; Wed, 31 Jul 2013 15:09:10 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail.ukfsn.org (Postfix) with SMTP id 3FBF8DC0ECA
	for <qemu-trivial@nongnu.org>; Wed, 31 Jul 2013 20:09:07 +0100 (BST)
Received: from crme.home.annexia.org (87-127-78-49.static.enta.net
	[87.127.78.49])
	by mail.ukfsn.org (Postfix) with ESMTPA id D78E5DC0E2A;
	Wed, 31 Jul 2013 20:09:05 +0100 (BST)
From: "Richard W.M. Jones" <rjones@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 31 Jul 2013 20:08:45 +0100
Message-Id: <1375297725-11344-1-git-send-email-rjones@redhat.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-DSPAM-Result: Innocent
X-DSPAM-Processed: Wed Jul 31 20:09:07 2013
X-DSPAM-Confidence: 1.0000
X-DSPAM-Probability: 0.0023
X-DSPAM-Signature: 51f960d3207515280897249
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 5.9.116.23
X-Mailman-Approved-At: Wed, 31 Jul 2013 15:29:10 -0400
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] block/iscsi.c: Fix printf format error.
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
X-List-Received-Date: Wed, 31 Jul 2013 19:09:29 -0000

From: "Richard W.M. Jones" <rjones@redhat.com>

The error on armv7hl was:

block/iscsi.c: In function =E2=80=98is_request_lun_aligned=E2=80=99:
block/iscsi.c:251:26: error: format =E2=80=98%ld=E2=80=99 expects argumen=
t of type =E2=80=98long int=E2=80=99, but argument 3 has type =E2=80=98in=
t64_t=E2=80=99 [-Werror=3Dformat=3D]
                          iscsilun->block_size, sector_num, nb_sectors);
                          ^
---
 block/iscsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/iscsi.c b/block/iscsi.c
index 5f28c6a..d02b4fc 100644
--- a/block/iscsi.c
+++ b/block/iscsi.c
@@ -247,7 +247,7 @@ static bool is_request_lun_aligned(int64_t sector_num=
, int nb_sectors,
 {
     if ((sector_num * BDRV_SECTOR_SIZE) % iscsilun->block_size ||
         (nb_sectors * BDRV_SECTOR_SIZE) % iscsilun->block_size) {
-            error_report("iSCSI misaligned request: iscsilun->block_size=
 %u, sector_num %ld, nb_sectors %d",
+            error_report("iSCSI misaligned request: iscsilun->block_size=
 %u, sector_num %" PRIi64 ", nb_sectors %d",
                          iscsilun->block_size, sector_num, nb_sectors);
             return 0;
     }
--=20
1.8.3.1



