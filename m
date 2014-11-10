Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xnkzs-0005DW-3a
	for mharc-qemu-trivial@gnu.org; Mon, 10 Nov 2014 04:10:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54650)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1Xnkzj-00053A-ET
	for qemu-trivial@nongnu.org; Mon, 10 Nov 2014 04:10:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1Xnkzd-0000lM-7G
	for qemu-trivial@nongnu.org; Mon, 10 Nov 2014 04:10:43 -0500
Received: from mx1.redhat.com ([209.132.183.28]:34651)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>)
	id 1XnkzO-0000kI-Vp; Mon, 10 Nov 2014 04:10:23 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id sAA9ALge002218
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Mon, 10 Nov 2014 04:10:22 -0500
Received: from fam-t430.nay.redhat.com (dhcp-14-161.nay.redhat.com
	[10.66.14.161])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id sAA9AHAL018394; Mon, 10 Nov 2014 04:10:18 -0500
From: Fam Zheng <famz@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 10 Nov 2014 17:10:38 +0800
Message-Id: <1415610638-3918-1-git-send-email-famz@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, mjt@tls.msk.ru,
	Markus Armbruster <armbru@redhat.com>
Subject: [Qemu-trivial] [PATCH] block: Fix comment for
	bdrv_co_get_block_status
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
X-List-Received-Date: Mon, 10 Nov 2014 09:10:49 -0000

It returns more information than binary, fix the comment.

Signed-off-by: Fam Zheng <famz@redhat.com>
---
 block.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/block.c b/block.c
index dacd881..42c914e 100644
--- a/block.c
+++ b/block.c
@@ -3903,9 +3903,9 @@ typedef struct BdrvCoGetBlockStatusData {
 } BdrvCoGetBlockStatusData;
 
 /*
- * Returns true iff the specified sector is present in the disk image. Drivers
- * not implementing the functionality are assumed to not support backing files,
- * hence all their sectors are reported as allocated.
+ * Returns the status of the specified sectors. Drivers not implementing the
+ * functionality are assumed to not support backing files, hence all their
+ * sectors are reported as allocated.
  *
  * If 'sector_num' is beyond the end of the disk image the return value is 0
  * and 'pnum' is set to 0.
-- 
1.9.3


