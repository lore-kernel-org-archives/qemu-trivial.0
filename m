Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T0JAx-0001he-Qb
	for mharc-qemu-trivial@gnu.org; Sat, 11 Aug 2012 17:24:51 -0400
Received: from eggs.gnu.org ([208.118.235.92]:35680)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1T0JAu-0001Wr-Fb
	for qemu-trivial@nongnu.org; Sat, 11 Aug 2012 17:24:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1T0JAt-0008Hy-Gs
	for qemu-trivial@nongnu.org; Sat, 11 Aug 2012 17:24:48 -0400
Received: from mnementh.archaic.org.uk ([81.2.115.146]:52549)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1T0JAq-0008GK-6W; Sat, 11 Aug 2012 17:24:44 -0400
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.72)
	(envelope-from <pm215@archaic.org.uk>)
	id 1T0JAh-0006xn-Lc; Sat, 11 Aug 2012 22:24:35 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Sat, 11 Aug 2012 22:24:35 +0100
Message-Id: <1344720275-26744-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 81.2.115.146
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	patches@linaro.org
Subject: [Qemu-trivial] [PATCH] iov_send_recv(): Handle zero bytes case even
	if OS does not
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
X-List-Received-Date: Sat, 11 Aug 2012 21:24:50 -0000

POSIX allows sendmsg() and recvmsg() to fail EMSGSIZE if passed a zero
msg.msg_iovlen (in particular the MacOS X implementation will do this).
Handle the case where iov_send_recv() is passed a zero byte count
explicitly, to avoid accidentally depending on the OS to treat zero
msg_iovlen as a no-op.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
This is what was causing 'make check' to fail on MacOS X.
The other option was to declare that a zero bytecount was illegal, I guess.

 iov.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/iov.c b/iov.c
index b333061..60705c7 100644
--- a/iov.c
+++ b/iov.c
@@ -146,6 +146,13 @@ ssize_t iov_send_recv(int sockfd, struct iovec *iov, unsigned iov_cnt,
 {
     ssize_t ret;
     unsigned si, ei;            /* start and end indexes */
+    if (bytes == 0) {
+        /* Catch the do-nothing case early, as otherwise we will pass an
+         * empty iovec to sendmsg/recvmsg(), and not all implementations
+         * accept this.
+         */
+        return 0;
+    }
 
     /* Find the start position, skipping `offset' bytes:
      * first, skip all full-sized vector elements, */
-- 
1.7.11.4


