Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z7h1k-00058N-Gv
	for mharc-qemu-trivial@gnu.org; Wed, 24 Jun 2015 05:31:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35042)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1Z7h1d-0004x2-Gy
	for qemu-trivial@nongnu.org; Wed, 24 Jun 2015 05:31:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1Z7h1Z-00014e-3b
	for qemu-trivial@nongnu.org; Wed, 24 Jun 2015 05:31:21 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:44520)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1Z7h1R-00010g-Qa; Wed, 24 Jun 2015 05:31:10 -0400
Received: from 172.24.2.119 (EHLO SZXEML429-HUB.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CNO46391; Wed, 24 Jun 2015 17:31:03 +0800 (CST)
Received: from localhost (10.177.19.102) by SZXEML429-HUB.china.huawei.com
	(10.82.67.184) with Microsoft SMTP Server id 14.3.158.1;
	Wed, 24 Jun 2015 17:29:27 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Wed, 24 Jun 2015 17:29:24 +0800
Message-ID: <1435138164-11728-1-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: qemu-trivial@nongnu.org, Gonglei <arei.gonglei@huawei.com>,
	qemu-block@nongnu.org, stefanha@redhat.com
Subject: [Qemu-trivial] [PATCH] virito-blk: drop duplicate check
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
X-List-Received-Date: Wed, 24 Jun 2015 09:31:26 -0000

From: Gonglei <arei.gonglei@huawei.com>

in_num = req->elem.in_num, and req->elem.in_num is
checked in line 489, so the check about in_num variable
is superflous, let's drop it.

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
---
 hw/block/virtio-blk.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
index cd539aa..cce552a 100644
--- a/hw/block/virtio-blk.c
+++ b/hw/block/virtio-blk.c
@@ -499,8 +499,7 @@ void virtio_blk_handle_request(VirtIOBlockReq *req, MultiReqBuffer *mrb)
 
     iov_discard_front(&iov, &out_num, sizeof(req->out));
 
-    if (in_num < 1 ||
-        in_iov[in_num - 1].iov_len < sizeof(struct virtio_blk_inhdr)) {
+    if (in_iov[in_num - 1].iov_len < sizeof(struct virtio_blk_inhdr)) {
         error_report("virtio-blk request inhdr too short");
         exit(1);
     }
-- 
1.7.12.4



