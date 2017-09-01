Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dno7w-0006dP-RO
	for mharc-qemu-trivial@gnu.org; Fri, 01 Sep 2017 11:45:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54069)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1dno7q-0006NB-EK
	for qemu-trivial@nongnu.org; Fri, 01 Sep 2017 11:44:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1dno7h-0004Fe-03
	for qemu-trivial@nongnu.org; Fri, 01 Sep 2017 11:44:54 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53142)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1dno7Z-0004Ar-TI; Fri, 01 Sep 2017 11:44:38 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C30D41F574;
	Fri,  1 Sep 2017 15:44:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com C30D41F574
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=ehabkost@redhat.com
Received: from localhost (ovpn-116-66.gru2.redhat.com [10.97.116.66])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9ADCD9568A;
	Fri,  1 Sep 2017 15:44:32 +0000 (UTC)
Date: Fri, 1 Sep 2017 12:44:30 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: Eduardo Otubo <otubo@redhat.com>, mst@redhat.com,
	qemu-trivial@nongnu.org, Alexander Graf <agraf@suse.de>,
	qemu-devel@nongnu.org, qemu-ppc@nongnu.org, pbonzini@redhat.com,
	Aurelien Jarno <aurelien@aurel32.net>,
	David Gibson <david@gibson.dropbear.id.au>
Message-ID: <20170901154430.GN7570@localhost.localdomain>
References: <20170901110332.32650-1-otubo@redhat.com>
	<20170901143016.GK7570@localhost.localdomain>
	<87lglyzb3p.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87lglyzb3p.fsf@dusky.pond.sub.org>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Fri, 01 Sep 2017 15:44:36 +0000 (UTC)
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
X-List-Received-Date: Fri, 01 Sep 2017 15:44:59 -0000

On Fri, Sep 01, 2017 at 05:34:34PM +0200, Markus Armbruster wrote:
> Eduardo Habkost <ehabkost@redhat.com> writes:
> 
> > i82374 is compiled in only on ppc and sh4, so I'm CCing the
> > maintainers for those architectures.
> >
> > On Fri, Sep 01, 2017 at 01:03:32PM +0200, Eduardo Otubo wrote:
> >> When used with the following command line:
> >> 
> >>  ./ppc64-softmmu/qemu-system-ppc64 -S -machine 40p,accel=tcg -device i82374
> >> 
> >> QEMU with machine type 40p already creates the device i82374. If
> >> specified in the command line, it will try to create it again, hence
> >> generating the error.
> >
> > Which error?
> >
> >
> >>                       One way to avoid this problem is to set
> >> user_creatable=false.
> >> 
> >> Signed-off-by: Eduardo Otubo <otubo@redhat.com>
> >
> > The patch does more than just avoiding double creation: it
> > prevents usage of "-device i82374" completely.
> >
> > Maybe nobody needs it to work with -device today (would the
> > device even work?) and it is OK to set user_creatable=false until
> > we fix the crash.  But we need to be sure of that.
> >
> >> ---
> >>  hw/dma/i82374.c | 1 +
> >>  1 file changed, 1 insertion(+)
> >> 
> >> diff --git a/hw/dma/i82374.c b/hw/dma/i82374.c
> >> index 6c0f975df0..5275d822e0 100644
> >> --- a/hw/dma/i82374.c
> >> +++ b/hw/dma/i82374.c
> >> @@ -139,6 +139,7 @@ static void i82374_class_init(ObjectClass *klass, void *data)
> >>      dc->realize = i82374_realize;
> >>      dc->vmsd = &vmstate_i82374;
> >>      dc->props = i82374_properties;
> >> +    dc->user_creatable = false;
> >
> > A "Reason:" comment explaining why user_creatable=false is
> > mandatory.  See the comment above user_creatable declaration in
> > qdev-core.h for reference.
> >
> > I suggest the following:
> >
> >     /*
> >      * Reason: i82374_realize() crashes (assertion failure inside isa_bus_dma()
> >      *         if the device is instantiated twice.
> >      */
> 
> We need to find out *why* it crashes.  Once we know, we can likely write
> a better comment.

It crashes because isa_bus_dma() isn't supposed to be called
twice for the same bus.

Making isa_bus_dma()/DMA_init()/i82374_realize() return an error
instead of asserting would be even better than setting
user_creatable=false.

-- 
Eduardo

