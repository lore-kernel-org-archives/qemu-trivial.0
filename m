Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YL8sd-0007vT-P0
	for mharc-qemu-trivial@gnu.org; Tue, 10 Feb 2015 06:21:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38234)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YL8sa-0007o1-4w
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 06:21:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YL8sZ-0007QU-9l
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 06:21:20 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:50246)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YL8sL-0007MF-01; Tue, 10 Feb 2015 06:21:05 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id BC9DF418E6;
	Tue, 10 Feb 2015 14:21:03 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 1F5EA960;
	Tue, 10 Feb 2015 09:34:48 +0300 (MSK)
Received: (nullmailer pid 9423 invoked by uid 1000);
	Tue, 10 Feb 2015 06:34:43 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue, 10 Feb 2015 09:34:33 +0300
Message-Id: <c0a95b352073d1defeb1c9d11bca8849452afeae.1423549659.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1423549659.git.mjt@msgid.tls.msk.ru>
References: <cover.1423549659.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 44/46] stubs: Fix warning caused by missing
	include statement
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
X-List-Received-Date: Tue, 10 Feb 2015 11:21:21 -0000

From: Stefan Weil <sw@weilnetz.de>

Warning from the Sparse static analysis tool:

stubs/qtest.c:14:6:
 warning: symbol 'qtest_allowed' was not declared. Should it be static?

Add the missing include statement which declares qtest_allowed.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 stubs/qtest.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/stubs/qtest.c b/stubs/qtest.c
index e671ed8..dc17594 100644
--- a/stubs/qtest.c
+++ b/stubs/qtest.c
@@ -8,7 +8,7 @@
  * See the COPYING file in the top-level directory.
  */
 
-#include "qemu-common.h"
+#include "sysemu/qtest.h"
 
 /* Needed for qtest_allowed() */
 bool qtest_allowed;
-- 
2.1.4


