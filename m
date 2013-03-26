Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UKPc2-0005MT-92
	for mharc-qemu-trivial@gnu.org; Tue, 26 Mar 2013 04:52:10 -0400
Received: from eggs.gnu.org ([208.118.235.92]:57361)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>) id 1UKPbz-0005Ih-9G
	for qemu-trivial@nongnu.org; Tue, 26 Mar 2013 04:52:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>) id 1UKPbt-00038v-52
	for qemu-trivial@nongnu.org; Tue, 26 Mar 2013 04:52:07 -0400
Received: from [222.73.24.84] (port=64986 helo=song.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>)
	id 1UKPbp-00037Y-Ab; Tue, 26 Mar 2013 04:51:57 -0400
X-IronPort-AV: E=Sophos;i="4.87,351,1363104000"; 
   d="scan'208";a="6946899"
Received: from unknown (HELO tang.cn.fujitsu.com) ([10.167.250.3])
	by song.cn.fujitsu.com with ESMTP; 26 Mar 2013 16:49:23 +0800
Received: from fnstmail02.fnst.cn.fujitsu.com (tang.cn.fujitsu.com [127.0.0.1])
	by tang.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id r2Q8psQH010733;
	Tue, 26 Mar 2013 16:51:54 +0800
Received: from [10.167.233.147] ([10.167.233.147])
	by fnstmail02.fnst.cn.fujitsu.com (Lotus Domino Release 8.5.3)
	with ESMTP id 2013032616510580-57288 ;
	Tue, 26 Mar 2013 16:51:05 +0800 
From: li guang <lig.fnst@cn.fujitsu.com>
To: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <514C3B63.8030308@redhat.com>
References: <1363943551-31150-1-git-send-email-lig.fnst@cn.fujitsu.com>
	<514C3B63.8030308@redhat.com>
Date: Tue, 26 Mar 2013 16:49:50 +0800
Message-ID: <1364287790.31713.15.camel@liguang.fnst.cn.fujitsu.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-MIMETrack: Itemize by SMTP Server on mailserver/fnst(Release 8.5.3|September
	15, 2011) at 2013/03/26 16:51:05,
	Serialize by Router on mailserver/fnst(Release 8.5.3|September 15,
	2011) at 2013/03/26 16:51:09,
	Serialize complete at 2013/03/26 16:51:09
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 222.73.24.84
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] hw/i386/pc: fix possible segment fault
	for port92_write
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
X-List-Received-Date: Tue, 26 Mar 2013 08:52:09 -0000

=E5=9C=A8 2013-03-22=E4=BA=94=E7=9A=84 12:07 +0100=EF=BC=8CPaolo Bonzini=E5=
=86=99=E9=81=93=EF=BC=9A
> Il 22/03/2013 10:12, liguang ha scritto:
> > e.g.
> > $qemu-system-x86_64 -device port92
> > will report segment fault,
> > for port92_write try a un-allocated
> > assignment for a20_out.
> > so check before this assignment.
> >=20
> > Signed-off-by: liguang <lig.fnst@cn.fujitsu.com>
> > ---
> >  hw/i386/pc.c |    3 ++-
> >  1 files changed, 2 insertions(+), 1 deletions(-)
> >=20
> > diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> > index ed7d9ba..a0e8ee0 100644
> > --- a/hw/i386/pc.c
> > +++ b/hw/i386/pc.c
> > @@ -440,7 +440,8 @@ static void port92_write(void *opaque, hwaddr addr,=
 uint64_t val,
> > =20
> >      DPRINTF("port92: write 0x%02x\n", val);
> >      s->outport =3D val;
> > -    qemu_set_irq(*s->a20_out, (val >> 1) & 1);
> > +    if (s->a20_out)
> > +        qemu_set_irq(*s->a20_out, (val >> 1) & 1);
> >      if (val & 1) {
> >          qemu_system_reset_request();
> >      }
> >=20
>=20
> Unfortunately, this is a very common problem.  The correct fix is to
> change port92 to use the GPIO mechanism instead.
>=20

Sorry, Paolo,
I'm not so familiar with 'GPIO mechanism',=20
can you specify more?

Thanks!



