Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WPZyM-0005vj-6i
	for mharc-qemu-trivial@gnu.org; Mon, 17 Mar 2014 12:01:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56067)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1WPZy8-0005RU-Mi
	for qemu-trivial@nongnu.org; Mon, 17 Mar 2014 12:00:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1WPZy7-0007m8-9H
	for qemu-trivial@nongnu.org; Mon, 17 Mar 2014 12:00:52 -0400
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:46882)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1WPZxz-0007gB-Et; Mon, 17 Mar 2014 12:00:43 -0400
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1WPZxx-0004wb-Mo; Mon, 17 Mar 2014 16:00:41 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 17 Mar 2014 16:00:41 +0000
Message-Id: <1395072041-18911-13-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1395072041-18911-1-git-send-email-peter.maydell@linaro.org>
References: <1395072041-18911-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2001:8b0:1d0::1
Cc: qemu-trivial@nongnu.org, qemu-ppc@nongnu.org, patches@linaro.org
Subject: [Qemu-trivial] [PATCH v2 12/12] hw/pci-host/apb.c: Avoid shifting
	left into sign bit
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
X-List-Received-Date: Mon, 17 Mar 2014 16:00:54 -0000

Add U suffix to avoid undefined behaviour.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/pci-host/apb.c | 10 +++++-----
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
1.9.0


