Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wpy5r-0007z5-UL
	for mharc-qemu-trivial@gnu.org; Thu, 29 May 2014 07:01:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43342)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1Wpy5q-0007wA-74
	for qemu-trivial@nongnu.org; Thu, 29 May 2014 07:01:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1Wpy5p-0000Q1-1f
	for qemu-trivial@nongnu.org; Thu, 29 May 2014 07:01:54 -0400
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:48296)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1Wpy5n-0000PW-Cp; Thu, 29 May 2014 07:01:51 -0400
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1Wpy5l-0006kY-Ms; Thu, 29 May 2014 12:01:49 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Thu, 29 May 2014 12:01:49 +0100
Message-Id: <1401361309-25921-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2001:8b0:1d0::1
Cc: qemu-trivial@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
	Anthony Liguori <aliguori@amazon.com>, patches@linaro.org
Subject: [Qemu-trivial] [PATCH] hw/i386/pc.c: Remove unused parallel_io and
	parallel_irq variables
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
X-List-Received-Date: Thu, 29 May 2014 11:01:55 -0000

The variables parallel_io and parallel_irq are unused; delete them.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/i386/pc.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index e6369d5..32d1632 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -922,9 +922,6 @@ static const int ne2000_io[NE2000_NB_MAX] = { 0x300, 0x320, 0x340, 0x360,
                                               0x280, 0x380 };
 static const int ne2000_irq[NE2000_NB_MAX] = { 9, 10, 11, 3, 4, 5 };
 
-static const int parallel_io[MAX_PARALLEL_PORTS] = { 0x378, 0x278, 0x3bc };
-static const int parallel_irq[MAX_PARALLEL_PORTS] = { 7, 7, 7 };
-
 void pc_init_ne2k_isa(ISABus *bus, NICInfo *nd)
 {
     static int nb_ne2k = 0;
-- 
1.9.2


