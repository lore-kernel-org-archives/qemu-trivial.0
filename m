Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T1zsj-0005gr-SR
	for mharc-qemu-trivial@gnu.org; Thu, 16 Aug 2012 09:13:01 -0400
Received: from eggs.gnu.org ([208.118.235.92]:44586)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1T1zsa-0005GP-0m
	for qemu-trivial@nongnu.org; Thu, 16 Aug 2012 09:13:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1T1zsN-0001YC-Mw
	for qemu-trivial@nongnu.org; Thu, 16 Aug 2012 09:12:51 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:51011)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1T1zs8-0001S7-Bl; Thu, 16 Aug 2012 09:12:24 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	9AE097280027; Thu, 16 Aug 2012 15:12:22 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id zC2KwiW2ivdt; Thu, 16 Aug 2012 15:12:22 +0200 (CEST)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 2D91A728002C; Thu, 16 Aug 2012 15:12:22 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial@nongnu.org
Date: Thu, 16 Aug 2012 15:12:21 +0200
Message-Id: <1345122741-32492-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH] Spelling fixes in comments and macro names
	(ressource -> resource)
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
X-List-Received-Date: Thu, 16 Aug 2012 13:13:00 -0000

Macro XEN_HOST_PCI_RESOURCE_BUFFER_SIZE is only used locally,
so the change should be safe.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 hw/xen-host-pci-device.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/xen-host-pci-device.c b/hw/xen-host-pci-device.c
index e7ff680..743b37b 100644
--- a/hw/xen-host-pci-device.c
+++ b/hw/xen-host-pci-device.c
@@ -47,13 +47,13 @@ static int xen_host_pci_sysfs_path(const XenHostPCIDevice *d,
 }
 
 
-/* This size should be enough to read the first 7 lines of a ressource file */
-#define XEN_HOST_PCI_RESSOURCE_BUFFER_SIZE 400
+/* This size should be enough to read the first 7 lines of a resource file */
+#define XEN_HOST_PCI_RESOURCE_BUFFER_SIZE 400
 static int xen_host_pci_get_resource(XenHostPCIDevice *d)
 {
     int i, rc, fd;
     char path[PATH_MAX];
-    char buf[XEN_HOST_PCI_RESSOURCE_BUFFER_SIZE];
+    char buf[XEN_HOST_PCI_RESOURCE_BUFFER_SIZE];
     unsigned long long start, end, flags, size;
     char *endptr, *s;
     uint8_t type;
-- 
1.7.10


