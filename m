Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VGRth-0001UM-6I
	for mharc-qemu-trivial@gnu.org; Mon, 02 Sep 2013 07:02:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45126)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VGRta-0001JU-PO
	for qemu-trivial@nongnu.org; Mon, 02 Sep 2013 07:02:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VGRtW-0005PR-1q
	for qemu-trivial@nongnu.org; Mon, 02 Sep 2013 07:02:10 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:50767)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VGRtN-0005LY-Hn; Mon, 02 Sep 2013 07:01:57 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id C9E2140234;
	Mon,  2 Sep 2013 15:01:56 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id B3C0B20D;
	Mon,  2 Sep 2013 15:01:56 +0400 (MSK)
Received: (nullmailer pid 14623 invoked by uid 1000);
	Mon, 02 Sep 2013 11:01:56 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: aliguori@us.ibm.com
Date: Mon,  2 Sep 2013 15:01:21 +0400
Message-Id: <1378119695-14568-2-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1378119695-14568-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1378119695-14568-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Taimoor Mirza <tmirza@codesourcery.com>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 01/15] slirp: Port redirection option behave
	differently on Linux and Windows
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
X-List-Received-Date: Mon, 02 Sep 2013 11:02:15 -0000

From: Taimoor Mirza <tmirza@codesourcery.com>

port redirection code uses SO_REUSEADDR socket option before binding to
host port. Behavior of SO_REUSEADDR is different on Windows and Linux.
Relaunching QEMU with same host and guest port redirection values on Linux
throws error but on Windows it does not throw any error.
Problem is discussed in http://lists.gnu.org/archive/html/qemu-devel/2013-04/msg03089.html

Signed-off-by: Taimoor Mirza <tmirza@codesourcery.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 slirp/socket.c |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/slirp/socket.c b/slirp/socket.c
index 8e8819c..25d60e7 100644
--- a/slirp/socket.c
+++ b/slirp/socket.c
@@ -627,7 +627,9 @@ tcp_listen(Slirp *slirp, uint32_t haddr, u_int hport, uint32_t laddr,
 	addr.sin_port = hport;
 
 	if (((s = qemu_socket(AF_INET,SOCK_STREAM,0)) < 0) ||
+#ifndef _WIN32
 	    (qemu_setsockopt(s, SOL_SOCKET, SO_REUSEADDR, &opt, sizeof(int)) < 0) ||
+#endif
 	    (bind(s,(struct sockaddr *)&addr, sizeof(addr)) < 0) ||
 	    (listen(s,1) < 0)) {
 		int tmperrno = errno; /* Don't clobber the real reason we failed */
-- 
1.7.10.4


