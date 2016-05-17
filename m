Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b2TxI-00041R-Oy
	for mharc-qemu-trivial@gnu.org; Mon, 16 May 2016 21:37:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47723)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1b2TxF-0003nR-T6
	for qemu-trivial@nongnu.org; Mon, 16 May 2016 21:37:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1b2TxD-00050g-PN
	for qemu-trivial@nongnu.org; Mon, 16 May 2016 21:37:48 -0400
Received: from [59.151.112.132] (port=9389 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>)
	id 1b2Tx8-0004x6-5S; Mon, 16 May 2016 21:37:42 -0400
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="6609136"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 17 May 2016 09:37:26 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id A3797489F962;
	Tue, 17 May 2016 09:37:23 +0800 (CST)
Received: from G08FNSTD140223.g08.fujitsu.local (10.167.226.69) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Tue, 17 May 2016 09:37:23 +0800
From: Cao jin <caoj.fnst@cn.fujitsu.com>
To: <qemu-devel@nongnu.org>
CC: <mst@redhat.com>, <qemu-trivial@nongnu.org>, <marcel@redhat.com>
Date: Tue, 17 May 2016 09:41:18 +0800
Message-ID: <1463449278-16060-1-git-send-email-caoj.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.226.69]
X-yoursite-MailScanner-ID: A3797489F962.A9E53
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: caoj.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Subject: [Qemu-trivial] [PATCH] ICH9: fix typo
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 17 May 2016 01:37:51 -0000

Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
---
it is 4th attempt to send this patch...
because of it wasn't delivered correctly by eggs.gnu.org

 hw/isa/lpc_ich9.c      | 4 ++--
 include/hw/i386/ich9.h | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/isa/lpc_ich9.c b/hw/isa/lpc_ich9.c
index 99cd3ba..fafe367 100644
--- a/hw/isa/lpc_ich9.c
+++ b/hw/isa/lpc_ich9.c
@@ -96,8 +96,8 @@ static void ich9_cc_update(ICH9LPCState *lpc)
 
     /*
      * D30: DMI2PCI bridge
-     * It is arbitrarily decided how INTx lines of PCI devicesbehind the bridge
-     * are connected to pirq lines. Our choice is PIRQ[E-H].
+     * It is arbitrarily decided how INTx lines of PCI devices behind
+     * the bridge are connected to pirq lines. Our choice is PIRQ[E-H].
      * INT[A-D] are connected to PIRQ[E-H]
      */
     for (pci_intx = 0; pci_intx < PCI_NUM_PINS; pci_intx++) {
diff --git a/include/hw/i386/ich9.h b/include/hw/i386/ich9.h
index d04dcdc..88233c3 100644
--- a/include/hw/i386/ich9.h
+++ b/include/hw/i386/ich9.h
@@ -35,7 +35,7 @@ typedef struct ICH9LPCState {
 
     /* (pci device, intx) -> pirq
      * In real chipset case, the unused slots are never used
-     * as ICH9 supports only D25-D32 irq routing.
+     * as ICH9 supports only D25-D31 irq routing.
      * On the other hand in qemu case, any slot/function can be populated
      * via command line option.
      * So fallback interrupt routing for any devices in any slots is necessary.
@@ -181,7 +181,7 @@ Object *ich9_lpc_find(void);
 #define ICH9_SATA1_DEV                          31
 #define ICH9_SATA1_FUNC                         2
 
-/* D30:F1 power management I/O registers
+/* D31:F0 power management I/O registers
    offset from the address ICH9_LPC_PMBASE */
 
 /* ICH9 LPC PM I/O registers are 128 ports and 128-aligned */
-- 
2.1.0




