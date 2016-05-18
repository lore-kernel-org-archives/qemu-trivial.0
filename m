Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b30Wr-00011e-L4
	for mharc-qemu-trivial@gnu.org; Wed, 18 May 2016 08:24:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34072)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b30Wm-0000ul-1z
	for qemu-trivial@nongnu.org; Wed, 18 May 2016 08:24:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b30Wg-0005jX-OM
	for qemu-trivial@nongnu.org; Wed, 18 May 2016 08:24:38 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:45348)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1b30WT-0005gh-4T; Wed, 18 May 2016 08:24:21 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 2F103417A6;
	Wed, 18 May 2016 15:24:17 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id CEDF2ADA;
	Wed, 18 May 2016 15:06:10 +0300 (MSK)
Received: (nullmailer pid 12394 invoked by uid 1000);
	Wed, 18 May 2016 12:06:09 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Wei Jiangang <weijg.fnst@cn.fujitsu.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Wed, 18 May 2016 15:06:02 +0300
Message-Id: <d43eda3d19152372d265a93ca2cf69aa86a9d4ae.1463573089.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1463573089.git.mjt@msgid.tls.msk.ru>
References: <cover.1463573089.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 07/13] util: fix comment typos
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
X-List-Received-Date: Wed, 18 May 2016 12:24:44 -0000

From: Wei Jiangang <weijg.fnst@cn.fujitsu.com>

Signed-off-by: Wei Jiangang <weijg.fnst@cn.fujitsu.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
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
index 2a2c524..0d6cd1f 100644
--- a/util/qemu-sockets.c
+++ b/util/qemu-sockets.c
@@ -93,7 +93,7 @@ NetworkAddressFamily inet_netfamily(int family)
  *   t     f       PF_INET
  *   t     t       PF_INET6
  *
- * NB, this matrix is only about getting the neccessary results
+ * NB, this matrix is only about getting the necessary results
  * from getaddrinfo(). Some of the cases require further work
  * after reading results from getaddrinfo in order to fully
  * apply the logic the end user wants. eg with the last case
-- 
2.1.4


