Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aIY8K-0001KY-5Q
	for mharc-qemu-trivial@gnu.org; Mon, 11 Jan 2016 03:47:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51975)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aIY8D-00013n-2S
	for qemu-trivial@nongnu.org; Mon, 11 Jan 2016 03:47:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aIY8C-0002AJ-6b
	for qemu-trivial@nongnu.org; Mon, 11 Jan 2016 03:47:16 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:48268)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1aIY86-00027R-Gp; Mon, 11 Jan 2016 03:47:10 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 6287B403EA;
	Mon, 11 Jan 2016 11:47:08 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id F3CD7ABA;
	Mon, 11 Jan 2016 11:42:00 +0300 (MSK)
Received: (nullmailer pid 28783 invoked by uid 1000);
	Mon, 11 Jan 2016 08:41:59 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon, 11 Jan 2016 11:41:48 +0300
Message-Id: <f922254c87889f2bcdc289d4eea2dda569a03ece.1452501577.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1452501577.git.mjt@msgid.tls.msk.ru>
References: <cover.1452501577.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Cao jin <caoj.fnst@cn.fujitsu.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 09/19] hw/misc/edu: Convert to realize()
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
X-List-Received-Date: Mon, 11 Jan 2016 08:47:18 -0000

From: Cao jin <caoj.fnst@cn.fujitsu.com>

for educational PCI device

Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/misc/edu.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/hw/misc/edu.c b/hw/misc/edu.c
index fe50b42..43d5b18 100644
--- a/hw/misc/edu.c
+++ b/hw/misc/edu.c
@@ -327,7 +327,7 @@ static void *edu_fact_thread(void *opaque)
     return NULL;
 }
 
-static int pci_edu_init(PCIDevice *pdev)
+static void pci_edu_realize(PCIDevice *pdev, Error **errp)
 {
     EduState *edu = DO_UPCAST(EduState, pdev, pdev);
     uint8_t *pci_conf = pdev->config;
@@ -344,8 +344,6 @@ static int pci_edu_init(PCIDevice *pdev)
     memory_region_init_io(&edu->mmio, OBJECT(edu), &edu_mmio_ops, edu,
                     "edu-mmio", 1 << 20);
     pci_register_bar(pdev, 0, PCI_BASE_ADDRESS_SPACE_MEMORY, &edu->mmio);
-
-    return 0;
 }
 
 static void pci_edu_uninit(PCIDevice *pdev)
@@ -385,7 +383,7 @@ static void edu_class_init(ObjectClass *class, void *data)
 {
     PCIDeviceClass *k = PCI_DEVICE_CLASS(class);
 
-    k->init = pci_edu_init;
+    k->realize = pci_edu_realize;
     k->exit = pci_edu_uninit;
     k->vendor_id = PCI_VENDOR_ID_QEMU;
     k->device_id = 0x11e8;
-- 
2.1.4


