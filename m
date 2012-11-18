Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ta0D4-00009N-Ab
	for mharc-qemu-trivial@gnu.org; Sun, 18 Nov 2012 03:26:34 -0500
Received: from eggs.gnu.org ([208.118.235.92]:60905)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1Ta0Cy-0008IC-BZ
	for qemu-trivial@nongnu.org; Sun, 18 Nov 2012 03:26:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1Ta0Cu-0000MI-Pk
	for qemu-trivial@nongnu.org; Sun, 18 Nov 2012 03:26:27 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:34579)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1Ta0Co-0000Lo-Dh; Sun, 18 Nov 2012 03:26:18 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	B47A7728002F; Sun, 18 Nov 2012 09:26:16 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id 3NFM3CivrDFe; Sun, 18 Nov 2012 09:26:16 +0100 (CET)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 1FE3C728003A; Sun, 18 Nov 2012 09:26:16 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial@nongnu.org
Date: Sun, 18 Nov 2012 09:26:15 +0100
Message-Id: <1353227175-24596-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 78.47.199.172
Cc: Kevin Wolf <kwolf@redhat.com>, Jim Meyering <meyering@redhat.com>,
	qemu-devel@nongnu.org, Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH] block: Fix regression for MinGW (assertion
	caused by short string)
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
X-List-Received-Date: Sun, 18 Nov 2012 08:26:32 -0000

The local string tmp_filename is passed to function get_tmp_filename
which expects a string with minimum size MAX_PATH for w32 hosts.

MAX_PATH is 260 and PATH_MAX is 259, so tmp_filename was too short.

Commit eba25057b9a5e19d10ace2bc7716667a31297169 introduced this
regression.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 block.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block.c b/block.c
index 49dd6bb..8739635 100644
--- a/block.c
+++ b/block.c
@@ -787,7 +787,7 @@ int bdrv_open(BlockDriverState *bs, const char *filename, int flags,
               BlockDriver *drv)
 {
     int ret;
-    char tmp_filename[PATH_MAX];
+    char tmp_filename[PATH_MAX + 1];
 
     if (flags & BDRV_O_SNAPSHOT) {
         BlockDriverState *bs1;
-- 
1.7.10.4


