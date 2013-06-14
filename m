Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UnRiG-0006ip-E9
	for mharc-qemu-trivial@gnu.org; Fri, 14 Jun 2013 06:58:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57012)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UnRi9-0006aQ-Ux
	for qemu-trivial@nongnu.org; Fri, 14 Jun 2013 06:58:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UnRi6-0006gb-Mi
	for qemu-trivial@nongnu.org; Fri, 14 Jun 2013 06:58:29 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:46300)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1UnRi0-0006ef-RL; Fri, 14 Jun 2013 06:58:20 -0400
Received: from gandalf.tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id A716B41663;
	Fri, 14 Jun 2013 14:58:19 +0400 (MSK)
Received: by gandalf.tls.msk.ru (Postfix, from userid 1000)
	id 03C8C522; Fri, 14 Jun 2013 14:50:47 +0400 (MSK)
From: Michael Tokarev <mjt@tls.msk.ru>
To: Anthony Liguori <aliguori@us.ibm.com>
Date: Fri, 14 Jun 2013 14:50:36 +0400
Message-Id: <1371207042-17980-21-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1371207042-17980-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1371207042-17980-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Scott Wood <scottwood@freescale.com>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org,
	Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: [Qemu-trivial] [PULL 20/26] KVM: PPC: Add dummy
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
X-List-Received-Date: Fri, 14 Jun 2013 10:58:32 -0000

From: Scott Wood <scottwood@freescale.com>

The common KVM code insists on calling kvm_arch_init_irq_routing()
as soon as it sees kernel header support for it (regardless of whether
QEMU supports it).  Provide a dummy function to satisfy this.

Unlike x86, PPC does not have one default irqchip, so there's no common
code that we'd stick here.  Even if you ignore the routes themselves,
which even on x86 are not set up in this function, the initial XICS
kernel implementation will not support IRQ routing, so it's best to
leave even the general feature flags up to the specific irqchip code.

Signed-off-by: Scott Wood <scottwood@freescale.com>
Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 target-ppc/kvm.c |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target-ppc/kvm.c b/target-ppc/kvm.c
index 3ab2946..2bbc3b8 100644
--- a/target-ppc/kvm.c
+++ b/target-ppc/kvm.c
@@ -1797,3 +1797,7 @@ int kvm_arch_on_sigbus(int code, void *addr)
 {
     return 1;
 }
+
+void kvm_arch_init_irq_routing(KVMState *s)
+{
+}
-- 
1.7.10.4


