Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VKvyd-00035p-U1
	for mharc-qemu-trivial@gnu.org; Sat, 14 Sep 2013 15:57:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49565)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VKvyX-0002tn-H7
	for qemu-trivial@nongnu.org; Sat, 14 Sep 2013 15:57:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VKvyS-0000n9-LB
	for qemu-trivial@nongnu.org; Sat, 14 Sep 2013 15:57:49 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:41655)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VKvyG-0000is-90; Sat, 14 Sep 2013 15:57:32 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id E3F39411BF;
	Sat, 14 Sep 2013 23:57:30 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 053C750D;
	Sat, 14 Sep 2013 23:47:45 +0400 (MSK)
Received: (nullmailer pid 7714 invoked by uid 1000);
	Sat, 14 Sep 2013 19:47:44 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: aliguori@us.ibm.com
Date: Sat, 14 Sep 2013 23:47:37 +0400
Message-Id: <1379188061-7634-12-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1379188061-7634-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1379188061-7634-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel@nongnu.org, Wenchao Xia <xiawenc@linux.vnet.ibm.com>
Subject: [Qemu-trivial] [PULL 11/15] iov: avoid "orig_len may be used
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
X-List-Received-Date: Sat, 14 Sep 2013 19:57:54 -0000

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


