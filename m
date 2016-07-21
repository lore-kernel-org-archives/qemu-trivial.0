Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bQ9xH-0008HZ-DM
	for mharc-qemu-trivial@gnu.org; Thu, 21 Jul 2016 05:07:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45896)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1bQ9xC-0008Cn-C8
	for qemu-trivial@nongnu.org; Thu, 21 Jul 2016 05:07:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1bQ9x8-00013x-Tx
	for qemu-trivial@nongnu.org; Thu, 21 Jul 2016 05:07:38 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55826)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>)
	id 1bQ9wz-0000zI-Nw; Thu, 21 Jul 2016 05:07:25 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 413823E2A1;
	Thu, 21 Jul 2016 09:07:25 +0000 (UTC)
Received: from localhost (ovpn-112-65.ams2.redhat.com [10.36.112.65])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u6L97NEB002263; Thu, 21 Jul 2016 05:07:24 -0400
Date: Thu, 21 Jul 2016 10:07:21 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Reda Sallahi <fullmanet@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
	Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
	Fam Zheng <famz@redhat.com>, qemu-trivial@nongnu.org
Message-ID: <20160721090721.GA27488@stefanha-x1.localdomain>
References: <20160721084153.16103-1-fullmanet@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/04w6evG8XlLl3ft"
Content-Disposition: inline
In-Reply-To: <20160721084153.16103-1-fullmanet@gmail.com>
User-Agent: Mutt/1.6.1 (2016-04-27)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Thu, 21 Jul 2016 09:07:25 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] qemu-img: fix error messages emitted by
 img_open()
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
X-List-Received-Date: Thu, 21 Jul 2016 09:07:41 -0000


--/04w6evG8XlLl3ft
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 21, 2016 at 10:41:53AM +0200, Reda Sallahi wrote:
> img_open_file() and img_open_opts() were printing error messages with a
> duplicate part because of a wrong use of error_reportf_err() (e.g.
> qemu-img: Could not open 'foo': Could not open 'foo': No such file or dir=
ectory)
>=20
> This change uses error_report_err() instead to eliminate the duplicate pa=
rt.
>=20
> Signed-off-by: Reda Sallahi <fullmanet@gmail.com>
> ---
>  qemu-img.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/qemu-img.c b/qemu-img.c
> index 2e40e1f..dc6652d 100644
> --- a/qemu-img.c
> +++ b/qemu-img.c
> @@ -268,7 +268,7 @@ static BlockBackend *img_open_opts(const char *optstr,
>      options =3D qemu_opts_to_qdict(opts, NULL);
>      blk =3D blk_new_open(NULL, NULL, options, flags, &local_err);
>      if (!blk) {
> -        error_reportf_err(local_err, "Could not open '%s': ", optstr);
> +        error_report_err(local_err);
>          return NULL;
>      }
>      blk_set_enable_write_cache(blk, !writethrough);
> @@ -295,7 +295,7 @@ static BlockBackend *img_open_file(const char *filena=
me,
> =20
>      blk =3D blk_new_open(filename, NULL, options, flags, &local_err);
>      if (!blk) {
> -        error_reportf_err(local_err, "Could not open '%s': ", filename);
> +        error_report(local_err);
>          return NULL;
>      }
>      blk_set_enable_write_cache(blk, !writethrough);

The duplication happens in the "Could not open 'foo'" case, but other
error cases do not include the filename in the error message.

We would lose information in those error cases since the filename is no
longer included by qemu-img.c in the error message.

I'm not aware of a clean way to distinguish Error objects.  Maybe
someone else can suggest one.  Otherwise it may be best to leave the
code as it is.

Stefan

--/04w6evG8XlLl3ft
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJXkJDJAAoJEJykq7OBq3PIk2oH/1AHdz4WC7aJ0bEo3dQytyS+
uD1UrCcNlP/Hg+tShU1A4ok95BDITB2VIDmGwdbDZaAb1p+rdv2YgnziXPklutvk
CF6trFsMw9hj/mmshBOPaOHuX23GvPf9i4QMd1CutYGZ5gXVKjXECQVxxuJ4twU4
y+5r+zJaAuj2Ic1s3PZPb1tkq/uFbis962PcB7SLyIGfFpT3koV7vGa/ae2ukVvN
AFa3DAEYac3+eLw10F65wb0Uwkk+KZCRBdyW+e8TgLjw8GR/uBJZ2jshZAUCK2jV
jyBqj/OxGIwmEBrwqc4Y5kva0ykYHmLM1vZ0m8XkircSd3Pz9RGBYuGr5rruv5g=
=ATvb
-----END PGP SIGNATURE-----

--/04w6evG8XlLl3ft--

