Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UOzj0-0003ba-3g
	for mharc-qemu-trivial@gnu.org; Sun, 07 Apr 2013 20:14:18 -0400
Received: from eggs.gnu.org ([208.118.235.92]:40868)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>) id 1UOzix-0003au-6d
	for qemu-trivial@nongnu.org; Sun, 07 Apr 2013 20:14:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>) id 1UOziv-0007BH-Oo
	for qemu-trivial@nongnu.org; Sun, 07 Apr 2013 20:14:15 -0400
Received: from [222.73.24.84] (port=35778 helo=song.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>)
	id 1UOziv-00070h-Dp; Sun, 07 Apr 2013 20:14:13 -0400
X-IronPort-AV: E=Sophos;i="4.87,427,1363104000"; 
   d="scan'208";a="7010627"
Received: from unknown (HELO tang.cn.fujitsu.com) ([10.167.250.3])
	by song.cn.fujitsu.com with ESMTP; 08 Apr 2013 08:11:27 +0800
Received: from fnstmail02.fnst.cn.fujitsu.com (tang.cn.fujitsu.com [127.0.0.1])
	by tang.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id r380E3f8023978;
	Mon, 8 Apr 2013 08:14:03 +0800
Received: from [10.167.233.147] ([10.167.233.147])
	by fnstmail02.fnst.cn.fujitsu.com (Lotus Domino Release 8.5.3)
	with ESMTP id 2013040808125670-352115 ;
	Mon, 8 Apr 2013 08:12:56 +0800 
From: li guang <lig.fnst@cn.fujitsu.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
In-Reply-To: <20130405125941.GD15818@stefanha-thinkpad.redhat.com>
References: <1364779317-3963-1-git-send-email-lig.fnst@cn.fujitsu.com>
	<20130405125941.GD15818@stefanha-thinkpad.redhat.com>
Date: Mon, 08 Apr 2013 08:13:05 +0800
Message-ID: <1365379985.5674.0.camel@liguang.fnst.cn.fujitsu.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-MIMETrack: Itemize by SMTP Server on mailserver/fnst(Release 8.5.3|September
	15, 2011) at 2013/04/08 08:12:56,
	Serialize by Router on mailserver/fnst(Release 8.5.3|September 15,
	2011) at 2013/04/08 08:12:57,
	Serialize complete at 2013/04/08 08:12:57
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 222.73.24.84
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel][PATCH v2] hw/i386/pc: reject to
 boot a wrong header magic kernel
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
X-List-Received-Date: Mon, 08 Apr 2013 00:14:16 -0000

=E5=9C=A8 2013-04-05=E4=BA=94=E7=9A=84 14:59 +0200=EF=BC=8CStefan Hajnoczi=
=E5=86=99=E9=81=93=EF=BC=9A
> On Mon, Apr 01, 2013 at 09:21:57AM +0800, liguang wrote:
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
> >  hw/i386/pc.c |    3 +++
> >  1 files changed, 3 insertions(+), 0 deletions(-)
> >=20
> > diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> > index b1e06fa..bfbb5fe 100644
> > --- a/hw/i386/pc.c
> > +++ b/hw/i386/pc.c
> > @@ -683,6 +683,9 @@ static void load_linux(void *fw_cfg,
> >          if (load_multiboot(fw_cfg, f, kernel_filename, initrd_filename=
,
> >                             kernel_cmdline, kernel_size, header)) {
> >              return;
> > +        } else {
> > +            fprintf(stderr, "not a valid multiboot image!\n");
> > +            exit(1);
> >          }
> >          protocol =3D 0;
>=20
> The point of protocol =3D 0 is to support old Linux kernels.  If we exit
> when probing load_multiboot() fails then QEMU will no longer load old
> Linux kernels!
>=20
> I suggest just:
> fprintf(stderr, "warning: not a valid multiboot or modern kernel image\n"=
);
>=20
> Stefan

OK, Thanks!


