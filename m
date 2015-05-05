Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YpRzG-0007HI-7k
	for mharc-qemu-trivial@gnu.org; Mon, 04 May 2015 21:49:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39112)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1YpRzE-0007H1-AC
	for qemu-trivial@nongnu.org; Mon, 04 May 2015 21:49:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1YpRzB-0007ah-4a
	for qemu-trivial@nongnu.org; Mon, 04 May 2015 21:49:28 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:48437)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>)
	id 1YpRz9-0007ZP-MB; Mon, 04 May 2015 21:49:25 -0400
Received: from 172.24.2.119 (EHLO szxeml428-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CKW03602; Tue, 05 May 2015 09:49:13 +0800 (CST)
Received: from localhost (10.177.22.69) by szxeml428-hub.china.huawei.com
	(10.82.67.183) with Microsoft SMTP Server id 14.3.158.1; Tue, 5 May 2015
	09:49:04 +0800
From: zhanghailiang <zhang.zhanghailiang@huawei.com>
To: <qemu-trivial@nongnu.org>
Date: Tue, 5 May 2015 09:48:03 +0800
Message-ID: <1430790483-10320-1-git-send-email-zhang.zhanghailiang@huawei.com>
X-Mailer: git-send-email 1.9.2.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.22.69]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: mitake.hitoshi@lab.ntt.co.jp, namei.unix@gmail.com, qemu-devel@nongnu.org,
	kwolf@redhat.com, zhanghailiang <zhang.zhanghailiang@huawei.com>
Subject: [Qemu-trivial] [PATCH] sheepdog: fix resource leak with
	sd_snapshot_create
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
X-List-Received-Date: Tue, 05 May 2015 01:49:29 -0000

Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
---
 block/sheepdog.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/block/sheepdog.c b/block/sheepdog.c
index 2d5f06a..bd7cbed 100644
--- a/block/sheepdog.c
+++ b/block/sheepdog.c
@@ -2341,6 +2341,7 @@ static int sd_snapshot_create(BlockDriverState *bs, QEMUSnapshotInfo *sn_info)
     if (ret < 0) {
         error_report("failed to create inode for snapshot: %s",
                      error_get_pretty(local_err));
+        error_free(local_err);
         goto cleanup;
     }
 
-- 
1.7.12.4



