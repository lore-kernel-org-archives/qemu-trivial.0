Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hT6VW-0007aF-0g
	for mharc-qemu-trivial@gnu.org; Tue, 21 May 2019 11:16:50 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54142)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <liq3ea@163.com>) id 1hT6VS-0007X3-UB
	for qemu-trivial@nongnu.org; Tue, 21 May 2019 11:16:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <liq3ea@163.com>) id 1hT6VS-0001b7-51
	for qemu-trivial@nongnu.org; Tue, 21 May 2019 11:16:46 -0400
Received: from m12-16.163.com ([220.181.12.16]:57269)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <liq3ea@163.com>)
	id 1hT6VO-0001Uo-PE; Tue, 21 May 2019 11:16:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=YF+Y59FtV25KxIFj7L
	w31u+auxIodjqyp94VvLhiljw=; b=AbmPP46ZNC6kq1swgcEN4Bg//Iz7uX+Aaz
	+MxS1DZUWXy4w9daecrullGfR1Q0tOHHKzTGj6x/1bhEGdPzksiWxUaLzyQYzTWk
	R/vv3ODPFf1hzSpYOTNC6tVS3Za7UoqPGnt/9osDO0G8M0xvx5+BKB4TmHm3jN1f
	lFTSYlefk=
Received: from localhost.localdomain (unknown [115.192.71.0])
	by smtp12 (Coremail) with SMTP id EMCowAC31lxJFuRcie7uGw--.4521S3;
	Tue, 21 May 2019 23:16:29 +0800 (CST)
From: Li Qiang <liq3ea@163.com>
To: alex.williamson@redhat.com,
	lvivier@redhat.com
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, liq3ea@gmail.com,
	philmd@redhat.com, Li Qiang <liq3ea@163.com>
Date: Tue, 21 May 2019 08:15:40 -0700
Message-Id: <20190521151543.92274-2-liq3ea@163.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190521151543.92274-1-liq3ea@163.com>
References: <20190521151543.92274-1-liq3ea@163.com>
X-CM-TRANSID: EMCowAC31lxJFuRcie7uGw--.4521S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7Xw1xXF48ZrWDCFWrXw13Arb_yoWkKwcEy3
	ZrZw4v9wn5Cay3KwsrZa43Cw48Aw4YqF4kJ34rtrs2yr4UJFs8CryDArn7Zr1fur4fAry8
	Grs2qr13Kry3KjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUbrOzDUUUUU==
X-Originating-IP: [115.192.71.0]
X-CM-SenderInfo: 5oltjvrd6rljoofrz/1tbiTw27bVsGPbUeDAAAsT
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 220.181.12.16
Subject: [Qemu-trivial] [PATCH v2 1/4] vfio: pci: make "vfio-pci-nohotplug"
 as MACRO
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
X-List-Received-Date: Tue, 21 May 2019 15:16:47 -0000

The QOMConventions recommends we should use TYPE_FOO
for a TypeInfo's name. Though "vfio-pci-nohotplug" is not
used in other parts, for consistency we should make this change.

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



