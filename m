Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VGUQH-0008Kt-T2
	for mharc-qemu-trivial@gnu.org; Mon, 02 Sep 2013 09:44:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52197)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rjones@redhat.com>) id 1VGUQB-0008Cc-10
	for qemu-trivial@nongnu.org; Mon, 02 Sep 2013 09:44:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rjones@redhat.com>) id 1VGUQ5-0000fn-2M
	for qemu-trivial@nongnu.org; Mon, 02 Sep 2013 09:43:58 -0400
Received: from mx1.redhat.com ([209.132.183.28]:62746)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rjones@redhat.com>)
	id 1VGUPs-0000fB-4Y; Mon, 02 Sep 2013 09:43:40 -0400
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r82DhdwP029448
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 2 Sep 2013 09:43:39 -0400
Received: from choo.home.annexia.org (vpn1-7-7.ams2.redhat.com [10.36.7.7])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r82Dhcao020193; Mon, 2 Sep 2013 09:43:38 -0400
From: "Richard W.M. Jones" <rjones@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon,  2 Sep 2013 14:43:36 +0100
Message-Id: <1378129416-21762-1-git-send-email-rjones@redhat.com>
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] q35: Fix typo in constant DEFUALT -> DEFAULT.
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
X-List-Received-Date: Mon, 02 Sep 2013 13:44:05 -0000

From: "Richard W.M. Jones" <rjones@redhat.com>

Signed-off-by: Richard W.M. Jones <rjones@redhat.com>
---
 hw/pci-host/q35.c         | 2 +-
 include/hw/pci-host/q35.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/pci-host/q35.c b/hw/pci-host/q35.c
index 12314d8..9ed0a3d 100644
--- a/hw/pci-host/q35.c
+++ b/hw/pci-host/q35.c
@@ -370,7 +370,7 @@ static void mch_class_init(ObjectClass *klass, void *data)
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
1.8.3.1


