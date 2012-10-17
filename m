Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TOb6P-0002Qq-Tr
	for mharc-qemu-trivial@gnu.org; Wed, 17 Oct 2012 17:24:33 -0400
Received: from eggs.gnu.org ([208.118.235.92]:60261)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thardeck@suse.de>) id 1TOb6N-0002KW-K3
	for qemu-trivial@nongnu.org; Wed, 17 Oct 2012 17:24:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thardeck@suse.de>) id 1TOb6M-0008D2-Be
	for qemu-trivial@nongnu.org; Wed, 17 Oct 2012 17:24:31 -0400
Received: from cantor2.suse.de ([195.135.220.15]:35366 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thardeck@suse.de>)
	id 1TOb6J-0008CO-Dh; Wed, 17 Oct 2012 17:24:27 -0400
Received: from relay2.suse.de (unknown [195.135.220.254])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id F07D9A24CA;
	Wed, 17 Oct 2012 23:24:24 +0200 (CEST)
From: Tim Hardeck <thardeck@suse.de>
To: Andreas =?ISO-8859-1?Q?F=E4rber?= <afaerber@suse.de>
Date: Wed, 17 Oct 2012 23:24:17 +0200
Message-ID: <1359569.y3MYGdvym5@thinktank.site>
Organization: SUSE LINUX Products GmbH
User-Agent: KMail/4.8.5 (Linux/3.6.2-6-desktop; KDE/4.8.5; x86_64; ; )
In-Reply-To: <507EC7FF.90603@suse.de>
References: <1350220128-10140-1-git-send-email-thardeck@suse.de>
	<1350220128-10140-3-git-send-email-thardeck@suse.de>
	<507EC7FF.90603@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1384374.LIZGkQOY9H";
	micalg="pgp-sha1"; protocol="application/pgp-signature"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 195.135.220.15
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 2/2] qemu queue: fix
	uninitialized removals
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
X-List-Received-Date: Wed, 17 Oct 2012 21:24:32 -0000


--nextPart1384374.LIZGkQOY9H
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Hi Andreas,

On Wednesday 17 October 2012 17:00:15 Andreas F=E4rber wrote:
> Tim,
>=20
> Am 14.10.2012 15:08, schrieb Tim Hardeck:
> > When calling QTAILQ_REMOVE or QLIST_REMOVE on an unitialized list
> > QEMU segfaults.
>=20
> Can this be reproduced by a user today? Or is this just fixing the ca=
se
> that a developer forgot to initialize a list?
I am not sure but in this case it happened during an early VNC connecti=
on=20
state failure which most likely wouldn't happen to regular users.
I triggered it while working on the VNC connection part.

The issue could most likely be also fixed in the VNC connection initial=
ization=20
process but if this changes doesn't have a relevant performance impact =
they=20
might prevent some other/future crashes.

Regards
Tim

>=20
> Regards,
> Andreas
>=20
> > Check for this case specifically on item removal.
> >=20
> > Signed-off-by: Tim Hardeck <thardeck@suse.de>
> > ---
> >=20
> >  qemu-queue.h |    8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/qemu-queue.h b/qemu-queue.h
> > index 9288cd8..47ed239 100644
> > --- a/qemu-queue.h
> > +++ b/qemu-queue.h
> > @@ -141,7 +141,9 @@ struct {                                       =
      =20
> >                  \>=20
> >          if ((elm)->field.le_next !=3D NULL)                       =
        \
> >         =20
> >                  (elm)->field.le_next->field.le_prev =3D           =
        \
> >                 =20
> >                      (elm)->field.le_prev;                         =
      \
> >=20
> > -        *(elm)->field.le_prev =3D (elm)->field.le_next;           =
        \
> > +        if ((elm)->field.le_prev !=3D NULL) {                     =
        \
> > +            *(elm)->field.le_prev =3D (elm)->field.le_next;       =
        \
> > +        }                                                         =
      \
> >=20
> >  } while (/*CONSTCOND*/0)
> > =20
> >  #define QLIST_FOREACH(var, head, field)                           =
      \
> >=20
> > @@ -381,7 +383,9 @@ struct {                                       =
      =20
> >                  \>=20
> >                      (elm)->field.tqe_prev;                        =
      \
> >         =20
> >          else                                                      =
      \
> >         =20
> >                  (head)->tqh_last =3D (elm)->field.tqe_prev;       =
        \
> >=20
> > -        *(elm)->field.tqe_prev =3D (elm)->field.tqe_next;         =
        \
> > +        if ((elm)->field.tqe_prev !=3D NULL) {                    =
        \
> > +            *(elm)->field.tqe_prev =3D (elm)->field.tqe_next;     =
        \
> > +        }                                                         =
      \
> >=20
> >  } while (/*CONSTCOND*/0)
> > =20
> >  #define QTAILQ_FOREACH(var, head, field)                          =
      \
--=20
SUSE LINUX Products GmbH, GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6=
rffer, HRB=20
16746 (AG N=FCrnberg)
Maxfeldstr. 5, 90409 N=FCrnberg, Germany
T: +49 (0) 911 74053-0  F: +49 (0) 911 74053-483 http://www.suse.de/
--nextPart1384374.LIZGkQOY9H
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQEcBAABAgAGBQJQfyIFAAoJENur/L6EMd67v2cIAKzVdEAoCQgKueCvyUt6rZmr
JRH/CstHiWreXQj2Czs3jQZMqcmaisyl55JbS2nkKmnvYSbso+IQXdNSsxrhGv/0
d3f3CILtyKT1kWhZPEkGqX/GbD0BhdpOLnk3dCeSfJqkw8H9S0ihaW3LAiF0v4KM
KPg29rRqwRIQo7ezD9QwC54RrWFqL9e03f/+OmlmA0rWWJLGPZVFcyrf8ZYXTOZB
NYbK62gt5pAa5IEUMXO2E+gYgWy2EXVVZFGnDgZgoDOn/7j8lxlpbpqYWzAxukDi
1YgU8nwJS57LVu/ni77ifcFah0O8XOePz+0FL+6JHrnXuJtuBsJA4r/amEN6+C4=
=/h07
-----END PGP SIGNATURE-----

--nextPart1384374.LIZGkQOY9H--


