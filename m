Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WuObu-0002YS-Op
	for mharc-qemu-trivial@gnu.org; Tue, 10 Jun 2014 12:09:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58415)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WuObo-0002Mx-3w
	for qemu-trivial@nongnu.org; Tue, 10 Jun 2014 12:09:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WuObj-00087k-6f
	for qemu-trivial@nongnu.org; Tue, 10 Jun 2014 12:09:12 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:54050)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WuObR-0007jI-K5; Tue, 10 Jun 2014 12:08:49 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 93C82412BB;
	Tue, 10 Jun 2014 20:08:47 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 80F66661;
	Tue, 10 Jun 2014 20:08:47 +0400 (MSK)
Received: (nullmailer pid 13300 invoked by uid 1000);
	Tue, 10 Jun 2014 16:08:47 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue, 10 Jun 2014 20:08:23 +0400
Message-Id: <1402416523-13212-6-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1402416523-13212-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1402416523-13212-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Sergey Fedorov <serge.fdrv@gmail.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 05/25] qtest: fix hex2nib for capital
	characters
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
X-List-Received-Date: Tue, 10 Jun 2014 16:09:17 -0000

From: Sergey Fedorov <serge.fdrv@gmail.com>

Signed-off-by: Sergey Fedorov <serge.fdrv@gmail.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qtest.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qtest.c b/qtest.c
index f9695a8..04a6dc1 100644
--- a/qtest.c
+++ b/qtest.c
@@ -148,7 +148,7 @@ static int hex2nib(char ch)
     } else if (ch >= 'a' && ch <= 'f') {
         return 10 + (ch - 'a');
     } else if (ch >= 'A' && ch <= 'F') {
-        return 10 + (ch - 'a');
+        return 10 + (ch - 'A');
     } else {
         return -1;
     }
-- 
1.7.10.4


