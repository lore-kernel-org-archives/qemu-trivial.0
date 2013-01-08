Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TseGG-0003f3-EG
	for mharc-qemu-trivial@gnu.org; Tue, 08 Jan 2013 13:50:56 -0500
Received: from eggs.gnu.org ([208.118.235.92]:60996)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1TseGC-0003e3-Kh
	for qemu-trivial@nongnu.org; Tue, 08 Jan 2013 13:50:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1TseG7-000286-Kg
	for qemu-trivial@nongnu.org; Tue, 08 Jan 2013 13:50:52 -0500
Received: from mx1.redhat.com ([209.132.183.28]:9749)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>)
	id 1TseG7-00026n-CO; Tue, 08 Jan 2013 13:50:47 -0500
Received: from int-mx12.intmail.prod.int.phx2.redhat.com
	(int-mx12.intmail.prod.int.phx2.redhat.com [10.5.11.25])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r08Ioe4d031791
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 8 Jan 2013 13:50:41 -0500
Received: from lacos-laptop.usersys.redhat.com (vpn1-5-113.ams2.redhat.com
	[10.36.5.113])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r08IoRgd028561; Tue, 8 Jan 2013 13:50:31 -0500
From: Laszlo Ersek <lersek@redhat.com>
To: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, kraxel@redhat.com,
	lersek@redhat.com
Date: Tue,  8 Jan 2013 19:52:20 +0100
Message-Id: <1357671140-21713-1-git-send-email-lersek@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.25
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] Makefile: install the "acpi-dsdt.aml" and
	"q35-acpi-dsdt.aml" blobs too
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
X-List-Received-Date: Tue, 08 Jan 2013 18:50:54 -0000

The WARNING message from commit f7e4dd6c made me notice.

Signed-off-by: Laszlo Ersek <lersek@redhat.com>
---
 Makefile |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/Makefile b/Makefile
index a7ac04b..f6626b5 100644
--- a/Makefile
+++ b/Makefile
@@ -280,6 +280,7 @@ bepo
 ifdef INSTALL_BLOBS
 BLOBS=bios.bin sgabios.bin vgabios.bin vgabios-cirrus.bin \
 vgabios-stdvga.bin vgabios-vmware.bin vgabios-qxl.bin \
+acpi-dsdt.aml q35-acpi-dsdt.aml \
 ppc_rom.bin openbios-sparc32 openbios-sparc64 openbios-ppc \
 pxe-e1000.rom pxe-eepro100.rom pxe-ne2k_pci.rom \
 pxe-pcnet.rom pxe-rtl8139.rom pxe-virtio.rom \
-- 
1.7.1


