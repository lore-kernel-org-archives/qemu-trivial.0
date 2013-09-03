Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VGtsL-0007u9-Pn
	for mharc-qemu-trivial@gnu.org; Tue, 03 Sep 2013 12:54:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42292)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1VGtsD-0007hC-1c
	for qemu-trivial@nongnu.org; Tue, 03 Sep 2013 12:54:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1VGts5-000713-DO
	for qemu-trivial@nongnu.org; Tue, 03 Sep 2013 12:54:36 -0400
Received: from cantor2.suse.de ([195.135.220.15]:45762 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1VGtrq-0006zU-EC; Tue, 03 Sep 2013 12:54:14 -0400
Received: from relay1.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id E3719A51B7;
	Tue,  3 Sep 2013 18:54:12 +0200 (CEST)
Message-ID: <52261431.5050705@suse.de>
Date: Tue, 03 Sep 2013 18:54:09 +0200
From: =?ISO-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>
References: <1378191917-6964-1-git-send-email-lig.fnst@cn.fujitsu.com>
	<52258E44.9010704@redhat.com> <52259F6E.3000205@suse.de>
	<5225C559.2030601@msgid.tls.msk.ru>
In-Reply-To: <5225C559.2030601@msgid.tls.msk.ru>
X-Enigmail-Version: 1.5.2
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x
X-Received-From: 195.135.220.15
Cc: Peter Maydell <peter.maydell@linaro.org>,
	qemu-trivial <qemu-trivial@nongnu.org>,
	Jan Kiszka <jan.kiszka@siemens.com>, Alexander Graf <agraf@suse.de>,
	qemu-devel <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	liguang <lig.fnst@cn.fujitsu.com>, Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-trivial] [PATCH] cputlb: remove dead function
	tlb_update_dirty
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
X-List-Received-Date: Tue, 03 Sep 2013 16:54:44 -0000

Am 03.09.2013 13:17, schrieb Michael Tokarev:
> 03.09.2013 12:35, Andreas F=E4rber wrote:
>> I also don't understand why qemu-trivial is suddenly picking up Stefan=
's
>> arm translation patch, it used to be for unmaintained areas only. But
>> arm is not my problem.
>=20
> Which patch you're talking about?  Is it "target-arm: Report unimplemen=
ted
> opcodes (LOG_UNIMP)" ?

Yes.

>  If yes, that one appears to be trivial as it just
> adds some logging before failing an instruction and should not conflict
> with other work being done in this area.  Perhaps I was too aggressive
> while picking up the backlog.  We should just draw the line *somewhere*=
, --

Right, that line is what I'm reminding about here. I feel that lately an
increasing number of contributors and reviewers are deferring patches to
qemu-trivial that don't really belong there IMO. That Anthony doesn't
scale to cover Blue's maintainer work as well shouldn't lead to a surge
on qemu-trivial.

> eg, it sure is possible to reject spelling fixes for maintained areas
> from -trivial (like this arm tree), - will this be productive?

No, spelling fixes are not a concern to me as they are rather unlikely
to cause conflicts with patches being queued by submaintainers. :)

> This change (cputlb: remove dead function) appears to be "trivial enoug=
h"
> for me (after looking at the usage history of this function), and I'd
> pick it up without this Andreas's request, too.

Yes. This one here would've been okay usually, as there is no official
maintainer for cputlb.c and it's trivial in the sense that a git-grep
confirms it to be okay. I was just annoyed that I had to defer my pull
twice (sent it out now) because s390x added two CPU loops and then once
that was merged ppc added another loop, too. My upcoming 35+ patch
series qom-cpu-13 may hopefully explain the rest once you see it.

> As for the "suddenly" - it's not really suddenly, it's because it
> has been Cc'd to -trivial (by someone who submitted lots of good
> trivial patches before) and actually looks trivial, too.  And also
> because subsystem maintainer added his Reviewed-by, apparently (or
> hopefully) after noticing it's submitted to -trivial.  I also Cc'd
> both maintainers in my notice that it's been applied to -trivial.

"Suddenly" in the sense that the prupose of qemu-trivial used to be
handling patches that would otherwise fall through the cracks.

So by my understanding, e.g., "target-arm:" =3D> !trivial, and I would've
expected there to be some on-list communication between PMM and you
before CC'ing someone on a "thanks, applied" after the fact.
By contrast, if there's a change to configure or "Fix spelling of" etc.
then you picking it up is highly appreciated. I just don't want
qemu-trivial becoming the least-resistance way of getting patches into
qemu.git that might otherwise get bounced/changed by submaintainers.

Also, I am seeing Paolo pull in huge memory changes but now pinging the
breakage fixes rather than assembling a pull to fix the fallout. ;)

Similarly target-i386 TCG is not suited for qemu-trivial IMO, instead
rth or someone who works on and/or reviews it (rth?) should volunteer as
proper maintainer. With the larger part of the community using KVM these
days, we simply can't have that be handled by the community at large any
more.

So yes, I know you were on vacation and you seem eager to take up work
again, that's great; I'm just cautioning that CC'ing everything on
qemu-trivial (not your fault, you're on the receiving end) can't be the
new solution, so feel encouraged to push back a little. :)

Cheers,
Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg

