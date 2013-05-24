Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Uffkr-0008Q1-JS
	for mharc-qemu-trivial@gnu.org; Thu, 23 May 2013 20:21:09 -0400
Received: from eggs.gnu.org ([208.118.235.92]:54223)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>) id 1Uffkk-0008FR-5l
	for qemu-trivial@nongnu.org; Thu, 23 May 2013 20:21:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>) id 1Uffkf-000089-Cq
	for qemu-trivial@nongnu.org; Thu, 23 May 2013 20:21:02 -0400
Received: from [222.73.24.84] (port=15316 helo=song.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>)
	id 1UffkV-0008WF-5u; Thu, 23 May 2013 20:20:47 -0400
X-IronPort-AV: E=Sophos;i="4.87,730,1363104000"; 
   d="scan'208";a="7349909"
Received: from unknown (HELO tang.cn.fujitsu.com) ([10.167.250.3])
	by song.cn.fujitsu.com with ESMTP; 24 May 2013 08:17:55 +0800
Received: from fnstmail02.fnst.cn.fujitsu.com (tang.cn.fujitsu.com [127.0.0.1])
	by tang.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id r4O0KjV1024108;
	Fri, 24 May 2013 08:20:45 +0800
Received: from [10.167.233.147] ([10.167.233.147])
	by fnstmail02.fnst.cn.fujitsu.com (Lotus Domino Release 8.5.3)
	with ESMTP id 2013052408192432-1492409 ;
	Fri, 24 May 2013 08:19:24 +0800 
From: li guang <lig.fnst@cn.fujitsu.com>
To: Andreas =?ISO-8859-1?Q?F=E4rber?= <afaerber@suse.de>
In-Reply-To: <519E1408.4060602@suse.de>
References: <1369292323-31762-1-git-send-email-lig.fnst@cn.fujitsu.com>
	<519E1408.4060602@suse.de>
Date: Fri, 24 May 2013 08:20:35 +0800
Message-ID: <1369354835.5142.192.camel@liguang.fnst.cn.fujitsu.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-MIMETrack: Itemize by SMTP Server on mailserver/fnst(Release 8.5.3|September
	15, 2011) at 2013/05/24 08:19:24,
	Serialize by Router on mailserver/fnst(Release 8.5.3|September 15,
	2011) at 2013/05/24 08:19:24,
	Serialize complete at 2013/05/24 08:19:24
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 222.73.24.84
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH][v4 1/3] debugcon: fix
 always print "addr=0x0, val=0x0" bug when use DEBUG_DEBUGCON
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
X-List-Received-Date: Fri, 24 May 2013 00:21:08 -0000

=E5=9C=A8 2013-05-23=E5=9B=9B=E7=9A=84 15:05 +0200=EF=BC=8CAndreas F=C3=A4r=
ber=E5=86=99=E9=81=93=EF=BC=9A
> Am 23.05.2013 08:58, schrieb liguang:
> > when use DEBUG_DEBUGCON, screen spits:
> > debugcon: write addr=3D0x0000 val=3D0x00
> > Rdebugcon: write addr=3D0x0000 val=3D0x00
> > udebugcon: write addr=3D0x0000 val=3D0x00
> > ndebugcon: write addr=3D0x0000 val=3D0x00
> > ndebugcon: write addr=3D0x0000 val=3D0x00
> > idebugcon: write addr=3D0x0000 val=3D0x00
> > ndebugcon: write addr=3D0x0000 val=3D0x00
> > gdebugcon: write addr=3D0x0000 val=3D0x00
> >  debugcon: write addr=3D0x0000 val=3D0x00
> > odebugcon: write addr=3D0x0000 val=3D0x00
> > pdebugcon: write addr=3D0x0000 val=3D0x00
> > tdebugcon: write addr=3D0x0000 val=3D0x00
> > idebugcon: write addr=3D0x0000 val=3D0x00
> > odebugcon: write addr=3D0x0000 val=3D0x00
> > ndebugcon: write addr=3D0x0000 val=3D0x00
> >  debugcon: write addr=3D0x0000 val=3D0x00
> > rdebugcon: write addr=3D0x0000 val=3D0x00
> > odebugcon: write addr=3D0x0000 val=3D0x00
> > mdebugcon: write addr=3D0x0000 val=3D0x00
> >  debugcon: write addr=3D0x0000 val=3D0x00
> > adebugcon: write addr=3D0x0000 val=3D0x00
> > tdebugcon: write addr=3D0x0000 val=3D0x00
> >  debugcon: write addr=3D0x0000 val=3D0x00
> >=20
> > Oh, that's wrong, val is not always be 0.
> > this bug caused by lack of length modifier
> > for specifier 'x'.
> >=20
> > Signed-off-by: liguang <lig.fnst@cn.fujitsu.com>
> > ---
> > v4: fix misleading subject
>=20
> As I've reminded before, please prepend a cover letter (0/x) when
> sending more than once patch!

OK, I'll write cover-letter.
I thought since they are trivial patch, you'll not mind=20
that I sent without cover-letter before.

Thanks!

>=20
> > ---
> >  hw/char/debugcon.c |    2 +-
> >  1 files changed, 1 insertions(+), 1 deletions(-)
> >=20
> > diff --git a/hw/char/debugcon.c b/hw/char/debugcon.c
> > index 02c9577..7e41c90 100644
> > --- a/hw/char/debugcon.c
> > +++ b/hw/char/debugcon.c
> > @@ -55,7 +55,7 @@ static void debugcon_ioport_write(void *opaque, hwadd=
r addr, uint64_t val,
> >      unsigned char ch =3D val;
> > =20
> >  #ifdef DEBUG_DEBUGCON
> > -    printf("debugcon: write addr=3D0x%04x val=3D0x%02x\n", addr, val);
> > +    printf("debugcon: write addr=3D0x%04" HWADDR_PRIx " val=3D0x%02x\n=
", addr, val);
>=20
> Please merge 3/3 with this patch - the changes are pretty obviously
> correct, so you can shorten the commit message by dropping the example
> output.
>=20
> Andreas
>=20
> >  #endif
> > =20
> >      qemu_chr_fe_write(s->chr, &ch, 1);
> >=20
>=20
>=20



