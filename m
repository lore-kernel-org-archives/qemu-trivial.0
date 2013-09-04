Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VH22l-0005n5-TM
	for mharc-qemu-trivial@gnu.org; Tue, 03 Sep 2013 21:38:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35540)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>) id 1VH22e-0005a8-MC
	for qemu-trivial@nongnu.org; Tue, 03 Sep 2013 21:38:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>) id 1VH22Y-0000Zf-M9
	for qemu-trivial@nongnu.org; Tue, 03 Sep 2013 21:37:56 -0400
Received: from [222.73.24.84] (port=33087 helo=song.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>)
	id 1VH22M-0000MQ-0L; Tue, 03 Sep 2013 21:37:38 -0400
X-IronPort-AV: E=Sophos;i="4.89,1017,1367942400"; d="scan'208";a="8400024"
Received: from unknown (HELO tang.cn.fujitsu.com) ([10.167.250.3])
	by song.cn.fujitsu.com with ESMTP; 04 Sep 2013 09:34:27 +0800
Received: from fnstmail02.fnst.cn.fujitsu.com (tang.cn.fujitsu.com [127.0.0.1])
	by tang.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id r841bVVK004218;
	Wed, 4 Sep 2013 09:37:32 +0800
Received: from [10.167.226.116] ([10.167.226.116])
	by fnstmail02.fnst.cn.fujitsu.com (Lotus Domino Release 8.5.3)
	with ESMTP id 2013090409352434-1200583 ;
	Wed, 4 Sep 2013 09:35:24 +0800 
From: Li Guang <lig.fnst@cn.fujitsu.com>
To: Andreas =?ISO-8859-1?Q?F=E4rber?= <afaerber@suse.de>
In-Reply-To: <52261431.5050705@suse.de>
References: <1378191917-6964-1-git-send-email-lig.fnst@cn.fujitsu.com>
	<52258E44.9010704@redhat.com> <52259F6E.3000205@suse.de>
	<5225C559.2030601@msgid.tls.msk.ru>  <52261431.5050705@suse.de>
Date: Wed, 04 Sep 2013 09:36:01 +0800
Message-ID: <1378258561.12672.9.camel@liguang.fnst.cn.fujitsu.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-MIMETrack: Itemize by SMTP Server on mailserver/fnst(Release 8.5.3|September
	15, 2011) at 2013/09/04 09:35:24,
	Serialize by Router on mailserver/fnst(Release 8.5.3|September 15,
	2011) at 2013/09/04 09:35:27,
	Serialize complete at 2013/09/04 09:35:27
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 222.73.24.84
Cc: Peter Maydell <peter.maydell@linaro.org>,
	qemu-trivial <qemu-trivial@nongnu.org>,
	Jan Kiszka <jan.kiszka@siemens.com>, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel <qemu-devel@nongnu.org>, Alexander Graf <agraf@suse.de>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
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
X-List-Received-Date: Wed, 04 Sep 2013 01:38:02 -0000

=E5=9C=A8 2013-09-03=E4=BA=8C=E7=9A=84 18:54 +0200=EF=BC=8CAndreas F=C3=A4r=
ber=E5=86=99=E9=81=93=EF=BC=9A
> Am 03.09.2013 13:17, schrieb Michael Tokarev:
> > 03.09.2013 12:35, Andreas F=C3=A4rber wrote:
> >> I also don't understand why qemu-trivial is suddenly picking up Stefan=
's
> >> arm translation patch, it used to be for unmaintained areas only. But
> >> arm is not my problem.
> >=20
> > Which patch you're talking about?  Is it "target-arm: Report unimplemen=
ted
> > opcodes (LOG_UNIMP)" ?
>=20
> Yes.
>=20
> >  If yes, that one appears to be trivial as it just
> > adds some logging before failing an instruction and should not conflict
> > with other work being done in this area.  Perhaps I was too aggressive
> > while picking up the backlog.  We should just draw the line *somewhere*=
, --
>=20
> Right, that line is what I'm reminding about here. I feel that lately an
> increasing number of contributors and reviewers are deferring patches to
> qemu-trivial that don't really belong there IMO. That Anthony doesn't
> scale to cover Blue's maintainer work as well shouldn't lead to a surge
> on qemu-trivial.
>=20
> > eg, it sure is possible to reject spelling fixes for maintained areas
> > from -trivial (like this arm tree), - will this be productive?
>=20
> No, spelling fixes are not a concern to me as they are rather unlikely
> to cause conflicts with patches being queued by submaintainers. :)
>=20
> > This change (cputlb: remove dead function) appears to be "trivial enoug=
h"
> > for me (after looking at the usage history of this function), and I'd
> > pick it up without this Andreas's request, too.
>=20
> Yes. This one here would've been okay usually, as there is no official
> maintainer for cputlb.c and it's trivial in the sense that a git-grep
> confirms it to be okay. I was just annoyed that I had to defer my pull
> twice (sent it out now) because s390x added two CPU loops and then once
> that was merged ppc added another loop, too. My upcoming 35+ patch
> series qom-cpu-13 may hopefully explain the rest once you see it.
>=20
> > As for the "suddenly" - it's not really suddenly, it's because it
> > has been Cc'd to -trivial (by someone who submitted lots of good
> > trivial patches before) and actually looks trivial, too.  And also
> > because subsystem maintainer added his Reviewed-by, apparently (or
> > hopefully) after noticing it's submitted to -trivial.  I also Cc'd
> > both maintainers in my notice that it's been applied to -trivial.
>=20
> "Suddenly" in the sense that the prupose of qemu-trivial used to be
> handling patches that would otherwise fall through the cracks.
>=20
> So by my understanding, e.g., "target-arm:" =3D> !trivial, and I would've
> expected there to be some on-list communication between PMM and you
> before CC'ing someone on a "thanks, applied" after the fact.
> By contrast, if there's a change to configure or "Fix spelling of" etc.
> then you picking it up is highly appreciated. I just don't want
> qemu-trivial becoming the least-resistance way of getting patches into
> qemu.git that might otherwise get bounced/changed by submaintainers.
>=20
> Also, I am seeing Paolo pull in huge memory changes but now pinging the
> breakage fixes rather than assembling a pull to fix the fallout. ;)
>=20
> Similarly target-i386 TCG is not suited for qemu-trivial IMO, instead
> rth or someone who works on and/or reviews it (rth?) should volunteer as
> proper maintainer.=20

 I'd like to maintain cputlb.c, can I?

> With the larger part of the community using KVM these
> days, we simply can't have that be handled by the community at large any
> more.
>=20
> So yes, I know you were on vacation and you seem eager to take up work
> again, that's great; I'm just cautioning that CC'ing everything on
> qemu-trivial (not your fault, you're on the receiving end) can't be the
> new solution, so feel encouraged to push back a little. :)
>=20
> Cheers,
> Andreas
>=20

--=20
Thanks!

Li Guang




