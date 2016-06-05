Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b9Sit-00033Z-Ic
	for mharc-qemu-trivial@gnu.org; Sun, 05 Jun 2016 03:43:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58984)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b9Sio-0002zq-Cu
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2016 03:43:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b9Sin-0004RK-GS
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2016 03:43:46 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:56642)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1b9Sig-0004OU-7g; Sun, 05 Jun 2016 03:43:38 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 49BE240912;
	Sun,  5 Jun 2016 10:43:33 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id BAAE1928;
	Sun,  5 Jun 2016 10:43:32 +0300 (MSK)
Received: (nullmailer pid 1105 invoked by uid 1000);
	Sun, 05 Jun 2016 07:43:32 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Peter Wu <peter@lekensteyn.nl>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Sun,  5 Jun 2016 10:42:45 +0300
Message-Id: <0b49921d791e56830e9f93bea4de20208244fff2.1465112552.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1465112552.git.mjt@msgid.tls.msk.ru>
References: <cover.1465112552.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 08/52] gdbstub: set listen backlog to 1
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
X-List-Received-Date: Sun, 05 Jun 2016 07:43:47 -0000

From: Peter Wu <peter@lekensteyn.nl>

Avoid possible connection drops on Linux (when tcp_syncookies is
disabled) or fallbacks to SYN cookies with the following kernel warning:

    TCP: request_sock_TCP: Possible SYN flooding on port 1234. Sending cookies.  Check SNMP counters.

Since Linux 4.4 (ef547f2ac16b "tcp: remove max_qlen_log"), a backlog of
zero is really treated as the "queue length for completely established
sockets waiting to be accepted" (listen(2)). This is apparently a valid
interpretation of an "implementation-defined minimum value" for a
backlog value of 0 (listen(3p)). Previous kernels would use 8 as
minimum value, but that is no longer the case.

Signed-off-by: Peter Wu <peter@lekensteyn.nl>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 gdbstub.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/gdbstub.c b/gdbstub.c
index b9e3710..ffcad0e 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -1629,7 +1629,7 @@ static int gdbserver_open(int port)
         close(fd);
         return -1;
     }
-    ret = listen(fd, 0);
+    ret = listen(fd, 1);
     if (ret < 0) {
         perror("listen");
         close(fd);
-- 
2.1.4


