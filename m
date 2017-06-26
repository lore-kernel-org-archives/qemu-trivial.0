Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dPQJA-0000na-VL
	for mharc-qemu-trivial@gnu.org; Mon, 26 Jun 2017 05:27:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54285)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1dPQJ8-0000le-KC
	for qemu-trivial@nongnu.org; Mon, 26 Jun 2017 05:27:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1dPQJ7-0000ab-Gs
	for qemu-trivial@nongnu.org; Mon, 26 Jun 2017 05:27:46 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34004)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgilbert@redhat.com>)
	id 1dPQJ4-0000Wq-Lw; Mon, 26 Jun 2017 05:27:42 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D962BC04B310;
	Mon, 26 Jun 2017 09:27:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com D962BC04B310
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=dgilbert@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com D962BC04B310
Received: from work-vm (ovpn-117-172.ams2.redhat.com [10.36.117.172])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8B00F779FC;
	Mon, 26 Jun 2017 09:27:39 +0000 (UTC)
Date: Mon, 26 Jun 2017 10:27:37 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Greg Kurz <groug@kaod.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Juan Quintela <quintela@redhat.com>
Message-ID: <20170626092735.GA2136@work-vm>
References: <20170622184255.2d44e3bd@bahia.lab.toulouse-stg.fr.ibm.com>
	<87injo6jla.fsf@secure.mitica>
	<CAFEAcA-g-=AkH3t8jOTFY_9zA6ECS57-3MS=cHPb+Q6sePzNsw@mail.gmail.com>
	<20170622172555.GE2100@work-vm>
	<20170622194649.6d251753@bahia.lab.toulouse-stg.fr.ibm.com>
	<20170622175012.GF2100@work-vm>
	<fb2c7124-2d3f-6684-e2f2-265bfb3eb6da@redhat.com>
	<CAFEAcA-A=UrkKjLmVOcFA_d4rMW1AJwGffE4r2Uy6fw++XFF6w@mail.gmail.com>
	<20170622183457.GG2100@work-vm>
	<20170622212332.38f4b434@bahia.lab.toulouse-stg.fr.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170622212332.38f4b434@bahia.lab.toulouse-stg.fr.ibm.com>
User-Agent: Mutt/1.8.2 (2017-04-18)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Mon, 26 Jun 2017 09:27:41 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Separate function types
 from opaque types in include/qemu/typedefs.h
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
X-List-Received-Date: Mon, 26 Jun 2017 09:27:47 -0000

* Greg Kurz (groug@kaod.org) wrote:
> On Thu, 22 Jun 2017 19:34:58 +0100
> "Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
> 
> > * Peter Maydell (peter.maydell@linaro.org) wrote:
> > > On 22 June 2017 at 19:08, Thomas Huth <thuth@redhat.com> wrote:  
> > > > On 22.06.2017 19:50, Dr. David Alan Gilbert wrote:  
> > > >> Could do; I'm just not finding tiny header files with one or
> > > >> two entries each that useful.  
> > > 
> > > Well, it means that the bulk of code that doesn't care about the
> > > types doesn't get its compilation fractionally slowed by having
> > > to parse the typedef anyway. In general I think we're drifting
> > > towards "have each .c file get fewer things automatically" rather
> > > than otherwise (eg more finely focused files rather than stuffing
> > > everything into qemu-common.h).  
> > 
> > At the cost of things getting fractionally slower by including lots
> > more tiny headers.
> > 
> > I generally agree in the case where there's a useful chunk,
> > but when it's down to one or two definitions I don't see the point.
> > 
> > > > Do we really need these function typedefs at all? IMHO it's quite ugly
> > > > to hide such things in a typedef unless it is really necessary (and in
> > > > this case, it does not seem to be really necessary since it is only used
> > > > in a few places). So what about simply removing the typedefs in this case?  
> > > 
> > > I find function typedefs much more readable than having the
> > > function-types inline in function arguments and the like.
> > > 
> > > This is all fairly rapidly heading into bikeshed territory
> > > though -- in the final analysis I don't think it matters
> > > much what we do.  
> > 
> > Agreed.
> > 
> 
> Last question for my own comprehension.
> 
> I can't think of a case where we would do something like:
> 
>    some_vmsd->load_state_old = some_se->ops->load_state;
> 
> Does it make sense for VMStateDescription::load_state_old and SaveVMHandlers::load_state
> to be of the same type ?

(I think this is what we discussed on irc)
There's only a few _old's and they're the same interface as the
non-_old's,   the only difference is the range of version_id's they're
prepared to take.

Dave

> > Dave
> > 
> > > thanks
> > > -- PMM  
> > --
> > Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
> 


--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

