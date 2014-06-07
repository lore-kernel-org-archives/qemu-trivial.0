Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WtLlj-0001qR-U7
	for mharc-qemu-trivial@gnu.org; Sat, 07 Jun 2014 14:55:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52584)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1WtLld-0001cI-46
	for qemu-trivial@nongnu.org; Sat, 07 Jun 2014 14:55:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1WtLlX-0000dB-Vj
	for qemu-trivial@nongnu.org; Sat, 07 Jun 2014 14:55:01 -0400
Received: from qemu.weilnetz.de ([37.221.198.45]:36645)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1WtLlN-0000Zu-LO; Sat, 07 Jun 2014 14:54:45 -0400
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
	id 0F54C17F6B6; Sat,  7 Jun 2014 20:54:43 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org
Date: Sat,  7 Jun 2014 20:54:42 +0200
Message-Id: <1402167282-9264-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.198.45
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: [Qemu-trivial] [PATCH] apb: Fix compiler warnings (large constants)
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
X-List-Received-Date: Sat, 07 Jun 2014 18:55:06 -0000

Both constants need more than 32 bit.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
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


