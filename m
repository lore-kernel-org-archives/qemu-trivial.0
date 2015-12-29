Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aDrFx-0005Sx-Bs
	for mharc-qemu-trivial@gnu.org; Tue, 29 Dec 2015 05:11:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59217)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1aDrFv-0005QJ-B5
	for qemu-trivial@nongnu.org; Tue, 29 Dec 2015 05:11:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1aDrFu-00049K-K8
	for qemu-trivial@nongnu.org; Tue, 29 Dec 2015 05:11:51 -0500
Received: from [59.151.112.132] (port=17145 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>)
	id 1aDrFq-00048n-5i; Tue, 29 Dec 2015 05:11:46 -0500
X-IronPort-AV: E=Sophos;i="5.20,346,1444665600"; 
   d="scan'208";a="2063346"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 29 Dec 2015 18:11:25 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 4D41F40427FE;
	Tue, 29 Dec 2015 18:11:14 +0800 (CST)
Received: from G08FNSTD140223.g08.fujitsu.local (10.167.226.86) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Tue, 29 Dec 2015 18:14:39 +0800
From: Cao jin <caoj.fnst@cn.fujitsu.com>
To: <qemu-devel@nongnu.org>
Date: Tue, 29 Dec 2015 18:13:55 +0800
Message-ID: <1451384035-29691-1-git-send-email-caoj.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.226.86]
X-yoursite-MailScanner-ID: 4D41F40427FE.AC26F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: caoj.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, xen-devel@lists.xensource.com,
	stefano.stabellini@eu.citrix.com
Subject: [Qemu-trivial] [PATCH trivial] xen/Makefile.objs: simplify
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
X-List-Received-Date: Tue, 29 Dec 2015 10:11:52 -0000

merge three lines into one line

Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
---
 hw/xen/Makefile.objs | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/hw/xen/Makefile.objs b/hw/xen/Makefile.objs
index a9ad7e7..77806f0 100644
--- a/hw/xen/Makefile.objs
+++ b/hw/xen/Makefile.objs
@@ -1,6 +1,4 @@
 # xen backend driver support
 common-obj-$(CONFIG_XEN_BACKEND) += xen_backend.o xen_devconfig.o
 
-obj-$(CONFIG_XEN_PCI_PASSTHROUGH) += xen-host-pci-device.o
-obj-$(CONFIG_XEN_PCI_PASSTHROUGH) += xen_pt.o xen_pt_config_init.o xen_pt_msi.o
-obj-$(CONFIG_XEN_PCI_PASSTHROUGH) += xen_pt.o xen_pt_config_init.o xen_pt_msi.o xen_pt_graphics.o
+obj-$(CONFIG_XEN_PCI_PASSTHROUGH) += xen_pt.o xen_pt_config_init.o xen_pt_msi.o xen_pt_graphics.o xen-host-pci-device.o
-- 
2.1.0




