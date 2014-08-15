Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XIEYr-0007cg-QC
	for mharc-qemu-trivial@gnu.org; Fri, 15 Aug 2014 06:16:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60473)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hutao@cn.fujitsu.com>) id 1XIEYl-0007RH-JA
	for qemu-trivial@nongnu.org; Fri, 15 Aug 2014 06:16:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <hutao@cn.fujitsu.com>) id 1XIEYh-0002K7-5B
	for qemu-trivial@nongnu.org; Fri, 15 Aug 2014 06:16:35 -0400
Received: from [59.151.112.132] (port=53933 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hutao@cn.fujitsu.com>)
	id 1XIEYT-0002I3-EY; Fri, 15 Aug 2014 06:16:17 -0400
X-IronPort-AV: E=Sophos;i="5.04,333,1406563200"; d="scan'208";a="34654138"
Received: from localhost (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 15 Aug 2014 18:13:23 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id s7FAGCth031154;
	Fri, 15 Aug 2014 18:16:13 +0800
Received: from G08FNSTD100614.fnst.cn.fujitsu.com (10.167.226.102) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Fri, 15 Aug 2014 18:16:21 +0800
From: Hu Tao <hutao@cn.fujitsu.com>
To: <qemu-devel@nongnu.org>
Date: Fri, 15 Aug 2014 18:13:59 +0800
Message-ID: <ce2e69aa1699c58e74cb5e41bfa95e497aa55a71.1408093440.git.hutao@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1408093440.git.hutao@cn.fujitsu.com>
References: <cover.1408093440.git.hutao@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.226.102]
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH 1/2] vl: free err
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
X-List-Received-Date: Fri, 15 Aug 2014 10:16:40 -0000

err is not freed after use, thus causing memory leak. This patch fixes
it.

Signed-off-by: Hu Tao <hutao@cn.fujitsu.com>
Cc: qemu-trivial@nongnu.org
---
 vl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/vl.c b/vl.c
index a8029d5..6011aff 100644
--- a/vl.c
+++ b/vl.c
@@ -2917,6 +2917,7 @@ out:
     g_free(dummy);
     if (err) {
         qerror_report_err(err);
+        error_free(err);
         return -1;
     }
     return 0;
-- 
1.9.3


