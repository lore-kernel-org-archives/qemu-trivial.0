Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eqZ0c-0007ON-7W
	for mharc-qemu-trivial@gnu.org; Tue, 27 Feb 2018 01:45:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60866)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1eqZ0a-0007N6-3s
	for qemu-trivial@nongnu.org; Tue, 27 Feb 2018 01:45:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1eqZ0Z-0005Cn-Ct
	for qemu-trivial@nongnu.org; Tue, 27 Feb 2018 01:45:04 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:47124 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1eqZ0S-00059R-Iy; Tue, 27 Feb 2018 01:44:56 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AEB2E8185920;
	Tue, 27 Feb 2018 06:44:51 +0000 (UTC)
Received: from thh440s.redhat.com (ovpn-116-62.ams2.redhat.com [10.36.116.62])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E995B213AEF4;
	Tue, 27 Feb 2018 06:44:45 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Date: Tue, 27 Feb 2018 07:44:44 +0100
Message-Id: <1519713884-2346-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Tue, 27 Feb 2018 06:44:51 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Tue, 27 Feb 2018 06:44:51 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-trivial] [PATCH] tests/libqos: Check for valid dev pointer
 when looking for PCI devices
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
X-List-Received-Date: Tue, 27 Feb 2018 06:45:05 -0000

dev could be NULL if the PCI device can not be found due to some
reasons, so we must not dereference the pointer in this case.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/libqos/virtio-pci.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/libqos/virtio-pci.c b/tests/libqos/virtio-pci.c
index 7ac15c0..550dede 100644
--- a/tests/libqos/virtio-pci.c
+++ b/tests/libqos/virtio-pci.c
@@ -315,7 +315,9 @@ QVirtioPCIDevice *qvirtio_pci_device_find(QPCIBus *bus, uint16_t device_type)
     qvirtio_pci_foreach(bus, device_type, false, 0,
                         qvirtio_pci_assign_device, &dev);
 
-    dev->vdev.bus = &qvirtio_pci;
+    if (dev) {
+        dev->vdev.bus = &qvirtio_pci;
+    }
 
     return dev;
 }
-- 
1.8.3.1


