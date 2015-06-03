Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z09d9-00048c-At
	for mharc-qemu-trivial@gnu.org; Wed, 03 Jun 2015 10:26:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59769)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z09d1-0003tI-Rr
	for qemu-trivial@nongnu.org; Wed, 03 Jun 2015 10:26:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z09cw-0006zD-24
	for qemu-trivial@nongnu.org; Wed, 03 Jun 2015 10:26:47 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:51931)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Z09cq-0006vT-GR; Wed, 03 Jun 2015 10:26:36 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 02A34407C9;
	Wed,  3 Jun 2015 17:26:34 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 2BBB9A53;
	Wed,  3 Jun 2015 16:08:53 +0300 (MSK)
Received: (nullmailer pid 27414 invoked by uid 1000);
	Wed, 03 Jun 2015 13:08:52 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Wed,  3 Jun 2015 16:08:21 +0300
Message-Id: <44f192f364b71683379e104157b15b0685d24394.1433336870.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1433336870.git.mjt@msgid.tls.msk.ru>
References: <cover.1433336870.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Fam Zheng <famz@redhat.com>
Subject: [Qemu-trivial] [PULL 01/30] iscsi: Remove pointless runtime check
	of macro value
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
X-List-Received-Date: Wed, 03 Jun 2015 14:26:51 -0000

From: Fam Zheng <famz@redhat.com>

raw_bsd already has QEMU_BUILD_BUG_ON(BDRV_SECTOR_SIZE != 512), so iscsi
should relax.

Signed-off-by: Fam Zheng <famz@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 block/iscsi.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/block/iscsi.c b/block/iscsi.c
index 8fca1d3..14e97a6 100644
--- a/block/iscsi.c
+++ b/block/iscsi.c
@@ -1323,13 +1323,6 @@ static int iscsi_open(BlockDriverState *bs, QDict *options, int flags,
     const char *filename;
     int i, ret = 0;
 
-    if ((BDRV_SECTOR_SIZE % 512) != 0) {
-        error_setg(errp, "iSCSI: Invalid BDRV_SECTOR_SIZE. "
-                   "BDRV_SECTOR_SIZE(%lld) is not a multiple "
-                   "of 512", BDRV_SECTOR_SIZE);
-        return -EINVAL;
-    }
-
     opts = qemu_opts_create(&runtime_opts, NULL, 0, &error_abort);
     qemu_opts_absorb_qdict(opts, options, &local_err);
     if (local_err) {
-- 
2.1.4


