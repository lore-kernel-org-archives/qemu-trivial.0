Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b7JR9-0002M3-0W
	for mharc-qemu-trivial@gnu.org; Mon, 30 May 2016 05:24:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46947)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <xiecl.fnst@cn.fujitsu.com>) id 1b7JR6-0002Gw-Kz
	for qemu-trivial@nongnu.org; Mon, 30 May 2016 05:24:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <xiecl.fnst@cn.fujitsu.com>) id 1b7JR4-00015O-M3
	for qemu-trivial@nongnu.org; Mon, 30 May 2016 05:24:35 -0400
Received: from [59.151.112.132] (port=38458 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <xiecl.fnst@cn.fujitsu.com>)
	id 1b7JQx-00011Y-Vu; Mon, 30 May 2016 05:24:29 -0400
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="7099570"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 30 May 2016 17:24:15 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id DE7DE489F99F;
	Mon, 30 May 2016 17:24:08 +0800 (CST)
Received: from changlox.g08.fujitsu.local (10.167.225.55) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Mon, 30 May 2016 17:24:08 +0800
From: Changlong Xie <xiecl.fnst@cn.fujitsu.com>
To: qemu devel <qemu-devel@nongnu.org>, qemu trival <qemu-trivial@nongnu.org>, 
	Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <famz@redhat.com>,
	Max Reitz <mreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>
CC: Changlong Xie <xiecl.fnst@cn.fujitsu.com>
Date: Mon, 30 May 2016 17:28:11 +0800
Message-ID: <1464600491-23340-1-git-send-email-xiecl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.3
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.55]
X-yoursite-MailScanner-ID: DE7DE489F99F.A1E2B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xiecl.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Subject: [Qemu-trivial] [PATCH] iostatus: fix comments for
 block_job_iostatus_reset
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 30 May 2016 09:24:37 -0000

Signed-off-by: Changlong Xie <xiecl.fnst@cn.fujitsu.com>
---
 include/block/blockjob.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/block/blockjob.h b/include/block/blockjob.h
index 86d2807..00ac418 100644
--- a/include/block/blockjob.h
+++ b/include/block/blockjob.h
@@ -397,7 +397,7 @@ int block_job_complete_sync(BlockJob *job, Error **errp);
  * @job: The job whose I/O status should be reset.
  *
  * Reset I/O status on @job and on BlockDriverState objects it uses,
- * other than job->bs.
+ * other than job->blk.
  */
 void block_job_iostatus_reset(BlockJob *job);
 
-- 
1.9.3




