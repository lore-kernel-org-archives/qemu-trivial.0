Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XJLK4-0005x3-7Z
	for mharc-qemu-trivial@gnu.org; Mon, 18 Aug 2014 07:42:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58685)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XJLJx-0005pJ-K6
	for qemu-trivial@nongnu.org; Mon, 18 Aug 2014 07:41:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XJLJs-0007lE-6I
	for qemu-trivial@nongnu.org; Mon, 18 Aug 2014 07:41:53 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:33612)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XJLJh-0007jY-QV; Mon, 18 Aug 2014 07:41:37 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 2BE51437BD;
	Mon, 18 Aug 2014 15:41:37 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 169DD707;
	Mon, 18 Aug 2014 15:41:37 +0400 (MSK)
Received: (nullmailer pid 10526 invoked by uid 1000);
	Mon, 18 Aug 2014 11:41:37 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Mon, 18 Aug 2014 15:41:36 +0400
Message-Id: <1408362096-10482-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: Li Liu <john.liuli@huawei.com>, Michael Tokarev <mjt@tls.msk.ru>,
	zhanghailiang <zhang.zhanghailiang@huawei.com>
Subject: [Qemu-trivial] [PATCH] block/vvfat.c: remove debugging code to
	reinit stderr if NULL
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
X-List-Received-Date: Mon, 18 Aug 2014 11:41:58 -0000

Just log to stderr unconditionally, like other similar code does.

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 block/vvfat.c |    5 -----
 1 file changed, 5 deletions(-)

diff --git a/block/vvfat.c b/block/vvfat.c
index 70176b1..ea37023 100644
--- a/block/vvfat.c
+++ b/block/vvfat.c
@@ -1082,11 +1082,6 @@ static int vvfat_open(BlockDriverState *bs, QDict *options, int flags,
     vvv = s;
 #endif
 
-DLOG(if (stderr == NULL) {
-    stderr = fopen("vvfat.log", "a");
-    setbuf(stderr, NULL);
-})
-
     opts = qemu_opts_create(&runtime_opts, NULL, 0, &error_abort);
     qemu_opts_absorb_qdict(opts, options, &local_err);
     if (local_err) {
-- 
1.7.10.4


