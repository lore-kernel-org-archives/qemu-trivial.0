Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WKiec-0007hj-1F
	for mharc-qemu-trivial@gnu.org; Tue, 04 Mar 2014 01:16:38 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57976)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WKieT-0007Xk-N6
	for qemu-trivial@nongnu.org; Tue, 04 Mar 2014 01:16:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WKieP-00019h-A6
	for qemu-trivial@nongnu.org; Tue, 04 Mar 2014 01:16:29 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:41669)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WKieD-00015o-K9; Tue, 04 Mar 2014 01:16:13 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 0341340850;
	Tue,  4 Mar 2014 10:16:04 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id E62E164F;
	Tue,  4 Mar 2014 10:16:03 +0400 (MSK)
Received: (nullmailer pid 16579 invoked by uid 1000);
	Tue, 04 Mar 2014 06:16:03 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue,  4 Mar 2014 10:15:53 +0400
Message-Id: <1393913761-16516-6-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1393913761-16516-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1393913761-16516-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 05/13] tcg: Fix typo in comment (dependancies
	-> dependencies)
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
X-List-Received-Date: Tue, 04 Mar 2014 06:16:34 -0000

From: Stefan Weil <sw@weilnetz.de>

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 tcg/tcg.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index ffc851e..f1e0763 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -41,7 +41,7 @@
 #include "qemu/host-utils.h"
 #include "qemu/timer.h"
 
-/* Note: the long term plan is to reduce the dependancies on the QEMU
+/* Note: the long term plan is to reduce the dependencies on the QEMU
    CPU definitions. Currently they are used for qemu_ld/st
    instructions */
 #define NO_CPU_IO_DEFS
-- 
1.7.10.4


