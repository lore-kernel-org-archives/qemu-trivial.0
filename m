Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QoYZZ-000214-50
	for mharc-qemu-trivial@gnu.org; Wed, 03 Aug 2011 06:21:09 -0400
Received: from eggs.gnu.org ([140.186.70.92]:49193)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1QoYZV-0001p6-SE
	for qemu-trivial@nongnu.org; Wed, 03 Aug 2011 06:21:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1QoYZU-0008Ln-Qe
	for qemu-trivial@nongnu.org; Wed, 03 Aug 2011 06:21:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52085)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>)
	id 1QoYZU-0008Lc-DW; Wed, 03 Aug 2011 06:21:04 -0400
Received: from int-mx01.intmail.prod.int.phx2.redhat.com
	(int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p73AKx3C028667
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 3 Aug 2011 06:20:59 -0400
Received: from redhat.com (vpn-203-160.tlv.redhat.com [10.35.203.160])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with SMTP
	id p73AKuod013739; Wed, 3 Aug 2011 06:20:57 -0400
Date: Wed, 3 Aug 2011 13:21:35 +0300
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Message-ID: <20110803102135.GB9497@redhat.com>
References: <1312181462-29889-1-git-send-email-david@gibson.dropbear.id.au>
	<20110801101038.GE5439@redhat.com>
	<20110803101315.GA4658@stefanha-thinkpad.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20110803101315.GA4658@stefanha-thinkpad.localdomain>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.11
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	David Gibson <david@gibson.dropbear.id.au>
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
X-List-Received-Date: Wed, 03 Aug 2011 10:21:07 -0000

On Wed, Aug 03, 2011 at 11:13:15AM +0100, Stefan Hajnoczi wrote:
> On Mon, Aug 01, 2011 at 01:10:38PM +0300, Michael S. Tsirkin wrote:
> > On Mon, Aug 01, 2011 at 04:51:02PM +1000, David Gibson wrote:
> > > qemu already almost supports PCI domains; that is, several entirely
> > > independent PCI host bridges on the same machine.  However, a bug in
> > > pci_bus_new_inplace() means that every host bridge gets assigned domain
> > > number zero and so can't be properly distinguished.  This patch fixes the
> > > bug, giving each new host bridge a new domain number.
> > > 
> > > Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> > 
> > OK, but I'd like to see the whole picture.
> > How does the guest detect multiple domains,
> > and how does it access them?
> > 
> > > ---
> > >  hw/pci.c |    5 ++++-
> > >  1 files changed, 4 insertions(+), 1 deletions(-)
> > > 
> > > diff --git a/hw/pci.c b/hw/pci.c
> > > index 36db58b..2b4aecb 100644
> > > --- a/hw/pci.c
> > > +++ b/hw/pci.c
> > > @@ -262,6 +262,8 @@ int pci_find_domain(const PCIBus *bus)
> > >      return -1;
> > >  }
> > >  
> > > +static int pci_next_domain; /* = 0 */
> > > +
> > >  void pci_bus_new_inplace(PCIBus *bus, DeviceState *parent,
> > >                           const char *name,
> > >                           MemoryRegion *address_space,
> > > @@ -274,7 +276,8 @@ void pci_bus_new_inplace(PCIBus *bus, DeviceState *parent,
> > >  
> > >      /* host bridge */
> > >      QLIST_INIT(&bus->child);
> > > -    pci_host_bus_register(0, bus); /* for now only pci domain 0 is supported */
> > > +
> > > +    pci_host_bus_register(pci_next_domain++, bus);
> > 
> > What happens when that overflows?
> 
> In what scenario do we reach such a high number?  (I'm not saying this
> is harmless, just trying to understand if it should be an assert or
> error return.)
> 
> Stefan

Can bus ever get hot-plugged?

