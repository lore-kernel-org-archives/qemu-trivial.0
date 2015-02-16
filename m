Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YNTQZ-00081S-Vp
	for mharc-qemu-trivial@gnu.org; Mon, 16 Feb 2015 16:42:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51276)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1YNTQQ-0007ke-Ne
	for qemu-trivial@nongnu.org; Mon, 16 Feb 2015 16:42:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1YNTQI-0007Xf-Hu
	for qemu-trivial@nongnu.org; Mon, 16 Feb 2015 16:41:54 -0500
Received: from e06smtp11.uk.ibm.com ([195.75.94.107]:36381)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1YNTQI-0007XJ-9F
	for qemu-trivial@nongnu.org; Mon, 16 Feb 2015 16:41:46 -0500
Received: from /spool/local
	by e06smtp11.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <thuth@linux.vnet.ibm.com>;
	Mon, 16 Feb 2015 21:41:42 -0000
Received: from d06dlp02.portsmouth.uk.ibm.com (9.149.20.14)
	by e06smtp11.uk.ibm.com (192.168.101.141) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Mon, 16 Feb 2015 21:41:38 -0000
Received: from b06cxnps4074.portsmouth.uk.ibm.com
	(d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
	by d06dlp02.portsmouth.uk.ibm.com (Postfix) with ESMTP id B4928219004D; 
	Mon, 16 Feb 2015 21:41:32 +0000 (GMT)
Received: from d06av04.portsmouth.uk.ibm.com (d06av04.portsmouth.uk.ibm.com
	[9.149.37.216])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id t1GLfc8D11469292; Mon, 16 Feb 2015 21:41:38 GMT
Received: from d06av04.portsmouth.uk.ibm.com (localhost [127.0.0.1])
	by d06av04.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with
	ESMTP id t1GLfbhu015957; Mon, 16 Feb 2015 14:41:37 -0700
Received: from oc7435384737.ibm.com (sig-9-81-72-150.evts.uk.ibm.com
	[9.81.72.150])
	by d06av04.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with
	ESMTP id t1GLfWRZ015849; Mon, 16 Feb 2015 14:41:36 -0700
From: Thomas Huth <thuth@linux.vnet.ibm.com>
To: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Date: Mon, 16 Feb 2015 22:41:31 +0100
Message-Id: <1424122891-9390-5-git-send-email-thuth@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1424122891-9390-1-git-send-email-thuth@linux.vnet.ibm.com>
References: <1424122891-9390-1-git-send-email-thuth@linux.vnet.ibm.com>
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 15021621-0041-0000-0000-00000366A1E0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.75.94.107
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Thomas Huth <thuth@linux.vnet.ibm.com>,
	Stefan Hajnoczi <stefanha@redhat.com>
Subject: [Qemu-trivial] [PATCH 4/4] block: Remove unused functions
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
X-List-Received-Date: Mon, 16 Feb 2015 21:42:02 -0000

qemu_try_blockalign0() and nbd_export_close_all() are not
used anymore and thus can be removed.

Signed-off-by: Thomas Huth <thuth@linux.vnet.ibm.com>
Cc: Kevin Wolf <kwolf@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
---
 block.c               |   11 -----------
 include/block/block.h |    1 -
 include/block/nbd.h   |    1 -
 nbd.c                 |    9 ---------
 4 files changed, 0 insertions(+), 22 deletions(-)

diff --git a/block.c b/block.c
index 210fd5f..2128f82 100644
--- a/block.c
+++ b/block.c
@@ -5335,17 +5335,6 @@ void *qemu_try_blockalign(BlockDriverState *bs, size_t size)
     return qemu_try_memalign(align, size);
 }
 
-void *qemu_try_blockalign0(BlockDriverState *bs, size_t size)
-{
-    void *mem = qemu_try_blockalign(bs, size);
-
-    if (mem) {
-        memset(mem, 0, size);
-    }
-
-    return mem;
-}
-
 /*
  * Check if all memory in this vector is sector aligned.
  */
diff --git a/include/block/block.h b/include/block/block.h
index 321295e..7ee9ab3 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -433,7 +433,6 @@ void bdrv_set_guest_block_size(BlockDriverState *bs, int align);
 void *qemu_blockalign(BlockDriverState *bs, size_t size);
 void *qemu_blockalign0(BlockDriverState *bs, size_t size);
 void *qemu_try_blockalign(BlockDriverState *bs, size_t size);
-void *qemu_try_blockalign0(BlockDriverState *bs, size_t size);
 bool bdrv_qiov_is_aligned(BlockDriverState *bs, QEMUIOVector *qiov);
 
 struct HBitmapIter;
diff --git a/include/block/nbd.h b/include/block/nbd.h
index b759595..fccef2d 100644
--- a/include/block/nbd.h
+++ b/include/block/nbd.h
@@ -95,7 +95,6 @@ BlockBackend *nbd_export_get_blockdev(NBDExport *exp);
 
 NBDExport *nbd_export_find(const char *name);
 void nbd_export_set_name(NBDExport *exp, const char *name);
-void nbd_export_close_all(void);
 
 NBDClient *nbd_client_new(NBDExport *exp, int csock,
                           void (*close)(NBDClient *));
diff --git a/nbd.c b/nbd.c
index e56afbc..634bf84 100644
--- a/nbd.c
+++ b/nbd.c
@@ -1067,15 +1067,6 @@ BlockBackend *nbd_export_get_blockdev(NBDExport *exp)
     return exp->blk;
 }
 
-void nbd_export_close_all(void)
-{
-    NBDExport *exp, *next;
-
-    QTAILQ_FOREACH_SAFE(exp, &exports, next, next) {
-        nbd_export_close(exp);
-    }
-}
-
 static ssize_t nbd_co_send_reply(NBDRequest *req, struct nbd_reply *reply,
                                  int len)
 {
-- 
1.7.1


