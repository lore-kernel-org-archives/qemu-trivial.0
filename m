Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aIY3I-0003yD-D1
	for mharc-qemu-trivial@gnu.org; Mon, 11 Jan 2016 03:42:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50820)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aIY3E-0003ow-A3
	for qemu-trivial@nongnu.org; Mon, 11 Jan 2016 03:42:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aIY3D-0000uJ-FG
	for qemu-trivial@nongnu.org; Mon, 11 Jan 2016 03:42:08 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:35704)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1aIY37-0000rf-Cz; Mon, 11 Jan 2016 03:42:01 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id CB5E9403E2;
	Mon, 11 Jan 2016 11:42:00 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 44E45A8A;
	Mon, 11 Jan 2016 11:42:00 +0300 (MSK)
Received: (nullmailer pid 28777 invoked by uid 1000);
	Mon, 11 Jan 2016 08:41:59 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon, 11 Jan 2016 11:41:45 +0300
Message-Id: <b3afe33526eca082cd5b0cdb12aabf5315cdf68b.1452501577.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1452501577.git.mjt@msgid.tls.msk.ru>
References: <cover.1452501577.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Eric Blake <eblake@redhat.com>
Subject: [Qemu-trivial] [PULL 06/19] crypto: Fix typo in example
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
X-List-Received-Date: Mon, 11 Jan 2016 08:42:09 -0000

From: Eric Blake <eblake@redhat.com>

The example code wouldn't even compile, since it did not use
a consistent spelling for the Error ** parameter.

Signed-off-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Daniel P. Berrange <berrange@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 include/crypto/tlssession.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/crypto/tlssession.h b/include/crypto/tlssession.h
index b38fe69..d356a8d 100644
--- a/include/crypto/tlssession.h
+++ b/include/crypto/tlssession.h
@@ -56,7 +56,7 @@
  *
  * static int mysock_run_tls(int sockfd,
  *                           QCryptoTLSCreds *creds,
- *                           Error *erp)
+ *                           Error *errp)
  * {
  *    QCryptoTLSSession *sess;
  *
-- 
2.1.4


