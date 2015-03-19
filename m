Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YYWyT-0002tE-Ig
	for mharc-qemu-trivial@gnu.org; Thu, 19 Mar 2015 05:42:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41823)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YYWyR-0002qx-Ca
	for qemu-trivial@nongnu.org; Thu, 19 Mar 2015 05:42:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YYWyQ-0001nb-Ek
	for qemu-trivial@nongnu.org; Thu, 19 Mar 2015 05:42:43 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:56178)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YYWyL-0001km-Tw; Thu, 19 Mar 2015 05:42:38 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 9749B41E4E;
	Thu, 19 Mar 2015 12:42:36 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 65C1F947;
	Thu, 19 Mar 2015 12:05:48 +0300 (MSK)
Received: (nullmailer pid 363 invoked by uid 1000);
	Thu, 19 Mar 2015 09:05:44 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 19 Mar 2015 12:05:37 +0300
Message-Id: <7e7d49d68bb165ddfdf29929e0a487264085ca51.1426755483.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1426755483.git.mjt@msgid.tls.msk.ru>
References: <cover.1426755483.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	John Snow <jsnow@redhat.com>
Subject: [Qemu-trivial] [PULL 19/24] qtest/ahci: Fix a bit mask expression
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
X-List-Received-Date: Thu, 19 Mar 2015 09:42:44 -0000

From: John Snow <jsnow@redhat.com>

A thinko that clang 3.5.0 caught.
Thankfully does not introduce any new failures.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 tests/ahci-test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/ahci-test.c b/tests/ahci-test.c
index cf0b98b..169e83b 100644
--- a/tests/ahci-test.c
+++ b/tests/ahci-test.c
@@ -583,7 +583,7 @@ static void ahci_test_port_spec(AHCIQState *ahci, uint8_t port)
         ASSERT_BIT_CLEAR(reg, AHCI_PX_CMD_MPSP);
     }
     /* If, via CPD or MPSP we detect a drive, HPCP must be on. */
-    if (BITANY(reg, AHCI_PX_CMD_CPD || AHCI_PX_CMD_MPSP)) {
+    if (BITANY(reg, AHCI_PX_CMD_CPD | AHCI_PX_CMD_MPSP)) {
         ASSERT_BIT_SET(reg, AHCI_PX_CMD_HPCP);
     }
     /* HPCP and ESP cannot both be active. */
-- 
2.1.4


