Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dah9i-0001QI-GO
	for mharc-qemu-trivial@gnu.org; Thu, 27 Jul 2017 07:40:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43178)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <groug@kaod.org>) id 1dah9g-0001Q7-I2
	for qemu-trivial@nongnu.org; Thu, 27 Jul 2017 07:40:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <groug@kaod.org>) id 1dah9d-0001Ua-OH
	for qemu-trivial@nongnu.org; Thu, 27 Jul 2017 07:40:36 -0400
Received: from 19.mo4.mail-out.ovh.net ([87.98.179.66]:38215)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <groug@kaod.org>) id 1dah9d-0001Qz-GP
	for qemu-trivial@nongnu.org; Thu, 27 Jul 2017 07:40:33 -0400
Received: from player759.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo4.mail-out.ovh.net (Postfix) with ESMTP id 6E29789035
	for <qemu-trivial@nongnu.org>; Thu, 27 Jul 2017 13:40:24 +0200 (CEST)
Received: from bahia.lan (deibp9eh1--blueice1n7.emea.ibm.com [195.212.29.161])
	(Authenticated sender: groug@kaod.org)
	by player759.ha.ovh.net (Postfix) with ESMTPSA id 0850C6400C8;
	Thu, 27 Jul 2017 13:40:12 +0200 (CEST)
Date: Thu, 27 Jul 2017 13:40:05 +0200
From: Greg Kurz <groug@kaod.org>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, =?UTF-8?B?TWFyYy1BbmRyw6k=?=
	Lureau <marcandre.lureau@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Eric Blake <eblake@redhat.com>, "Aneesh Kumar K . V"
	<aneesh.kumar@linux.vnet.ibm.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Message-ID: <20170727134005.76e74eb6@bahia.lan>
In-Reply-To: <20170727024224.22900-18-f4bug@amsat.org>
References: <20170727024224.22900-1-f4bug@amsat.org>
	<20170727024224.22900-18-f4bug@amsat.org>
X-Mailer: Claws Mail 3.14.1 (GTK+ 2.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	boundary="Sig_/bfnJXxrYhM9lY8WmPrISK5q";
	protocol="application/pgp-signature"
X-Ovh-Tracer-Id: 15071296153352247748
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelkedrheelgdeggecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 87.98.179.66
Subject: Re: [Qemu-trivial] [PATCH for 2.10 v2 18/20] 9pfs: avoid sign
 conversion error simplifying the code
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
X-List-Received-Date: Thu, 27 Jul 2017 11:40:37 -0000

--Sig_/bfnJXxrYhM9lY8WmPrISK5q
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 26 Jul 2017 23:42:22 -0300
Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:

> (note this is how other functions also handle the errors).
>=20
> hw/9pfs/9p.c:948:18: warning: Loss of sign in implicit conversion
>         offset =3D err;
>                  ^~~
>=20
> Reported-by: Clang Static Analyzer
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---

Reviewed-by: Greg Kurz <groug@kaod.org>

Now, I'm not sure this can be merged during hard freeze since it is
more code cleanup than actual bug fixing...

>  hw/9pfs/9p.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
> index 333dbb6f8e..0a37c8bd13 100644
> --- a/hw/9pfs/9p.c
> +++ b/hw/9pfs/9p.c
> @@ -945,7 +945,6 @@ static void coroutine_fn v9fs_version(void *opaque)
>      v9fs_string_init(&version);
>      err =3D pdu_unmarshal(pdu, offset, "ds", &s->msize, &version);
>      if (err < 0) {
> -        offset =3D err;
>          goto out;
>      }
>      trace_v9fs_version(pdu->tag, pdu->id, s->msize, version.data);
> @@ -962,13 +961,12 @@ static void coroutine_fn v9fs_version(void *opaque)
> =20
>      err =3D pdu_marshal(pdu, offset, "ds", s->msize, &version);
>      if (err < 0) {
> -        offset =3D err;
>          goto out;
>      }
> -    offset +=3D err;
> +    err +=3D offset;
>      trace_v9fs_version_return(pdu->tag, pdu->id, s->msize, version.data);
>  out:
> -    pdu_complete(pdu, offset);
> +    pdu_complete(pdu, err);
>      v9fs_string_free(&version);
>  }
> =20


--Sig_/bfnJXxrYhM9lY8WmPrISK5q
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAll50RYACgkQAvw66wEB28LfBQCgjlsg2Pm9Nzt8b8MzQjfKhtrp
WnEAn1nTWirDcX4MlUK7hE0/sHDZRzEL
=wsQE
-----END PGP SIGNATURE-----

--Sig_/bfnJXxrYhM9lY8WmPrISK5q--

