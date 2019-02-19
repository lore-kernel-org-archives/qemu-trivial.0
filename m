Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gw7wF-0003Ag-RC
	for mharc-qemu-trivial@gnu.org; Tue, 19 Feb 2019 11:08:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42815)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gw7wC-000381-FS
	for qemu-trivial@nongnu.org; Tue, 19 Feb 2019 11:08:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gw7wB-00008J-Ph
	for qemu-trivial@nongnu.org; Tue, 19 Feb 2019 11:08:04 -0500
Received: from mx1.redhat.com ([209.132.183.28]:50410)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gw7w4-0008NQ-Hq; Tue, 19 Feb 2019 11:07:57 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 229078667E;
	Tue, 19 Feb 2019 16:07:46 +0000 (UTC)
Received: from thuth.com (ovpn-116-144.ams2.redhat.com [10.36.116.144])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AAEF95F9D0;
	Tue, 19 Feb 2019 16:07:43 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, yang.zhong@intel.com,
	pbonzini@redhat.com
Date: Tue, 19 Feb 2019 17:07:39 +0100
Message-Id: <1550592459-7286-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Tue, 19 Feb 2019 16:07:46 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] hw/pci/pci-stub: Add msi_enabled() and
 msi_notify() to the pci stubs
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
X-List-Received-Date: Tue, 19 Feb 2019 16:08:06 -0000

Some machines have an AHCI adapter, but no PCI. To be able to
compile hw/ide/ahci.c without CONFIG_PCI, we still need the two
functions msi_enabled() and msi_notify() for linking.
This is required for the upcoming Kconfig-like build system, if
a user wants to compile a QEMU binary with just one machine that
has AHCI, but no PCI, like the ARM "cubieboard" for example.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/pci/pci-stub.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/hw/pci/pci-stub.c b/hw/pci/pci-stub.c
index b941a0e..c04a5df 100644
--- a/hw/pci/pci-stub.c
+++ b/hw/pci/pci-stub.c
@@ -53,3 +53,14 @@ uint16_t pci_requester_id(PCIDevice *dev)
     g_assert(false);
     return 0;
 }
+
+/* Required by ahci.c */
+bool msi_enabled(const PCIDevice *dev)
+{
+    return false;
+}
+
+void msi_notify(PCIDevice *dev, unsigned int vector)
+{
+    g_assert_not_reached();
+}
-- 
1.8.3.1


