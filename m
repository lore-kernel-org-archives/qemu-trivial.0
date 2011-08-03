Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QoYS8-00071q-44
	for mharc-qemu-trivial@gnu.org; Wed, 03 Aug 2011 06:13:28 -0400
Received: from eggs.gnu.org ([140.186.70.92]:60107)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QoYS4-00071X-Sp
	for qemu-trivial@nongnu.org; Wed, 03 Aug 2011 06:13:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QoYS3-00079L-D1
	for qemu-trivial@nongnu.org; Wed, 03 Aug 2011 06:13:24 -0400
Received: from mail-ww0-f53.google.com ([74.125.82.53]:35250)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1QoYS3-00079H-5q; Wed, 03 Aug 2011 06:13:23 -0400
Received: by wwf26 with SMTP id 26so586671wwf.10
	for <multiple recipients>; Wed, 03 Aug 2011 03:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=QYb+NE3I0yghZ50l1hg6BqHnozBA6cH/YjjJqD8/W9k=;
	b=Sylx8DCi3LcKELayPheZFwcsnwYlQ8tFJSnA7Iz1LY4siXSxGxZBTnAxec4dNJbyBU
	2OJlvKW79Z3Uecn//hOch9M+W6nTmfKtCXfT6sfWCLiNKZYxxnlRqphKXmoB2DVau/w2
	48wePY02CeWEoRiQtqkRp07//srchfQP7Gqak=
Received: by 10.216.135.99 with SMTP id t77mr470070wei.113.1312366402234;
	Wed, 03 Aug 2011 03:13:22 -0700 (PDT)
Received: from stefanha-thinkpad.localdomain ([109.224.133.37])
	by mx.google.com with ESMTPS id e56sm427847wed.41.2011.08.03.03.13.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 03 Aug 2011 03:13:21 -0700 (PDT)
Date: Wed, 3 Aug 2011 11:13:15 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20110803101315.GA4658@stefanha-thinkpad.localdomain>
References: <1312181462-29889-1-git-send-email-david@gibson.dropbear.id.au>
	<20110801101038.GE5439@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20110801101038.GE5439@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 74.125.82.53
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
X-List-Received-Date: Wed, 03 Aug 2011 10:13:26 -0000

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

In what scenario do we reach such a high number?  (I'm not saying this
is harmless, just trying to understand if it should be an assert or
error return.)

Stefan

