Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bAf8T-0005Qw-KY
	for mharc-qemu-trivial@gnu.org; Wed, 08 Jun 2016 11:11:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56395)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Maciej.Rozycki@imgtec.com>) id 1bAecd-00010i-RZ
	for qemu-trivial@nongnu.org; Wed, 08 Jun 2016 10:38:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Maciej.Rozycki@imgtec.com>) id 1bAecb-0006RB-Pk
	for qemu-trivial@nongnu.org; Wed, 08 Jun 2016 10:38:18 -0400
Received: from mailapp01.imgtec.com ([195.59.15.196]:3138)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Maciej.Rozycki@imgtec.com>)
	id 1bAecX-0006QM-2e; Wed, 08 Jun 2016 10:38:13 -0400
Received: from HHMAIL01.hh.imgtec.org (unknown [10.100.10.19])
	by Forcepoint Email with ESMTPS id 4AA13B1F712BD;
	Wed,  8 Jun 2016 15:38:08 +0100 (IST)
Received: from [10.20.78.130] (10.20.78.130) by HHMAIL01.hh.imgtec.org
	(10.100.10.21) with Microsoft SMTP Server id 14.3.294.0; Wed, 8 Jun 2016
	15:38:10 +0100
Date: Wed, 8 Jun 2016 15:38:01 +0100
From: "Maciej W. Rozycki" <macro@imgtec.com>
To: Eric Blake <eblake@redhat.com>
CC: Stefan Weil <sw@weilnetz.de>, QEMU Trivial <qemu-trivial@nongnu.org>, QEMU
	Developer <qemu-devel@nongnu.org>
In-Reply-To: <57582628.9060306@redhat.com>
Message-ID: <alpine.DEB.2.00.1606081515240.10382@tp.orcam.me.uk>
References: <1463404220-5945-1-git-send-email-sw@weilnetz.de>
	<alpine.DEB.2.00.1606081305490.10382@tp.orcam.me.uk>
	<57582628.9060306@redhat.com>
User-Agent: Alpine 2.00 (DEB 1167 2008-08-23)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
X-Originating-IP: [10.20.78.130]
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.59.15.196
X-Mailman-Approved-At: Wed, 08 Jun 2016 11:11:12 -0400
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] configure: Use $(..)
 instead of deprecated `..`
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
X-List-Received-Date: Wed, 08 Jun 2016 14:38:21 -0000

On Wed, 8 Jun 2016, Eric Blake wrote:

> >  Unlike `..` the $(..) Bourne shell construct is not fully portable, some 
> > implementations do not recognise it.
> 
> All POSIX implementations support it. The only shell that doesn't is
> from Solaris /bin/sh, and that pre-dates modern OpenSolaris which has
> (finally) modernized their shell.  And I don't think we have anyone
> actively trying to build qemu for Solaris (we have bug reports for
> mingw, BSD, and Mac OS, but I haven't seen anyone complaining about a
> failed Solaris build).

 The IRIX shell doesn't support it either I believe, as I suppose some 
other older systems.  We may or may not care about them (we might as well 
kindly ask people to install bash or suchlike), but I think it makes sense 
to make it explicit.

> >  NB given the above, and especially because of the introduced functional 
> > regression mentioned, I don't think this change qualifies as trivial.
> 
> I agree that calling this trivial may be a stretch, but I see no problem
> with the patch itself if the commit message is beefed up to provide more
> justification than just "silence a lint-like tool".

 Agreed, I think it's worth the little extra time needed to write it and 
have a commit description explanatory enough for anyone to understand the 
motivation.  Having one often turns a questionable change into an obvious 
one, not to mention that someone might scratch their head staring at a 
commit years on from now as they try to understand what the author 
actually meant to do.

 I find myself doing this frequently when discovering bugs introduced to 
software 10-15 years ago with commits having little if any description (as 
per the standards of that time), trying to figure out how to fix the bug
while not breaking the original intent of the change.

  Maciej

