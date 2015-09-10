Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZZyPz-00072y-Lv
	for mharc-qemu-trivial@gnu.org; Thu, 10 Sep 2015 05:45:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47132)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1ZZyPv-0006w4-Vx
	for qemu-trivial@nongnu.org; Thu, 10 Sep 2015 05:45:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1ZZyPr-00039L-R6
	for qemu-trivial@nongnu.org; Thu, 10 Sep 2015 05:45:19 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33445)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>)
	id 1ZZyPk-0002ur-8W; Thu, 10 Sep 2015 05:45:08 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id 4D94D341AC6;
	Thu, 10 Sep 2015 09:45:07 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-116-16.rdu2.redhat.com
	[10.10.116.16])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t8A9j2TZ006246; Thu, 10 Sep 2015 05:45:03 -0400
To: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
References: <1441876643-7467-1-git-send-email-mst@redhat.com>
	<1441876643-7467-8-git-send-email-mst@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <55F1511D.4080406@redhat.com>
Date: Thu, 10 Sep 2015 11:45:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <1441876643-7467-8-git-send-email-mst@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Michael Tokarev <mjt@tls.msk.ru>, Don Koch <dkoch@verizon.com>,
	Marcel Apfelbaum <marcel@redhat.com>
Subject: Re: [Qemu-trivial] [PULL 7/7] hw/pci: fix pci_update_mappings()
	trace events
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
X-List-Received-Date: Thu, 10 Sep 2015 09:45:21 -0000

Hi,

On 09/10/15 11:27, Michael S. Tsirkin wrote:
> From: Laszlo Ersek <lersek@redhat.com>
> 
> The current trace prototypes and (matching) trace calls lead to
> "unorthodox" PCI BDF notation in at least the stderr trace backend. For
> example, the four BARs of a QXL video card at 00:01.0 (bus 0, slot 1,
> function 0) are traced like this (PID and timestamps removed):
> 
>   pci_update_mappings_add d=0x7f14a73bf890 00:00.1 0,0x84000000+0x4000000
>   pci_update_mappings_add d=0x7f14a73bf890 00:00.1 1,0x80000000+0x4000000
>   pci_update_mappings_add d=0x7f14a73bf890 00:00.1 2,0x88200000+0x2000
>   pci_update_mappings_add d=0x7f14a73bf890 00:00.1 3,0xd060+0x20
> 
> The slot and function values are in reverse order.
> 
> Stick with the conventional BDF notation.
> 
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Don Koch <dkoch@verizon.com>
> Cc: qemu-trivial@nongnu.org
> Fixes: 7828d75045
> Signed-off-by: Laszlo Ersek <lersek@redhat.com>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

can you please add Marcel's R-b too? From
<http://thread.gmane.org/gmane.comp.emulators.qemu/358561/focus=358673>.

Also, the patch has been picked up by Michael Tokarev for qemu-trivial,
<http://thread.gmane.org/gmane.comp.emulators.qemu/358561/focus=358673>.
I apologize for the confusion, but I really couldn't figure out myself
if this should go "only" to trivial, or to PCI "only". I guess the patch
could be dropped from exactly one of the two queues, but I also expect
that whenever the chronologically second one is going to be merged, git
will simply realize that the patch is already present.

So, my point is that please add *both* R-b tags, regardless of which
tree this is going to be pulled from first.

Also: any guidance for the next time I have a trivial patch for PCI?
Should I Cc qemu-trivial, or not?

Thanks!
Laszlo


> ---
>  hw/pci/pci.c | 4 ++--
>  trace-events | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index eba7ca2..ccea628 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -1154,16 +1154,16 @@ static void pci_update_mappings(PCIDevice *d)
>          /* now do the real mapping */
>          if (r->addr != PCI_BAR_UNMAPPED) {
>              trace_pci_update_mappings_del(d, pci_bus_num(d->bus),
> -                                          PCI_FUNC(d->devfn),
>                                            PCI_SLOT(d->devfn),
> +                                          PCI_FUNC(d->devfn),
>                                            i, r->addr, r->size);
>              memory_region_del_subregion(r->address_space, r->memory);
>          }
>          r->addr = new_addr;
>          if (r->addr != PCI_BAR_UNMAPPED) {
>              trace_pci_update_mappings_add(d, pci_bus_num(d->bus),
> -                                          PCI_FUNC(d->devfn),
>                                            PCI_SLOT(d->devfn),
> +                                          PCI_FUNC(d->devfn),
>                                            i, r->addr, r->size);
>              memory_region_add_subregion_overlap(r->address_space,
>                                                  r->addr, r->memory, 1);
> diff --git a/trace-events b/trace-events
> index 0a82f0c..1684a95 100644
> --- a/trace-events
> +++ b/trace-events
> @@ -1303,8 +1303,8 @@ spapr_pci_lsi_set(const char *busname, int pin, uint32_t irq) "%s PIN%d IRQ %u"
>  spapr_pci_msi_retry(unsigned config_addr, unsigned req_num, unsigned max_irqs) "Guest device at %x asked %u, have only %u"
>  
>  # hw/pci/pci.c
> -pci_update_mappings_del(void *d, uint32_t bus, uint32_t func, uint32_t slot, int bar, uint64_t addr, uint64_t size) "d=%p %02x:%02x.%x %d,%#"PRIx64"+%#"PRIx64
> -pci_update_mappings_add(void *d, uint32_t bus, uint32_t func, uint32_t slot, int bar, uint64_t addr, uint64_t size) "d=%p %02x:%02x.%x %d,%#"PRIx64"+%#"PRIx64
> +pci_update_mappings_del(void *d, uint32_t bus, uint32_t slot, uint32_t func, int bar, uint64_t addr, uint64_t size) "d=%p %02x:%02x.%x %d,%#"PRIx64"+%#"PRIx64
> +pci_update_mappings_add(void *d, uint32_t bus, uint32_t slot, uint32_t func, int bar, uint64_t addr, uint64_t size) "d=%p %02x:%02x.%x %d,%#"PRIx64"+%#"PRIx64
>  
>  # hw/net/pcnet.c
>  pcnet_s_reset(void *s) "s=%p"
> 





