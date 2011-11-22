Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RSnHp-0000QU-Tj
	for mharc-qemu-trivial@gnu.org; Tue, 22 Nov 2011 05:09:09 -0500
Received: from eggs.gnu.org ([140.186.70.92]:54654)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wdongxu@linux.vnet.ibm.com>) id 1RSnHP-00083b-8g
	for qemu-trivial@nongnu.org; Tue, 22 Nov 2011 05:09:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wdongxu@linux.vnet.ibm.com>) id 1RSnHB-0006LP-73
	for qemu-trivial@nongnu.org; Tue, 22 Nov 2011 05:08:38 -0500
Received: from e28smtp07.in.ibm.com ([122.248.162.7]:42689)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wdongxu@linux.vnet.ibm.com>) id 1RSnH9-00062B-Rg
	for qemu-trivial@nongnu.org; Tue, 22 Nov 2011 05:08:29 -0500
Received: from /spool/local
	by e28smtp07.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <wdongxu@linux.vnet.ibm.com>;
	Tue, 22 Nov 2011 15:37:32 +0530
Received: from d28relay05.in.ibm.com ([9.184.220.62])
	by e28smtp07.in.ibm.com ([192.168.1.137]) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Tue, 22 Nov 2011 15:37:28 +0530
Received: from d28av05.in.ibm.com (d28av05.in.ibm.com [9.184.220.67])
	by d28relay05.in.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	pAMA7RrP3899532; Tue, 22 Nov 2011 15:37:27 +0530
Received: from d28av05.in.ibm.com (loopback [127.0.0.1])
	by d28av05.in.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id
	pAMA7RxD028328; Tue, 22 Nov 2011 21:07:27 +1100
Received: from wdongxu-T410.cn.ibm.com (wdongxu-t410.cn.ibm.com
	[9.115.118.147] (may be forged))
	by d28av05.in.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with ESMTP id
	pAMA6u0S026400; Tue, 22 Nov 2011 21:07:26 +1100
From: Dong Xu Wang <wdongxu@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Date: Tue, 22 Nov 2011 18:06:25 +0800
Message-Id: <1321956386-12004-10-git-send-email-wdongxu@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1321956386-12004-1-git-send-email-wdongxu@linux.vnet.ibm.com>
References: <1321956386-12004-1-git-send-email-wdongxu@linux.vnet.ibm.com>
x-cbid: 11112210-8878-0000-0000-0000004EB85B
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 122.248.162.7
Cc: qemu-trivial@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	stefanha@linux.vnet.ibm.com
Subject: [Qemu-trivial] [PATCH 10/11] fix spelling in block sub directory
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
X-List-Received-Date: Tue, 22 Nov 2011 10:09:07 -0000

From: Dong Xu Wang <wdongxu@linux.vnet.ibm.com>


Cc: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Dong Xu Wang <wdongxu@linux.vnet.ibm.com>
---
 block/cow.c       |    2 +-
 block/qcow2.c     |    4 ++--
 block/raw-posix.c |    4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/block/cow.c b/block/cow.c
index 089d395..3448296 100644
--- a/block/cow.c
+++ b/block/cow.c
@@ -92,7 +92,7 @@ static int cow_open(BlockDriverState *bs, int flags)
 }
 
 /*
- * XXX(hch): right now these functions are extremly ineffcient.
+ * XXX(hch): right now these functions are extremely ineffcient.
  * We should just read the whole bitmap we'll need in one go instead.
  */
 static inline int cow_set_bit(BlockDriverState *bs, int64_t bitnum)
diff --git a/block/qcow2.c b/block/qcow2.c
index d7805ce..9e1b1eb 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -92,7 +92,7 @@ static int qcow2_read_extensions(BlockDriverState *bs, uint64_t start_offset,
         if (offset > s->cluster_size)
             printf("qcow2_read_extension: suspicious offset %lu\n", offset);
 
-        printf("attemting to read extended header in offset %lu\n", offset);
+        printf("attempting to read extended header in offset %lu\n", offset);
 #endif
 
         if (bdrv_pread(bs->file, offset, &ext, sizeof(ext)) != sizeof(ext)) {
@@ -821,7 +821,7 @@ static int qcow2_create2(const char *filename, int64_t total_size,
                          int flags, size_t cluster_size, int prealloc,
                          QEMUOptionParameter *options)
 {
-    /* Calulate cluster_bits */
+    /* Calculate cluster_bits */
     int cluster_bits;
     cluster_bits = ffs(cluster_size) - 1;
     if (cluster_bits < MIN_CLUSTER_BITS || cluster_bits > MAX_CLUSTER_BITS ||
diff --git a/block/raw-posix.c b/block/raw-posix.c
index a3de373..2ee5d69 100644
--- a/block/raw-posix.c
+++ b/block/raw-posix.c
@@ -1153,7 +1153,7 @@ static int cdrom_open(BlockDriverState *bs, const char *filename, int flags)
     if (ret)
         return ret;
 
-    /* make sure the door isnt locked at this time */
+    /* make sure the door isn't locked at this time */
     ioctl(s->fd, CDIOCALLOW);
     return 0;
 }
@@ -1184,7 +1184,7 @@ static int cdrom_reopen(BlockDriverState *bs)
     }
     s->fd = fd;
 
-    /* make sure the door isnt locked at this time */
+    /* make sure the door isn't locked at this time */
     ioctl(s->fd, CDIOCALLOW);
     return 0;
 }
-- 
1.7.5.4


