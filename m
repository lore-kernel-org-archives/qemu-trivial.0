Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VALJd-0004fP-4n
	for mharc-qemu-trivial@gnu.org; Fri, 16 Aug 2013 10:47:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51967)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony.perard@citrix.com>) id 1VALJW-0004WV-IB
	for qemu-trivial@nongnu.org; Fri, 16 Aug 2013 10:47:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <anthony.perard@citrix.com>) id 1VALJR-0001M3-VC
	for qemu-trivial@nongnu.org; Fri, 16 Aug 2013 10:47:42 -0400
Received: from smtp02.citrix.com ([66.165.176.63]:19495)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony.perard@citrix.com>)
	id 1VALJR-0001Lm-QE; Fri, 16 Aug 2013 10:47:37 -0400
X-IronPort-AV: E=Sophos;i="4.89,895,1367971200"; d="scan'208";a="42791516"
Received: from accessns.citrite.net (HELO FTLPEX01CL02.citrite.net)
	([10.9.154.239]) by FTLPIPO02.CITRIX.COM with ESMTP/TLS/AES128-SHA;
	16 Aug 2013 14:47:36 +0000
Received: from ukmail1.uk.xensource.com (10.80.16.128) by smtprelay.citrix.com
	(10.13.107.79) with Microsoft SMTP Server id 14.2.342.4;
	Fri, 16 Aug 2013 10:47:35 -0400
Received: from perard.uk.xensource.com ([10.80.2.84])	by
	ukmail1.uk.xensource.com with esmtp (Exim 4.69)	(envelope-from
	<anthony.perard@citrix.com>)	id 1VALJP-0005k6-IM;
	Fri, 16 Aug 2013 15:47:35 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: QEMU-devel <qemu-devel@nongnu.org>
Date: Fri, 16 Aug 2013 15:46:49 +0100
Message-ID: <1376664409-2695-1-git-send-email-anthony.perard@citrix.com>
X-Mailer: git-send-email 1.8.3.4
MIME-Version: 1.0
Content-Type: text/plain
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 66.165.176.63
Cc: qemu-trivial@nongnu.org, Anthony PERARD <anthony.perard@citrix.com>,
	Stefano Stabellini <stefano.stabellini@citrix.com>,
	Xen Devel <xen-devel@lists.xen.org>
Subject: [Qemu-trivial] [PATCH for v1.6] pc: Fix initialization of the
	ram_memory variable.
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
X-List-Received-Date: Fri, 16 Aug 2013 14:47:47 -0000

In some cases (Xen), it will not be initialized before to be used. This
leads to segv.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

---

It works with this simple initialization to NULL, but would it be
necessary (or better) to assign a proper value to this variables ?
---
 hw/i386/pc_piix.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 6e1e654..596d433 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -86,7 +86,7 @@ static void pc_init1(MemoryRegion *system_memory,
     BusState *idebus[MAX_IDE_BUS];
     ISADevice *rtc_state;
     ISADevice *floppy;
-    MemoryRegion *ram_memory;
+    MemoryRegion *ram_memory = NULL;
     MemoryRegion *pci_memory;
     MemoryRegion *rom_memory;
     DeviceState *icc_bridge;
-- 
Anthony PERARD


