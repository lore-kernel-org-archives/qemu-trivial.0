Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Tgp5t-0000PW-PY
	for mharc-qemu-trivial@gnu.org; Thu, 06 Dec 2012 22:59:21 -0500
Received: from eggs.gnu.org ([208.118.235.92]:53403)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>) id 1Tgp5r-0000J0-3J
	for qemu-trivial@nongnu.org; Thu, 06 Dec 2012 22:59:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>) id 1Tgp5q-0003hX-04
	for qemu-trivial@nongnu.org; Thu, 06 Dec 2012 22:59:19 -0500
Received: from [222.73.24.84] (port=2844 helo=song.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>)
	id 1Tgp5n-0003h5-CY; Thu, 06 Dec 2012 22:59:15 -0500
X-IronPort-AV: E=Sophos;i="4.84,235,1355068800"; 
   d="scan'208";a="6350301"
Received: from unknown (HELO tang.cn.fujitsu.com) ([10.167.250.3])
	by song.cn.fujitsu.com with ESMTP; 07 Dec 2012 11:57:25 +0800
Received: from fnstmail02.fnst.cn.fujitsu.com (tang.cn.fujitsu.com [127.0.0.1])
	by tang.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id qB73xhfq026818;
	Fri, 7 Dec 2012 11:59:43 +0800
Received: from [10.167.225.128] ([10.167.225.128])
	by fnstmail02.fnst.cn.fujitsu.com (Lotus Domino Release 8.5.3)
	with ESMTP id 2012120711583056-288498 ;
	Fri, 7 Dec 2012 11:58:30 +0800 
From: li guang <lig.fnst@cn.fujitsu.com>
To: Kevin Wolf <kwolf@redhat.com>
In-Reply-To: <50C06D98.9040804@redhat.com>
References: <1352101300-12060-1-git-send-email-lig.fnst@cn.fujitsu.com>
	<50C06D98.9040804@redhat.com>
Date: Fri, 07 Dec 2012 11:56:42 +0800
Message-ID: <1354852602.15193.0.camel@liguang.fnst.cn.fujitsu.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-MIMETrack: Itemize by SMTP Server on mailserver/fnst(Release 8.5.3|September
	15, 2011) at 2012/12/07 11:58:30,
	Serialize by Router on mailserver/fnst(Release 8.5.3|September 15,
	2011) at 2012/12/07 11:58:32,
	Serialize complete at 2012/12/07 11:58:32
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 222.73.24.84
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v4] correct error message
	qemu-img reported
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
X-List-Received-Date: Fri, 07 Dec 2012 03:59:20 -0000

=E5=9C=A8 2012-12-06=E5=9B=9B=E7=9A=84 11:04 +0100=EF=BC=8CKevin Wolf=E5=86=
=99=E9=81=93=EF=BC=9A
> Am 05.11.2012 08:41, schrieb liguang:
> > qemu-img will complain when qcow or qcow2
> > size overflow for 64 bits, report the right
> > message in this condition.
> >=20
> > Signed-off-by: liguang <lig.fnst@cn.fujitsu.com>
> > ---
> >  qemu-img.c |    7 ++++++-
> >  1 files changed, 6 insertions(+), 1 deletions(-)
> >=20
> > diff --git a/qemu-img.c b/qemu-img.c
> > index b41e670..d9434ad 100644
> > --- a/qemu-img.c
> > +++ b/qemu-img.c
> > @@ -340,7 +340,12 @@ static int img_create(int argc, char **argv)
> >          int64_t sval;
> >          char *end;
> >          sval =3D strtosz_suffix(argv[optind++], &end, STRTOSZ_DEFSUFFI=
X_B);
> > -        if (sval < 0 || *end) {
> > +        if (sval < 0) {
> > +            error_report("Image size must be less than 8 exabytes!");
> > +            ret =3D -1;
> > +            goto out;
> > +        }
>=20
> This is wrong, overflows are not the only way how strtosz_suffix() can fa=
il.
>=20
> Before this patch:
>=20
> $ ./qemu-img create /tmp/foo bar
> qemu-img: Invalid image size specified! You may use k, M, G or T
> suffixes for
> qemu-img: kilobytes, megabytes, gigabytes and terabytes
>=20
> With the patch applied:
>=20
> $ ./qemu-img create /tmp/foo bar
> qemu-img: Image size must be less than 8 exabytes!
>=20

Oh, my fault, I'll fix.
Thanks!

> Kevin
>=20
>=20
> > +        if (*end) {
> >              error_report("Invalid image size specified! You may use k,=
 M, G or "
> >                    "T suffixes for ");
> >              error_report("kilobytes, megabytes, gigabytes and terabyte=
s.");
> >=20
>=20
>=20
>=20

--=20
regards!
li guang


