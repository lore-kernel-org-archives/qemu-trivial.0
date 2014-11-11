Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XoCij-0002kX-43
	for mharc-qemu-trivial@gnu.org; Tue, 11 Nov 2014 09:47:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60774)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XoCia-0002VA-Vm
	for qemu-trivial@nongnu.org; Tue, 11 Nov 2014 09:46:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XoCiW-000824-2K
	for qemu-trivial@nongnu.org; Tue, 11 Nov 2014 09:46:52 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:48292)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XoCiJ-0007yT-Tk; Tue, 11 Nov 2014 09:46:36 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id CB5BB41DF3;
	Tue, 11 Nov 2014 17:46:34 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id B79A3705;
	Tue, 11 Nov 2014 17:46:34 +0300 (MSK)
Received: (nullmailer pid 14581 invoked by uid 1000);
	Tue, 11 Nov 2014 14:46:34 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue, 11 Nov 2014 17:46:33 +0300
Message-Id: <705be728c0b5546da10d8ef4239a112d1616bb97.1415716845.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1415716845.git.mjt@msgid.tls.msk.ru>
References: <cover.1415716845.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Fam Zheng <famz@redhat.com>
Subject: [Qemu-trivial] [PULL 11/11] block: Fix comment for
	bdrv_co_get_block_status
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
X-List-Received-Date: Tue, 11 Nov 2014 14:46:58 -0000

From: Fam Zheng <famz@redhat.com>

It returns more information than binary, fix the comment.

Signed-off-by: Fam Zheng <famz@redhat.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 block.c               |    6 +++---
 include/block/block.h |    4 +++-
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/block.c b/block.c
index 88f6d9b..5f5b244 100644
--- a/block.c
+++ b/block.c
@@ -3877,9 +3877,9 @@ typedef struct BdrvCoGetBlockStatusData {
 } BdrvCoGetBlockStatusData;
 
 /*
- * Returns true iff the specified sector is present in the disk image. Drivers
- * not implementing the functionality are assumed to not support backing files,
- * hence all their sectors are reported as allocated.
+ * Returns the allocation status of the specified sectors.
+ * Drivers not implementing the functionality are assumed to not support
+ * backing files, hence all their sectors are reported as allocated.
  *
  * If 'sector_num' is beyond the end of the disk image the return value is 0
  * and 'pnum' is set to 0.
diff --git a/include/block/block.h b/include/block/block.h
index 341054d..603d4b4 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -83,7 +83,9 @@ typedef enum {
 #define BDRV_SECTOR_SIZE   (1ULL << BDRV_SECTOR_BITS)
 #define BDRV_SECTOR_MASK   ~(BDRV_SECTOR_SIZE - 1)
 
-/* BDRV_BLOCK_DATA: data is read from bs->file or another file
+/*
+ * Allocation status flags
+ * BDRV_BLOCK_DATA: data is read from bs->file or another file
  * BDRV_BLOCK_ZERO: sectors read as zero
  * BDRV_BLOCK_OFFSET_VALID: sector stored in bs->file as raw data
  * BDRV_BLOCK_ALLOCATED: the content of the block is determined by this
-- 
1.7.10.4


