Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1afTLn-0002PJ-Sj
	for mharc-qemu-trivial@gnu.org; Mon, 14 Mar 2016 10:20:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51986)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <weijg.fnst@cn.fujitsu.com>) id 1afPHw-0004Bq-Sw
	for qemu-trivial@nongnu.org; Mon, 14 Mar 2016 05:59:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <weijg.fnst@cn.fujitsu.com>) id 1afPHs-0001HT-Pk
	for qemu-trivial@nongnu.org; Mon, 14 Mar 2016 05:59:48 -0400
Received: from [59.151.112.132] (port=22930 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <weijg.fnst@cn.fujitsu.com>)
	id 1afPHh-00012J-Kn; Mon, 14 Mar 2016 05:59:33 -0400
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="4548170"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 14 Mar 2016 17:59:13 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 24FAB42B4B03;
	Mon, 14 Mar 2016 17:59:12 +0800 (CST)
Received: from localhost.localdomain (10.167.226.50) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Mon, 14 Mar 2016 18:03:50 +0800
From: Wei Jiangang <weijg.fnst@cn.fujitsu.com>
To: <qemu-devel@nongnu.org>
Date: Mon, 14 Mar 2016 17:58:29 +0800
Message-ID: <1457949509-4014-1-git-send-email-weijg.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.3
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.226.50]
X-yoursite-MailScanner-ID: 24FAB42B4B03.A0B11
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: weijg.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
X-Mailman-Approved-At: Mon, 14 Mar 2016 10:20:02 -0400
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, berrange@redhat.com,
	kraxel@redhat.com, Wei Jiangang <weijg.fnst@cn.fujitsu.com>
Subject: [Qemu-trivial] [Qemu-devel][PATCH v1] util: fix comment typos
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
X-List-Received-Date: Mon, 14 Mar 2016 09:59:49 -0000

Signed-off-by: Wei Jiangang <weijg.fnst@cn.fujitsu.com>
---
 util/buffer.c       | 4 ++--
 util/qemu-sockets.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/util/buffer.c b/util/buffer.c
index a6118bf..33e94d1 100644
--- a/util/buffer.c
+++ b/util/buffer.c
@@ -25,7 +25,7 @@
 #define BUFFER_MIN_INIT_SIZE     4096
 #define BUFFER_MIN_SHRINK_SIZE  65536
 
-/* define the factor alpha for the expentional smoothing
+/* define the factor alpha for the exponential smoothing
  * that is used in the average size calculation. a shift
  * of 7 results in an alpha of 1/2^7. */
 #define BUFFER_AVG_SIZE_SHIFT       7
@@ -45,7 +45,7 @@ static void buffer_adj_size(Buffer *buffer, size_t len)
                         old, buffer->capacity);
 
     /* make it even harder for the buffer to shrink, reset average size
-     * to currenty capacity if it is larger than the average. */
+     * to current capacity if it is larger than the average. */
     buffer->avg_size = MAX(buffer->avg_size,
                            buffer->capacity << BUFFER_AVG_SIZE_SHIFT);
 }
diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
index ad7c00c..e1ef4ad 100644
--- a/util/qemu-sockets.c
+++ b/util/qemu-sockets.c
@@ -90,7 +90,7 @@ NetworkAddressFamily inet_netfamily(int family)
  *   t     f       PF_INET
  *   t     t       PF_INET6
  *
- * NB, this matrix is only about getting the neccessary results
+ * NB, this matrix is only about getting the necessary results
  * from getaddrinfo(). Some of the cases require further work
  * after reading results from getaddrinfo in order to fully
  * apply the logic the end user wants. eg with the last case
-- 
1.9.3




