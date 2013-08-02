Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V5GEd-0001KU-C1
	for mharc-qemu-trivial@gnu.org; Fri, 02 Aug 2013 10:21:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57473)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1V5GEV-00014j-Tr
	for qemu-trivial@nongnu.org; Fri, 02 Aug 2013 10:21:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1V5GEQ-0007JK-Pv
	for qemu-trivial@nongnu.org; Fri, 02 Aug 2013 10:21:31 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:41935)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1V5GEF-0007GL-0N; Fri, 02 Aug 2013 10:21:15 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 6CFF040425;
	Fri,  2 Aug 2013 18:21:14 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 5D2924DA;
	Fri,  2 Aug 2013 18:21:14 +0400 (MSK)
Received: (nullmailer pid 7231 invoked by uid 1000);
	Fri, 02 Aug 2013 14:21:13 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: Anthony Liguori <aliguori@us.ibm.com>
Date: Fri,  2 Aug 2013 18:20:48 +0400
Message-Id: <1375453248-7178-5-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1375453248-7178-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1375453248-7178-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Fam Zheng <famz@redhat.com>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 4/4] vmdk: fix comment for vmdk_co_write_zeroes
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
X-List-Received-Date: Fri, 02 Aug 2013 14:21:37 -0000

From: Fam Zheng <famz@redhat.com>

The comment was truncated. Add the missing parts, especially explain why
we need zero_dry_run.

Signed-off-by: Fam Zheng <famz@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 block/vmdk.c |    8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/block/vmdk.c b/block/vmdk.c
index 3756333..e6c50b1 100644
--- a/block/vmdk.c
+++ b/block/vmdk.c
@@ -1200,8 +1200,10 @@ static coroutine_fn int vmdk_co_read(BlockDriverState *bs, int64_t sector_num,
 /**
  * vmdk_write:
  * @zeroed:       buf is ignored (data is zero), use zeroed_grain GTE feature
- * if possible, otherwise return -ENOTSUP.
- * @zero_dry_run: used for zeroed == true only, don't update L2 table, just
+ *                if possible, otherwise return -ENOTSUP.
+ * @zero_dry_run: used for zeroed == true only, don't update L2 table, just try
+ *                with each cluster. By dry run we can find if the zero write
+ *                is possible without modifying image data.
  *
  * Returns: error code with 0 for success.
  */
@@ -1328,6 +1330,8 @@ static int coroutine_fn vmdk_co_write_zeroes(BlockDriverState *bs,
     int ret;
     BDRVVmdkState *s = bs->opaque;
     qemu_co_mutex_lock(&s->lock);
+    /* write zeroes could fail if sectors not aligned to cluster, test it with
+     * dry_run == true before really updating image */
     ret = vmdk_write(bs, sector_num, NULL, nb_sectors, true, true);
     if (!ret) {
         ret = vmdk_write(bs, sector_num, NULL, nb_sectors, true, false);
-- 
1.7.10.4


