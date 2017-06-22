Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dO5ru-0004Bi-4m
	for mharc-qemu-trivial@gnu.org; Thu, 22 Jun 2017 13:26:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34637)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1dO5rr-00049o-5q
	for qemu-trivial@nongnu.org; Thu, 22 Jun 2017 13:26:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1dO5rq-0002DD-6S
	for qemu-trivial@nongnu.org; Thu, 22 Jun 2017 13:26:07 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55424)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgilbert@redhat.com>)
	id 1dO5rl-0002Bk-4A; Thu, 22 Jun 2017 13:26:01 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BA97D635C1;
	Thu, 22 Jun 2017 17:25:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com BA97D635C1
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=dgilbert@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com BA97D635C1
Received: from work-vm (ovpn-117-226.ams2.redhat.com [10.36.117.226])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 667215C7A9;
	Thu, 22 Jun 2017 17:25:58 +0000 (UTC)
Date: Thu, 22 Jun 2017 18:25:55 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Juan Quintela <quintela@redhat.com>, Greg Kurz <groug@kaod.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>
Message-ID: <20170622172555.GE2100@work-vm>
References: <149814756006.27338.8723356702388175951.stgit@bahia>
	<CAFEAcA8yqb8ykP8nCnoVNQUZd851RhOLFf2TfkHZmL2je+pP=Q@mail.gmail.com>
	<20170622184255.2d44e3bd@bahia.lab.toulouse-stg.fr.ibm.com>
	<87injo6jla.fsf@secure.mitica>
	<CAFEAcA-g-=AkH3t8jOTFY_9zA6ECS57-3MS=cHPb+Q6sePzNsw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA-g-=AkH3t8jOTFY_9zA6ECS57-3MS=cHPb+Q6sePzNsw@mail.gmail.com>
User-Agent: Mutt/1.8.2 (2017-04-18)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Thu, 22 Jun 2017 17:26:00 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] Separate function types from opaque
 types in include/qemu/typedefs.h
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
X-List-Received-Date: Thu, 22 Jun 2017 17:26:08 -0000

* Peter Maydell (peter.maydell@linaro.org) wrote:
> On 22 June 2017 at 18:03, Juan Quintela <quintela@redhat.com> wrote:
> > Greg Kurz <groug@kaod.org> wrote:
> >> On Thu, 22 Jun 2017 17:14:08 +0100
> >> Peter Maydell <peter.maydell@linaro.org> wrote:
> >>
> >>> On 22 June 2017 at 17:06, Greg Kurz <groug@kaod.org> wrote:
> >>> > Function types cannot reside in the same sorted list as opaque types since
> >>> > they may depend on a type which would be defined later.
> >>> >
> >>> > Of course, the same problem could arise if a function type depends on
> >>> > another function type with greater alphabetical order. Hopefully we
> >>> > don't have that at this time.
> >>>
> >>> The other approach would be to put function types somewhere
> >>> else and leave typedefs.h for the simple 'opaque types
> >>> for structures' that it was started as.
> >>>
> >>> For instance we have include/qemu/fprintf-fn.h as a precedent.
> >>>
> >>
> >> Indeed, and I'm not quite sure why Juan decided to put these types into
> >> typedefs.h instead of a dedicated header file in include/migration... is
> >> it only because it was the quickest fix ?
> >
> > All other typedefs were defined there.  I can create a different include
> > file, but I think that is "overengineering", no?  They are typedefs,
> > just not of structs.  But I agree that they are the only ones.
> 
> Well, the comment in the file says "opaque types so that device init
> declarations don't have to pull in all the real definitions", whereas
> the ones you've added aren't opaque types, they are the real
> definitions. They're also only used by a very small subset of .c
> files, whereas typedefs.h goes everywhere.

mv fprintf-fn.f   fn-typedefs.h

move those two defs into that?

Dave

> thanks
> -- PMM
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

