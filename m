Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ULNNY-00063s-GP
	for mharc-qemu-trivial@gnu.org; Thu, 28 Mar 2013 20:41:12 -0400
Received: from eggs.gnu.org ([208.118.235.92]:56553)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>) id 1ULNNW-00063V-0y
	for qemu-trivial@nongnu.org; Thu, 28 Mar 2013 20:41:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>) id 1ULNNR-00021t-Ev
	for qemu-trivial@nongnu.org; Thu, 28 Mar 2013 20:41:09 -0400
Received: from [222.73.24.84] (port=6434 helo=song.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>)
	id 1ULNNR-000215-4b; Thu, 28 Mar 2013 20:41:05 -0400
X-IronPort-AV: E=Sophos;i="4.87,370,1363104000"; 
   d="scan'208";a="6965364"
Received: from unknown (HELO tang.cn.fujitsu.com) ([10.167.250.3])
	by song.cn.fujitsu.com with ESMTP; 29 Mar 2013 08:38:27 +0800
Received: from fnstmail02.fnst.cn.fujitsu.com (tang.cn.fujitsu.com [127.0.0.1])
	by tang.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id r2T0exon014281;
	Fri, 29 Mar 2013 08:40:59 +0800
Received: from [10.167.233.147] ([10.167.233.147])
	by fnstmail02.fnst.cn.fujitsu.com (Lotus Domino Release 8.5.3)
	with ESMTP id 2013032908400895-153425 ;
	Fri, 29 Mar 2013 08:40:08 +0800 
From: li guang <lig.fnst@cn.fujitsu.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
In-Reply-To: <20130328094237.GE24910@stefanha-thinkpad.redhat.com>
References: <1364364631-24665-1-git-send-email-lig.fnst@cn.fujitsu.com>
	<20130328094237.GE24910@stefanha-thinkpad.redhat.com>
Date: Fri, 29 Mar 2013 08:38:42 +0800
Message-ID: <1364517522.31713.59.camel@liguang.fnst.cn.fujitsu.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-MIMETrack: Itemize by SMTP Server on mailserver/fnst(Release 8.5.3|September
	15, 2011) at 2013/03/29 08:40:08,
	Serialize by Router on mailserver/fnst(Release 8.5.3|September 15,
	2011) at 2013/03/29 08:40:09,
	Serialize complete at 2013/03/29 08:40:09
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 222.73.24.84
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel][PATCH] hw/i386/pc: reject to boot a
 wrong header magic kernel
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
X-List-Received-Date: Fri, 29 Mar 2013 00:41:11 -0000

=E5=9C=A8 2013-03-28=E5=9B=9B=E7=9A=84 10:42 +0100=EF=BC=8CStefan Hajnoczi=
=E5=86=99=E9=81=93=EF=BC=9A
> On Wed, Mar 27, 2013 at 02:10:31PM +0800, liguang wrote:
> > if head magic is missing or wrong unexpectedly, we'd
> > better to reject booting.
> > e.g.
> > I make a mistake to boot a vmlinuz for MIPS(which
> > I think it's for x86) like this:
> > qemu-system-x86_64 -kernel vmlinuz -initrd demord
> > then qemu report:
> > "qemu: linux kernel too old to load a ram disk"
> > that's misleading.
> >=20
> > Signed-off-by: liguang <lig.fnst@cn.fujitsu.com>
> > ---
> >  hw/i386/pc.c |    4 +++-
> >  1 files changed, 3 insertions(+), 1 deletions(-)
> >=20
> > diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> > index b1e06fa..2b78dfc 100644
> > --- a/hw/i386/pc.c
> > +++ b/hw/i386/pc.c
> > @@ -683,8 +683,10 @@ static void load_linux(void *fw_cfg,
> >          if (load_multiboot(fw_cfg, f, kernel_filename, initrd_filename=
,
> >                             kernel_cmdline, kernel_size, header)) {
> >              return;
> > +        } else {
> > +            fprintf(stderr, "please assure specicified kernel is for x=
86!\n");
> > +            exit(1);
>=20
> load_multiboot() can fail for other reasons so this error messing is
> misleading.  Giving QEMU a non-x86 kernel is just one scenario where
> this may fail.

according to my check of load_mutiboot function,
mostly it will return 0 if it's not multboot,
or 1 it's a multiboot, so print this message,
or can I just print "wrong kernel image!" ?

>=20
> >          }
> > -        protocol =3D 0;
> >      }
>=20
> Why did you drop protocol =3D 0?

I think we only want either normal or multi boot linux kernel,
I can't see meaning let other case go on.
so, here, if a normal kernel, OK, go on,
if multiboot, OK, go on,
others, NO, end up.
so, "protocol =3D 0" is meaningless here.




