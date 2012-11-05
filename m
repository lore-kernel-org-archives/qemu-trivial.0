Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TVHJE-0001CA-Ez
	for mharc-qemu-trivial@gnu.org; Mon, 05 Nov 2012 02:41:24 -0500
Received: from eggs.gnu.org ([208.118.235.92]:43287)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>) id 1TVHJB-000142-FR
	for qemu-trivial@nongnu.org; Mon, 05 Nov 2012 02:41:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>) id 1TVHJA-0007qC-KY
	for qemu-trivial@nongnu.org; Mon, 05 Nov 2012 02:41:21 -0500
Received: from [222.73.24.84] (port=18722 helo=song.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>)
	id 1TVHJ7-0007nR-QT; Mon, 05 Nov 2012 02:41:18 -0500
X-IronPort-AV: E=Sophos;i="4.80,713,1344182400"; 
   d="scan'208";a="6138880"
Received: from unknown (HELO tang.cn.fujitsu.com) ([10.167.250.3])
	by song.cn.fujitsu.com with ESMTP; 05 Nov 2012 15:39:31 +0800
Received: from fnstmail02.fnst.cn.fujitsu.com (tang.cn.fujitsu.com [127.0.0.1])
	by tang.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id qA57f6Ip015670;
	Mon, 5 Nov 2012 15:41:07 +0800
Received: from [10.167.225.128] ([10.167.225.128])
	by fnstmail02.fnst.cn.fujitsu.com (Lotus Domino Release 8.5.3)
	with ESMTP id 2012110515401592-957971 ;
	Mon, 5 Nov 2012 15:40:15 +0800 
From: li guang <lig.fnst@cn.fujitsu.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
In-Reply-To: <CAJSP0QXiLvzW5wUDCwVfnR6UXMv52Nb23314WnCC8-sv4vU_1g@mail.gmail.com>
References: <1351833082-26633-1-git-send-email-lig.fnst@cn.fujitsu.com>
	<CAJSP0QXiLvzW5wUDCwVfnR6UXMv52Nb23314WnCC8-sv4vU_1g@mail.gmail.com>
Date: Mon, 05 Nov 2012 15:40:07 +0800
Message-ID: <1352101207.11909.0.camel@liguang.fnst.cn.fujitsu.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-MIMETrack: Itemize by SMTP Server on mailserver/fnst(Release 8.5.3|September
	15, 2011) at 2012/11/05 15:40:15,
	Serialize by Router on mailserver/fnst(Release 8.5.3|September 15,
	2011) at 2012/11/05 15:40:16,
	Serialize complete at 2012/11/05 15:40:16
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 222.73.24.84
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Kevin Wolf <kwolf@redhat.com>,
	qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v3] correct error message
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
X-List-Received-Date: Mon, 05 Nov 2012 07:41:22 -0000

=E5=9C=A8 2012-11-02=E4=BA=94=E7=9A=84 08:16 +0100=EF=BC=8CStefan Hajnoczi=
=E5=86=99=E9=81=93=EF=BC=9A
> On Fri, Nov 2, 2012 at 6:11 AM, liguang <lig.fnst@cn.fujitsu.com> wrote:
> > diff --git a/qemu-img.c b/qemu-img.c
> > index b41e670..d4ea800 100644
> > --- a/qemu-img.c
> > +++ b/qemu-img.c
> > @@ -337,10 +337,15 @@ static int img_create(int argc, char **argv)
> >
> >      /* Get image size, if specified */
> >      if (optind < argc) {
> > -        int64_t sval;
> > +        int64_t sval =3D 0;
>=20
> sval is assigned below so there is no need for this change.
>=20
> >          char *end;
> >          sval =3D strtosz_suffix(argv[optind++], &end, STRTOSZ_DEFSUFFI=
X_B);
> > -        if (sval < 0 || *end) {
> > +        if (sval < 0) {
> > +            error_report("image size is too large!");
>=20
> I suggest being specific about the upper limit so the user knows which
> values are valid:
> "Image size must be less than 8 exabytes!"
>=20
> Stefan
>=20

OK, will fix.

--=20
liguang    lig.fnst@cn.fujitsu.com
FNST linux kernel team


