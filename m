Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hS0Ds-0002aD-5b
	for mharc-qemu-trivial@gnu.org; Sat, 18 May 2019 10:22:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53835)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.williamson@redhat.com>) id 1hS0Dq-0002Ye-6Q
	for qemu-trivial@nongnu.org; Sat, 18 May 2019 10:22:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.williamson@redhat.com>) id 1hS0Dp-0007ai-BO
	for qemu-trivial@nongnu.org; Sat, 18 May 2019 10:22:02 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36338)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alex.williamson@redhat.com>)
	id 1hS0Dn-0007Zh-9p; Sat, 18 May 2019 10:21:59 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A146B307D91F;
	Sat, 18 May 2019 14:21:58 +0000 (UTC)
Received: from x1.home (ovpn-117-92.phx2.redhat.com [10.3.117.92])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F222A5D9D6;
	Sat, 18 May 2019 14:21:55 +0000 (UTC)
Date: Sat, 18 May 2019 08:21:55 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Li Qiang <liq3ea@163.com>
Cc: lvivier@redhat.com, qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	liq3ea@gmail.com, philmd@redhat.com
Message-ID: <20190518082155.213cc6d0@x1.home>
In-Reply-To: <20190518032811.60341-4-liq3ea@163.com>
References: <20190518032811.60341-1-liq3ea@163.com>
	<20190518032811.60341-4-liq3ea@163.com>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Sat, 18 May 2019 14:21:58 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH 4/4] pci: msix: move 'MSIX_CAP_LENGTH' to
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
X-List-Received-Date: Sat, 18 May 2019 14:22:03 -0000

On Fri, 17 May 2019 20:28:11 -0700
Li Qiang <liq3ea@163.com> wrote:

Lacking commit message.

> CC: qemu-trivial@nongnu.org
> Signed-off-by: Li Qiang <liq3ea@163.com>
> ---
>  hw/pci/msix.c         | 2 --
>  hw/vfio/pci.c         | 2 --
>  include/hw/pci/msix.h | 2 ++
>  3 files changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/pci/msix.c b/hw/pci/msix.c
> index 4e336416a7..d39dcf32e8 100644
> --- a/hw/pci/msix.c
> +++ b/hw/pci/msix.c
> @@ -24,8 +24,6 @@
>  #include "qapi/error.h"
>  #include "trace.h"
>  
> -#define MSIX_CAP_LENGTH 12
> -
>  /* MSI enable bit and maskall bit are in byte 1 in FLAGS register */
>  #define MSIX_CONTROL_OFFSET (PCI_MSIX_FLAGS + 1)
>  #define MSIX_ENABLE_MASK (PCI_MSIX_FLAGS_ENABLE >> 8)
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index 08729e5875..8e555db12e 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -35,8 +35,6 @@
>  #include "trace.h"
>  #include "qapi/error.h"
>  
> -#define MSIX_CAP_LENGTH 12
> -
>  #define TYPE_VFIO_PCI "vfio-pci"
>  #define PCI_VFIO(obj)    OBJECT_CHECK(VFIOPCIDevice, obj, TYPE_VFIO_PCI)
>  
> diff --git a/include/hw/pci/msix.h b/include/hw/pci/msix.h
> index 1f27658d35..08acfa836e 100644
> --- a/include/hw/pci/msix.h
> +++ b/include/hw/pci/msix.h
> @@ -4,6 +4,8 @@
>  #include "qemu-common.h"
>  #include "hw/pci/pci.h"
>  
> +#define MSIX_CAP_LENGTH 12
> +
>  void msix_set_message(PCIDevice *dev, int vector, MSIMessage msg);
>  MSIMessage msix_get_message(PCIDevice *dev, unsigned int vector);
>  int msix_init(PCIDevice *dev, unsigned short nentries,


