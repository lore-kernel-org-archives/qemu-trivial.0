Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WTCXa-0001xW-2B
	for mharc-qemu-trivial@gnu.org; Thu, 27 Mar 2014 11:48:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40588)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WTCXS-0001k7-Mx
	for qemu-trivial@nongnu.org; Thu, 27 Mar 2014 11:48:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WTCXO-0001YH-5i
	for qemu-trivial@nongnu.org; Thu, 27 Mar 2014 11:48:18 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:46949)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WTCXD-0001UB-HR; Thu, 27 Mar 2014 11:48:03 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 4E4214372B;
	Thu, 27 Mar 2014 19:48:02 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id A393A67D;
	Thu, 27 Mar 2014 19:28:34 +0400 (MSK)
Received: (nullmailer pid 1817 invoked by uid 1000);
	Thu, 27 Mar 2014 15:28:30 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 27 Mar 2014 19:28:26 +0400
Message-Id: <1395934108-1694-22-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1395934108-1694-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1395934108-1694-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 21/23] hw/pci-host/apb.c: Avoid shifting left
	into sign bit
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
X-List-Received-Date: Thu, 27 Mar 2014 15:48:23 -0000

From: Peter Maydell <peter.maydell@linaro.org>

Add U suffix to avoid undefined behaviour.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/pci-host/apb.c |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/pci-host/apb.c b/hw/pci-host/apb.c
index 1b399dd..252caef 100644
--- a/hw/pci-host/apb.c
+++ b/hw/pci-host/apb.c
@@ -58,11 +58,11 @@ do { printf("APB: " fmt , ## __VA_ARGS__); } while (0)
 #define PBM_PCI_IMR_MASK    0x7fffffff
 #define PBM_PCI_IMR_ENABLED 0x80000000
 
-#define POR          (1 << 31)
-#define SOFT_POR     (1 << 30)
-#define SOFT_XIR     (1 << 29)
-#define BTN_POR      (1 << 28)
-#define BTN_XIR      (1 << 27)
+#define POR          (1U << 31)
+#define SOFT_POR     (1U << 30)
+#define SOFT_XIR     (1U << 29)
+#define BTN_POR      (1U << 28)
+#define BTN_XIR      (1U << 27)
 #define RESET_MASK   0xf8000000
 #define RESET_WCMASK 0x98000000
 #define RESET_WMASK  0x60000000
-- 
1.7.10.4


