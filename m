Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Uqydu-0004PQ-W4
	for mharc-qemu-trivial@gnu.org; Mon, 24 Jun 2013 00:44:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51139)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.williamson@redhat.com>) id 1Uqydq-0004On-Hp
	for qemu-trivial@nongnu.org; Mon, 24 Jun 2013 00:44:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.williamson@redhat.com>) id 1Uqydp-00047v-14
	for qemu-trivial@nongnu.org; Mon, 24 Jun 2013 00:44:38 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36267)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.williamson@redhat.com>)
	id 1Uqydo-00047i-Mq; Mon, 24 Jun 2013 00:44:36 -0400
Received: from int-mx12.intmail.prod.int.phx2.redhat.com
	(int-mx12.intmail.prod.int.phx2.redhat.com [10.5.11.25])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r5O4iU3t029141
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 24 Jun 2013 00:44:30 -0400
Received: from [10.3.113.38] (ovpn-113-38.phx2.redhat.com [10.3.113.38])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r5O4iJWZ010726; Mon, 24 Jun 2013 00:44:19 -0400
Message-ID: <1372049059.30572.170.camel@ul30vt.home>
From: Alex Williamson <alex.williamson@redhat.com>
To: Anthony Liguori <anthony@codemonkey.ws>
Date: Sun, 23 Jun 2013 22:44:19 -0600
In-Reply-To: <CA+aC4kvDQW=-V3-8y-0WQrn-SZh+4jcs+FWLfGa5+VdcE01rxg@mail.gmail.com>
References: <1371737338-25148-1-git-send-email-aik@ozlabs.ru>
	<1371747090.32709.61.camel@ul30vt.home> <51C3B2E4.7000807@ozlabs.ru>
	<1371782063.30572.74.camel@ul30vt.home> <51C3BF3E.20901@ozlabs.ru>
	<1371789981.30572.114.camel@ul30vt.home>
	<CA+aC4kvDQW=-V3-8y-0WQrn-SZh+4jcs+FWLfGa5+VdcE01rxg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.25
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Anthony Liguori <aliguori@us.ibm.com>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-devel <qemu-devel@nongnu.org>,
	Alexander Graf <agraf@suse.de>, qemu-trivial@nongnu.org,
	qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Paul Mackerras <paulus@samba.org>,
	David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] RFC kvm irqfd: add directly
 mapped MSI IRQ support
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
X-List-Received-Date: Mon, 24 Jun 2013 04:44:41 -0000

On Sun, 2013-06-23 at 10:06 -0500, Anthony Liguori wrote:
> On Thu, Jun 20, 2013 at 11:46 PM, Alex Williamson
> <alex.williamson@redhat.com> wrote:
> > On Fri, 2013-06-21 at 12:49 +1000, Alexey Kardashevskiy wrote:
> >> On 06/21/2013 12:34 PM, Alex Williamson wrote:
> >>
> >>
> >> Do not follow you, sorry. For x86, is it that MSI routing table which is
> >> updated via KVM_SET_GSI_ROUTING in KVM? When there is no KVM, what piece of
> >> code responds on msi_notify() in qemu-x86 and does qemu_irq_pulse()?
> >
> > vfio_msi_interrupt->msi[x]_notify->stl_le_phys(msg.address, msg.data)
> >
> > This writes directly to the interrupt block on the vCPU.  With KVM, the
> > in-kernel APIC does the same write, where the pin to MSIMessage is setup
> > by kvm_irqchip_add_msi_route and the pin is pulled by an irqfd.
> 
> What is this "interrupt block on the vCPU" you speak of?  I reviewed
> the SDM and see nothing in the APIC protocol or the brief description
> of MSI as a PCI concept that would indicate anything except that the
> PHB handles MSI writes and feeds them to the I/O APIC.

In all likelihood I'm recalling ia64 details and trying to apply them to
x86.  Does the MSIMessage not actually get written to the LAPIC on the
CPU?  Thanks,

Alex

> In fact, the wikipedia article on MSI has:
> 
> "A common misconception with Message Signaled Interrupts is that they
> allow the device to send data to a processor as part of the interrupt.
> The data that is sent as part of the write is used by the chipset to
> determine which interrupt to trigger on which processor; it is not
> available for the device to communicate additional information to the
> interrupt handler."
> 
> > Do I understand that on POWER the MSI from the device is intercepted at
> > the PHB and converted to an IRQ that's triggered by some means other
> > than a MSI write?
> 
> This is exactly the same thing that happens on x86, no?  Can you point
> me to something in the SDM that says otherwise?
> 
> Regards,
> 
> Anthony Liguori
> 
> >  So to correctly model the hardware, vfio should do a
> > msi_notify() that does a stl_le_phys that terminates at this IRQ
> > remapper thing and in turn toggles a qemu_irq.  MSIMessage is only
> > extraneous data if you want to skip over hardware blocks.
> >
> > Maybe you could add a device parameter to kvm_irqchip_add_msi_route so
> > that it can be implemented on POWER without this pci_bus_map_msi
> > interface that seems very unique to POWER.  Thanks,
> >
> > Alex
> >
> >> >>>> ---
> >> >>>>  hw/misc/vfio.c           |   11 +++++++++--
> >> >>>>  hw/pci/pci.c             |   13 +++++++++++++
> >> >>>>  hw/ppc/spapr_pci.c       |   13 +++++++++++++
> >> >>>>  hw/virtio/virtio-pci.c   |   26 ++++++++++++++++++++------
> >> >>>>  include/hw/pci/pci.h     |    4 ++++
> >> >>>>  include/hw/pci/pci_bus.h |    1 +
> >> >>>>  6 files changed, 60 insertions(+), 8 deletions(-)
> >> >>>>
> >> >>>> diff --git a/hw/misc/vfio.c b/hw/misc/vfio.c
> >> >>>> index 14aac04..2d9eef7 100644
> >> >>>> --- a/hw/misc/vfio.c
> >> >>>> +++ b/hw/misc/vfio.c
> >> >>>> @@ -639,7 +639,11 @@ static int vfio_msix_vector_do_use(PCIDevice *pdev, unsigned int nr,
> >> >>>>       * Attempt to enable route through KVM irqchip,
> >> >>>>       * default to userspace handling if unavailable.
> >> >>>>       */
> >> >>>> -    vector->virq = msg ? kvm_irqchip_add_msi_route(kvm_state, *msg) : -1;
> >> >>>> +
> >> >>>> +    vector->virq = msg ? pci_bus_map_msi(vdev->pdev.bus, *msg) : -1;
> >> >>>> +    if (vector->virq < 0) {
> >> >>>> +        vector->virq = msg ? kvm_irqchip_add_msi_route(kvm_state, *msg) : -1;
> >> >>>> +    }
> >> >>>>      if (vector->virq < 0 ||
> >> >>>>          kvm_irqchip_add_irqfd_notifier(kvm_state, &vector->interrupt,
> >> >>>>                                         vector->virq) < 0) {
> >> >>>> @@ -807,7 +811,10 @@ retry:
> >> >>>>           * Attempt to enable route through KVM irqchip,
> >> >>>>           * default to userspace handling if unavailable.
> >> >>>>           */
> >> >>>> -        vector->virq = kvm_irqchip_add_msi_route(kvm_state, msg);
> >> >>>> +        vector->virq = pci_bus_map_msi(vdev->pdev.bus, msg);
> >> >>>> +        if (vector->virq < 0) {
> >> >>>> +            vector->virq = kvm_irqchip_add_msi_route(kvm_state, msg);
> >> >>>> +        }
> >> >>>>          if (vector->virq < 0 ||
> >> >>>>              kvm_irqchip_add_irqfd_notifier(kvm_state, &vector->interrupt,
> >> >>>>                                             vector->virq) < 0) {
> >> >>>> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> >> >>>> index a976e46..a9875e9 100644
> >> >>>> --- a/hw/pci/pci.c
> >> >>>> +++ b/hw/pci/pci.c
> >> >>>> @@ -1254,6 +1254,19 @@ void pci_device_set_intx_routing_notifier(PCIDevice *dev,
> >> >>>>      dev->intx_routing_notifier = notifier;
> >> >>>>  }
> >> >>>>
> >> >>>> +void pci_bus_set_map_msi_fn(PCIBus *bus, pci_map_msi_fn map_msi_fn)
> >> >>>> +{
> >> >>>> +    bus->map_msi = map_msi_fn;
> >> >>>> +}
> >> >>>> +
> >> >>>> +int pci_bus_map_msi(PCIBus *bus, MSIMessage msg)
> >> >>>> +{
> >> >>>> +    if (bus->map_msi) {
> >> >>>> +        return bus->map_msi(bus, msg);
> >> >>>> +    }
> >> >>>> +    return -1;
> >> >>>> +}
> >> >>>> +
> >> >>>>  /*
> >> >>>>   * PCI-to-PCI bridge specification
> >> >>>>   * 9.1: Interrupt routing. Table 9-1
> >> >>>> diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
> >> >>>> index 80408c9..9ef9a29 100644
> >> >>>> --- a/hw/ppc/spapr_pci.c
> >> >>>> +++ b/hw/ppc/spapr_pci.c
> >> >>>> @@ -500,6 +500,18 @@ static void spapr_msi_write(void *opaque, hwaddr addr,
> >> >>>>      qemu_irq_pulse(xics_get_qirq(spapr->icp, irq));
> >> >>>>  }
> >> >>>>
> >> >>>> +static int spapr_msi_get_irq(PCIBus *bus, MSIMessage msg)
> >> >>>> +{
> >> >>>> +    DeviceState *par = bus->qbus.parent;
> >> >>>> +    sPAPRPHBState *sphb = (sPAPRPHBState *) par;
> >> >>>> +    unsigned long addr = msg.address - sphb->msi_win_addr;
> >> >>>> +    int ndev = addr >> 16;
> >> >>>> +    int vec = ((addr & 0xFFFF) >> 2) | msg.data;
> >> >>>> +    uint32_t irq = sphb->msi_table[ndev].irq + vec;
> >> >>>> +
> >> >>>> +    return (int)irq;
> >> >>>> +}
> >> >>>> +
> >> >>>>  static const MemoryRegionOps spapr_msi_ops = {
> >> >>>>      /* There is no .read as the read result is undefined by PCI spec */
> >> >>>>      .read = NULL,
> >> >>>> @@ -664,6 +676,7 @@ static int _spapr_phb_init(SysBusDevice *s)
> >> >>>>
> >> >>>>          sphb->lsi_table[i].irq = irq;
> >> >>>>      }
> >> >>>> +    pci_bus_set_map_msi_fn(bus, spapr_msi_get_irq);
> >> >>>>
> >> >>>>      return 0;
> >> >>>>  }
> >> >>>> diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
> >> >>>> index d309416..587f53e 100644
> >> >>>> --- a/hw/virtio/virtio-pci.c
> >> >>>> +++ b/hw/virtio/virtio-pci.c
> >> >>>> @@ -472,6 +472,8 @@ static unsigned virtio_pci_get_features(DeviceState *d)
> >> >>>>      return proxy->host_features;
> >> >>>>  }
> >> >>>>
> >> >>>> +extern int spapr_msi_get_irq(PCIBus *bus, MSIMessage *msg);
> >> >>>> +
> >> >>>>  static int kvm_virtio_pci_vq_vector_use(VirtIOPCIProxy *proxy,
> >> >>>>                                          unsigned int queue_no,
> >> >>>>                                          unsigned int vector,
> >> >>>> @@ -481,7 +483,10 @@ static int kvm_virtio_pci_vq_vector_use(VirtIOPCIProxy *proxy,
> >> >>>>      int ret;
> >> >>>>
> >> >>>>      if (irqfd->users == 0) {
> >> >>>> -        ret = kvm_irqchip_add_msi_route(kvm_state, msg);
> >> >>>> +        ret = pci_bus_map_msi(proxy->pci_dev.bus, msg);
> >> >>>> +        if (ret < 0) {
> >> >>>> +            ret = kvm_irqchip_add_msi_route(kvm_state, msg);
> >> >>>> +        }
> >> >>>>          if (ret < 0) {
> >> >>>>              return ret;
> >> >>>>          }
> >> >>>> @@ -609,14 +614,23 @@ static int virtio_pci_vq_vector_unmask(VirtIOPCIProxy *proxy,
> >> >>>>      VirtQueue *vq = virtio_get_queue(proxy->vdev, queue_no);
> >> >>>>      EventNotifier *n = virtio_queue_get_guest_notifier(vq);
> >> >>>>      VirtIOIRQFD *irqfd;
> >> >>>> -    int ret = 0;
> >> >>>> +    int ret = 0, tmp;
> >> >>>>
> >> >>>>      if (proxy->vector_irqfd) {
> >> >>>>          irqfd = &proxy->vector_irqfd[vector];
> >> >>>> -        if (irqfd->msg.data != msg.data || irqfd->msg.address != msg.address) {
> >> >>>> -            ret = kvm_irqchip_update_msi_route(kvm_state, irqfd->virq, msg);
> >> >>>> -            if (ret < 0) {
> >> >>>> -                return ret;
> >> >>>> +
> >> >>>> +        tmp = pci_bus_map_msi(proxy->pci_dev.bus, msg);
> >> >>>> +        if (tmp >= 0) {
> >> >>>> +            if (irqfd->virq != tmp) {
> >> >>>> +                fprintf(stderr, "FIXME: MSI(-X) vector has changed from %X to %x\n",
> >> >>>> +                        irqfd->virq, tmp);
> >> >>>> +            }
> >> >>>> +        } else {
> >> >>>> +            if (irqfd->msg.data != msg.data || irqfd->msg.address != msg.address) {
> >> >>>> +                ret = kvm_irqchip_update_msi_route(kvm_state, irqfd->virq, msg);
> >> >>>> +                if (ret < 0) {
> >> >>>> +                    return ret;
> >> >>>> +                }
> >> >>>>              }
> >> >>>>          }
> >> >>>>      }
> >> >>>> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> >> >>>> index 8797802..632739a 100644
> >> >>>> --- a/include/hw/pci/pci.h
> >> >>>> +++ b/include/hw/pci/pci.h
> >> >>>> @@ -332,6 +332,7 @@ MemoryRegion *pci_address_space_io(PCIDevice *dev);
> >> >>>>  typedef void (*pci_set_irq_fn)(void *opaque, int irq_num, int level);
> >> >>>>  typedef int (*pci_map_irq_fn)(PCIDevice *pci_dev, int irq_num);
> >> >>>>  typedef PCIINTxRoute (*pci_route_irq_fn)(void *opaque, int pin);
> >> >>>> +typedef int (*pci_map_msi_fn)(PCIBus *bus, MSIMessage msg);
> >> >>>>
> >> >>>>  typedef enum {
> >> >>>>      PCI_HOTPLUG_DISABLED,
> >> >>>> @@ -375,6 +376,9 @@ bool pci_intx_route_changed(PCIINTxRoute *old, PCIINTxRoute *new);
> >> >>>>  void pci_bus_fire_intx_routing_notifier(PCIBus *bus);
> >> >>>>  void pci_device_set_intx_routing_notifier(PCIDevice *dev,
> >> >>>>                                            PCIINTxRoutingNotifier notifier);
> >> >>>> +void pci_bus_set_map_msi_fn(PCIBus *bus, pci_map_msi_fn map_msi_fn);
> >> >>>> +int pci_bus_map_msi(PCIBus *bus, MSIMessage msg);
> >> >>>> +
> >> >>>>  void pci_device_reset(PCIDevice *dev);
> >> >>>>  void pci_bus_reset(PCIBus *bus);
> >> >>>>
> >> >>>> diff --git a/include/hw/pci/pci_bus.h b/include/hw/pci/pci_bus.h
> >> >>>> index 66762f6..81efd2b 100644
> >> >>>> --- a/include/hw/pci/pci_bus.h
> >> >>>> +++ b/include/hw/pci/pci_bus.h
> >> >>>> @@ -16,6 +16,7 @@ struct PCIBus {
> >> >>>>      pci_set_irq_fn set_irq;
> >> >>>>      pci_map_irq_fn map_irq;
> >> >>>>      pci_route_irq_fn route_intx_to_irq;
> >> >>>> +    pci_map_msi_fn map_msi;
> >> >>>>      pci_hotplug_fn hotplug;
> >> >>>>      DeviceState *hotplug_qdev;
> >> >>>>      void *irq_opaque;
> >> >>>
> >> >>>
> >> >>>
> >> >>
> >> >>
> >> >
> >> >
> >> >
> >>
> >>
> >
> >
> >
> >




