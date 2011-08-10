Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Qqz6x-0002jL-48
	for mharc-qemu-trivial@gnu.org; Tue, 09 Aug 2011 23:05:39 -0400
Received: from eggs.gnu.org ([140.186.70.92]:44656)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1Qqz6v-0002ao-09
	for qemu-trivial@nongnu.org; Tue, 09 Aug 2011 23:05:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1Qqz6s-00011c-H7
	for qemu-trivial@nongnu.org; Tue, 09 Aug 2011 23:05:36 -0400
Received: from ozlabs.org ([203.10.76.45]:56125)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>)
	id 1Qqz6k-00010C-G5; Tue, 09 Aug 2011 23:05:26 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id B1CD1B6F83; Wed, 10 Aug 2011 13:05:22 +1000 (EST)
Date: Wed, 10 Aug 2011 13:05:19 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20110810030519.GG23511@yookeroo.fritz.box>
Mail-Followup-To: "Michael S. Tsirkin" <mst@redhat.com>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <1312181462-29889-1-git-send-email-david@gibson.dropbear.id.au>
	<20110801101038.GE5439@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20110801101038.GE5439@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 203.10.76.45
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
X-List-Received-Date: Wed, 10 Aug 2011 03:05:38 -0000

On Mon, Aug 01, 2011 at 01:10:38PM +0300, Michael S. Tsirkin wrote:
> On Mon, Aug 01, 2011 at 04:51:02PM +1000, David Gibson wrote:
> > qemu already almost supports PCI domains; that is, several entirely
> > independent PCI host bridges on the same machine.  However, a bug in
> > pci_bus_new_inplace() means that every host bridge gets assigned domain
> > number zero and so can't be properly distinguished.  This patch fixes the
> > bug, giving each new host bridge a new domain number.
> > 
> > Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> 
> OK, but I'd like to see the whole picture.
> How does the guest detect multiple domains,
> and how does it access them?
> 
> > ---
> >  hw/pci.c |    5 ++++-
> >  1 files changed, 4 insertions(+), 1 deletions(-)
> > 
> > diff --git a/hw/pci.c b/hw/pci.c
> > index 36db58b..2b4aecb 100644
> > --- a/hw/pci.c
> > +++ b/hw/pci.c
> > @@ -262,6 +262,8 @@ int pci_find_domain(const PCIBus *bus)
> >      return -1;
> >  }
> >  
> > +static int pci_next_domain; /* = 0 */
> > +
> >  void pci_bus_new_inplace(PCIBus *bus, DeviceState *parent,
> >                           const char *name,
> >                           MemoryRegion *address_space,
> > @@ -274,7 +276,8 @@ void pci_bus_new_inplace(PCIBus *bus, DeviceState *parent,
> >  
> >      /* host bridge */
> >      QLIST_INIT(&bus->child);
> > -    pci_host_bus_register(0, bus); /* for now only pci domain 0 is supported */
> > +
> > +    pci_host_bus_register(pci_next_domain++, bus);
> 
> What happens when that overflows?

Well, I guess we get an overlap, and therefore multiple domains with
the same number.

So, exactly what happens now, only four billion times less often.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

