Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1a9ql5-0004JK-Bn
	for mharc-qemu-trivial@gnu.org; Fri, 18 Dec 2015 03:51:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48222)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1a9ql2-0004F7-LE
	for qemu-trivial@nongnu.org; Fri, 18 Dec 2015 03:51:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1a9ql1-0005Aq-Sl
	for qemu-trivial@nongnu.org; Fri, 18 Dec 2015 03:51:24 -0500
Received: from [59.151.112.132] (port=49256 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>)
	id 1a9qkw-00058w-0y; Fri, 18 Dec 2015 03:51:18 -0500
X-IronPort-AV: E=Sophos;i="5.20,346,1444665600"; 
   d="scan'208";a="1735405"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 18 Dec 2015 16:50:45 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 350C6409255D;
	Fri, 18 Dec 2015 16:50:39 +0800 (CST)
Received: from G08FNSTD140223.g08.fujitsu.local (10.167.226.86) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Fri, 18 Dec 2015 16:53:54 +0800
From: Cao jin <caoj.fnst@cn.fujitsu.com>
To: <qemu-devel@nongnu.org>
Date: Fri, 18 Dec 2015 16:52:50 +0800
Message-ID: <1450428770-18215-1-git-send-email-caoj.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.226.86]
X-yoursite-MailScanner-ID: 350C6409255D.A982B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: caoj.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, mst@redhat.com,
	ehabkost@redhat.com, rth@twiddle.net
Subject: [Qemu-trivial] [PATCH v2] Use macro instead of plain text
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
X-List-Received-Date: Fri, 18 Dec 2015 08:51:25 -0000

There is TYPE_ICH9_AHCI definition in ahci.h when QOMify it, seems it
is missed.

Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
---
 hw/i386/pc_q35.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 9a12068..aa34a07 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -249,7 +249,7 @@ static void pc_q35_init(MachineState *machine)
     ahci = pci_create_simple_multifunction(host_bus,
                                            PCI_DEVFN(ICH9_SATA1_DEV,
                                                      ICH9_SATA1_FUNC),
-                                           true, "ich9-ahci");
+                                           true, TYPE_ICH9_AHCI);
     idebus[0] = qdev_get_child_bus(&ahci->qdev, "ide.0");
     idebus[1] = qdev_get_child_bus(&ahci->qdev, "ide.1");
     g_assert(MAX_SATA_PORTS == ICH_AHCI(ahci)->ahci.ports);
-- 
2.1.0




