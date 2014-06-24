Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WzTI3-0005O1-UJ
	for mharc-qemu-trivial@gnu.org; Tue, 24 Jun 2014 12:09:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52304)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WzTHw-00059a-IG
	for qemu-trivial@nongnu.org; Tue, 24 Jun 2014 12:09:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WzTHq-0004zx-PZ
	for qemu-trivial@nongnu.org; Tue, 24 Jun 2014 12:09:40 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:60075)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WzTHe-0004vs-Ud; Tue, 24 Jun 2014 12:09:23 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 5414344082;
	Tue, 24 Jun 2014 20:09:22 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 3A838674;
	Tue, 24 Jun 2014 20:09:22 +0400 (MSK)
Received: (nullmailer pid 15621 invoked by uid 1000);
	Tue, 24 Jun 2014 16:09:21 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue, 24 Jun 2014 20:09:12 +0400
Message-Id: <1403626160-15546-7-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1403626160-15546-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1403626160-15546-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Chen Gang <gang.chen.5i5j@gmail.com>
Subject: [Qemu-trivial] [PULL 06/14] block.c: Remove useless 'buf' variable
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
X-List-Received-Date: Tue, 24 Jun 2014 16:09:46 -0000

From: Chen Gang <gang.chen.5i5j@gmail.com>

'buf' is not used actually, so remove it and related snprintf() statement.

Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 block.c |    2 --
 1 file changed, 2 deletions(-)

diff --git a/block.c b/block.c
index e6f9b71..217f523 100644
--- a/block.c
+++ b/block.c
@@ -5581,7 +5581,6 @@ void bdrv_img_create(const char *filename, const char *fmt,
         if (backing_file) {
             BlockDriverState *bs;
             uint64_t size;
-            char buf[32];
             int back_flags;
 
             /* backing files always opened read-only */
@@ -5602,7 +5601,6 @@ void bdrv_img_create(const char *filename, const char *fmt,
             bdrv_get_geometry(bs, &size);
             size *= 512;
 
-            snprintf(buf, sizeof(buf), "%" PRId64, size);
             qemu_opt_set_number(opts, BLOCK_OPT_SIZE, size);
 
             bdrv_unref(bs);
-- 
1.7.10.4


