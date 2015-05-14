Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ysztb-0006nr-Tv
	for mharc-qemu-trivial@gnu.org; Thu, 14 May 2015 16:38:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54869)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1YsztZ-0006ko-OB
	for qemu-trivial@nongnu.org; Thu, 14 May 2015 16:38:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1YsztY-0005Tc-Ue
	for qemu-trivial@nongnu.org; Thu, 14 May 2015 16:38:17 -0400
Received: from qemu.weilnetz.de ([2a03:4000:2:362::1]:40715)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1YsztW-0005RV-Va; Thu, 14 May 2015 16:38:15 -0400
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
	id 1C16917F768; Thu, 14 May 2015 22:38:13 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: QEMU Trivial <qemu-trivial@nongnu.org>
Date: Thu, 14 May 2015 22:38:12 +0200
Message-Id: <1431635892-31996-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 2.1.4
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a03:4000:2:362::1
Cc: Stefan Weil <sw@weilnetz.de>, QEMU Developer <qemu-devel@nongnu.org>
Subject: [Qemu-trivial] [PATCH] pci: Fix compiler warning (MinGW-w64 gcc 4.9)
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
X-List-Received-Date: Thu, 14 May 2015 20:38:18 -0000

i686-w64-mingw32-gcc 4.9.1 from Debian Jessie complains:

hw/pci/pci.c:938:29: warning:
 array subscript is above array bounds [-Warray-bounds]

Using g_assert instead of assert fixes this warning.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 hw/pci/pci.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 48f19a3..34f71dc 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -927,8 +927,8 @@ void pci_register_bar(PCIDevice *pci_dev, int region_num,
     uint64_t wmask;
     pcibus_t size = memory_region_size(memory);
 
-    assert(region_num >= 0);
-    assert(region_num < PCI_NUM_REGIONS);
+    g_assert(region_num >= 0);
+    g_assert(region_num < PCI_NUM_REGIONS);
     if (size & (size-1)) {
         fprintf(stderr, "ERROR: PCI region size must be pow2 "
                     "type=0x%x, size=0x%"FMT_PCIBUS"\n", type, size);
-- 
2.1.4


