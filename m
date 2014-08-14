Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XHv33-000281-Q2
	for mharc-qemu-trivial@gnu.org; Thu, 14 Aug 2014 09:26:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43637)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XHpXV-0007KJ-5K
	for qemu-trivial@nongnu.org; Thu, 14 Aug 2014 03:33:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XHpXQ-0006lX-9u
	for qemu-trivial@nongnu.org; Thu, 14 Aug 2014 03:33:37 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:6169)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>)
	id 1XHpXP-0006lH-Eb; Thu, 14 Aug 2014 03:33:32 -0400
Received: from 172.24.2.119 (EHLO szxeml419-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id BYE11835; Thu, 14 Aug 2014 15:30:58 +0800 (CST)
Received: from localhost (10.177.22.69) by szxeml419-hub.china.huawei.com
	(10.82.67.158) with Microsoft SMTP Server id 14.3.158.1;
	Thu, 14 Aug 2014 15:30:03 +0800
From: zhanghailiang <zhang.zhanghailiang@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 14 Aug 2014 15:29:21 +0800
Message-ID: <1408001361-13580-11-git-send-email-zhang.zhanghailiang@huawei.com>
X-Mailer: git-send-email 1.9.2.msysgit.0
In-Reply-To: <1408001361-13580-1-git-send-email-zhang.zhanghailiang@huawei.com>
References: <1408001361-13580-1-git-send-email-zhang.zhanghailiang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.22.69]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
X-Mailman-Approved-At: Thu, 14 Aug 2014 09:26:29 -0400
Cc: kwolf@redhat.com, lkurusa@redhat.com,
	zhanghailiang <zhang.zhanghailiang@huawei.com>, mst@redhat.com,
	qemu-trivial@nongnu.org, jan.kiszka@siemens.com,
	riku.voipio@iki.fi, mjt@tls.msk.ru, peter.huangpeng@huawei.com,
	lcapitulino@redhat.com, stefanha@redhat.com,
	Li Liu <john.liuli@huawei.com>, luonengjun@huawei.com,
	pbonzini@redhat.com, alex.bennee@linaro.org, rth@twiddle.net
Subject: [Qemu-trivial] [PATCH v6 10/10] block/vvfat: fix setbuf stream
	parameter may be NULL
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
X-List-Received-Date: Thu, 14 Aug 2014 07:33:42 -0000

From: Li Liu <john.liuli@huawei.com>

fopen() may return NULL which will cause setbuf() segmentfault

Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
Signed-off-by: Li Liu <john.liuli@huawei.com>
---
 block/vvfat.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/block/vvfat.c b/block/vvfat.c
index 70176b1..6889ea9 100644
--- a/block/vvfat.c
+++ b/block/vvfat.c
@@ -1084,7 +1084,10 @@ static int vvfat_open(BlockDriverState *bs, QDict *options, int flags,
 
 DLOG(if (stderr == NULL) {
     stderr = fopen("vvfat.log", "a");
-    setbuf(stderr, NULL);
+
+    if (stderr) {
+        setbuf(stderr, NULL);
+    }
 })
 
     opts = qemu_opts_create(&runtime_opts, NULL, 0, &error_abort);
-- 
1.7.12.4



