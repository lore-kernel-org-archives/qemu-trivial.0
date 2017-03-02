Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cjHvP-0001AI-Nw
	for mharc-qemu-trivial@gnu.org; Wed, 01 Mar 2017 23:01:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51304)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhangchen.fnst@cn.fujitsu.com>) id 1cjHvM-000182-Rb
	for qemu-trivial@nongnu.org; Wed, 01 Mar 2017 23:01:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhangchen.fnst@cn.fujitsu.com>) id 1cjHvL-0003KM-R5
	for qemu-trivial@nongnu.org; Wed, 01 Mar 2017 23:01:04 -0500
Received: from [59.151.112.132] (port=63277 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhangchen.fnst@cn.fujitsu.com>)
	id 1cjHvG-0003A9-VW; Wed, 01 Mar 2017 23:00:59 -0500
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="16122010"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 02 Mar 2017 12:00:45 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 1092947C4EB6;
	Thu,  2 Mar 2017 12:00:46 +0800 (CST)
Received: from localhost.localdomain (10.167.226.56) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Thu, 2 Mar 2017 12:00:46 +0800
From: Zhang Chen <zhangchen.fnst@cn.fujitsu.com>
To: qemu devel <qemu-devel@nongnu.org>, QEMU Trivial
	<qemu-trivial@nongnu.org>, Laurent Vivier <laurent@vivier.eu>, Michael
	Tokarev <mjt@tls.msk.ru>, Jason Wang <jasowang@redhat.com>
CC: Zhang Chen <zhangchen.fnst@cn.fujitsu.com>
Date: Thu, 2 Mar 2017 11:59:30 +0800
Message-ID: <1488427170-28050-1-git-send-email-zhangchen.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.226.56]
X-yoursite-MailScanner-ID: 1092947C4EB6.AD2D0
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhangchen.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Subject: [Qemu-trivial] [PATCH] net/filter-mirror: Follow CODING_STYLE
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
X-List-Received-Date: Thu, 02 Mar 2017 04:01:05 -0000

Signed-off-by: Zhang Chen <zhangchen.fnst@cn.fujitsu.com>
---
 net/filter-mirror.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/net/filter-mirror.c b/net/filter-mirror.c
index aa0aa98..72fa7c2 100644
--- a/net/filter-mirror.c
+++ b/net/filter-mirror.c
@@ -49,7 +49,7 @@ static int filter_mirror_send(CharBackend *chr_out,
 {
     int ret = 0;
     ssize_t size = 0;
-    uint32_t len =  0;
+    uint32_t len = 0;
     char *buf;
 
     size = iov_size(iov, iovcnt);
@@ -77,8 +77,9 @@ err:
     return ret < 0 ? ret : -EIO;
 }
 
-static void
-redirector_to_filter(NetFilterState *nf, const uint8_t *buf, int len)
+static void redirector_to_filter(NetFilterState *nf,
+                                 const uint8_t *buf,
+                                 int len)
 {
     struct iovec iov = {
         .iov_base = (void *)buf,
-- 
2.7.4




