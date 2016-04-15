Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aqwXc-0005dd-6n
	for mharc-qemu-trivial@gnu.org; Fri, 15 Apr 2016 01:43:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53928)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <xiecl.fnst@cn.fujitsu.com>) id 1aqwXY-0005U8-3S
	for qemu-trivial@nongnu.org; Fri, 15 Apr 2016 01:43:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <xiecl.fnst@cn.fujitsu.com>) id 1aqwXX-0000yd-9X
	for qemu-trivial@nongnu.org; Fri, 15 Apr 2016 01:43:36 -0400
Received: from [59.151.112.132] (port=42245 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <xiecl.fnst@cn.fujitsu.com>)
	id 1aqwXV-0000vw-25; Fri, 15 Apr 2016 01:43:33 -0400
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="5628425"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 15 Apr 2016 13:43:16 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 39B4A42B55E4;
	Fri, 15 Apr 2016 13:43:15 +0800 (CST)
Received: from changlox.g08.fujitsu.local (10.167.225.55) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Fri, 15 Apr 2016 13:43:14 +0800
From: Changlong Xie <xiecl.fnst@cn.fujitsu.com>
To: qemu devel <qemu-devel@nongnu.org>, qemu trivial
	<qemu-trivial@nongnu.org>, Kevin Wolf <kwolf@redhat.com>, Max Reitz
	<mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
CC: Changlong Xie <xiecl.fnst@cn.fujitsu.com>, Wen Congyang
	<wency@cn.fujitsu.com>
Date: Fri, 15 Apr 2016 13:46:12 +0800
Message-ID: <1460699173-31401-2-git-send-email-xiecl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1460699173-31401-1-git-send-email-xiecl.fnst@cn.fujitsu.com>
References: <1460699173-31401-1-git-send-email-xiecl.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.55]
X-yoursite-MailScanner-ID: 39B4A42B55E4.A0D15
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xiecl.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Subject: [Qemu-trivial] [PATCH v1 1/2] block: fix description of @stats
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
X-List-Received-Date: Fri, 15 Apr 2016 05:43:37 -0000

Qemu does not support "info blockstats" now.

Signed-off-by: Changlong Xie <xiecl.fnst@cn.fujitsu.com>
---
 block/block-backend.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index d74f670..05d5d09 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -49,7 +49,7 @@ struct BlockBackend {
 
     bool enable_write_cache;
 
-    /* I/O stats (display with "info blockstats"). */
+    /* I/O stats (display with { "execute": "query-blockstats" }). */
     BlockAcctStats stats;
 
     BlockdevOnError on_read_error, on_write_error;
-- 
1.9.3




