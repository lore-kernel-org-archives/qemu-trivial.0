Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UnRje-0000Kb-RZ
	for mharc-qemu-trivial@gnu.org; Fri, 14 Jun 2013 07:00:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57558)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UnRja-0000Js-Iw
	for qemu-trivial@nongnu.org; Fri, 14 Jun 2013 06:59:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UnRjY-000763-Er
	for qemu-trivial@nongnu.org; Fri, 14 Jun 2013 06:59:58 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:57653)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1UnRjV-00075E-9o; Fri, 14 Jun 2013 06:59:53 -0400
Received: from gandalf.tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 76B9F41661;
	Fri, 14 Jun 2013 14:59:52 +0400 (MSK)
Received: by gandalf.tls.msk.ru (Postfix, from userid 1000)
	id D921C521; Fri, 14 Jun 2013 14:50:47 +0400 (MSK)
From: Michael Tokarev <mjt@tls.msk.ru>
To: Anthony Liguori <aliguori@us.ibm.com>
Date: Fri, 14 Jun 2013 14:50:34 +0400
Message-Id: <1371207042-17980-19-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1371207042-17980-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1371207042-17980-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Alexey Kardashevskiy <aik@ozlabs.ru>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 18/26] KVM: ARM: Add dummy
	kvm_arch_init_irq_routing()
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
X-List-Received-Date: Fri, 14 Jun 2013 10:59:59 -0000

From: Alexey Kardashevskiy <aik@ozlabs.ru>

The common KVM code insists on calling kvm_arch_init_irq_routing()
as soon as it sees kernel header support for it (regardless of whether
QEMU supports it).  Provide a dummy function to satisfy this.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 target-arm/kvm.c |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target-arm/kvm.c b/target-arm/kvm.c
index b7bdc03..27dcab9 100644
--- a/target-arm/kvm.c
+++ b/target-arm/kvm.c
@@ -491,3 +491,7 @@ void kvm_arch_remove_all_hw_breakpoints(void)
 {
     qemu_log_mask(LOG_UNIMP, "%s: not implemented\n", __func__);
 }
+
+void kvm_arch_init_irq_routing(KVMState *s)
+{
+}
-- 
1.7.10.4


