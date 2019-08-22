Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i0jIR-0005cf-OZ
	for mharc-qemu-trivial@gnu.org; Thu, 22 Aug 2019 05:22:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45084)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1i0jIP-0005a3-Hv
 for qemu-trivial@nongnu.org; Thu, 22 Aug 2019 05:22:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1i0jIO-0005xa-Gi
 for qemu-trivial@nongnu.org; Thu, 22 Aug 2019 05:22:17 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56938)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>)
 id 1i0jIM-0005vu-Hw; Thu, 22 Aug 2019 05:22:14 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D3F5C3082A6C;
 Thu, 22 Aug 2019 09:22:13 +0000 (UTC)
Received: from gondolin (dhcp-192-222.str.redhat.com [10.33.192.222])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C1B051001B36;
 Thu, 22 Aug 2019 09:22:10 +0000 (UTC)
Date: Thu, 22 Aug 2019 11:22:08 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Chen Zhang via Qemu-devel <qemu-devel@nongnu.org>
Cc: Chen Zhang <tgfbeta@me.com>, qemu-trivial@nongnu.org, Alex Williamson
 <alex.williamson@redhat.com>
Message-ID: <20190822112208.0829e2df.cohuck@redhat.com>
In-Reply-To: <8E5A9C27-C76D-46CF-85B0-79121A00B05F@me.com>
References: <8E5A9C27-C76D-46CF-85B0-79121A00B05F@me.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Thu, 22 Aug 2019 09:22:13 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] vfio: fix a typo
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Aug 2019 09:22:18 -0000

On Thu, 22 Aug 2019 14:49:09 +0800
Chen Zhang via Qemu-devel <qemu-devel@nongnu.org> wrote:

> Signed-off-by: Chen Zhang <tgfbeta@me.com>
> ---
>  hw/vfio/pci.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index dc3479c..c5e6fe6 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -44,7 +44,7 @@
>  #define TYPE_VFIO_PCI "vfio-pci"
>  #define PCI_VFIO(obj)    OBJECT_CHECK(VFIOPCIDevice, obj, TYPE_VFIO_PCI)
>  
> -#define TYPE_VIFO_PCI_NOHOTPLUG "vfio-pci-nohotplug"
> +#define TYPE_VFIO_PCI_NOHOTPLUG "vfio-pci-nohotplug"
>  
>  static void vfio_disable_interrupts(VFIOPCIDevice *vdev);
>  static void vfio_mmap_set_enabled(VFIOPCIDevice *vdev, bool enabled);
> @@ -3199,7 +3199,7 @@ static void vfio_pci_nohotplug_dev_class_init(ObjectClass *klass, void *data)
>  }
>  
>  static const TypeInfo vfio_pci_nohotplug_dev_info = { 
> -    .name = TYPE_VIFO_PCI_NOHOTPLUG,
> +    .name = TYPE_VFIO_PCI_NOHOTPLUG,
>      .parent = TYPE_VFIO_PCI,
>      .instance_size = sizeof(VFIOPCIDevice),
>      .class_init = vfio_pci_nohotplug_dev_class_init,

Reviewed-by: Cornelia Huck <cohuck@redhat.com>

