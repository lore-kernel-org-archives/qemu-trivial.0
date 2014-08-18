Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XJHsE-0000Tj-My
	for mharc-qemu-trivial@gnu.org; Mon, 18 Aug 2014 04:01:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49054)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XJHs8-0000Mi-Jz
	for qemu-trivial@nongnu.org; Mon, 18 Aug 2014 04:01:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XJHs3-0002Sv-QV
	for qemu-trivial@nongnu.org; Mon, 18 Aug 2014 04:00:56 -0400
Received: from szxga01-in.huawei.com ([119.145.14.64]:40889)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>)
	id 1XJHrt-0002M7-FD; Mon, 18 Aug 2014 04:00:42 -0400
Received: from 172.24.2.119 (EHLO szxeml417-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CAL15514; Mon, 18 Aug 2014 16:00:36 +0800 (CST)
Received: from localhost (10.177.22.69) by szxeml417-hub.china.huawei.com
	(10.82.67.156) with Microsoft SMTP Server id 14.3.158.1;
	Mon, 18 Aug 2014 16:00:25 +0800
From: zhanghailiang <zhang.zhanghailiang@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Mon, 18 Aug 2014 16:00:31 +0800
Message-ID: <1408348831-10788-1-git-send-email-zhang.zhanghailiang@huawei.com>
X-Mailer: git-send-email 1.9.2.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.22.69]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.64
Cc: kwolf@redhat.com, zhanghailiang <zhang.zhanghailiang@huawei.com>,
	qemu-trivial@nongnu.org, Li Liu <john.liuli@huawei.com>,
	luonengjun@huawei.com, peter.huangpeng@huawei.com, stefanha@redhat.com
Subject: [Qemu-trivial] [PATCH v7] block/vvfat: assert return value of fopen
	which may fail
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
X-List-Received-Date: Mon, 18 Aug 2014 08:01:01 -0000

From: Li Liu <john.liuli@huawei.com>

fopen() may return NULL which will cause setbuf() segmentfault

Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
Signed-off-by: Li Liu <john.liuli@huawei.com>
---
 block/vvfat.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/block/vvfat.c b/block/vvfat.c
index 70176b1..62023e1 100644
--- a/block/vvfat.c
+++ b/block/vvfat.c
@@ -1084,6 +1084,7 @@ static int vvfat_open(BlockDriverState *bs, QDict *options, int flags,
 
 DLOG(if (stderr == NULL) {
     stderr = fopen("vvfat.log", "a");
+    assert(stderr);
     setbuf(stderr, NULL);
 })
 
-- 
1.7.12.4



