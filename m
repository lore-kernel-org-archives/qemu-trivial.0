Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XWkvm-0001kM-B7
	for mharc-qemu-trivial@gnu.org; Wed, 24 Sep 2014 07:40:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43029)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <tklauser@sym2.noone.org>) id 1XWkvg-0001ew-I7
	for qemu-trivial@nongnu.org; Wed, 24 Sep 2014 07:40:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <tklauser@sym2.noone.org>) id 1XWkvc-0003jD-4N
	for qemu-trivial@nongnu.org; Wed, 24 Sep 2014 07:40:16 -0400
Received: from sym2.noone.org ([178.63.92.236]:36281)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <tklauser@sym2.noone.org>)
	id 1XWkvS-0003VD-PT; Wed, 24 Sep 2014 07:40:02 -0400
Received: by sym2.noone.org (Postfix, from userid 1002)
	id 150FD135A006; Wed, 24 Sep 2014 13:39:56 +0200 (CEST)
Date: Wed, 24 Sep 2014 13:39:56 +0200
From: Tobias Klauser <tklauser@distanz.ch>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20140924113955.GB3408@distanz.ch>
References: <1411061124-21108-1-git-send-email-tklauser@distanz.ch>
	<542279B5.7070502@msgid.tls.msk.ru>
	<CAFEAcA_q=L6vk0Snn3a2wz+VzvXXCGm6D+ZakD=HCDw1F7rP1w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA_q=L6vk0Snn3a2wz+VzvXXCGm6D+ZakD=HCDw1F7rP1w@mail.gmail.com>
X-Editor: Vi IMproved 7.3
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 178.63.92.236
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] disas/arm: Remove
 redefinition of ATTRIBUTE_UNUSED
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 24 Sep 2014 11:40:21 -0000

On 2014-09-24 at 11:09:42 +0200, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 24 September 2014 00:58, Michael Tokarev <mjt@tls.msk.ru> wrote:
> > 18.09.2014 21:25, Tobias Klauser wrote:
> >> ATTRIBUTE_UNUSED is already defined in disas/bfd.h, which is included.
> >> Thus, there is no need to redefine it.
> >
> > Is there any harm in keeping it here?
> >
> > While it really is a redifinition, I'm not sure what's the right thing
> > here.  This whole code is not from qemu, it is an external source imported,
> > and that source is being maintained (but under different license as has
> > already been discussed, so keeping changes at minimum might not be that
> > good idea anymore).  On the other hand this symbol is so common it should
> > be defined in a common header.  Yet on another hand, for these external
> > sources wich has public API, it might not be a good idea to define it in
> > a header to start with, because it might clash with project-local define,
> > so it might be better to define it in either private header or in individual
> > source.
> 
> So my take on the disas/ sources is:
>  * yes, they're from an external source
>  * but as you say, we're never going to take another drop from that
>    external source so we should feel free to make local bugfixes
>    and changes as we need to
>  * on the other hand, there's no point in making gratuitous changes
>    to them (they're never going to match the QEMU coding style,
>    for instance)
> 
> So what's the rationale for this particular change? The duplication
> is harmless, so why worry about it...

There's no particular reason, I just found it odd to see a redefinition
of the macro there and I didn't know about the external source of the
code - please just ignore the patch then.

Thanks
Tobias

