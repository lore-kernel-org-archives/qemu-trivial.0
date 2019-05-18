Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hRq1Z-0000dO-M1
	for mharc-qemu-trivial@gnu.org; Fri, 17 May 2019 23:28:41 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51859)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <liq3ea@163.com>) id 1hRq1X-0000be-Mj
	for qemu-trivial@nongnu.org; Fri, 17 May 2019 23:28:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <liq3ea@163.com>) id 1hRq1W-000385-Nu
	for qemu-trivial@nongnu.org; Fri, 17 May 2019 23:28:39 -0400
Received: from m12-18.163.com ([220.181.12.18]:40382)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <liq3ea@163.com>)
	id 1hRq1T-0002zi-B4; Fri, 17 May 2019 23:28:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=m/jK5BRzZ77Fytp9Cm
	+5i3Aa2DC0aXVgIOAmW6CJ4SI=; b=TftTTbdHITftWYsVcHK+E+P6mzGcFBJTX5
	bgpwmo24XLwZoCsSryUM9a7h46k7TOPS4oCcg/3b5W6ZSPorFpf3kbDeN93qb3G1
	f2nSF1iTT8DJvvhEw+RVfF1hdjLJXjKqklb2KEMvMyA12eZ2W1gifK5LJDElXFHp
	qyKWIuqqg=
Received: from localhost.localdomain (unknown [183.159.73.182])
	by smtp14 (Coremail) with SMTP id EsCowACXzsrXe99czqL5Gg--.37649S2;
	Sat, 18 May 2019 11:28:24 +0800 (CST)
From: Li Qiang <liq3ea@163.com>
To: alex.williamson@redhat.com,
	lvivier@redhat.com
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, liq3ea@gmail.com,
	philmd@redhat.com, Li Qiang <liq3ea@163.com>
Date: Fri, 17 May 2019 20:28:08 -0700
Message-Id: <20190518032811.60341-1-liq3ea@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: EsCowACXzsrXe99czqL5Gg--.37649S2
X-Coremail-Antispam: 1Uf129KBjvdXoWruFyfJF4DAr4xWw1DCF18AFb_yoWDAwcEy3
	ZxZwsYk3s8CayxKrsxZa43Cw48Zw45tF48t3sYyrs2yr4UG3Z8CryDAFn7ZryfWr4fAry8
	Grs2qr13GryUKjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRRo7KPUUUUU==
X-Originating-IP: [183.159.73.182]
X-CM-SenderInfo: 5oltjvrd6rljoofrz/xtbBZhi4bVaD1iSbFgAAsB
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 220.181.12.18
Subject: [Qemu-trivial] [PATCH 1/4] vfio: pci: make "vfio-pci-nohotplug" as
 MACRO
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
X-List-Received-Date: Sat, 18 May 2019 03:28:40 -0000

CC: qemu-trivial@nongnu.org
Signed-off-by: Li Qiang <liq3ea@163.com>
---
 hw/vfio/pci.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 8cecb53d5c..08729e5875 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -40,6 +40,8 @@
 #define TYPE_VFIO_PCI "vfio-pci"
 #define PCI_VFIO(obj)    OBJECT_CHECK(VFIOPCIDevice, obj, TYPE_VFIO_PCI)
 
+#define TYPE_VIFO_PCI_NOHOTPLUG "vfio-pci-nohotplug"
+
 static void vfio_disable_interrupts(VFIOPCIDevice *vdev);
 static void vfio_mmap_set_enabled(VFIOPCIDevice *vdev, bool enabled);
 
@@ -3304,8 +3306,8 @@ static void vfio_pci_nohotplug_dev_class_init(ObjectClass *klass, void *data)
 }
 
 static const TypeInfo vfio_pci_nohotplug_dev_info = {
-    .name = "vfio-pci-nohotplug",
-    .parent = "vfio-pci",
+    .name = TYPE_VIFO_PCI_NOHOTPLUG,
+    .parent = TYPE_VFIO_PCI,
     .instance_size = sizeof(VFIOPCIDevice),
     .class_init = vfio_pci_nohotplug_dev_class_init,
 };
-- 
2.17.1



