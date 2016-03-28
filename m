Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1akRfX-00046Y-Bq
	for mharc-qemu-trivial@gnu.org; Mon, 28 Mar 2016 03:32:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47454)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcel@redhat.com>) id 1akRfU-00043m-Ve
	for qemu-trivial@nongnu.org; Mon, 28 Mar 2016 03:32:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcel@redhat.com>) id 1akRfU-0005JO-73
	for qemu-trivial@nongnu.org; Mon, 28 Mar 2016 03:32:56 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51974)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcel@redhat.com>)
	id 1akRfP-0005J4-9R; Mon, 28 Mar 2016 03:32:51 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id 24A7AC049E17;
	Mon, 28 Mar 2016 07:32:50 +0000 (UTC)
Received: from work.redhat.com (vpn-201-44.tlv.redhat.com [10.35.201.44])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u2S7Wk55032234; Mon, 28 Mar 2016 03:32:47 -0400
From: Marcel Apfelbaum <marcel@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 28 Mar 2016 10:32:45 +0300
Message-Id: <1459150365-26233-1-git-send-email-marcel@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: marcel@redhat.com, qemu-trivial@nongnu.org, mst@redhat.com
Subject: [Qemu-trivial] [Qemu-devel] [PATCH] pci: fix identation
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
X-List-Received-Date: Mon, 28 Mar 2016 07:32:57 -0000

Signed-off-by: Marcel Apfelbaum <marcel@redhat.com>
---
 hw/pci/pci.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index a1d41aa..da8b0b6 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -165,15 +165,15 @@ static inline int pci_irq_state(PCIDevice *d, int irq_num)
 {
     assert(irq_num >= 0);
 
-	return (d->irq_state >> irq_num) & 0x1;
+    return (d->irq_state >> irq_num) & 0x1;
 }
 
 static inline void pci_set_irq_state(PCIDevice *d, int irq_num, int level)
 {
     assert(irq_num >= 0);
 
-	d->irq_state &= ~(0x1 << irq_num);
-	d->irq_state |= level << irq_num;
+    d->irq_state &= ~(0x1 << irq_num);
+    d->irq_state |= level << irq_num;
 }
 
 static void pci_change_irq_level(PCIDevice *pci_dev, int irq_num, int change)
-- 
2.4.3


