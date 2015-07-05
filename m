Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZBe4F-0006Au-7l
	for mharc-qemu-trivial@gnu.org; Sun, 05 Jul 2015 03:10:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52001)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1ZBe4B-00066i-C7
	for qemu-trivial@nongnu.org; Sun, 05 Jul 2015 03:10:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1ZBe48-0002zp-6q
	for qemu-trivial@nongnu.org; Sun, 05 Jul 2015 03:10:19 -0400
Received: from e23smtp05.au.ibm.com ([202.81.31.147]:55654)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1ZBe47-0002yS-Jk
	for qemu-trivial@nongnu.org; Sun, 05 Jul 2015 03:10:16 -0400
Received: from /spool/local
	by e23smtp05.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <aik@ozlabs.ru>;
	Sun, 5 Jul 2015 17:10:11 +1000
Received: from d23dlp03.au.ibm.com (202.81.31.214)
	by e23smtp05.au.ibm.com (202.81.31.211) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Sun, 5 Jul 2015 17:10:09 +1000
X-Helo: d23dlp03.au.ibm.com
X-MailFrom: aik@ozlabs.ru
X-RcptTo: qemu-trivial@nongnu.org
Received: from d23relay09.au.ibm.com (d23relay09.au.ibm.com [9.185.63.181])
	by d23dlp03.au.ibm.com (Postfix) with ESMTP id 580A33578048;
	Sun,  5 Jul 2015 17:10:06 +1000 (EST)
Received: from d23av01.au.ibm.com (d23av01.au.ibm.com [9.190.234.96])
	by d23relay09.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
	t6579t6D57212944; Sun, 5 Jul 2015 17:10:06 +1000
Received: from d23av01.au.ibm.com (localhost [127.0.0.1])
	by d23av01.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
	t6579UrV014330; Sun, 5 Jul 2015 17:09:30 +1000
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
	by d23av01.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
	t6579Usa014081; Sun, 5 Jul 2015 17:09:30 +1000
Received: from bran.ozlabs.ibm.com (unknown [9.192.254.114])
	by ozlabs.au.ibm.com (Postfix) with ESMTP id 5DEDEA01AD;
	Sun,  5 Jul 2015 17:09:06 +1000 (AEST)
Received: from ka1.ozlabs.ibm.com (ka1.ozlabs.ibm.com [10.61.145.11])
	by bran.ozlabs.ibm.com (Postfix) with ESMTP id 43F55E38DD;
	Sun,  5 Jul 2015 17:09:06 +1000 (AEST)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: qemu-devel@nongnu.org
Date: Sun,  5 Jul 2015 17:09:05 +1000
Message-Id: <1436080145-6149-1-git-send-email-aik@ozlabs.ru>
X-Mailer: git-send-email 2.4.0.rc3.8.gfb3e7d5
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 15070507-0017-0000-0000-00000177B393
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 202.81.31.147
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
	Gavin Shan <gwshan@linux.vnet.ibm.com>, qemu-trivial@nongnu.org,
	Alex Williamson <alex.williamson@redhat.com>,
	qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Subject: [Qemu-trivial] [PATCH qemu] vfio: Unregister IOMMU notifiers when
	container is destroyed
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
X-List-Received-Date: Sun, 05 Jul 2015 07:10:20 -0000

On systems with guest visible IOMMU, adding a new memory region onto
PCI bus calls vfio_listener_region_add() for every DMA window. This
installs a notifier for IOMMU memory regions. The notifier is supposed
to be removed vfio_listener_region_del(), however in the case of mixed
PHB (emulated + VFIO devices) when last VFIO device is unplugged and
container gets destroyed, all existing DMA windows stay alive altogether
with the notifiers which are on the linked list which head was in
the destroyed container.

This unregisters IOMMU memory region notifier when a container is
destroyed.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
 hw/vfio/common.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index b1045da..85ee9b0 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -772,11 +772,19 @@ static void vfio_disconnect_container(VFIOGroup *group)
 
     if (QLIST_EMPTY(&container->group_list)) {
         VFIOAddressSpace *space = container->space;
+        VFIOGuestIOMMU *giommu, *tmp;
 
         if (container->iommu_data.release) {
             container->iommu_data.release(container);
         }
         QLIST_REMOVE(container, next);
+
+        QLIST_FOREACH_SAFE(giommu, &container->giommu_list, giommu_next, tmp) {
+            memory_region_unregister_iommu_notifier(&giommu->n);
+            QLIST_REMOVE(giommu, giommu_next);
+            g_free(giommu);
+        }
+
         trace_vfio_disconnect_container(container->fd);
         close(container->fd);
         g_free(container);
-- 
2.4.0.rc3.8.gfb3e7d5


