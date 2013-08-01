Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V4tVZ-0007Yy-8m
	for mharc-qemu-trivial@gnu.org; Thu, 01 Aug 2013 10:05:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37518)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1V4psb-0000Hv-40
	for qemu-trivial@nongnu.org; Thu, 01 Aug 2013 06:13:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1V4psU-0005Fm-Tk
	for qemu-trivial@nongnu.org; Thu, 01 Aug 2013 06:13:09 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34099)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>)
	id 1V4psE-0005AJ-T6; Thu, 01 Aug 2013 06:12:47 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r71ACijg010506
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Thu, 1 Aug 2013 06:12:45 -0400
Received: from T430s.nay.redhat.com ([10.66.6.13])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r71ACeVl031219; Thu, 1 Aug 2013 06:12:41 -0400
From: Fam Zheng <famz@redhat.com>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Thu,  1 Aug 2013 18:12:17 +0800
Message-Id: <1375351937-17893-1-git-send-email-famz@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
X-Mailman-Approved-At: Thu, 01 Aug 2013 10:05:35 -0400
Cc: Fam Zheng <famz@redhat.com>, mjt@tls.msk.ru
Subject: [Qemu-trivial] [PATCH] vmdk: fix comment for vmdk_co_write_zeroes
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
X-List-Received-Date: Thu, 01 Aug 2013 10:13:17 -0000

The comment was truncated. Add the missing parts, especially explain why
we need zero_dry_run.

Signed-off-by: Fam Zheng <famz@redhat.com>
---
 block/vmdk.c | 8 ++++++--
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
1.8.3.4


