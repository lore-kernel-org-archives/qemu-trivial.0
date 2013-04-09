Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UPQl5-0007cY-8D
	for mharc-qemu-trivial@gnu.org; Tue, 09 Apr 2013 01:06:15 -0400
Received: from eggs.gnu.org ([208.118.235.92]:57825)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>) id 1UPQl2-0007cP-F8
	for qemu-trivial@nongnu.org; Tue, 09 Apr 2013 01:06:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>) id 1UPQl1-0007X2-5L
	for qemu-trivial@nongnu.org; Tue, 09 Apr 2013 01:06:12 -0400
Received: from [222.73.24.84] (port=17408 helo=song.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>)
	id 1UPQl0-0007Wn-Qm; Tue, 09 Apr 2013 01:06:11 -0400
X-IronPort-AV: E=Sophos;i="4.87,436,1363104000"; 
   d="scan'208";a="7019399"
Received: from unknown (HELO tang.cn.fujitsu.com) ([10.167.250.3])
	by song.cn.fujitsu.com with ESMTP; 09 Apr 2013 13:03:29 +0800
Received: from fnstmail02.fnst.cn.fujitsu.com (tang.cn.fujitsu.com [127.0.0.1])
	by tang.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id r39565rp031705;
	Tue, 9 Apr 2013 13:06:05 +0800
Received: from [10.167.233.147] ([10.167.233.147])
	by fnstmail02.fnst.cn.fujitsu.com (Lotus Domino Release 8.5.3)
	with ESMTP id 2013040913045687-392939 ;
	Tue, 9 Apr 2013 13:04:56 +0800 
From: li guang <lig.fnst@cn.fujitsu.com>
To: Jesse Larrew <jlarrew@linux.vnet.ibm.com>
In-Reply-To: <51639ACE.8020505@linux.vnet.ibm.com>
References: <1365474461-17474-1-git-send-email-lig.fnst@cn.fujitsu.com>
	<51639ACE.8020505@linux.vnet.ibm.com>
Date: Tue, 09 Apr 2013 13:05:00 +0800
Message-ID: <1365483900.9553.8.camel@liguang.fnst.cn.fujitsu.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-MIMETrack: Itemize by SMTP Server on mailserver/fnst(Release 8.5.3|September
	15, 2011) at 2013/04/09 13:04:56,
	Serialize by Router on mailserver/fnst(Release 8.5.3|September 15,
	2011) at 2013/04/09 13:04:57,
	Serialize complete at 2013/04/09 13:04:57
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 222.73.24.84
Cc: qemu-trivial@nongnu.org, Anthony Liguori <aliguori@us.ibm.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v3] hw/i386/pc: prompt not
 multboot or morden kernel image
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
X-List-Received-Date: Tue, 09 Apr 2013 05:06:13 -0000

=E5=9C=A8 2013-04-08=E4=B8=80=E7=9A=84 23:36 -0500=EF=BC=8CJesse Larrew=E5=
=86=99=E9=81=93=EF=BC=9A
> On 04/08/2013 09:27 PM, liguang wrote:
> > if head magic is missing or wrong unexpectedly, we'd
> > better to prompt memssage for this.
> > e.g.
> > I make a mistake to boot a vmlinuz for MIPS(which
> > I think it's for x86) like this:
> > qemu-system-x86_64 -kernel vmlinuz -initrd demord
> > then qemu report:
> > "qemu: linux kernel too old to load a ram disk"
> > that's misleading.
> >=20
>=20
> Yes, that message would definitely be misleading in this case.
>=20
> > Signed-off-by: liguang <lig.fnst@cn.fujitsu.com>
> > ---
> >  hw/i386/pc.c |    2 ++
> >  1 files changed, 2 insertions(+), 0 deletions(-)
> >=20
> > diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> > index ebbf059..6b29c3f 100644
> > --- a/hw/i386/pc.c
> > +++ b/hw/i386/pc.c
> > @@ -686,6 +686,8 @@ static void load_linux(void *fw_cfg,
> >          if (load_multiboot(fw_cfg, f, kernel_filename, initrd_filename=
,
> >                             kernel_cmdline, kernel_size, header)) {
> >              return;
> > +        } else {
> > +            fprintf(stderr, "warn: invalid multiboot or modern kernel =
image\n");
> >          }
> >          protocol =3D 0;
> >      }
> >=20
>=20
> My impression from reading through the code is that this branch can be
> legitimately triggered by an older kernel (protocol < 0x200).=20

right.

> In that case,the error message above would also be misleading.

the warning message is saying: hey, we prefer modern kernel image
or multiboot, but you specify neither, what are you doing?
do you want to boot an old(obsolete) kernel?

or, add a line like fprintf(stderr, "do you boot an old kernel?\n") :-)

>=20
> I think a better solution might be to simply validate that the arch
> specified in the ELF header matches the arch that qemu is emulating.
>  I'll look into this more tomorrow morning. :)

that's fine

>=20
> Jesse Larrew
> Software Engineer, KVM Team
> IBM Linux Technology Center
> Phone: (512) 973-2052 (T/L: 363-2052)
> jlarrew@linux.vnet.ibm.com
>=20



