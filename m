Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QnpRv-0007xo-3S
	for mharc-qemu-trivial@gnu.org; Mon, 01 Aug 2011 06:10:15 -0400
Received: from eggs.gnu.org ([140.186.70.92]:55500)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1QnpRr-0007mH-SL
	for qemu-trivial@nongnu.org; Mon, 01 Aug 2011 06:10:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1QnpRr-0000xg-0C
	for qemu-trivial@nongnu.org; Mon, 01 Aug 2011 06:10:11 -0400
Received: from mx1.redhat.com ([209.132.183.28]:13261)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>)
	id 1QnpRo-0000w7-CF; Mon, 01 Aug 2011 06:10:08 -0400
Received: from int-mx01.intmail.prod.int.phx2.redhat.com
	(int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p71AA41L004624
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 1 Aug 2011 06:10:04 -0400
Received: from redhat.com (vpn-203-136.tlv.redhat.com [10.35.203.136])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with SMTP
	id p71AA1u8020709; Mon, 1 Aug 2011 06:10:02 -0400
Date: Mon, 1 Aug 2011 13:10:38 +0300
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Gibson <david@gibson.dropbear.id.au>
Message-ID: <20110801101038.GE5439@redhat.com>
References: <1312181462-29889-1-git-send-email-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1312181462-29889-1-git-send-email-david@gibson.dropbear.id.au>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.11
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] Correctly assign PCI domain numbers
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
X-List-Received-Date: Mon, 01 Aug 2011 10:10:12 -0000

On Mon, Aug 01, 2011 at 04:51:02PM +1000, David Gibson wrote:
> qemu already almost supports PCI domains; that is, several entirely
> independent PCI host bridges on the same machine.  However, a bug in
> pci_bus_new_inplace() means that every host bridge gets assigned domain
> number zero and so can't be properly distinguished.  This patch fixes the
> bug, giving each new host bridge a new domain number.
> 
> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>

OK, but I'd like to see the whole picture.
How does the guest detect multiple domains,
and how does it access them?

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

What happens when that overflows?

>  
>      vmstate_register(NULL, -1, &vmstate_pcibus, bus);
>  }
> -- 
> 1.7.5.4
> 

