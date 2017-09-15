Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dspBd-0001QH-OW
	for mharc-qemu-trivial@gnu.org; Fri, 15 Sep 2017 07:53:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37058)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <otubo@redhat.com>) id 1dspBb-0001OQ-BZ
	for qemu-trivial@nongnu.org; Fri, 15 Sep 2017 07:53:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <otubo@redhat.com>) id 1dspBa-00021g-GV
	for qemu-trivial@nongnu.org; Fri, 15 Sep 2017 07:53:31 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35016)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <otubo@redhat.com>)
	id 1dspBW-0001pp-1a; Fri, 15 Sep 2017 07:53:26 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5C5CF7F3E4;
	Fri, 15 Sep 2017 11:53:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 5C5CF7F3E4
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=otubo@redhat.com
Received: from vader (ovpn-117-76.ams2.redhat.com [10.36.117.76])
	by smtp.corp.redhat.com (Postfix) with SMTP id 709527047E;
	Fri, 15 Sep 2017 11:53:17 +0000 (UTC)
Date: Fri, 15 Sep 2017 13:53:16 +0200
From: Eduardo Otubo <otubo@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>, ehabkost@redhat.com,
	Markus Armbruster <armbru@redhat.com>, Alexander Graf <agraf@suse.de>
Message-ID: <20170915115316.GA13920@vader>
References: <20170915090643.6043-1-otubo@redhat.com>
	<0d4bdcbb-3153-0064-d280-d9ca4f0671e4@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0d4bdcbb-3153-0064-d280-d9ca4f0671e4@redhat.com>
User-Agent: Mutt/1.8.3+47 (5f034395e53d) (2017-05-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Fri, 15 Sep 2017 11:53:23 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] dma/i82374: avoid double creation of
 i82374 device
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
X-List-Received-Date: Fri, 15 Sep 2017 11:53:32 -0000

On Fri, Sep 15, 2017 at 12:18:11PM +0200, Paolo Bonzini wrote:
> On 15/09/2017 11:06, Eduardo Otubo wrote:
> > QEMU fails when used with the following command line:
> > 
> >   ./ppc64-softmmu/qemu-system-ppc64 -S -machine 40p,accel=tcg -device i82374
> >   qemu-system-ppc64: hw/isa/isa-bus.c:110: isa_bus_dma: Assertion `!bus->dma[0] && !bus->dma[1]' failed.
> >   Aborted (core dumped)
> > 
> > The 40p machine type already creates the device i82374. If specified in the
> > command line, it will try to create it again, hence generating the error. The
> > function isa_bus_dma() isn't supposed to be called twice for the same bus. One
> > way to avoid this problem is to set user_creatable=false.
> > 
> > A possible fix in a near future would be making
> > isa_bus_dma()/DMA_init()/i82374_realize() return an error instead of asserting
> > as well.
> > 
> > Signed-off-by: Eduardo Otubo <otubo@redhat.com>
> > ---
> >  hw/dma/i82374.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/hw/dma/i82374.c b/hw/dma/i82374.c
> > index 6c0f975df0..e76dea8dc7 100644
> > --- a/hw/dma/i82374.c
> > +++ b/hw/dma/i82374.c
> > @@ -139,6 +139,11 @@ static void i82374_class_init(ObjectClass *klass, void *data)
> >      dc->realize = i82374_realize;
> >      dc->vmsd = &vmstate_i82374;
> >      dc->props = i82374_properties;
> > +    dc->user_creatable = false;
> > +    /*
> > +     * Reason: i82374_realize() crashes (assertion failure inside isa_bus_dma()
> > +     *         if the device is instantiated twice.
> > +     */
> >  }
> >  
> >  static const TypeInfo i82374_info = {
> > 
> 
> This breaks "make check", doesn't it?
> 
> v2 should be the one that returns an error instead of asserting.

I guess I have misunderstood, then. I'll work on a patch to propagate
the error then.

Thanks,

-- 
Eduardo Otubo
Senior Software Engineer @ RedHat

