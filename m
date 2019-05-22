Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hTTn3-0002JE-Sv
	for mharc-qemu-trivial@gnu.org; Wed, 22 May 2019 12:08:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57614)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hTTn1-0002Gy-QP
	for qemu-trivial@nongnu.org; Wed, 22 May 2019 12:08:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hTTn0-0004Az-Kz
	for qemu-trivial@nongnu.org; Wed, 22 May 2019 12:08:27 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:40769)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1hTTmz-00045p-4Z; Wed, 22 May 2019 12:08:25 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue108 [212.227.15.183]) with ESMTPSA
	(Nemesis)
	id 1MuDTn-1gdaTf45r3-00uZSg; Wed, 22 May 2019 18:07:39 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Tony Krowiak <akrowiak@linux.ibm.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Cornelia Huck <cohuck@redhat.com>, Farhan Ali <alifm@linux.ibm.com>,
	qemu-s390x@nongnu.org, Eric Farman <farman@linux.ibm.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Halil Pasic <pasic@linux.ibm.com>, Laurent Vivier <laurent@vivier.eu>,
	qemu-trivial@nongnu.org, Juan Quintela <quintela@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Michael Tokarev <mjt@tls.msk.ru>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Pierre Morel <pmorel@linux.ibm.com>, Li Qiang <liq3ea@163.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Eric Auger <eric.auger@redhat.com>
Date: Wed, 22 May 2019 18:07:20 +0200
Message-Id: <20190522160723.31484-7-laurent@vivier.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190522160723.31484-1-laurent@vivier.eu>
References: <20190522160723.31484-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:6/5e76T1+hru2DLQJ56rOSKbhJRipSr30E2IAEPyFGEo9bmDiHC
	TLqHMaIZkD8fI/l3CVWOr0g4N+Xt7N34g24fXLSd476aA23FKd+JOpBgdeBwLlEeRj3U+mx
	Dcrn28jQThU/am7tSB59sfhbo4VeK0E8p7VQtzTk1RXqVncKxYVEk/PSKDGM+S7TlBzKEi/
	pRAFkIv2fP/Gr98tp8G1Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:l6hggI84yA4=:OUi4ZpRUC00/2bO2CZSbzB
	3y16jgQhxJVWfuqaoylrUI0iAxZChkvrdoMeVUGGIHIFOZGtL0MkTzBZhVEJqfJL2hn7OK4Mb
	X/A8I0jrGuoqn1UXc/+yMA4XNfA/FEax/2+WogbpYQ23Y2y1yWvkd7iXwLP9e8n0/d6tHZqlu
	YV6qXCTESdf0UMCgkBG5P8hrcswHfhUD2MaYWoqROTnRj2uLc+ICr4pj8n/msmjzohskwifFR
	4XaLCy6+qkpjQ3EcA65rtRFUu02VaE0nQa6rED2N07DpRtMrOxJ32usdz3QmTD6fLP2m3C1Z7
	RvWSb/OkfeqAue+1kHDksiul6yb7e1Rff34VLLYHdyxYB7yRQck/ubHtNfabxcArTRJ/GlDEg
	r7y0nOU/JFgpNcJ+0JavSD1BkzgQs8wCZtzUAjK/JP6qkvaoSR4TSqtaaGTQ25lWRhJ1GXiJX
	LvOuvd/2iN7GtQM65Dx3BoNd49FpHN/qlWPcDb2vlkuz0dZ97EWFUW7859TfbbkmxefuqFV8x
	9HmNTswgCuiPb1XiqRWR1woN4/Rm0XulLFHrCzfx6BnJmGN0mu1a9bNaRgjte2yYzBCqJ00GG
	2/zMQluvF+Wo2P99FY6B9tXqhV1XMZJlqR6OiN+ZoA7FJAe5Zzw0EqtJIazQnrx+8nbirKVJb
	0+LkXxThb/G1CRPeBQ6mXqt48VmhJWtbNp7yS5WOxHV9TXDOzMBFSCJKwY/R3ypXg6z9pD0Et
	MF3ly+Z3ysH0/T5QunnTvMn28J0gUGD2bpLZYz1g0iAXiu2EuEgzrXldeAk=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.24
Subject: [Qemu-trivial] [PULL 6/9] vfio: pci: make "vfio-pci-nohotplug" as
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
X-List-Received-Date: Wed, 22 May 2019 16:08:28 -0000

From: Li Qiang <liq3ea@163.com>

The QOMConventions recommends we should use TYPE_FOO
for a TypeInfo's name. Though "vfio-pci-nohotplug" is not
used in other parts, for consistency we should make this change.

CC: qemu-trivial@nongnu.org
Signed-off-by: Li Qiang <liq3ea@163.com>
Message-Id: <20190521151543.92274-2-liq3ea@163.com>
Acked-by: Alex Williamson <alex.williamson@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/vfio/pci.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 8cecb53d5cf6..08729e5875a9 100644
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
2.20.1


