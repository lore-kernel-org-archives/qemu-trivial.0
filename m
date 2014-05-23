Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WnnGQ-0001ki-78
	for mharc-qemu-trivial@gnu.org; Fri, 23 May 2014 07:03:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51574)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <junqing.wang@cs2c.com.cn>) id 1Wnh52-00075i-Fk
	for qemu-trivial@nongnu.org; Fri, 23 May 2014 00:27:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <junqing.wang@cs2c.com.cn>) id 1Wnh51-0004nn-Qt
	for qemu-trivial@nongnu.org; Fri, 23 May 2014 00:27:40 -0400
Received: from [2001:250:208:1181:6e92:bfff:fe00:bcdb] (port=55340
	helo=mail.cs2c.com.cn) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <junqing.wang@cs2c.com.cn>)
	id 1Wnh4z-0004n9-0l; Fri, 23 May 2014 00:27:37 -0400
X-ns-mid: postfix-537EC5BF-50674820615
Received: from localhost.localdomain (cs2c.com.cn [127.0.0.1])
	by mail.cs2c.com.cn (NSMail) with ESMTPA id 76C7EB81028;
	Fri, 23 May 2014 11:51:27 +0800 (CST)
BANMAU_FRONT_USER_AUTHED: 1
BANMAU_FRONT_RESULT: 01
BANMAU_FRONT_SUSPICION_REASON: 0
X-Forward-For: 124.205.131.210
From: Jules Wang <junqing.wang@cs2c.com.cn>
To: qemu-devel@nongnu.org
Date: Fri, 23 May 2014 11:44:05 +0800
Message-Id: <1400816645-16005-1-git-send-email-junqing.wang@cs2c.com.cn>
X-Mailer: git-send-email 1.7.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 2001:250:208:1181:6e92:bfff:fe00:bcdb
X-Mailman-Approved-At: Fri, 23 May 2014 07:03:48 -0400
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com,
	Jules Wang <junqing.wang@cs2c.com.cn>
Subject: [Qemu-trivial] [PATCH] dma-helpers: avoid calling dma_bdrv_unmap()
	twice
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
X-List-Received-Date: Fri, 23 May 2014 04:27:41 -0000

Calling dma_bdrv_unmap() twice is not necessary and may cause
potential problems if some code changes.

Signed-off-by: Jules Wang <junqing.wang@cs2c.com.cn>
---
 dma-helpers.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
1.7.1



