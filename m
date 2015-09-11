Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZaNL2-0006iX-F7
	for mharc-qemu-trivial@gnu.org; Fri, 11 Sep 2015 08:21:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49042)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZaNKx-0006bE-MY
	for qemu-trivial@nongnu.org; Fri, 11 Sep 2015 08:21:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZaNKw-0000S8-V8
	for qemu-trivial@nongnu.org; Fri, 11 Sep 2015 08:21:51 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:48236)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZaNKs-0000MQ-D2; Fri, 11 Sep 2015 08:21:46 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 53D3C41440;
	Fri, 11 Sep 2015 15:21:45 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 19DA0A67;
	Fri, 11 Sep 2015 14:03:53 +0300 (MSK)
Received: (nullmailer pid 22756 invoked by uid 1000);
	Fri, 11 Sep 2015 11:03:51 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Fri, 11 Sep 2015 14:03:26 +0300
Message-Id: <6883de6c9b647d5629ffe131ed5d97c06bb0db1a.1441969369.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1441969369.git.mjt@msgid.tls.msk.ru>
References: <cover.1441969369.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Andrey Korolyov <andrey@xdel.ru>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 02/26] Trivial: fix commandline help message
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
X-List-Received-Date: Fri, 11 Sep 2015 12:21:52 -0000

From: Andrey Korolyov <andrey@xdel.ru>

Fix obvious typo in printed help for qemu-nbd.

Signed-off-by: Andrey Korolyov <andrey@xdel.ru>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qemu-nbd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qemu-nbd.c b/qemu-nbd.c
index d9644b2..9518b75 100644
--- a/qemu-nbd.c
+++ b/qemu-nbd.c
@@ -102,7 +102,7 @@ static void usage(const char *name)
 "      --aio=MODE            set AIO mode (native or threads)\n"
 #endif
 "      --discard=MODE        set discard mode (ignore, unmap)\n"
-"      --detect-zeroes=MODE  set detect-zeroes mode (off, on, discard)\n"
+"      --detect-zeroes=MODE  set detect-zeroes mode (off, on, unmap)\n"
 "\n"
 "Report bugs to <qemu-devel@nongnu.org>\n"
     , name, NBD_DEFAULT_PORT, "DEVICE");
-- 
2.1.4


