Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bARyB-0000xb-L9
	for mharc-qemu-trivial@gnu.org; Tue, 07 Jun 2016 21:07:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39399)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <xiecl.fnst@cn.fujitsu.com>) id 1bARy5-0000lx-An
	for qemu-trivial@nongnu.org; Tue, 07 Jun 2016 21:07:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <xiecl.fnst@cn.fujitsu.com>) id 1bARy0-0007KY-E9
	for qemu-trivial@nongnu.org; Tue, 07 Jun 2016 21:07:36 -0400
Received: from [59.151.112.132] (port=52506 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <xiecl.fnst@cn.fujitsu.com>)
	id 1bARxr-0007IT-7i; Tue, 07 Jun 2016 21:07:23 -0400
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="7473505"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 08 Jun 2016 09:07:20 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 81B6B41C0B9A;
	Wed,  8 Jun 2016 09:07:18 +0800 (CST)
Received: from changlox.g08.fujitsu.local (10.167.225.55) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Wed, 8 Jun 2016 09:07:18 +0800
From: Changlong Xie <xiecl.fnst@cn.fujitsu.com>
To: qemu devel <qemu-devel@nongnu.org>, qemu trival <qemu-trivial@nongnu.org>, 
	Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <famz@redhat.com>,
	Max Reitz <mreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>, Jeff Cody
	<jcody@redhat.com>
CC: qemu block <qemu-block@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	John Snow <jsnow@redhat.com>, Eric Blake <eblake@redhat.com>, Markus
	Armbruster <armbru@redhat.com>, "Dr. David Alan Gilbert"
	<dgilbert@redhat.com>, Dong Eddie <eddie.dong@intel.com>, Jiang Yunhong
	<yunhong.jiang@intel.com>, zhanghailiang <zhang.zhanghailiang@huawei.com>, 
	Gonglei <arei.gonglei@huawei.com>, Wen Congyang <wency@cn.fujitsu.com>, 
	Changlong Xie <xiecl.fnst@cn.fujitsu.com>
Date: Wed, 8 Jun 2016 09:11:23 +0800
Message-ID: <1465348292-26750-2-git-send-email-xiecl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1465348292-26750-1-git-send-email-xiecl.fnst@cn.fujitsu.com>
References: <1465348292-26750-1-git-send-email-xiecl.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.55]
X-yoursite-MailScanner-ID: 81B6B41C0B9A.AFAB3
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xiecl.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Subject: [Qemu-trivial] [PATCH v20 01/10] unblock backup operations in
 backing file
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 08 Jun 2016 01:07:42 -0000

From: Wen Congyang <wency@cn.fujitsu.com>

Signed-off-by: Wen Congyang <wency@cn.fujitsu.com>
Signed-off-by: Changlong Xie <xiecl.fnst@cn.fujitsu.com>
---
 block.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/block.c b/block.c
index 736432f..dcf63f4 100644
--- a/block.c
+++ b/block.c
@@ -1310,6 +1310,23 @@ void bdrv_set_backing_hd(BlockDriverState *bs, BlockDriverState *backing_hd)
     /* Otherwise we won't be able to commit due to check in bdrv_commit */
     bdrv_op_unblock(backing_hd, BLOCK_OP_TYPE_COMMIT_TARGET,
                     bs->backing_blocker);
+    /*
+     * We do backup in 3 ways:
+     * 1. drive backup
+     *    The target bs is new opened, and the source is top BDS
+     * 2. blockdev backup
+     *    Both the source and the target are top BDSes.
+     * 3. internal backup(used for block replication)
+     *    Both the source and the target are backing file
+     *
+     * In case 1 and 2, neither the source nor the target is the backing file.
+     * In case 3, we will block the top BDS, so there is only one block job
+     * for the top BDS and its backing chain.
+     */
+    bdrv_op_unblock(backing_hd, BLOCK_OP_TYPE_BACKUP_SOURCE,
+                    bs->backing_blocker);
+    bdrv_op_unblock(backing_hd, BLOCK_OP_TYPE_BACKUP_TARGET,
+                    bs->backing_blocker);
 out:
     bdrv_refresh_limits(bs, NULL);
 }
-- 
1.9.3




