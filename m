Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YsP12-0006zL-3q
	for mharc-qemu-trivial@gnu.org; Wed, 13 May 2015 01:15:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44741)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1YsP10-0006wl-BQ
	for qemu-trivial@nongnu.org; Wed, 13 May 2015 01:15:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1YsP0z-0005vc-Ga
	for qemu-trivial@nongnu.org; Wed, 13 May 2015 01:15:30 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53769)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>)
	id 1YsP0v-0005tt-1f; Wed, 13 May 2015 01:15:25 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t4D5FOMt018826
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Wed, 13 May 2015 01:15:24 -0400
Received: from cpc-pc.redhat.com (vpn1-5-226.pek2.redhat.com [10.72.5.226])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t4D5FLOZ032584; Wed, 13 May 2015 01:15:22 -0400
From: Fam Zheng <famz@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 13 May 2015 13:15:28 +0000
Message-Id: <1431522928-5292-1-git-send-email-famz@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] iscsi: Remove pointless runtime check of
	macro value
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
X-List-Received-Date: Wed, 13 May 2015 05:15:31 -0000

raw_bsd already has QEMU_BUILD_BUG_ON(BDRV_SECTOR_SIZE != 512), so iscsi
should relax.

Signed-off-by: Fam Zheng <famz@redhat.com>
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
2.4.0


