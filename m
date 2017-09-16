Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dt8AM-0007Mx-F3
	for mharc-qemu-trivial@gnu.org; Sat, 16 Sep 2017 04:09:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36071)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1dt8AJ-0007L2-Ec
	for qemu-trivial@nongnu.org; Sat, 16 Sep 2017 04:09:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1dt8AI-0002Kn-A5
	for qemu-trivial@nongnu.org; Sat, 16 Sep 2017 04:09:27 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45946)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>)
	id 1dt8AB-0002JX-Tg; Sat, 16 Sep 2017 04:09:20 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2A3BA61461;
	Sat, 16 Sep 2017 08:09:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 2A3BA61461
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=pbonzini@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 13AAA39BD;
	Sat, 16 Sep 2017 08:09:16 +0000 (UTC)
Received: from zmail18.collab.prod.int.phx2.redhat.com
	(zmail18.collab.prod.int.phx2.redhat.com [10.5.83.21])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BFB9D1808872;
	Sat, 16 Sep 2017 08:09:15 +0000 (UTC)
Date: Sat, 16 Sep 2017 04:09:15 -0400 (EDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Cc: Eduardo Otubo <otubo@redhat.com>, qemu-devel@nongnu.org, 
	qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>, 
	Markus Armbruster <armbru@redhat.com>, Alexander Graf <agraf@suse.de>
Message-ID: <2144615425.6261195.1505549355346.JavaMail.zimbra@redhat.com>
In-Reply-To: <20170915222113.GB10621@localhost.localdomain>
References: <20170915090643.6043-1-otubo@redhat.com>
	<0d4bdcbb-3153-0064-d280-d9ca4f0671e4@redhat.com>
	<20170915222113.GB10621@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [78.12.246.117, 10.4.196.5, 10.4.195.12]
Thread-Topic: dma/i82374: avoid double creation of i82374 device
Thread-Index: 8Mxpho57qGQUR3vD6+No3YJBqJM8qg==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Sat, 16 Sep 2017 08:09:18 +0000 (UTC)
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
X-List-Received-Date: Sat, 16 Sep 2017 08:09:28 -0000



----- Original Message -----
> From: "Eduardo Habkost" <ehabkost@redhat.com>
> To: "Paolo Bonzini" <pbonzini@redhat.com>
> Cc: "Eduardo Otubo" <otubo@redhat.com>, qemu-devel@nongnu.org, qemu-trivial@nongnu.org, "Michael Tokarev"
> <mjt@tls.msk.ru>, "Markus Armbruster" <armbru@redhat.com>, "Alexander Graf" <agraf@suse.de>
> Sent: Saturday, September 16, 2017 12:21:13 AM
> Subject: Re: [PATCH] dma/i82374: avoid double creation of i82374 device
> 
> On Fri, Sep 15, 2017 at 12:18:11PM +0200, Paolo Bonzini wrote:
> > On 15/09/2017 11:06, Eduardo Otubo wrote:
> > > QEMU fails when used with the following command line:
> > > 
> > >   ./ppc64-softmmu/qemu-system-ppc64 -S -machine 40p,accel=tcg -device
> > >   i82374
> > >   qemu-system-ppc64: hw/isa/isa-bus.c:110: isa_bus_dma: Assertion
> > >   `!bus->dma[0] && !bus->dma[1]' failed.
> > >   Aborted (core dumped)
> > > 
> > > The 40p machine type already creates the device i82374. If specified in
> > > the
> > > command line, it will try to create it again, hence generating the error.
> > > The
> > > function isa_bus_dma() isn't supposed to be called twice for the same
> > > bus. One
> > > way to avoid this problem is to set user_creatable=false.
> > > 
> > > A possible fix in a near future would be making
> > > isa_bus_dma()/DMA_init()/i82374_realize() return an error instead of
> > > asserting
> > > as well.
> > > 
> > > Signed-off-by: Eduardo Otubo <otubo@redhat.com>
> > > ---
> > >  hw/dma/i82374.c | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > > 
> > > diff --git a/hw/dma/i82374.c b/hw/dma/i82374.c
> > > index 6c0f975df0..e76dea8dc7 100644
> > > --- a/hw/dma/i82374.c
> > > +++ b/hw/dma/i82374.c
> > > @@ -139,6 +139,11 @@ static void i82374_class_init(ObjectClass *klass,
> > > void *data)
> > >      dc->realize = i82374_realize;
> > >      dc->vmsd = &vmstate_i82374;
> > >      dc->props = i82374_properties;
> > > +    dc->user_creatable = false;
> > > +    /*
> > > +     * Reason: i82374_realize() crashes (assertion failure inside
> > > isa_bus_dma()
> > > +     *         if the device is instantiated twice.
> > > +     */
> > >  }
> > >  
> > >  static const TypeInfo i82374_info = {
> > > 
> > 
> > This breaks "make check", doesn't it?
> 
> Why would it?  I don't see any test code using -device i82374.
> (endianness-test uses -device i82378).

You're right, both Aurelien and I were confused.  If you want to
accept this patch it would be fine then, even if giving an error may
be preferrable.

Paolo

