Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aDtWt-0003cE-ST
	for mharc-qemu-trivial@gnu.org; Tue, 29 Dec 2015 07:37:31 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58142)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1aDtWs-0003a5-3Z
	for qemu-trivial@nongnu.org; Tue, 29 Dec 2015 07:37:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1aDtWr-0008O4-9E
	for qemu-trivial@nongnu.org; Tue, 29 Dec 2015 07:37:30 -0500
Received: from [59.151.112.132] (port=46726 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>)
	id 1aDtWm-0008Ln-TH; Tue, 29 Dec 2015 07:37:25 -0500
X-IronPort-AV: E=Sophos;i="5.20,346,1444665600"; 
   d="scan'208";a="2065819"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 29 Dec 2015 20:37:23 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 62EB54092565;
	Tue, 29 Dec 2015 20:37:14 +0800 (CST)
Received: from G08FNSTD140223.g08.fujitsu.local (10.167.226.86) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Tue, 29 Dec 2015 20:40:40 +0800
From: Cao jin <caoj.fnst@cn.fujitsu.com>
To: <qemu-devel@nongnu.org>
Date: Tue, 29 Dec 2015 20:39:56 +0800
Message-ID: <1451392796-30956-1-git-send-email-caoj.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.226.86]
X-yoursite-MailScanner-ID: 62EB54092565.A90F8
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: caoj.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, sw@weilnetz.de,
	xen-devel@lists.xensource.com, stefano.stabellini@eu.citrix.com
Subject: [Qemu-trivial] [PATCH trivial v2] xen/Makefile.objs: simplify
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
X-List-Received-Date: Tue, 29 Dec 2015 12:37:30 -0000

merge last two lines, keep alphabetic order.

Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
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
2.1.0




