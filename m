Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UffsO-0003IH-9W
	for mharc-qemu-trivial@gnu.org; Thu, 23 May 2013 20:28:56 -0400
Received: from eggs.gnu.org ([208.118.235.92]:55602)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>) id 1UffsI-00037O-OX
	for qemu-trivial@nongnu.org; Thu, 23 May 2013 20:28:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>) id 1UffsD-00049X-HM
	for qemu-trivial@nongnu.org; Thu, 23 May 2013 20:28:50 -0400
Received: from [222.73.24.84] (port=10628 helo=song.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>)
	id 1Uffry-0003sZ-AV; Thu, 23 May 2013 20:28:30 -0400
X-IronPort-AV: E=Sophos;i="4.87,730,1363104000"; 
   d="scan'208";a="7349949"
Received: from unknown (HELO tang.cn.fujitsu.com) ([10.167.250.3])
	by song.cn.fujitsu.com with ESMTP; 24 May 2013 08:25:37 +0800
Received: from fnstmail02.fnst.cn.fujitsu.com (tang.cn.fujitsu.com [127.0.0.1])
	by tang.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id r4O0SR1Y024414;
	Fri, 24 May 2013 08:28:27 +0800
Received: from [10.167.233.147] ([10.167.233.147])
	by fnstmail02.fnst.cn.fujitsu.com (Lotus Domino Release 8.5.3)
	with ESMTP id 2013052408270663-1492530 ;
	Fri, 24 May 2013 08:27:06 +0800 
From: li guang <lig.fnst@cn.fujitsu.com>
To: Andreas =?ISO-8859-1?Q?F=E4rber?= <afaerber@suse.de>
In-Reply-To: <519E145D.8040205@suse.de>
References: <1369292323-31762-1-git-send-email-lig.fnst@cn.fujitsu.com>
	<1369292323-31762-2-git-send-email-lig.fnst@cn.fujitsu.com>
	<519E145D.8040205@suse.de>
Date: Fri, 24 May 2013 08:28:17 +0800
Message-ID: <1369355297.5142.199.camel@liguang.fnst.cn.fujitsu.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-MIMETrack: Itemize by SMTP Server on mailserver/fnst(Release 8.5.3|September
	15, 2011) at 2013/05/24 08:27:06,
	Serialize by Router on mailserver/fnst(Release 8.5.3|September 15,
	2011) at 2013/05/24 08:27:07,
	Serialize complete at 2013/05/24 08:27:07
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 222.73.24.84
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH][v4 2/3] debugcon: make
 debug message more readable
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
X-List-Received-Date: Fri, 24 May 2013 00:28:55 -0000

=E5=9C=A8 2013-05-23=E5=9B=9B=E7=9A=84 15:06 +0200=EF=BC=8CAndreas F=C3=A4r=
ber=E5=86=99=E9=81=93=EF=BC=9A
> Am 23.05.2013 08:58, schrieb liguang:
> > before change:
> > Bdebugcon: write addr=3D0x0000 val=3D0x6f
> > odebugcon: write addr=3D0x0000 val=3D0x6f
> > odebugcon: write addr=3D0x0000 val=3D0x74
> > tdebugcon: write addr=3D0x0000 val=3D0x69
> > idebugcon: write addr=3D0x0000 val=3D0x6e
> > ndebugcon: write addr=3D0x0000 val=3D0x67
> > gdebugcon: write addr=3D0x0000 val=3D0x20
> >  debugcon: write addr=3D0x0000 val=3D0x66
> >=20
> > after change:
> > B [debugcon: write addr=3D0x0000 val=3D0x6f]
> > o [debugcon: write addr=3D0x0000 val=3D0x6f]
> > o [debugcon: write addr=3D0x0000 val=3D0x74]
> > t [debugcon: write addr=3D0x0000 val=3D0x69]
> > i [debugcon: write addr=3D0x0000 val=3D0x6e]
> > n [debugcon: write addr=3D0x0000 val=3D0x67]
> > g [debugcon: write addr=3D0x0000 val=3D0x20]
> >   [debugcon: write addr=3D0x0000 val=3D0x66]
> >=20
> > Signed-off-by: liguang <lig.fnst@cn.fujitsu.com>
> > ---
> >  hw/char/debugcon.c |    2 +-
> >  1 files changed, 1 insertions(+), 1 deletions(-)
> >=20
> > diff --git a/hw/char/debugcon.c b/hw/char/debugcon.c
> > index 7e41c90..52fa0ab 100644
> > --- a/hw/char/debugcon.c
> > +++ b/hw/char/debugcon.c
> > @@ -55,7 +55,7 @@ static void debugcon_ioport_write(void *opaque, hwadd=
r addr, uint64_t val,
> >      unsigned char ch =3D val;
> > =20
> >  #ifdef DEBUG_DEBUGCON
> > -    printf("debugcon: write addr=3D0x%04" HWADDR_PRIx " val=3D0x%02x\n=
", addr, val);
> > +    printf(" [debugcon: write addr=3D0x%04" HWADDR_PRIx " val=3D0x%02x=
]\n", addr, val);
>=20
> While not wrong, this is rather exotic - wouldn't it be better to
> fprintf() to stderr instead or to use qemu_log() or tracepoints?
>=20

Hmm... let me change.

>=20
> >  #endif
> > =20
> >      qemu_chr_fe_write(s->chr, &ch, 1);
> >=20
>=20
>=20



