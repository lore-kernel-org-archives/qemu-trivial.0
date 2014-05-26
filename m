Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WopJk-0003uG-Cm
	for mharc-qemu-trivial@gnu.org; Mon, 26 May 2014 03:27:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45475)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WopJe-0003i2-GZ
	for qemu-trivial@nongnu.org; Mon, 26 May 2014 03:27:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WopJZ-0000qY-WA
	for qemu-trivial@nongnu.org; Mon, 26 May 2014 03:27:26 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:51333)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WopJP-0000o1-Ce; Mon, 26 May 2014 03:27:11 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id B6C6542FAB;
	Mon, 26 May 2014 11:27:09 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id BEBC76AE;
	Mon, 26 May 2014 11:20:14 +0400 (MSK)
Received: (nullmailer pid 23008 invoked by uid 1000);
	Mon, 26 May 2014 07:20:13 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon, 26 May 2014 11:19:58 +0400
Message-Id: <1401088811-22923-11-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1401088811-22923-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1401088811-22923-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Jules Wang <junqing.wang@cs2c.com.cn>
Subject: [Qemu-trivial] [PULL 10/23] dma-helpers: avoid calling
	dma_bdrv_unmap() twice
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
X-List-Received-Date: Mon, 26 May 2014 07:27:31 -0000

From: Jules Wang <junqing.wang@cs2c.com.cn>

Calling dma_bdrv_unmap() twice is not necessary and may cause
potential problems if some code changes.

Signed-off-by: Jules Wang <junqing.wang@cs2c.com.cn>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 dma-helpers.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/dma-helpers.c b/dma-helpers.c
index 5f421e9..53cbe92 100644
--- a/dma-helpers.c
+++ b/dma-helpers.c
@@ -143,12 +143,12 @@ static void dma_bdrv_cb(void *opaque, int ret)
 
     dbs->acb = NULL;
     dbs->sector_num += dbs->iov.size / 512;
-    dma_bdrv_unmap(dbs);
 
     if (dbs->sg_cur_index == dbs->sg->nsg || ret < 0) {
         dma_complete(dbs, ret);
         return;
     }
+    dma_bdrv_unmap(dbs);
 
     while (dbs->sg_cur_index < dbs->sg->nsg) {
         cur_addr = dbs->sg->sg[dbs->sg_cur_index].base + dbs->sg_cur_byte;
-- 
1.7.10.4


