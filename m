Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WeduG-0000GU-8c
	for mharc-qemu-trivial@gnu.org; Mon, 28 Apr 2014 01:15:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48943)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Wedu9-0008T8-DO
	for qemu-trivial@nongnu.org; Mon, 28 Apr 2014 01:15:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Wedu5-0002NB-Ah
	for qemu-trivial@nongnu.org; Mon, 28 Apr 2014 01:15:01 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:39711)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Wedtp-0002Ku-BL; Mon, 28 Apr 2014 01:14:41 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 742E84303A;
	Mon, 28 Apr 2014 09:14:40 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id AA0D7651;
	Mon, 28 Apr 2014 09:08:27 +0400 (MSK)
Received: (nullmailer pid 19156 invoked by uid 1000);
	Mon, 28 Apr 2014 05:08:26 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon, 28 Apr 2014 09:07:59 +0400
Message-Id: <1398661684-19059-14-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1398661684-19059-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1398661684-19059-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Igor Ryzhov <iryzhov@arccn.ru>
Subject: [Qemu-trivial] [PULL 13/18] net/net.c: remove unnecessary semicolon
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
X-List-Received-Date: Mon, 28 Apr 2014 05:15:05 -0000

From: Igor Ryzhov <iryzhov@arccn.ru>

Signed-off-by: Igor Ryzhov <iryzhov@arccn.ru>
Reviewed-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 net/net.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/net.c b/net/net.c
index a4aadff..bc9ed6d 100644
--- a/net/net.c
+++ b/net/net.c
@@ -473,7 +473,7 @@ ssize_t qemu_deliver_packet(NetClientState *sender,
 
     if (ret == 0) {
         nc->receive_disabled = 1;
-    };
+    }
 
     return ret;
 }
-- 
1.7.10.4


