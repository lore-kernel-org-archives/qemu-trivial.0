Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UpmEI-0006d1-5F
	for mharc-qemu-trivial@gnu.org; Thu, 20 Jun 2013 17:17:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51287)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1Upgwe-0002Vn-Iq
	for qemu-trivial@nongnu.org; Thu, 20 Jun 2013 11:38:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1Upgwb-0000Ui-Ay
	for qemu-trivial@nongnu.org; Thu, 20 Jun 2013 11:38:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:11050)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>)
	id 1UpgwM-0000SO-Iu; Thu, 20 Jun 2013 11:38:26 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r5KFc4V6016299
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Thu, 20 Jun 2013 11:38:04 -0400
Received: from redhat.com (vpn1-4-248.ams2.redhat.com [10.36.4.248])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with SMTP
	id r5KFbt2N018886; Thu, 20 Jun 2013 11:37:56 -0400
Date: Thu, 20 Jun 2013 18:38:39 +0300
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Message-ID: <20130620153839.GA18645@redhat.com>
References: <1371737338-25148-1-git-send-email-aik@ozlabs.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1371737338-25148-1-git-send-email-aik@ozlabs.ru>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
X-Mailman-Approved-At: Thu, 20 Jun 2013 17:17:16 -0400
Cc: Anthony Liguori <aliguori@us.ibm.com>, qemu-trivial@nongnu.org,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	qemu-devel@nongnu.org, Alexander Graf <agraf@suse.de>,
	Alex Williamson <alex.williamson@redhat.com>,
	qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Paul Mackerras <paulus@samba.org>,
	David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [Qemu-trivial] [PATCH] RFC kvm irqfd: add directly mapped MSI
	IRQ support
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
X-List-Received-Date: Thu, 20 Jun 2013 15:38:49 -0000

On Fri, Jun 21, 2013 at 12:08:58AM +1000, Alexey Kardashevskiy wrote:
> At the moment QEMU creates a route for every MSI IRQ.
> 
> Now we are about to add IRQFD support on PPC64-pseries platform.
> pSeries already has in-kernel emulated interrupt controller with
> 8192 IRQs. Also, pSeries PHB already supports MSIMessage to IRQ
> mapping as a part of PAPR requirements for MSI/MSIX guests.
> Specifically, the pSeries guest does not touch MSIMessage's at
> all, instead it uses rtas_ibm_change_msi and rtas_ibm_query_interrupt_source
> rtas calls to do the mapping.
> 
> Therefore we do not really need more routing than we got already.
> The patch introduces the infrastructure to enable direct IRQ mapping.
> 
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> 
> ---
> 
> The patch is raw and ugly indeed, I made it only to demonstrate
> the idea and see if it has right to live or not.
> 
> For some reason which I do not really understand (limited GSI numbers?)
> the existing code always adds routing and I do not see why we would need it.
> 
> Thanks!
> ---
>  hw/misc/vfio.c           |   11 +++++++++--
>  hw/pci/pci.c             |   13 +++++++++++++
>  hw/ppc/spapr_pci.c       |   13 +++++++++++++
>  hw/virtio/virtio-pci.c   |   26 ++++++++++++++++++++------
>  include/hw/pci/pci.h     |    4 ++++
>  include/hw/pci/pci_bus.h |    1 +
>  6 files changed, 60 insertions(+), 8 deletions(-)
> 
> diff --git a/hw/misc/vfio.c b/hw/misc/vfio.c
> index 14aac04..2d9eef7 100644
> --- a/hw/misc/vfio.c
> +++ b/hw/misc/vfio.c
> @@ -639,7 +639,11 @@ static int vfio_msix_vector_do_use(PCIDevice *pdev, unsigned int nr,
>       * Attempt to enable route through KVM irqchip,
>       * default to userspace handling if unavailable.
>       */
> -    vector->virq = msg ? kvm_irqchip_add_msi_route(kvm_state, *msg) : -1;
> +
> +    vector->virq = msg ? pci_bus_map_msi(vdev->pdev.bus, *msg) : -1;
> +    if (vector->virq < 0) {
> +        vector->virq = msg ? kvm_irqchip_add_msi_route(kvm_state, *msg) : -1;
> +    }
>      if (vector->virq < 0 ||
>          kvm_irqchip_add_irqfd_notifier(kvm_state, &vector->interrupt,
>                                         vector->virq) < 0) {
> @@ -807,7 +811,10 @@ retry:
>           * Attempt to enable route through KVM irqchip,
>           * default to userspace handling if unavailable.
>           */
> -        vector->virq = kvm_irqchip_add_msi_route(kvm_state, msg);
> +        vector->virq = pci_bus_map_msi(vdev->pdev.bus, msg);
> +        if (vector->virq < 0) {
> +            vector->virq = kvm_irqchip_add_msi_route(kvm_state, msg);
> +        }
>          if (vector->virq < 0 ||
>              kvm_irqchip_add_irqfd_notifier(kvm_state, &vector->interrupt,
>                                             vector->virq) < 0) {
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index a976e46..a9875e9 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -1254,6 +1254,19 @@ void pci_device_set_intx_routing_notifier(PCIDevice *dev,
>      dev->intx_routing_notifier = notifier;
>  }
>  
> +void pci_bus_set_map_msi_fn(PCIBus *bus, pci_map_msi_fn map_msi_fn)
> +{
> +    bus->map_msi = map_msi_fn;
> +}
> +
> +int pci_bus_map_msi(PCIBus *bus, MSIMessage msg)
> +{
> +    if (bus->map_msi) {
> +        return bus->map_msi(bus, msg);
> +    }
> +    return -1;
> +}
> +
>  /*
>   * PCI-to-PCI bridge specification
>   * 9.1: Interrupt routing. Table 9-1
> diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
> index 80408c9..9ef9a29 100644
> --- a/hw/ppc/spapr_pci.c
> +++ b/hw/ppc/spapr_pci.c
> @@ -500,6 +500,18 @@ static void spapr_msi_write(void *opaque, hwaddr addr,
>      qemu_irq_pulse(xics_get_qirq(spapr->icp, irq));
>  }
>  
> +static int spapr_msi_get_irq(PCIBus *bus, MSIMessage msg)
> +{
> +    DeviceState *par = bus->qbus.parent;
> +    sPAPRPHBState *sphb = (sPAPRPHBState *) par;
> +    unsigned long addr = msg.address - sphb->msi_win_addr;
> +    int ndev = addr >> 16;
> +    int vec = ((addr & 0xFFFF) >> 2) | msg.data;
> +    uint32_t irq = sphb->msi_table[ndev].irq + vec;

This array seems to be SPAPR_MSIX_MAX_DEVS in size, no?
Won't this overflow if ndev is large?

> +
> +    return (int)irq;
> +}
> +
>  static const MemoryRegionOps spapr_msi_ops = {
>      /* There is no .read as the read result is undefined by PCI spec */
>      .read = NULL,
> @@ -664,6 +676,7 @@ static int _spapr_phb_init(SysBusDevice *s)
>  
>          sphb->lsi_table[i].irq = irq;
>      }
> +    pci_bus_set_map_msi_fn(bus, spapr_msi_get_irq);
>  
>      return 0;
>  }
> diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
> index d309416..587f53e 100644
> --- a/hw/virtio/virtio-pci.c
> +++ b/hw/virtio/virtio-pci.c
> @@ -472,6 +472,8 @@ static unsigned virtio_pci_get_features(DeviceState *d)
>      return proxy->host_features;
>  }
>  
> +extern int spapr_msi_get_irq(PCIBus *bus, MSIMessage *msg);
> +
>  static int kvm_virtio_pci_vq_vector_use(VirtIOPCIProxy *proxy,
>                                          unsigned int queue_no,
>                                          unsigned int vector,
> @@ -481,7 +483,10 @@ static int kvm_virtio_pci_vq_vector_use(VirtIOPCIProxy *proxy,
>      int ret;
>  
>      if (irqfd->users == 0) {
> -        ret = kvm_irqchip_add_msi_route(kvm_state, msg);
> +        ret = pci_bus_map_msi(proxy->pci_dev.bus, msg);
> +        if (ret < 0) {
> +            ret = kvm_irqchip_add_msi_route(kvm_state, msg);
> +        }
>          if (ret < 0) {
>              return ret;
>          }
> @@ -609,14 +614,23 @@ static int virtio_pci_vq_vector_unmask(VirtIOPCIProxy *proxy,
>      VirtQueue *vq = virtio_get_queue(proxy->vdev, queue_no);
>      EventNotifier *n = virtio_queue_get_guest_notifier(vq);
>      VirtIOIRQFD *irqfd;
> -    int ret = 0;
> +    int ret = 0, tmp;
>  
>      if (proxy->vector_irqfd) {
>          irqfd = &proxy->vector_irqfd[vector];
> -        if (irqfd->msg.data != msg.data || irqfd->msg.address != msg.address) {
> -            ret = kvm_irqchip_update_msi_route(kvm_state, irqfd->virq, msg);
> -            if (ret < 0) {
> -                return ret;
> +
> +        tmp = pci_bus_map_msi(proxy->pci_dev.bus, msg);
> +        if (tmp >= 0) {
> +            if (irqfd->virq != tmp) {
> +                fprintf(stderr, "FIXME: MSI(-X) vector has changed from %X to %x\n",
> +                        irqfd->virq, tmp);
> +            }
> +        } else {
> +            if (irqfd->msg.data != msg.data || irqfd->msg.address != msg.address) {
> +                ret = kvm_irqchip_update_msi_route(kvm_state, irqfd->virq, msg);
> +                if (ret < 0) {
> +                    return ret;
> +                }
>              }
>          }
>      }
> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> index 8797802..632739a 100644
> --- a/include/hw/pci/pci.h
> +++ b/include/hw/pci/pci.h
> @@ -332,6 +332,7 @@ MemoryRegion *pci_address_space_io(PCIDevice *dev);
>  typedef void (*pci_set_irq_fn)(void *opaque, int irq_num, int level);
>  typedef int (*pci_map_irq_fn)(PCIDevice *pci_dev, int irq_num);
>  typedef PCIINTxRoute (*pci_route_irq_fn)(void *opaque, int pin);
> +typedef int (*pci_map_msi_fn)(PCIBus *bus, MSIMessage msg);
>  
>  typedef enum {
>      PCI_HOTPLUG_DISABLED,
> @@ -375,6 +376,9 @@ bool pci_intx_route_changed(PCIINTxRoute *old, PCIINTxRoute *new);
>  void pci_bus_fire_intx_routing_notifier(PCIBus *bus);
>  void pci_device_set_intx_routing_notifier(PCIDevice *dev,
>                                            PCIINTxRoutingNotifier notifier);
> +void pci_bus_set_map_msi_fn(PCIBus *bus, pci_map_msi_fn map_msi_fn);
> +int pci_bus_map_msi(PCIBus *bus, MSIMessage msg);
> +
>  void pci_device_reset(PCIDevice *dev);
>  void pci_bus_reset(PCIBus *bus);
>  
> diff --git a/include/hw/pci/pci_bus.h b/include/hw/pci/pci_bus.h
> index 66762f6..81efd2b 100644
> --- a/include/hw/pci/pci_bus.h
> +++ b/include/hw/pci/pci_bus.h
> @@ -16,6 +16,7 @@ struct PCIBus {
>      pci_set_irq_fn set_irq;
>      pci_map_irq_fn map_irq;
>      pci_route_irq_fn route_intx_to_irq;
> +    pci_map_msi_fn map_msi;
>      pci_hotplug_fn hotplug;
>      DeviceState *hotplug_qdev;
>      void *irq_opaque;
> -- 
> 1.7.10.4

