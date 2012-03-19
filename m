Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S9UhN-0000ic-P0
	for mharc-qemu-trivial@gnu.org; Mon, 19 Mar 2012 01:00:01 -0400
Received: from eggs.gnu.org ([208.118.235.92]:34710)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1S9UhJ-0000SO-CL
	for qemu-trivial@nongnu.org; Mon, 19 Mar 2012 00:59:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1S9UhH-0005dy-M1
	for qemu-trivial@nongnu.org; Mon, 19 Mar 2012 00:59:56 -0400
Received: from ozlabs.org ([203.10.76.45]:39928)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>)
	id 1S9Ugu-0005aq-HZ; Mon, 19 Mar 2012 00:59:32 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 52EEEB6FE5; Mon, 19 Mar 2012 15:59:30 +1100 (EST)
From: David Gibson <david@gibson.dropbear.id.au>
To: anthony@codemonkey.ws
Date: Mon, 19 Mar 2012 15:59:23 +1100
Message-Id: <1332133163-7890-1-git-send-email-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 1.7.9.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 203.10.76.45
Cc: qemu-trivial@nongnu.org, Rusty Russell <rusty@rustcorp.com.au>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
	David Gibson <david@gibson.dropbear.id.au>
Subject: [Qemu-trivial] [PATCH] Remove PCI class code from virtio balloon
	device
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
X-List-Received-Date: Mon, 19 Mar 2012 04:59:59 -0000

Currently the virtio balloon device, when using the virtio-pci interface
advertises itself with PCI class code MEMORY_RAM.  This is wrong; the
balloon is vaguely related to memory, but is nothing like a PCI memory
device in the meaning of the class code, and this code is not required or
suggested by the virtio PCI specification.

Worse, this patch causes problems on the pseries machine, because the
firmware, seeing this class code, advertises the device as memory in the
device tree, and then a guest kernel bug causes it to see this "memory"
before the real system memory, leading to a crash in early boot.

This patch fixes the problem by removing the bogus PCI class code on the
balloon device.

Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Rusty Russell <rusty@rustcorp.com.au>

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/virtio-pci.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/hw/virtio-pci.c b/hw/virtio-pci.c
index a0fb7c1..da8a382 100644
--- a/hw/virtio-pci.c
+++ b/hw/virtio-pci.c
@@ -919,7 +919,7 @@ static void virtio_balloon_class_init(ObjectClass *klass, void *data)
     k->vendor_id = PCI_VENDOR_ID_REDHAT_QUMRANET;
     k->device_id = PCI_DEVICE_ID_VIRTIO_BALLOON;
     k->revision = VIRTIO_PCI_ABI_VERSION;
-    k->class_id = PCI_CLASS_MEMORY_RAM;
+    k->class_id = PCI_CLASS_OTHERS;
     dc->reset = virtio_pci_reset;
     dc->props = virtio_balloon_properties;
 }
-- 
1.7.9.1


