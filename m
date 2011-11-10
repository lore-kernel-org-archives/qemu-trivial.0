Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ROPvz-0007wF-Ma
	for mharc-qemu-trivial@gnu.org; Thu, 10 Nov 2011 03:24:31 -0500
Received: from eggs.gnu.org ([140.186.70.92]:43017)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wdongxu@linux.vnet.ibm.com>) id 1ROPvx-0007vp-NN
	for qemu-trivial@nongnu.org; Thu, 10 Nov 2011 03:24:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wdongxu@linux.vnet.ibm.com>) id 1ROPvw-0000vB-M8
	for qemu-trivial@nongnu.org; Thu, 10 Nov 2011 03:24:29 -0500
Received: from e23smtp08.au.ibm.com ([202.81.31.141]:46025)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wdongxu@linux.vnet.ibm.com>) id 1ROPvw-0000uz-4j
	for qemu-trivial@nongnu.org; Thu, 10 Nov 2011 03:24:28 -0500
Received: from /spool/local
	by e23smtp08.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <wdongxu@linux.vnet.ibm.com>;
	Thu, 10 Nov 2011 08:22:41 +1000
Received: from d23relay03.au.ibm.com ([202.81.31.245])
	by e23smtp08.au.ibm.com ([202.81.31.205]) with XMail ESMTP;
	Thu, 10 Nov 2011 08:22:25 +1000
Received: from d23av03.au.ibm.com (d23av03.au.ibm.com [9.190.234.97])
	by d23relay03.au.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	pAA8NobB1605848; Thu, 10 Nov 2011 19:23:50 +1100
Received: from d23av03.au.ibm.com (loopback [127.0.0.1])
	by d23av03.au.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id
	pAA8Nm4d005967; Thu, 10 Nov 2011 19:23:50 +1100
Received: from wdongxu-T410.cn.ibm.com (wdongxu-t410.cn.ibm.com
	[9.115.118.147] (may be forged))
	by d23av03.au.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with ESMTP id
	pAA8NhBm005647; Thu, 10 Nov 2011 19:23:44 +1100
From: Dong Xu Wang <wdongxu@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Date: Thu, 10 Nov 2011 16:23:22 +0800
Message-Id: <1320913402-8762-1-git-send-email-wdongxu@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.7.5.4
x-cbid: 11110922-5140-0000-0000-00000032E223
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 202.81.31.141
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] block:add coroutine_fn marker to coroutine
	functions
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
X-List-Received-Date: Thu, 10 Nov 2011 08:24:30 -0000

From: Dong Xu Wang <wdongxu@linux.vnet.ibm.com>

Looks better when reviewing these source files.

Signed-off-by: Dong Xu Wang <wdongxu@linux.vnet.ibm.com>
---
 block/qcow.c     |    4 ++--
 block/qcow2.c    |    6 +++---
 block/sheepdog.c |    4 ++--
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/block/qcow.c b/block/qcow.c
index 35e21eb..3620a29 100644
--- a/block/qcow.c
+++ b/block/qcow.c
@@ -425,7 +425,7 @@ static int decompress_cluster(BlockDriverState *bs, uint64_t cluster_offset)
     return 0;
 }
 
-static int qcow_co_readv(BlockDriverState *bs, int64_t sector_num,
+static coroutine_fn int qcow_co_readv(BlockDriverState *bs, int64_t sector_num,
                          int nb_sectors, QEMUIOVector *qiov)
 {
     BDRVQcowState *s = bs->opaque;
@@ -523,7 +523,7 @@ fail:
     goto done;
 }
 
-static int qcow_co_writev(BlockDriverState *bs, int64_t sector_num,
+static coroutine_fn int qcow_co_writev(BlockDriverState *bs, int64_t sector_num,
                           int nb_sectors, QEMUIOVector *qiov)
 {
     BDRVQcowState *s = bs->opaque;
diff --git a/block/qcow2.c b/block/qcow2.c
index ef057d3..4924cfa 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -376,7 +376,7 @@ int qcow2_backing_read1(BlockDriverState *bs, QEMUIOVector *qiov,
     return n1;
 }
 
-static int qcow2_co_readv(BlockDriverState *bs, int64_t sector_num,
+static coroutine_fn int qcow2_co_readv(BlockDriverState *bs, int64_t sector_num,
                           int remaining_sectors, QEMUIOVector *qiov)
 {
     BDRVQcowState *s = bs->opaque;
@@ -516,7 +516,7 @@ static void run_dependent_requests(BDRVQcowState *s, QCowL2Meta *m)
     }
 }
 
-static int qcow2_co_writev(BlockDriverState *bs,
+static coroutine_fn int qcow2_co_writev(BlockDriverState *bs,
                            int64_t sector_num,
                            int remaining_sectors,
                            QEMUIOVector *qiov)
@@ -1105,7 +1105,7 @@ fail:
     return ret;
 }
 
-static int qcow2_co_flush(BlockDriverState *bs)
+static coroutine_fn int qcow2_co_flush(BlockDriverState *bs)
 {
     BDRVQcowState *s = bs->opaque;
     int ret;
diff --git a/block/sheepdog.c b/block/sheepdog.c
index 9f80609..c5bc520 100644
--- a/block/sheepdog.c
+++ b/block/sheepdog.c
@@ -1713,7 +1713,7 @@ out:
     return 1;
 }
 
-static int sd_co_writev(BlockDriverState *bs, int64_t sector_num,
+static coroutine_fn int sd_co_writev(BlockDriverState *bs, int64_t sector_num,
                         int nb_sectors, QEMUIOVector *qiov)
 {
     SheepdogAIOCB *acb;
@@ -1742,7 +1742,7 @@ static int sd_co_writev(BlockDriverState *bs, int64_t sector_num,
     return acb->ret;
 }
 
-static int sd_co_readv(BlockDriverState *bs, int64_t sector_num,
+static coroutine_fn int sd_co_readv(BlockDriverState *bs, int64_t sector_num,
                        int nb_sectors, QEMUIOVector *qiov)
 {
     SheepdogAIOCB *acb;
-- 
1.7.5.4


