Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VN4L6-0007C7-Gl
	for mharc-qemu-trivial@gnu.org; Fri, 20 Sep 2013 13:17:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54664)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VN4L3-00077W-Tm
	for qemu-trivial@nongnu.org; Fri, 20 Sep 2013 13:17:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VN4L2-0006Av-SR
	for qemu-trivial@nongnu.org; Fri, 20 Sep 2013 13:17:53 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:48734)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VN4Ky-00067a-TE; Fri, 20 Sep 2013 13:17:49 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id D7596419BE;
	Fri, 20 Sep 2013 21:17:47 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 0D2E220A;
	Fri, 20 Sep 2013 20:58:21 +0400 (MSK)
Received: (nullmailer pid 32164 invoked by uid 1000);
	Fri, 20 Sep 2013 16:58:20 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: aliguori@us.ibm.com
Date: Fri, 20 Sep 2013 20:58:01 +0400
Message-Id: <1379696296-32105-3-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1379696296-32105-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1379696296-32105-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	"Richard W.M. Jones" <rjones@redhat.com>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 02/17] q35: Fix typo in constant DEFUALT ->
	DEFAULT.
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
X-List-Received-Date: Fri, 20 Sep 2013 17:17:55 -0000

From: "Richard W.M. Jones" <rjones@redhat.com>

Signed-off-by: Richard W.M. Jones <rjones@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/pci-host/q35.c         |    2 +-
 include/hw/pci-host/q35.h |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/pci-host/q35.c b/hw/pci-host/q35.c
index 5473504..0cb652d 100644
--- a/hw/pci-host/q35.c
+++ b/hw/pci-host/q35.c
@@ -372,7 +372,7 @@ static void mch_class_init(ObjectClass *klass, void *data)
     dc->vmsd = &vmstate_mch;
     k->vendor_id = PCI_VENDOR_ID_INTEL;
     k->device_id = PCI_DEVICE_ID_INTEL_Q35_MCH;
-    k->revision = MCH_HOST_BRIDGE_REVISION_DEFUALT;
+    k->revision = MCH_HOST_BRIDGE_REVISION_DEFAULT;
     k->class_id = PCI_CLASS_BRIDGE_HOST;
 }
 
diff --git a/include/hw/pci-host/q35.h b/include/hw/pci-host/q35.h
index 6eb7ab6..56de92e 100644
--- a/include/hw/pci-host/q35.h
+++ b/include/hw/pci-host/q35.h
@@ -85,7 +85,7 @@ typedef struct Q35PCIHost {
 #define MCH_HOST_BRIDGE_CONFIG_DATA            0xcfc
 
 /* D0:F0 configuration space */
-#define MCH_HOST_BRIDGE_REVISION_DEFUALT       0x0
+#define MCH_HOST_BRIDGE_REVISION_DEFAULT       0x0
 
 #define MCH_HOST_BRIDGE_PCIEXBAR               0x60    /* 64bit register */
 #define MCH_HOST_BRIDGE_PCIEXBAR_SIZE          8       /* 64bit register */
-- 
1.7.10.4


