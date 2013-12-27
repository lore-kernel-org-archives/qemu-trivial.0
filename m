Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VwfZY-0002yC-Iq
	for mharc-qemu-trivial@gnu.org; Fri, 27 Dec 2013 17:08:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60260)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VwfZS-0002lF-Ou
	for qemu-trivial@nongnu.org; Fri, 27 Dec 2013 17:07:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VwfZN-0003xc-Q1
	for qemu-trivial@nongnu.org; Fri, 27 Dec 2013 17:07:54 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:56279)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VwfZA-0003s8-0O; Fri, 27 Dec 2013 17:07:36 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 56AA6438A1;
	Sat, 28 Dec 2013 02:07:36 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 0875C5E0;
	Sat, 28 Dec 2013 02:07:35 +0400 (MSK)
Received: (nullmailer pid 10329 invoked by uid 1000);
	Fri, 27 Dec 2013 22:07:34 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: aliguori@amazon.com
Date: Sat, 28 Dec 2013 02:07:15 +0400
Message-Id: <1388182050-10270-3-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1388182050-10270-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1388182050-10270-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 02/17] openrisc: Fix spelling in comment
	(transaltion -> translation)
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
X-List-Received-Date: Fri, 27 Dec 2013 22:07:59 -0000

From: Stefan Weil <sw@weilnetz.de>

I also removed two hyphens in the same comment.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: Jia Liu <proljc@gmail.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 target-openrisc/translate.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target-openrisc/translate.c b/target-openrisc/translate.c
index 91c60eb..b381477 100644
--- a/target-openrisc/translate.c
+++ b/target-openrisc/translate.c
@@ -112,7 +112,7 @@ void openrisc_translate_init(void)
     }
 }
 
-/* Writeback SR_F transaltion-space to execution-space.  */
+/* Writeback SR_F translation space to execution space.  */
 static inline void wb_SR_F(void)
 {
     int label;
-- 
1.7.10.4


