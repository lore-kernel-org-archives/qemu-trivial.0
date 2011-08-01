Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QnnuA-0008Kw-Dm
	for mharc-qemu-trivial@gnu.org; Mon, 01 Aug 2011 04:31:18 -0400
Received: from eggs.gnu.org ([140.186.70.92]:51077)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <yamahata@valinux.co.jp>) id 1Qnnu7-0008B2-4L
	for qemu-trivial@nongnu.org; Mon, 01 Aug 2011 04:31:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <yamahata@valinux.co.jp>) id 1Qnnu5-00031b-Ge
	for qemu-trivial@nongnu.org; Mon, 01 Aug 2011 04:31:14 -0400
Received: from mail.valinux.co.jp ([210.128.90.3]:54372)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <yamahata@valinux.co.jp>)
	id 1Qnnu2-0002zz-Ig; Mon, 01 Aug 2011 04:31:10 -0400
Received: from ps.local.valinux.co.jp (vagw.valinux.co.jp [210.128.90.14])
	by mail.valinux.co.jp (Postfix) with SMTP id 20C02874EE;
	Mon,  1 Aug 2011 17:31:06 +0900 (JST)
Received: (nullmailer pid 23865 invoked by uid 1000);
	Mon, 01 Aug 2011 08:31:06 -0000
Date: Mon, 1 Aug 2011 17:31:06 +0900
From: Isaku Yamahata <yamahata@valinux.co.jp>
To: David Gibson <david@gibson.dropbear.id.au>
Message-ID: <20110801083106.GH31494@valinux.co.jp>
References: <1312181462-29889-1-git-send-email-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1312181462-29889-1-git-send-email-david@gibson.dropbear.id.au>
User-Agent: Mutt/1.5.19 (2009-01-05)
X-Virus-Scanned: clamav-milter 0.95.2 at va-mail.local.valinux.co.jp
X-Virus-Status: Clean
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 210.128.90.3
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, mst@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Correctly assign PCI domain
	numbers
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
X-List-Received-Date: Mon, 01 Aug 2011 08:31:16 -0000

[Added mst to Cc.]

In order to use multi PCI domain, several areas need to be addressed
in addition to this patch. For example, bios, acpi dsdt.
Do you have any plan for addressing those area?
What's your motivation for multi pci domain?
NOTE: I'm not opposing to this patch. Just curious for your motivation/plan.

On Mon, Aug 01, 2011 at 04:51:02PM +1000, David Gibson wrote:
> qemu already almost supports PCI domains; that is, several entirely
> independent PCI host bridges on the same machine.  However, a bug in
> pci_bus_new_inplace() means that every host bridge gets assigned domain
> number zero and so can't be properly distinguished.  This patch fixes the
> bug, giving each new host bridge a new domain number.
> 
> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> ---
>  hw/pci.c |    5 ++++-
>  1 files changed, 4 insertions(+), 1 deletions(-)
> 
> diff --git a/hw/pci.c b/hw/pci.c
> index 36db58b..2b4aecb 100644
> --- a/hw/pci.c
> +++ b/hw/pci.c
> @@ -262,6 +262,8 @@ int pci_find_domain(const PCIBus *bus)
>      return -1;
>  }
>  
> +static int pci_next_domain; /* = 0 */
> +
>  void pci_bus_new_inplace(PCIBus *bus, DeviceState *parent,
>                           const char *name,
>                           MemoryRegion *address_space,
> @@ -274,7 +276,8 @@ void pci_bus_new_inplace(PCIBus *bus, DeviceState *parent,
>  
>      /* host bridge */
>      QLIST_INIT(&bus->child);
> -    pci_host_bus_register(0, bus); /* for now only pci domain 0 is supported */
> +
> +    pci_host_bus_register(pci_next_domain++, bus);
>  
>      vmstate_register(NULL, -1, &vmstate_pcibus, bus);
>  }
> -- 
> 1.7.5.4
> 
> 

-- 
yamahata

