Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dfkeq-0006MY-3k
	for mharc-qemu-trivial@gnu.org; Thu, 10 Aug 2017 06:25:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39050)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1dfken-0006Kc-Qg
	for qemu-trivial@nongnu.org; Thu, 10 Aug 2017 06:25:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1dfkem-0007Ip-Mj
	for qemu-trivial@nongnu.org; Thu, 10 Aug 2017 06:25:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42980)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cohuck@redhat.com>)
	id 1dfkef-0007G2-OT; Thu, 10 Aug 2017 06:25:29 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 84DEC7CE0E;
	Thu, 10 Aug 2017 10:25:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 84DEC7CE0E
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=cohuck@redhat.com
Received: from gondolin (ovpn-117-6.ams2.redhat.com [10.36.117.6])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 61D1B97835;
	Thu, 10 Aug 2017 10:25:23 +0000 (UTC)
Date: Thu, 10 Aug 2017 12:25:20 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>, Alex
	=?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>, Eric Blake
	<eblake@redhat.com>, Fam Zheng <famz@redhat.com>, Paolo Bonzini
	<pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>, QEMU Trivial
	<qemu-trivial@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, Markus
	Armbruster <armbru@redhat.com>, "Dr. David Alan Gilbert"
	<dgilbert@redhat.com>
Message-ID: <20170810122520.48403984.cohuck@redhat.com>
In-Reply-To: <CAFEAcA-GP53g+vfgDH1mNQnPHcrNULb+gkQk4JeJhb=8UCt+YA@mail.gmail.com>
References: <20170728053610.15770-1-f4bug@amsat.org>
	<20170728053610.15770-19-f4bug@amsat.org>
	<87mv7aumav.fsf@linaro.org>
	<8e2e3aa5-4459-76ba-3309-af6b30220346@amsat.org>
	<87fud0vmak.fsf@linaro.org>
	<3e66742f-04c5-51b7-de3a-f692c0637bc5@amsat.org>
	<20170810104604.342af354.cohuck@redhat.com>
	<CAFEAcA-GP53g+vfgDH1mNQnPHcrNULb+gkQk4JeJhb=8UCt+YA@mail.gmail.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Thu, 10 Aug 2017 10:25:28 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 18/47] MAINTAINERS: add
 missing TCG entry
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
X-List-Received-Date: Thu, 10 Aug 2017 10:25:39 -0000

On Thu, 10 Aug 2017 10:22:54 +0100
Peter Maydell <peter.maydell@linaro.org> wrote:

> On 10 August 2017 at 09:46, Cornelia Huck <cohuck@redhat.com> wrote:
> > The root problem is "some files have no maintainers". The reasons range
> > from "forgot to include the file in the pattern" (easily fixed), over
> > "file is updated via a script" (the linux-headers case), to "nobody
> > feels up to the task" (which is the worst case).
> >
> > In most cases, I don't think the recent contributors list is very
> > helpful. Somebody who simply did a tree-wide rename is unlikely to be
> > able to make a good judgment about a complicated logic change. Just
> > printing qemu-devel as the address to send this to is probably better;
> > unfortunately, it may cause patches to languish on the list if nobody
> > takes pity on them.
> >
> > Do we need someone collecting non-trivial patches like that, who either
> > pesters others or picks up the patches themselves?  
> 
> The problem is that if nobody's feeling up to the task of taking
> on a particular single file which has no maintainer, then it's
> definitely true that nobody's going to feel up to taking on
> the entire collection of unmaintained files...
> 
> I think the UI (giving no consideration to how we might implement
> this!) would ideally be something like:
>  * if anybody mails a patch which touches an "unmaintained" file,
>    a robot should send a reply along the lines of "thanks for the
>    patch; unfortunately file X is not maintained so it may be
>    tricky to get patch review for this. You'll need to be
>    persistent and do more of the legwork than if you were patching
>    a file that did have an active maintainer" so contributors
>    know when they've wandered into the swamp

That's a good idea.

>  * some mechanism for easily finding patches to unmaintained
>    files which haven't got review yet, so that anybody with some
>    spare time and interest can move some of them along (the idea
>    being to spread the load rather than trying to designate a
>    particular "owner" for this headache)

Can maybe patchew set a special flag for patches that only touch
unmaintained files?

>  * ditto for finding patches to unmaintained files which have got
>    review but which haven't been committed
> 
> thanks
> -- PMM


