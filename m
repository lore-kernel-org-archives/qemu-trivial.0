Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TlbQl-0004DA-RO
	for mharc-qemu-trivial@gnu.org; Thu, 20 Dec 2012 03:24:39 -0500
Received: from eggs.gnu.org ([208.118.235.92]:45944)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>) id 1TlbQh-0004CQ-2r
	for qemu-trivial@nongnu.org; Thu, 20 Dec 2012 03:24:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>) id 1TlbQd-0000EE-Pc
	for qemu-trivial@nongnu.org; Thu, 20 Dec 2012 03:24:35 -0500
Received: from csmailer.cs.nctu.edu.tw ([140.113.235.130]:29523)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>) id 1TlbQd-0000B4-9G
	for qemu-trivial@nongnu.org; Thu, 20 Dec 2012 03:24:31 -0500
Received: from csmailer.cs.nctu.edu.tw (localhost [127.0.0.1])
	by csmailer.cs.nctu.edu.tw (Postfix) with ESMTP id 991A19CC;
	Thu, 20 Dec 2012 16:24:22 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=cs.nctu.edu.tw; h=date
	:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to:content-transfer-encoding; s=rsa1024;
	bh=gKCMC1mZzkh6qPVzJ80AnDqsdaM=; b=LVQuZtIzRZCU/bRBAeyJJHJj42oO
	0tPhBPV6qolo/Z2th5fftecSZyLWXYRwGGlCZ0ie1BdmSA8nx58gjxE7NFiE9Jz9
	uB/uJAdb2GQyi3yWHjtfXiEJdrY7SkN1vbYccATFdjPIIOM+klyiV+oP9Cu6MsKa
	Cvlm6QUSWxaqZlc=
Received: from alumni.cs.nctu.edu.tw (alumni.cs.nctu.edu.tw [140.113.235.116])
	by csmailer.cs.nctu.edu.tw (Postfix) with ESMTP id 851169CB;
	Thu, 20 Dec 2012 16:24:22 +0800 (CST)
Received: (from chenwj@localhost)
	by alumni.cs.nctu.edu.tw (8.14.5/8.14.5/Submit) id qBK8OIqm021898;
	Thu, 20 Dec 2012 16:24:18 +0800 (CST) (envelope-from chenwj)
Date: Thu, 20 Dec 2012 16:24:18 +0800
From: =?utf-8?B?6Zmz6Z+L5Lu7IChXZWktUmVuIENoZW4p?= <chenwj@iis.sinica.edu.tw>
To: qemu-trivial@nongnu.org
Message-ID: <20121220082418.GA21451@cs.nctu.edu.tw>
References: <20121210135131.GA40753@cs.nctu.edu.tw>
	<20121210142133.GB5484@t430s.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20121210142133.GB5484@t430s.redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: FreeBSD 8.x
X-Received-From: 140.113.235.130
Cc: =?utf-8?B?6Zmz6Z+L5Lu7IChXZWktUmVuIENoZW4p?= <chenwj@iis.sinica.edu.tw>
Subject: Re: [Qemu-trivial] [PATCH] Remove Sparc v7 and v8 host support from
 the configure list
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
X-List-Received-Date: Thu, 20 Dec 2012 08:24:38 -0000

  Ping? :)

On Mon, Dec 10, 2012 at 10:21:33PM +0800, Amos Kong wrote:
> On Mon, Dec 10, 2012 at 09:51:31PM +0800, =E9=99=B3=E9=9F=8B=E4=BB=BB (=
Wei-Ren Chen) wrote:
> >   According to QEMU 1.3 release note, sparc v7 and v8 host support ha=
ve
> > been removed. [1] Fix configure list as well.
> >=20
> > [1] http://wiki.qemu.org/ChangeLog/1.3#Host_support
> >=20
> > Signed-off-by: Chen Wei-Ren <chenwj@iis.sinica.edu.tw>
> > ---
> >  configure |    2 +-
> >  1 files changed, 1 insertions(+), 1 deletions(-)
> >=20
> > diff --git a/configure b/configure
> > index e5aedef..56cf49d 100755
> > --- a/configure
> > +++ b/configure
> > @@ -1089,7 +1089,7 @@ echo "  --fmod-inc               path to FMOD i=
ncludes"
> >  echo "  --oss-lib                path to OSS library"
> >  echo "  --enable-uname-release=3DR Return R for uname -r in usermode=
 emulation"
> >  echo "  --cpu=3DCPU                Build for host CPU [$cpu]"
> > -echo "  --sparc_cpu=3DV            Build qemu for Sparc architecture=
 v7, v8, v8plus, v8plusa, v9"
> > +echo "  --sparc_cpu=3DV            Build qemu for Sparc architecture=
 v8plus, v8plusa, v9"
>=20
>=20
> Reviewed-by: Amos Kong <akong@redhat.com>
>=20
> >  echo "  --disable-uuid           disable uuid support"
> >  echo "  --enable-uuid            enable uuid support"
> >  echo "  --disable-vde            disable support for vde network"
> > --=20
> > 1.7.3.4
>=20
> --=20
> 		Amos.

--=20
Wei-Ren Chen (=E9=99=B3=E9=9F=8B=E4=BB=BB)
Computer Systems Lab, Institute of Information Science,
Academia Sinica, Taiwan (R.O.C.)
Tel:886-2-2788-3799 #1667
Homepage: http://people.cs.nctu.edu.tw/~chenwj

