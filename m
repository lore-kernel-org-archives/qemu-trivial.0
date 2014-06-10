Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WuOuD-0007Nl-PR
	for mharc-qemu-trivial@gnu.org; Tue, 10 Jun 2014 12:28:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36479)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WuOu7-00075N-FA
	for qemu-trivial@nongnu.org; Tue, 10 Jun 2014 12:28:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WuOu3-0007ad-1H
	for qemu-trivial@nongnu.org; Tue, 10 Jun 2014 12:28:07 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:57865)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WuOtt-0007XL-Nd; Tue, 10 Jun 2014 12:27:53 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 29200412C6;
	Tue, 10 Jun 2014 20:27:53 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 022726CB;
	Tue, 10 Jun 2014 20:08:49 +0400 (MSK)
Received: (nullmailer pid 13325 invoked by uid 1000);
	Tue, 10 Jun 2014 16:08:47 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue, 10 Jun 2014 20:08:35 +0400
Message-Id: <1402416523-13212-18-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1402416523-13212-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1402416523-13212-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 17/25] apb: Fix compiler warnings (large
	constants)
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
X-List-Received-Date: Tue, 10 Jun 2014 16:28:12 -0000

From: Stefan Weil <sw@weilnetz.de>

Both constants need more than 32 bit.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/pci-host/apb.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/pci-host/apb.c b/hw/pci-host/apb.c
index 1497008..6fa2723 100644
--- a/hw/pci-host/apb.c
+++ b/hw/pci-host/apb.c
@@ -99,8 +99,8 @@ do { printf("IOMMU: " fmt , ## __VA_ARGS__); } while (0)
 #define IOMMU_TTE_DATA_SIZE     (1ULL << 61)
 #define IOMMU_TTE_DATA_W        (1ULL << 1)
 
-#define IOMMU_TTE_PHYS_MASK_8K  0x1ffffffe000
-#define IOMMU_TTE_PHYS_MASK_64K 0x1ffffff8000
+#define IOMMU_TTE_PHYS_MASK_8K  0x1ffffffe000ULL
+#define IOMMU_TTE_PHYS_MASK_64K 0x1ffffff8000ULL
 
 #define IOMMU_TSB_8K_OFFSET_MASK_8M    0x00000000007fe000ULL
 #define IOMMU_TSB_8K_OFFSET_MASK_16M   0x0000000000ffe000ULL
-- 
1.7.10.4


