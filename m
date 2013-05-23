Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UfP8r-0000G6-DC
	for mharc-qemu-trivial@gnu.org; Thu, 23 May 2013 02:36:49 -0400
Received: from eggs.gnu.org ([208.118.235.92]:33299)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>) id 1UfP8l-0000Fg-QE
	for qemu-trivial@nongnu.org; Thu, 23 May 2013 02:36:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>) id 1UfP8h-00074p-PX
	for qemu-trivial@nongnu.org; Thu, 23 May 2013 02:36:43 -0400
Received: from [222.73.24.84] (port=33016 helo=song.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>)
	id 1UfP8h-0006zc-CP; Thu, 23 May 2013 02:36:39 -0400
X-IronPort-AV: E=Sophos;i="4.87,726,1363104000"; 
   d="scan'208";a="7342337"
Received: from unknown (HELO tang.cn.fujitsu.com) ([10.167.250.3])
	by song.cn.fujitsu.com with ESMTP; 23 May 2013 14:33:16 +0800
Received: from fnstmail02.fnst.cn.fujitsu.com (tang.cn.fujitsu.com [127.0.0.1])
	by tang.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id r4N6a5pZ015514;
	Thu, 23 May 2013 14:36:05 +0800
Received: from [10.167.233.147] ([10.167.233.147])
	by fnstmail02.fnst.cn.fujitsu.com (Lotus Domino Release 8.5.3)
	with ESMTP id 2013052314344610-1464108 ;
	Thu, 23 May 2013 14:34:46 +0800 
From: li guang <lig.fnst@cn.fujitsu.com>
To: Markus Armbruster <armbru@redhat.com>
In-Reply-To: <874ndu9prv.fsf@blackfin.pond.sub.org>
References: <1366084439-7475-1-git-send-email-lig.fnst@cn.fujitsu.com>
	<874ndu9prv.fsf@blackfin.pond.sub.org>
Date: Thu, 23 May 2013 14:36:00 +0800
Message-ID: <1369290960.5142.166.camel@liguang.fnst.cn.fujitsu.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-MIMETrack: Itemize by SMTP Server on mailserver/fnst(Release 8.5.3|September
	15, 2011) at 2013/05/23 14:34:46,
	Serialize by Router on mailserver/fnst(Release 8.5.3|September 15,
	2011) at 2013/05/23 14:34:46,
	Serialize complete at 2013/05/23 14:34:46
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 222.73.24.84
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v3 1/3] debugcon: fix always
 print "addr=0x0, val=0x0" bug
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
X-List-Received-Date: Thu, 23 May 2013 06:36:49 -0000

=E5=9C=A8 2013-05-23=E5=9B=9B=E7=9A=84 08:25 +0200=EF=BC=8CMarkus Armbruste=
r=E5=86=99=E9=81=93=EF=BC=9A
> Cc'ing qemu-trivial.
>=20
> liguang <lig.fnst@cn.fujitsu.com> writes:
>=20
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
> >
> > Oh, that's wrong, val is not always be 0.
> > this bug caused by lack of length modifier
> > for specifier 'x'.
>=20
> Subject is misleading, it doesn't "always print", only when
> DEBUG_DEBUGCON is enabled.
>=20
> Recommend to abridge the commit message radically.

OK, thanks!

>=20
> > Signed-off-by: liguang <lig.fnst@cn.fujitsu.com>
> > ---
> >  hw/char/debugcon.c |    2 +-
> >  1 files changed, 1 insertions(+), 1 deletions(-)
> >
> > diff --git a/hw/char/debugcon.c b/hw/char/debugcon.c
> > index 0588eeb..44c93e1 100644
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
> >  #endif
> > =20
> >      qemu_chr_fe_write(s->chr, &ch, 1);



