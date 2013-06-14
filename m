Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UnNsq-0002UO-9w
	for mharc-qemu-trivial@gnu.org; Fri, 14 Jun 2013 02:53:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57264)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hutao@cn.fujitsu.com>) id 1UnNsn-0002SX-J2
	for qemu-trivial@nongnu.org; Fri, 14 Jun 2013 02:53:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <hutao@cn.fujitsu.com>) id 1UnNsm-0001e0-IM
	for qemu-trivial@nongnu.org; Fri, 14 Jun 2013 02:53:13 -0400
Received: from [222.73.24.84] (port=9891 helo=song.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hutao@cn.fujitsu.com>)
	id 1UnNsj-0001Ws-1T; Fri, 14 Jun 2013 02:53:09 -0400
X-IronPort-AV: E=Sophos;i="4.87,863,1363104000"; 
   d="scan'208";a="7545157"
Received: from unknown (HELO tang.cn.fujitsu.com) ([10.167.250.3])
	by song.cn.fujitsu.com with ESMTP; 14 Jun 2013 14:50:10 +0800
Received: from fnstmail02.fnst.cn.fujitsu.com (tang.cn.fujitsu.com [127.0.0.1])
	by tang.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id r5E6r3Uh026835;
	Fri, 14 Jun 2013 14:53:03 +0800
Received: from localhost ([10.167.233.156])
	by fnstmail02.fnst.cn.fujitsu.com (Lotus Domino Release 8.5.3)
	with ESMTP id 2013061414510784-2124530 ;
	Fri, 14 Jun 2013 14:51:07 +0800 
Date: Fri, 14 Jun 2013 14:52:17 +0800
From: Hu Tao <hutao@cn.fujitsu.com>
To: Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>
Message-ID: <20130614065217.GF13787@G08FNSTD100614.fnst.cn.fujitsu.com>
References: <1371120709-18923-1-git-send-email-hutao@cn.fujitsu.com>
	<51B9A88C.3080105@suse.de>
MIME-Version: 1.0
In-Reply-To: <51B9A88C.3080105@suse.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-MIMETrack: Itemize by SMTP Server on mailserver/fnst(Release 8.5.3|September
	15, 2011) at 2013/06/14 14:51:07,
	Serialize by Router on mailserver/fnst(Release 8.5.3|September 15,
	2011) at 2013/06/14 14:51:08
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 222.73.24.84
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] fix some printf errors when
	debug is enabled
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
X-List-Received-Date: Fri, 14 Jun 2013 06:53:14 -0000

On Thu, Jun 13, 2013 at 01:10:04PM +0200, Andreas F=C3=A4rber wrote:
> Am 13.06.2013 12:51, schrieb Hu Tao:
> > Signed-off-by: Hu Tao <hutao@cn.fujitsu.com>
> > ---
> >  cputlb.c        | 4 ++--
> >  hw/acpi/piix4.c | 6 +++---
> >  2 files changed, 5 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/cputlb.c b/cputlb.c
> > index 86666c8..1230e9e 100644
> > --- a/cputlb.c
> > +++ b/cputlb.c
> > @@ -262,8 +262,8 @@ void tlb=5Fset=5Fpage(CPUArchState *env, target=5Fu=
long vaddr,
> > =20
> >  #if defined(DEBUG=5FTLB)
> >      printf("tlb=5Fset=5Fpage: vaddr=3D" TARGET=5FFMT=5Flx " paddr=3D0x=
" TARGET=5FFMT=5Fplx
> > -           " prot=3D%x idx=3D%d pd=3D0x%08lx\n",
> > -           vaddr, paddr, prot, mmu=5Fidx, pd);
> > +           " prot=3D%x idx=3D%d\n",
> > +           vaddr, paddr, prot, mmu=5Fidx);
> >  #endif
> > =20
> >      address =3D vaddr;
> > diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
> > index e6525ac..eafa76f 100644
> > --- a/hw/acpi/piix4.c
> > +++ b/hw/acpi/piix4.c
> > @@ -518,7 +518,7 @@ static uint64=5Ft gpe=5Freadb(void *opaque, hwaddr =
addr, unsigned width)
> >      PIIX4PMState *s =3D opaque;
> >      uint32=5Ft val =3D acpi=5Fgpe=5Fioport=5Freadb(&s->ar, addr);
> > =20
> > -    PIIX4=5FDPRINTF("gpe read %x =3D=3D %x\n", addr, val);
> > +    PIIX4=5FDPRINTF("gpe read %lx =3D=3D %x\n", addr, val);
>=20
> You need HWADDR=5FPRIx as seen below, because it might be %llx on some
> platforms. While touching it, changing %x to PRIx32 would be even better.

OK. Thanks!

>=20
> >      return val;
> >  }
> > =20
> > @@ -530,7 +530,7 @@ static void gpe=5Fwriteb(void *opaque, hwaddr addr,=
 uint64=5Ft val,
> >      acpi=5Fgpe=5Fioport=5Fwriteb(&s->ar, addr, val);
> >      pm=5Fupdate=5Fsci(s);
> > =20
> > -    PIIX4=5FDPRINTF("gpe write %x <=3D=3D %d\n", addr, val);
> > +    PIIX4=5FDPRINTF("gpe write %lx <=3D=3D %lu\n", addr, val);
>=20
> HWADDR=5FPRIx, PRIx64
>=20
> Regards,
> Andreas
>=20
> >  }
> > =20
> >  static const MemoryRegionOps piix4=5Fgpe=5Fops =3D {
> > @@ -579,7 +579,7 @@ static void pci=5Fwrite(void *opaque, hwaddr addr, =
uint64=5Ft data,
> >      switch (addr) {
> >      case PCI=5FEJ=5FBASE - PCI=5FHOTPLUG=5FADDR:
> >          acpi=5Fpiix=5Feject=5Fslot(opaque, (uint32=5Ft)data);
> > -        PIIX4=5FDPRINTF("pciej write %" HWADDR=5FPRIx " <=3D=3D % " PR=
Iu64 "\n",
> > +        PIIX4=5FDPRINTF("pciej write %" HWADDR=5FPRIx " <=3D=3D %" PRI=
u64 "\n",
> >                        addr, data);
> >          break;
> >      default:
> >=20
>=20
>=20
> --=20
> SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG N=C3=
=BCrnberg
=

