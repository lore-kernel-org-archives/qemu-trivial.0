Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z7J7E-0000XJ-9M
	for mharc-qemu-trivial@gnu.org; Tue, 23 Jun 2015 03:59:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59585)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <w.bumiller@proxmox.com>) id 1Z7J7B-0000UI-SV
	for qemu-trivial@nongnu.org; Tue, 23 Jun 2015 03:59:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <w.bumiller@proxmox.com>) id 1Z7J7A-00052w-Ol
	for qemu-trivial@nongnu.org; Tue, 23 Jun 2015 03:59:29 -0400
Received: from proxmox.maurer-it.com ([94.136.31.133]:41846)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <w.bumiller@proxmox.com>)
	id 1Z7J75-0004t1-Ef; Tue, 23 Jun 2015 03:59:23 -0400
Received: from proxmox.maurer-it.com (localhost.localdomain [127.0.0.1])
	by proxmox.maurer-it.com (Proxmox) with ESMTP id 80110AD0924;
	Tue, 23 Jun 2015 09:52:32 +0200 (CEST)
Date: Tue, 23 Jun 2015 09:52:22 +0200
From: Wolfgang Bumiller <w.bumiller@proxmox.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20150623075222.GA12643@olga>
References: <cover.1434971627.git.mjt@msgid.tls.msk.ru>
	<CAFEAcA9ru4tyzXNUW0USsN13wEP4v5hGOREbPZWVOkrLDS41=Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAFEAcA9ru4tyzXNUW0USsN13wEP4v5hGOREbPZWVOkrLDS41=Q@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 94.136.31.133
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL 00/21] Trivial patches for
 2015-06-22
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
X-List-Received-Date: Tue, 23 Jun 2015 07:59:31 -0000

> Fails to build on Windows:
>=20
> util/qemu-sockets.c: In function =E2=80=98inet_parse_connect_opts=E2=80=
=99:
> util/qemu-sockets.c:338: error: =E2=80=98AI_V4MAPPED=E2=80=99 undeclare=
d (first use in

What's the procedure with the trivial pull-request here now. Should I
send a v2 of this patch to trivial, or a fix based on the trivial
branch?
It's a bit embarrassing, I should have seen this coming, as there's
already an #ifdef for AI_ADDRCONFIG to #define it to 0. So the change
would just be doing the same for V4MAPPED.

Sorry about that.

On Mon, Jun 22, 2015 at 05:02:17PM +0100, Peter Maydell wrote:
> On 22 June 2015 at 12:16, Michael Tokarev <mjt@tls.msk.ru> wrote:
> > There are a few random thing here and there.  I especially
> > want to note 2 of them:
> >
> >  - QOMification series by Gonglei
> >  - rearrangement of ./configure --help output by me
> >
> > Other than that, the stuff is really trivial.
> >
> > Please consider applying/pulling.
> >
> > /mjt
> >
> > The following changes since commit ad7020a7e7b27d468ecc2aacb04ba4eb09=
017074:
> >
> >   target-microblaze: Remove dead code (2015-06-21 17:20:16 +1000)
> >
> > are available in the git repository at:
> >
> >   git://git.corpit.ru/qemu.git tags/pull-trivial-patches-2015-06-22
> >
> > for you to fetch changes up to 43ce995c79c09595e6fbdcabecd1c8b43cf9e4=
a4:
> >
> >   util/qemu-sockets: improve ai_flag hints for ipv6 hosts (2015-06-22=
 14:08:25 +0300)
> >
> > ----------------------------------------------------------------
> > trivial patches for 2015-06-22
>=20
> Fails to build on Windows:
>=20
> util/qemu-sockets.c: In function =E2=80=98inet_parse_connect_opts=E2=80=
=99:
> util/qemu-sockets.c:338: error: =E2=80=98AI_V4MAPPED=E2=80=99 undeclare=
d (first use in
> this function)
> util/qemu-sockets.c:338: error: (Each undeclared identifier is
> reported only once
> util/qemu-sockets.c:338: error: for each function it appears in.)
> util/qemu-sockets.c: In function =E2=80=98inet_dgram_opts=E2=80=99:
> util/qemu-sockets.c:438: error: =E2=80=98AI_V4MAPPED=E2=80=99 undeclare=
d (first use in
> this function)
>=20
> (Also I had to resolve a conflict in configure, so if you rebase
> on current master you'll save me having to do it twice...)
>=20
> thanks
> -- PMM
>=20
>=20


