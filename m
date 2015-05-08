Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YqqJl-0006nh-54
	for mharc-qemu-trivial@gnu.org; Fri, 08 May 2015 18:00:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45213)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YqqJf-0006cC-Fi
	for qemu-trivial@nongnu.org; Fri, 08 May 2015 18:00:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YqqJa-0005kx-MA
	for qemu-trivial@nongnu.org; Fri, 08 May 2015 18:00:19 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:60773)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YqqJU-0005XW-C4; Fri, 08 May 2015 18:00:08 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 2260C40780;
	Sat,  9 May 2015 01:00:07 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 00B366E2;
	Sat,  9 May 2015 01:00:06 +0300 (MSK)
Received: (nullmailer pid 10315 invoked by uid 1000);
	Fri, 08 May 2015 22:00:06 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Sat,  9 May 2015 01:00:02 +0300
Message-Id: <973a8529c54f9e4410a0e4a18ca1dcb2b085ca7e.1431122325.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1431122325.git.mjt@msgid.tls.msk.ru>
References: <cover.1431122325.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	zhanghailiang <zhang.zhanghailiang@huawei.com>
Subject: [Qemu-trivial] [PULL 2/5] sheepdog: fix resource leak with
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
X-List-Received-Date: Fri, 08 May 2015 22:00:24 -0000

From: zhanghailiang <zhang.zhanghailiang@huawei.com>

Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
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
2.1.4


