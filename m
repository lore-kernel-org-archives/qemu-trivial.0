Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hT6VZ-0007dn-7M
	for mharc-qemu-trivial@gnu.org; Tue, 21 May 2019 11:16:53 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54195)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <liq3ea@163.com>) id 1hT6VX-0007bo-8D
	for qemu-trivial@nongnu.org; Tue, 21 May 2019 11:16:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <liq3ea@163.com>) id 1hT6VW-0001eQ-BD
	for qemu-trivial@nongnu.org; Tue, 21 May 2019 11:16:51 -0400
Received: from m12-16.163.com ([220.181.12.16]:57339)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <liq3ea@163.com>)
	id 1hT6VR-0001VI-UR; Tue, 21 May 2019 11:16:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=JmlbMI8+rNjltu5NEn
	UC7kK/0d8byMc075r+nhfmo6c=; b=XMe/Ant6o7Wm413n39LYWjdl5r1IuZO/hU
	OEWiG2efN9NSKuOL7OHRnnbCXapi6pdmD0do1spJt3611sSXiJ66eK7TdWY7/c6z
	qMPjr2I9EUvWUXu8dZW1pUdAagaQ8mJ/z6OgpWzIzgYuAkvgoZeXMs62EobCmgXH
	UGqXiiiJw=
Received: from localhost.localdomain (unknown [115.192.71.0])
	by smtp12 (Coremail) with SMTP id EMCowAC31lxJFuRcie7uGw--.4521S6;
	Tue, 21 May 2019 23:16:37 +0800 (CST)
From: Li Qiang <liq3ea@163.com>
To: alex.williamson@redhat.com,
	lvivier@redhat.com
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, liq3ea@gmail.com,
	philmd@redhat.com, Li Qiang <liq3ea@163.com>
Date: Tue, 21 May 2019 08:15:43 -0700
Message-Id: <20190521151543.92274-5-liq3ea@163.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190521151543.92274-1-liq3ea@163.com>
References: <20190521151543.92274-1-liq3ea@163.com>
X-CM-TRANSID: EMCowAC31lxJFuRcie7uGw--.4521S6
X-Coremail-Antispam: 1Uf129KBjvJXoW7AF4fAF15Wr15Gw1rXw1UZFb_yoW8XFykpF
	Z8CF9a9r4Fqw17Crsayw4avF17JF4DWr12vF4vg3y7ta1xGF1ktr4DtFy7u34xXFW0vFyr
	Gr9rZ345tF1UZrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UBWl9UUUUU=
X-Originating-IP: [115.192.71.0]
X-CM-SenderInfo: 5oltjvrd6rljoofrz/xtbBZhW7bVaD1l5SdQAAsf
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 220.181.12.16
Subject: [Qemu-trivial] [PATCH v2 4/4] pci: msix: move 'MSIX_CAP_LENGTH' to
 header file
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
X-List-Received-Date: Tue, 21 May 2019 15:16:52 -0000

'MSIX_CAP_LENGTH' is defined in two .c file. Move it
to hw/pci/msix.h file to reduce duplicated code.

CC: qemu-trivial@nongnu.org
Signed-off-by: Li Qiang <liq3ea@163.com>
---
 hw/pci/msix.c         | 2 --
 hw/vfio/pci.c         | 2 --
 include/hw/pci/msix.h | 2 ++
 3 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/hw/pci/msix.c b/hw/pci/msix.c
index 4e336416a7..d39dcf32e8 100644
--- a/hw/pci/msix.c
+++ b/hw/pci/msix.c
@@ -24,8 +24,6 @@
 #include "qapi/error.h"
 #include "trace.h"
 
-#define MSIX_CAP_LENGTH 12
-
 /* MSI enable bit and maskall bit are in byte 1 in FLAGS register */
 #define MSIX_CONTROL_OFFSET (PCI_MSIX_FLAGS + 1)
 #define MSIX_ENABLE_MASK (PCI_MSIX_FLAGS_ENABLE >> 8)
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 08729e5875..8e555db12e 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -35,8 +35,6 @@
 #include "trace.h"
 #include "qapi/error.h"
 
-#define MSIX_CAP_LENGTH 12
-
 #define TYPE_VFIO_PCI "vfio-pci"
 #define PCI_VFIO(obj)    OBJECT_CHECK(VFIOPCIDevice, obj, TYPE_VFIO_PCI)
 
diff --git a/include/hw/pci/msix.h b/include/hw/pci/msix.h
index 1f27658d35..08acfa836e 100644
--- a/include/hw/pci/msix.h
+++ b/include/hw/pci/msix.h
@@ -4,6 +4,8 @@
 #include "qemu-common.h"
 #include "hw/pci/pci.h"
 
+#define MSIX_CAP_LENGTH 12
+
 void msix_set_message(PCIDevice *dev, int vector, MSIMessage msg);
 MSIMessage msix_get_message(PCIDevice *dev, unsigned int vector);
 int msix_init(PCIDevice *dev, unsigned short nentries,
-- 
2.17.1



