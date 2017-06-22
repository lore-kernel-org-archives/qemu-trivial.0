Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dO6wj-0001Et-Jk
	for mharc-qemu-trivial@gnu.org; Thu, 22 Jun 2017 14:35:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51061)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1dO6wf-00018R-Ge
	for qemu-trivial@nongnu.org; Thu, 22 Jun 2017 14:35:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1dO6we-0001Ch-N4
	for qemu-trivial@nongnu.org; Thu, 22 Jun 2017 14:35:09 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42276)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgilbert@redhat.com>)
	id 1dO6wZ-00019P-JK; Thu, 22 Jun 2017 14:35:03 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 63D07C0587EB;
	Thu, 22 Jun 2017 18:35:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 63D07C0587EB
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=dgilbert@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 63D07C0587EB
Received: from work-vm (ovpn-117-226.ams2.redhat.com [10.36.117.226])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A721565E83;
	Thu, 22 Jun 2017 18:35:00 +0000 (UTC)
Date: Thu, 22 Jun 2017 19:34:58 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>, Greg Kurz <groug@kaod.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Juan Quintela <quintela@redhat.com>
Message-ID: <20170622183457.GG2100@work-vm>
References: <149814756006.27338.8723356702388175951.stgit@bahia>
	<CAFEAcA8yqb8ykP8nCnoVNQUZd851RhOLFf2TfkHZmL2je+pP=Q@mail.gmail.com>
	<20170622184255.2d44e3bd@bahia.lab.toulouse-stg.fr.ibm.com>
	<87injo6jla.fsf@secure.mitica>
	<CAFEAcA-g-=AkH3t8jOTFY_9zA6ECS57-3MS=cHPb+Q6sePzNsw@mail.gmail.com>
	<20170622172555.GE2100@work-vm>
	<20170622194649.6d251753@bahia.lab.toulouse-stg.fr.ibm.com>
	<20170622175012.GF2100@work-vm>
	<fb2c7124-2d3f-6684-e2f2-265bfb3eb6da@redhat.com>
	<CAFEAcA-A=UrkKjLmVOcFA_d4rMW1AJwGffE4r2Uy6fw++XFF6w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA-A=UrkKjLmVOcFA_d4rMW1AJwGffE4r2Uy6fw++XFF6w@mail.gmail.com>
User-Agent: Mutt/1.8.2 (2017-04-18)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Thu, 22 Jun 2017 18:35:02 +0000 (UTC)
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
X-List-Received-Date: Thu, 22 Jun 2017 18:35:10 -0000

* Peter Maydell (peter.maydell@linaro.org) wrote:
> On 22 June 2017 at 19:08, Thomas Huth <thuth@redhat.com> wrote:
> > On 22.06.2017 19:50, Dr. David Alan Gilbert wrote:
> >> Could do; I'm just not finding tiny header files with one or
> >> two entries each that useful.
> 
> Well, it means that the bulk of code that doesn't care about the
> types doesn't get its compilation fractionally slowed by having
> to parse the typedef anyway. In general I think we're drifting
> towards "have each .c file get fewer things automatically" rather
> than otherwise (eg more finely focused files rather than stuffing
> everything into qemu-common.h).

At the cost of things getting fractionally slower by including lots
more tiny headers.

I generally agree in the case where there's a useful chunk,
but when it's down to one or two definitions I don't see the point.

> > Do we really need these function typedefs at all? IMHO it's quite ugly
> > to hide such things in a typedef unless it is really necessary (and in
> > this case, it does not seem to be really necessary since it is only used
> > in a few places). So what about simply removing the typedefs in this case?
> 
> I find function typedefs much more readable than having the
> function-types inline in function arguments and the like.
> 
> This is all fairly rapidly heading into bikeshed territory
> though -- in the final analysis I don't think it matters
> much what we do.

Agreed.

Dave

> thanks
> -- PMM
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

