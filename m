Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e1tfd-0007dp-J0
	for mharc-qemu-trivial@gnu.org; Tue, 10 Oct 2017 08:30:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56760)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Jim.Quigley@oracle.com>) id 1e1rgD-0002tS-EY
	for qemu-trivial@nongnu.org; Tue, 10 Oct 2017 06:22:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Jim.Quigley@oracle.com>) id 1e1rg9-0007B7-Ew
	for qemu-trivial@nongnu.org; Tue, 10 Oct 2017 06:22:29 -0400
Received: from userp1040.oracle.com ([156.151.31.81]:51362)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <Jim.Quigley@oracle.com>)
	id 1e1rg9-0007AF-5I; Tue, 10 Oct 2017 06:22:25 -0400
Received: from userv0021.oracle.com (userv0021.oracle.com [156.151.31.71])
	by userp1040.oracle.com (Sentrion-MTA-4.3.2/Sentrion-MTA-4.3.2) with
	ESMTP id v9AAMLXc014723
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Oct 2017 10:22:21 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
	by userv0021.oracle.com (8.14.4/8.14.4) with ESMTP id v9AAMKDb015811
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Tue, 10 Oct 2017 10:22:20 GMT
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
	by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id v9AAMHbI005621;
	Tue, 10 Oct 2017 10:22:17 GMT
Received: from aus-x4-2-1.us.oracle.com (/10.135.198.88)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Tue, 10 Oct 2017 03:22:16 -0700
From: Jim Quigley <Jim.Quigley@oracle.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, mjt@tls.msk.ru, laurent@vivier.eu,
	alex.williamson@redhat.com
Date: Tue, 10 Oct 2017 06:22:08 -0400
Message-Id: <1507630928-28307-1-git-send-email-Jim.Quigley@oracle.com>
X-Mailer: git-send-email 1.8.3.1
X-Source-IP: userv0021.oracle.com [156.151.31.71]
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
	[fuzzy]
X-Received-From: 156.151.31.81
X-Mailman-Approved-At: Tue, 10 Oct 2017 08:30:00 -0400
Subject: [Qemu-trivial] [PATCH] hw/vfio: improve error message when cannot
 init vfio event notifiers
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Oct 2017 10:22:30 -0000

More information is required to assist trouble-shooting when
QEMU fails to initialise the event notifications for devices
assigned with VFIO-PCI. Instead of supplying the user with a cryptic
error number only, print out a proper error message with strerror()
so that the user has a better way to figure out what the problem is.

Reviewed-by: Liam Merwick <liam.merwick@oracle.com>
Signed-off-by: Jim Quigley <Jim.Quigley@oracle.com>
---
Cc: qemu-trivial@nongnu.org
Cc: mjt@tls.msk.ru
Cc: laurent@vivier.eu
Cc: alex.williamson@redhat.com
---
 hw/vfio/pci.c | 35 ++++++++++++++++++++++++-----------
 1 file changed, 24 insertions(+), 11 deletions(-)

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 31e1edf..3bffb93 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -430,13 +430,16 @@ static int vfio_enable_vectors(VFIOPCIDevice *vdev, bool msix)
 static void vfio_add_kvm_msi_virq(VFIOPCIDevice *vdev, VFIOMSIVector *vector,
                                   int vector_n, bool msix)
 {
-    int virq;
+    int virq, ret;
 
     if ((msix && vdev->no_kvm_msix) || (!msix && vdev->no_kvm_msi)) {
         return;
     }
 
-    if (event_notifier_init(&vector->kvm_interrupt, 0)) {
+    ret = event_notifier_init(&vector->kvm_interrupt, 0);
+    if (ret) {
+        error_report("vfio (%s): Error: unable to init event notifier: %s (%d)",
+                     __func__, strerror(-ret), -ret);
         return;
     }
 
@@ -486,8 +489,11 @@ static int vfio_msix_vector_do_use(PCIDevice *pdev, unsigned int nr,
     if (!vector->use) {
         vector->vdev = vdev;
         vector->virq = -1;
-        if (event_notifier_init(&vector->interrupt, 0)) {
-            error_report("vfio: Error: event_notifier_init failed");
+        ret = event_notifier_init(&vector->interrupt, 0);
+        if (ret) {
+            error_report("vfio (%s): Error: "
+                         "unable to init event notifier: %s (%d)",
+                         __func__, strerror(-ret), -ret);
         }
         vector->use = true;
         msix_vector_use(pdev, nr);
@@ -658,8 +664,11 @@ retry:
         vector->virq = -1;
         vector->use = true;
 
-        if (event_notifier_init(&vector->interrupt, 0)) {
-            error_report("vfio: Error: event_notifier_init failed");
+        ret = event_notifier_init(&vector->interrupt, 0);
+        if (ret) {
+            error_report("vfio (%s): Error: "
+                         "unable to init event notifier: %s (%d)",
+                         __func__, strerror(-ret), -ret);
         }
 
         qemu_set_fd_handler(event_notifier_get_fd(&vector->interrupt),
@@ -2471,8 +2480,10 @@ static void vfio_register_err_notifier(VFIOPCIDevice *vdev)
         return;
     }
 
-    if (event_notifier_init(&vdev->err_notifier, 0)) {
-        error_report("vfio: Unable to init event notifier for error detection");
+    ret = event_notifier_init(&vdev->err_notifier, 0);
+    if (ret) {
+        error_report("vfio (%s): Error: unable to init event notifier: %s (%d)"
+            " for error detection", __func__, strerror(-ret), -ret);
         vdev->pci_aer = false;
         return;
     }
@@ -2553,7 +2564,7 @@ static void vfio_register_req_notifier(VFIOPCIDevice *vdev)
 {
     struct vfio_irq_info irq_info = { .argsz = sizeof(irq_info),
                                       .index = VFIO_PCI_REQ_IRQ_INDEX };
-    int argsz;
+    int argsz, ret;
     struct vfio_irq_set *irq_set;
     int32_t *pfd;
 
@@ -2566,8 +2577,10 @@ static void vfio_register_req_notifier(VFIOPCIDevice *vdev)
         return;
     }
 
-    if (event_notifier_init(&vdev->req_notifier, 0)) {
-        error_report("vfio: Unable to init event notifier for device request");
+    ret = event_notifier_init(&vdev->req_notifier, 0);
+    if (ret) {
+        error_report("vfio (%s): Error: unable to init event notifier: %s (%d)"
+            " for device request", __func__, strerror(-ret), -ret);
         return;
     }
 
-- 
1.8.3.1


