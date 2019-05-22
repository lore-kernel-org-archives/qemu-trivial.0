Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hTTnI-0002XQ-EX
	for mharc-qemu-trivial@gnu.org; Wed, 22 May 2019 12:08:44 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57774)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hTTnF-0002Un-Ju
	for qemu-trivial@nongnu.org; Wed, 22 May 2019 12:08:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hTTnC-0004iG-07
	for qemu-trivial@nongnu.org; Wed, 22 May 2019 12:08:40 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:44271)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1hTTn5-0004KQ-KP; Wed, 22 May 2019 12:08:32 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue108 [212.227.15.183]) with ESMTPSA
	(Nemesis)
	id 1Mwwm5-1gjc5k1Idf-00yPCy; Wed, 22 May 2019 18:07:43 +0200
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
Date: Wed, 22 May 2019 18:07:23 +0200
Message-Id: <20190522160723.31484-10-laurent@vivier.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190522160723.31484-1-laurent@vivier.eu>
References: <20190522160723.31484-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Zm70E0oI1ZM4VhuVrV6GSk5Zq65TW0Q3iF4E6XyH5HYqU2h0Zao
	p4Gh7WkJ1AE9pUSvPRL1YlWNjrdzSYh8FdCjmvRMoLCfw9KPU6Sok0uV4hNy7xUIW5nVKVy
	kgkuWwcQ1s8zkijGCMNf5/Uv+hnybRRMj1xn1q4Qt3h6JkXZOaXqh9QjxGORSu44MxI8AS9
	EEGIaFA2aQgx2F7Zb5H0g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:VV0Ai4aLcXk=:8ScUNQP4QVS+RbxOT+RGB1
	DiH86TvntWrDcy6rkHA7MLa0q2RhoJ12YrN9iwFQyBaxqw3jlFoyQjYB2lDw5vsGEuJraMWFO
	izMyWb2xxbEhPbUe4gdPINcujXzFXZPsOBBfoZpG0ESB6iixJlMCsOtVTnAtdsdSFpNklt57H
	kH7UYP61j4KR2X2N4xPtTbBNFu5vu0b6sk5yfSoOcmVni0chi8PKms5djeeXxJme6cUA1hFP0
	ZCwpXwqt30loKwCQNPHFK73AIpJ+rxK8CAFhnzVbzsiwoxVnsQjLoYLp6ixKDBcXs9v2MHBwT
	7huYWRKS1hxe6LznLJynCIbkYz+KSQkVmaJv/IR230HiRaJfUzl+TxyrOjzUcjjVRYfVirJCZ
	RKqXlAJrJizmxyLedx+qb1xLDUtMSqrtfyBOeoROHjOK286vIFNi/BfNNL5aLt86Ul303hCof
	naf0G/OUEoXH2EKkccneqxqwXtveUERP7VVQ1gQbLgBGMywcl6YaD6dle4A0RaqdnPkOwyNhb
	dfh9z59kJczNq8IYTRXLlfBVz7QKNCB6CL6tHKX2vnXXyIpUkaKsrzq0yLS9oLWGNZS2emHw2
	s+I9IqZj9NtzEF9sGofEwg1Tf1aTaMILtCE1q1tN2WUM5D4nkljRp68yvW6aJ/r3MhkKVYMvY
	FNGqAGH5WAO0zUxXZeUG60i0eBJtYzhrUHQp96z9cUWZ2dudwUoNXlqP33IcKe27jk9KU+cfI
	EHPESqNzJ0yrQIc+sXd2VVnW5kW3ijnKGioTYgsjd1ajNDDrt3bkmwR369g=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.72.192.75
Subject: [Qemu-trivial] [PULL 9/9] pci: msix: move 'MSIX_CAP_LENGTH' to
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
X-List-Received-Date: Wed, 22 May 2019 16:08:42 -0000

From: Li Qiang <liq3ea@163.com>

'MSIX_CAP_LENGTH' is defined in two .c file. Move it
to hw/pci/msix.h file to reduce duplicated code.

CC: qemu-trivial@nongnu.org
Signed-off-by: Li Qiang <liq3ea@163.com>
Message-Id: <20190521151543.92274-5-liq3ea@163.com>
Acked-by: Alex Williamson <alex.williamson@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/pci/msix.c         | 2 --
 hw/vfio/pci.c         | 2 --
 include/hw/pci/msix.h | 2 ++
 3 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/hw/pci/msix.c b/hw/pci/msix.c
index 4e336416a78a..d39dcf32e8c9 100644
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
index 08729e5875a9..8e555db12ec0 100644
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
index 1f27658d352f..08acfa836e49 100644
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
2.20.1


