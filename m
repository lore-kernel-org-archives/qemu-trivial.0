Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cbSnd-00041n-MX
	for mharc-qemu-trivial@gnu.org; Wed, 08 Feb 2017 09:00:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42877)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mlureau@redhat.com>) id 1cbSna-00040E-KU
	for qemu-trivial@nongnu.org; Wed, 08 Feb 2017 09:00:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mlureau@redhat.com>) id 1cbSnX-00057h-8n
	for qemu-trivial@nongnu.org; Wed, 08 Feb 2017 09:00:42 -0500
Received: from mx5-phx2.redhat.com ([209.132.183.37]:45702)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mlureau@redhat.com>)
	id 1cbSnW-00057V-SW; Wed, 08 Feb 2017 09:00:39 -0500
Received: from zmail17.collab.prod.int.phx2.redhat.com
	(zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
	by mx5-phx2.redhat.com (8.14.4/8.14.4) with ESMTP id v18E0cpx065159;
	Wed, 8 Feb 2017 09:00:38 -0500
Date: Wed, 8 Feb 2017 09:00:37 -0500 (EST)
From: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <mlureau@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org, kwolf@redhat.com, qemu-trivial@nongnu.org
Message-ID: <1904417137.1617199.1486562437768.JavaMail.zimbra@redhat.com>
In-Reply-To: <58a6feee-8828-d159-daf9-b460a6c0c7c4@redhat.com>
References: <20170208080900.4092-1-marcandre.lureau@redhat.com>
	<58a6feee-8828-d159-daf9-b460a6c0c7c4@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.3.116.15]
X-Mailer: Zimbra 8.0.6_GA_5922 (ZimbraWebClient - FF51 (Linux)/8.0.6_GA_5922)
Thread-Topic: qcow2: remove useless NULL check
Thread-Index: O907WuZf4eJbK6VZgQ5VMVEZQccYrQ==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.132.183.37
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qcow2: remove useless NULL
 check
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 08 Feb 2017 14:00:44 -0000

Hi

----- Original Message -----
> On 08.02.2017 09:09, Marc-Andr=C3=A9 Lureau wrote:
> > g_strdup() already handles the case where the argument is NULL.
> >=20
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  block/qcow2.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/block/qcow2.c b/block/qcow2.c
> > index 96fb8a8f16..9114218030 100644
> > --- a/block/qcow2.c
> > +++ b/block/qcow2.c
> > @@ -2016,8 +2016,8 @@ static int qcow2_change_backing_file(BlockDriverS=
tate
> > *bs,
> >      g_free(s->image_backing_file);
> >      g_free(s->image_backing_format);
> > =20
> > -    s->image_backing_file =3D backing_file ? g_strdup(bs->backing_file=
) :
> > NULL;
> > -    s->image_backing_format =3D backing_fmt ? g_strdup(bs->backing_for=
mat) :
> > NULL;
> > +    s->image_backing_file =3D g_strdup(bs->backing_file);
> > +    s->image_backing_format =3D g_strdup(bs->backing_format);
>=20
> bs->backing_file and bs->backing_format are arrays. They will never be NU=
LL.
>=20
> The ternary operator tests backing_file and backing_fmt which instead
> are pointers. So this is not an equivalent conversion.

oops my bad, ignore ;P a bit uncommon code though, could deserve a comment.


>=20
> Max
>=20
> > =20
> >      return qcow2_update_header(bs);
> >  }
> >=20
>=20
>=20
>=20

