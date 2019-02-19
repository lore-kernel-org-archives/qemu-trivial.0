Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gw7l0-0002ta-10
	for mharc-qemu-trivial@gnu.org; Tue, 19 Feb 2019 10:56:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39757)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gw7kx-0002r3-5v
	for qemu-trivial@nongnu.org; Tue, 19 Feb 2019 10:56:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gw7ku-0001qo-3K
	for qemu-trivial@nongnu.org; Tue, 19 Feb 2019 10:56:26 -0500
Received: from mx1.redhat.com ([209.132.183.28]:47058)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gw7km-0001mC-Tu; Tue, 19 Feb 2019 10:56:17 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 17778C007340;
	Tue, 19 Feb 2019 15:56:16 +0000 (UTC)
Received: from thuth.com (ovpn-116-144.ams2.redhat.com [10.36.116.144])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6D46618780;
	Tue, 19 Feb 2019 15:56:08 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: John Snow <jsnow@redhat.com>,
	qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, yang.zhong@intel.com,
	pbonzini@redhat.com
Date: Tue, 19 Feb 2019 16:55:57 +0100
Message-Id: <1550591757-6192-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Tue, 19 Feb 2019 15:56:16 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] hw/ide/ich: Compile ich.c only if CONFIG_PCI
 is also set
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
X-List-Received-Date: Tue, 19 Feb 2019 15:56:28 -0000

With the upcoming Kconfig-like build system, it will be easy to
build also version of QEMU that only contain a single machine. Some
of these machines (like the ARM cubieboard) use CONFIG_AHCI for an
AHCI sysbus device, but do not use CONFIG_PCI since they do not feature
a PCI bus. In this case linking fails:

../hw/ide/ich.o: In function `pci_ich9_ahci_realize':
hw/ide/ich.c:124: undefined reference to `pci_allocate_irq'
hw/ide/ich.c:126: undefined reference to `pci_register_bar'
hw/ide/ich.c:128: undefined reference to `pci_register_bar'
hw/ide/ich.c:131: undefined reference to `pci_add_capability'
hw/ide/ich.c:147: undefined reference to `msi_init'
../hw/ide/ich.o: In function `pci_ich9_uninit':
hw/ide/ich.c:158: undefined reference to `msi_uninit'
../hw/ide/ich.o:(.data.rel+0x50): undefined reference to `vmstate_pci_device'

Thus we must only compile ich.c if CONFIG_PCI is also set.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/ide/Makefile.objs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ide/Makefile.objs b/hw/ide/Makefile.objs
index a142add..dfe53af 100644
--- a/hw/ide/Makefile.objs
+++ b/hw/ide/Makefile.objs
@@ -9,6 +9,6 @@ common-obj-$(CONFIG_IDE_MMIO) += mmio.o
 common-obj-$(CONFIG_IDE_VIA) += via.o
 common-obj-$(CONFIG_MICRODRIVE) += microdrive.o
 common-obj-$(CONFIG_AHCI) += ahci.o
-common-obj-$(CONFIG_AHCI) += ich.o
+common-obj-$(call land,$(CONFIG_AHCI),$(CONFIG_PCI)) += ich.o
 common-obj-$(CONFIG_ALLWINNER_A10) += ahci-allwinner.o
 common-obj-$(CONFIG_IDE_SII3112) += sii3112.o
-- 
1.8.3.1


