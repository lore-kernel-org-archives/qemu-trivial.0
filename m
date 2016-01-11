Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aIY3H-0003wJ-QK
	for mharc-qemu-trivial@gnu.org; Mon, 11 Jan 2016 03:42:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50793)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aIY3D-0003nE-JK
	for qemu-trivial@nongnu.org; Mon, 11 Jan 2016 03:42:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aIY3C-0000tu-NU
	for qemu-trivial@nongnu.org; Mon, 11 Jan 2016 03:42:07 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:41582)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1aIY37-0000rd-Cn; Mon, 11 Jan 2016 03:42:01 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 90C4E403E0;
	Mon, 11 Jan 2016 11:42:00 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 0432BA92;
	Mon, 11 Jan 2016 11:42:00 +0300 (MSK)
Received: (nullmailer pid 28779 invoked by uid 1000);
	Mon, 11 Jan 2016 08:41:59 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon, 11 Jan 2016 11:41:46 +0300
Message-Id: <66c058cb69ab158e3fd61b0172e215e650f33213.1452501577.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1452501577.git.mjt@msgid.tls.msk.ru>
References: <cover.1452501577.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Cao jin <caoj.fnst@cn.fujitsu.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 07/19] xen/Makefile.objs: simplify
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
X-List-Received-Date: Mon, 11 Jan 2016 08:42:09 -0000

From: Cao jin <caoj.fnst@cn.fujitsu.com>

merge last two lines, keep alphabetic order.

Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
Reviewed-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: Stefano Stabellini <stefano.stabellini@eu.citrix.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/xen/Makefile.objs | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/xen/Makefile.objs b/hw/xen/Makefile.objs
index a9ad7e7..d367094 100644
--- a/hw/xen/Makefile.objs
+++ b/hw/xen/Makefile.objs
@@ -2,5 +2,4 @@
 common-obj-$(CONFIG_XEN_BACKEND) += xen_backend.o xen_devconfig.o
 
 obj-$(CONFIG_XEN_PCI_PASSTHROUGH) += xen-host-pci-device.o
-obj-$(CONFIG_XEN_PCI_PASSTHROUGH) += xen_pt.o xen_pt_config_init.o xen_pt_msi.o
-obj-$(CONFIG_XEN_PCI_PASSTHROUGH) += xen_pt.o xen_pt_config_init.o xen_pt_msi.o xen_pt_graphics.o
+obj-$(CONFIG_XEN_PCI_PASSTHROUGH) += xen_pt.o xen_pt_config_init.o xen_pt_graphics.o xen_pt_msi.o
-- 
2.1.4


