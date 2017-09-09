Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dqngX-0008FR-OO
	for mharc-qemu-trivial@gnu.org; Sat, 09 Sep 2017 17:53:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58577)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1dqngS-0008Dt-VI
	for qemu-trivial@nongnu.org; Sat, 09 Sep 2017 17:53:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1dqngS-0000C3-9Q
	for qemu-trivial@nongnu.org; Sat, 09 Sep 2017 17:53:01 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59518)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1dqngK-00008i-4s; Sat, 09 Sep 2017 17:52:52 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E87474DD4B;
	Sat,  9 Sep 2017 21:52:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com E87474DD4B
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=ehabkost@redhat.com
Received: from localhost (ovpn-116-45.gru2.redhat.com [10.97.116.45])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 36F4E5C552;
	Sat,  9 Sep 2017 21:52:45 +0000 (UTC)
Date: Sat, 9 Sep 2017 18:52:43 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Eduardo Otubo <otubo@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>, mst@redhat.com,
	qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Alexander Graf <agraf@suse.de>, qemu-ppc@nongnu.org,
	pbonzini@redhat.com, David Gibson <david@gibson.dropbear.id.au>
Message-ID: <20170909215243.GK7570@localhost.localdomain>
References: <20170901110332.32650-1-otubo@redhat.com>
	<20170901143016.GK7570@localhost.localdomain>
	<87lglyzb3p.fsf@dusky.pond.sub.org>
	<20170901154430.GN7570@localhost.localdomain>
	<20170907083829.GB2441@vader>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170907083829.GB2441@vader>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Sat, 09 Sep 2017 21:52:51 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] dma/i82374: avoid double
 creation of i82374 device
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sat, 09 Sep 2017 21:53:05 -0000

On Thu, Sep 07, 2017 at 10:38:29AM +0200, Eduardo Otubo wrote:
> On Fri, Sep 01, 2017 at 12:44:30PM -0300, Eduardo Habkost wrote:
> > On Fri, Sep 01, 2017 at 05:34:34PM +0200, Markus Armbruster wrote:
> > > Eduardo Habkost <ehabkost@redhat.com> writes:
> > > > On Fri, Sep 01, 2017 at 01:03:32PM +0200, Eduardo Otubo wrote:
[...]
> > > >> diff --git a/hw/dma/i82374.c b/hw/dma/i82374.c
> > > >> index 6c0f975df0..5275d822e0 100644
> > > >> --- a/hw/dma/i82374.c
> > > >> +++ b/hw/dma/i82374.c
> > > >> @@ -139,6 +139,7 @@ static void i82374_class_init(ObjectClass *klass, void *data)
> > > >>      dc->realize = i82374_realize;
> > > >>      dc->vmsd = &vmstate_i82374;
> > > >>      dc->props = i82374_properties;
> > > >> +    dc->user_creatable = false;
> > > >
> > > > A "Reason:" comment explaining why user_creatable=false is
> > > > mandatory.  See the comment above user_creatable declaration in
> > > > qdev-core.h for reference.
> > > >
> > > > I suggest the following:
> > > >
> > > >     /*
> > > >      * Reason: i82374_realize() crashes (assertion failure inside isa_bus_dma()
> > > >      *         if the device is instantiated twice.
> > > >      */
> 
> I agree with the comment above. If there's nothing left to fix/add
> I'll just send a v2 for this shortly.

I suggest amending it with the additional info below, explaining
that isa_bus_dma() isn't supposed to be called twice, and that we
need to make isa_bus_dma()/DMA_init()/i82374_realize() return an
appropriate error if the device is instantiated twice.


> 
> > > 
> > > We need to find out *why* it crashes.  Once we know, we can likely write
> > > a better comment.
> > 
> > It crashes because isa_bus_dma() isn't supposed to be called
> > twice for the same bus.
> > 
> > Making isa_bus_dma()/DMA_init()/i82374_realize() return an error
> > instead of asserting would be even better than setting
> > user_creatable=false.
> > 
> > -- 
> > Eduardo
> > 
> 
> -- 
> Eduardo Otubo
> Senior Software Engineer @ RedHat

-- 
Eduardo

