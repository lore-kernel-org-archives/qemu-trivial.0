Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dg9Il-0008MC-JW
	for mharc-qemu-trivial@gnu.org; Fri, 11 Aug 2017 08:44:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35344)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1dg9Ij-0008Jr-I7
	for qemu-trivial@nongnu.org; Fri, 11 Aug 2017 08:44:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1dg9Ii-0002Db-Hh
	for qemu-trivial@nongnu.org; Fri, 11 Aug 2017 08:44:29 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39342)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <famz@redhat.com>)
	id 1dg9Ic-0002Am-5O; Fri, 11 Aug 2017 08:44:22 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A7DB22D0FB3;
	Fri, 11 Aug 2017 12:44:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com A7DB22D0FB3
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=famz@redhat.com
Received: from localhost (ovpn-12-60.pek2.redhat.com [10.72.12.60])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9C0CAB32AB;
	Fri, 11 Aug 2017 12:44:19 +0000 (UTC)
Date: Fri, 11 Aug 2017 20:44:18 +0800
From: Fam Zheng <famz@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Cornelia Huck <cohuck@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Markus Armbruster <armbru@redhat.com>, Richard Henderson <rth@twiddle.net>
Message-ID: <20170811124418.GC23309@lemon.lan>
References: <20170728053610.15770-19-f4bug@amsat.org>
	<87mv7aumav.fsf@linaro.org>
	<8e2e3aa5-4459-76ba-3309-af6b30220346@amsat.org>
	<87fud0vmak.fsf@linaro.org>
	<3e66742f-04c5-51b7-de3a-f692c0637bc5@amsat.org>
	<20170810104604.342af354.cohuck@redhat.com>
	<CAFEAcA-GP53g+vfgDH1mNQnPHcrNULb+gkQk4JeJhb=8UCt+YA@mail.gmail.com>
	<20170810122520.48403984.cohuck@redhat.com>
	<20170811075455.GC27391@lemon.lan>
	<1ac44263-dc9a-b16e-df10-09253b566b1b@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1ac44263-dc9a-b16e-df10-09253b566b1b@redhat.com>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Fri, 11 Aug 2017 12:44:20 +0000 (UTC)
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
X-List-Received-Date: Fri, 11 Aug 2017 12:44:30 -0000

On Fri, 08/11 14:06, Paolo Bonzini wrote:
> On 11/08/2017 09:54, Fam Zheng wrote:
> > On Thu, 08/10 12:25, Cornelia Huck wrote:
> >>> I think the UI (giving no consideration to how we might implement
> >>> this!) would ideally be something like:
> >>>  * if anybody mails a patch which touches an "unmaintained" file,
> >>>    a robot should send a reply along the lines of "thanks for the
> >>>    patch; unfortunately file X is not maintained so it may be
> >>>    tricky to get patch review for this. You'll need to be
> >>>    persistent and do more of the legwork than if you were patching
> >>>    a file that did have an active maintainer" so contributors
> >>>    know when they've wandered into the swamp
> >>
> >> That's a good idea.
> >>
> >>>  * some mechanism for easily finding patches to unmaintained
> >>>    files which haven't got review yet, so that anybody with some
> >>>    spare time and interest can move some of them along (the idea
> >>>    being to spread the load rather than trying to designate a
> >>>    particular "owner" for this headache)
> >>
> >> Can maybe patchew set a special flag for patches that only touch
> >> unmaintained files?
> > 
> > Interesting idea. We have a number of patch status tracking feature requests for
> > patchew already. We can tackle them one by one. (The next priority is implement
> > "merged".)
> 
> Do you use github issues?

I have a private trello board that is slightly more up to date, but github
issues does have a few entries too. We can certainly discuss things there.

Fam

