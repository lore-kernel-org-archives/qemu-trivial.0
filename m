Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YYDtz-0006Aw-PA
	for mharc-qemu-trivial@gnu.org; Wed, 18 Mar 2015 09:20:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59359)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1YYDtx-00064C-HY
	for qemu-trivial@nongnu.org; Wed, 18 Mar 2015 09:20:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1YYDtw-0003Lx-MG
	for qemu-trivial@nongnu.org; Wed, 18 Mar 2015 09:20:49 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58807)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>)
	id 1YYDts-0003Ks-FE; Wed, 18 Mar 2015 09:20:44 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id 198DBC408A;
	Wed, 18 Mar 2015 13:20:44 +0000 (UTC)
Received: from redhat.com (ovpn-116-40.ams2.redhat.com [10.36.116.40])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with SMTP
	id t2IDKgR2005439; Wed, 18 Mar 2015 09:20:42 -0400
Date: Wed, 18 Mar 2015 14:20:41 +0100
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Thomas Huth <thuth@linux.vnet.ibm.com>
Message-ID: <20150318142021-mutt-send-email-mst@redhat.com>
References: <1426313974-25607-1-git-send-email-thuth@linux.vnet.ibm.com>
	<1426313974-25607-4-git-send-email-thuth@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1426313974-25607-4-git-send-email-thuth@linux.vnet.ibm.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH v2 3/7] pci: Remove unused function
	ich9_d2pbr_init()
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
X-List-Received-Date: Wed, 18 Mar 2015 13:20:50 -0000

On Sat, Mar 14, 2015 at 07:19:30AM +0100, Thomas Huth wrote:
> The function ich9_d2pbr_init() is completely unused and
> thus can be deleted.
> 
> Signed-off-by: Thomas Huth <thuth@linux.vnet.ibm.com>
> Cc: Michael S. Tsirkin <mst@redhat.com>

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

I assume all this will go in for 2.4 through the trivial tree?

> ---
>  hw/pci-bridge/i82801b11.c |   21 ---------------------
>  include/hw/i386/ich9.h    |    1 -
>  2 files changed, 0 insertions(+), 22 deletions(-)
> 
> diff --git a/hw/pci-bridge/i82801b11.c b/hw/pci-bridge/i82801b11.c
> index 14cd7fd..7e79bc0 100644
> --- a/hw/pci-bridge/i82801b11.c
> +++ b/hw/pci-bridge/i82801b11.c
> @@ -101,27 +101,6 @@ static const TypeInfo i82801b11_bridge_info = {
>      .class_init    = i82801b11_bridge_class_init,
>  };
>  
> -PCIBus *ich9_d2pbr_init(PCIBus *bus, int devfn, int sec_bus)
> -{
> -    PCIDevice *d;
> -    PCIBridge *br;
> -    char buf[16];
> -    DeviceState *qdev;
> -
> -    d = pci_create_multifunction(bus, devfn, true, "i82801b11-bridge");
> -    if (!d) {
> -        return NULL;
> -    }
> -    br = PCI_BRIDGE(d);
> -    qdev = DEVICE(d);
> -
> -    snprintf(buf, sizeof(buf), "pci.%d", sec_bus);
> -    pci_bridge_map_irq(br, buf, pci_swizzle_map_irq_fn);
> -    qdev_init_nofail(qdev);
> -
> -    return pci_bridge_get_sec_bus(br);
> -}
> -
>  static void d2pbr_register(void)
>  {
>      type_register_static(&i82801b11_bridge_info);
> diff --git a/include/hw/i386/ich9.h b/include/hw/i386/ich9.h
> index 59ea25b..5cede9b 100644
> --- a/include/hw/i386/ich9.h
> +++ b/include/hw/i386/ich9.h
> @@ -19,7 +19,6 @@ void ich9_lpc_set_irq(void *opaque, int irq_num, int level);
>  int ich9_lpc_map_irq(PCIDevice *pci_dev, int intx);
>  PCIINTxRoute ich9_route_intx_pin_to_irq(void *opaque, int pirq_pin);
>  void ich9_lpc_pm_init(PCIDevice *pci_lpc);
> -PCIBus *ich9_d2pbr_init(PCIBus *bus, int devfn, int sec_bus);
>  I2CBus *ich9_smb_init(PCIBus *bus, int devfn, uint32_t smb_io_base);
>  
>  #define ICH9_CC_SIZE                            (16 * 1024)     /* 16KB */
> -- 
> 1.7.1
> 

