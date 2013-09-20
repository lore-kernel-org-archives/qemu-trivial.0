Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VN4LH-0007YN-Hr
	for mharc-qemu-trivial@gnu.org; Fri, 20 Sep 2013 13:18:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54732)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VN4LA-0007It-0a
	for qemu-trivial@nongnu.org; Fri, 20 Sep 2013 13:18:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VN4L5-0006BW-3M
	for qemu-trivial@nongnu.org; Fri, 20 Sep 2013 13:17:59 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:60426)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VN4Ky-00067W-T4; Fri, 20 Sep 2013 13:17:49 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id E6814419CE;
	Fri, 20 Sep 2013 21:17:47 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 41DA14C3;
	Fri, 20 Sep 2013 20:58:21 +0400 (MSK)
Received: (nullmailer pid 32185 invoked by uid 1000);
	Fri, 20 Sep 2013 16:58:21 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: aliguori@us.ibm.com
Date: Fri, 20 Sep 2013 20:58:10 +0400
Message-Id: <1379696296-32105-12-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1379696296-32105-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1379696296-32105-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel@nongnu.org, Wenchao Xia <xiawenc@linux.vnet.ibm.com>
Subject: [Qemu-trivial] [PULL 11/17] iov: avoid "orig_len may be used
	unitialized" warning
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
X-List-Received-Date: Fri, 20 Sep 2013 17:18:05 -0000

Signed-off-by: Wenchao Xia <xiawenc@linux.vnet.ibm.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 util/iov.c |   10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/util/iov.c b/util/iov.c
index f705586..bb46c04 100644
--- a/util/iov.c
+++ b/util/iov.c
@@ -181,13 +181,11 @@ ssize_t iov_send_recv(int sockfd, struct iovec *iov, unsigned iov_cnt,
             assert(iov[niov].iov_len > tail);
             orig_len = iov[niov].iov_len;
             iov[niov++].iov_len = tail;
-        }
-
-        ret = do_send_recv(sockfd, iov, niov, do_send);
-
-        /* Undo the changes above before checking for errors */
-        if (tail) {
+            ret = do_send_recv(sockfd, iov, niov, do_send);
+            /* Undo the changes above before checking for errors */
             iov[niov-1].iov_len = orig_len;
+        } else {
+            ret = do_send_recv(sockfd, iov, niov, do_send);
         }
         if (offset) {
             iov[0].iov_base -= offset;
-- 
1.7.10.4


