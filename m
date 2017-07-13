Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dVkcL-000675-LK
	for mharc-qemu-trivial@gnu.org; Thu, 13 Jul 2017 16:21:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56081)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dVkcI-00064Z-Sr
	for qemu-trivial@nongnu.org; Thu, 13 Jul 2017 16:21:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dVkcH-0004m5-Ro
	for qemu-trivial@nongnu.org; Thu, 13 Jul 2017 16:21:42 -0400
Received: from mx1.redhat.com ([209.132.183.28]:31719)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1dVkcA-0004hK-Rw; Thu, 13 Jul 2017 16:21:35 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D052B7F3F1;
	Thu, 13 Jul 2017 20:21:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com D052B7F3F1
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eblake@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com D052B7F3F1
Received: from [10.10.121.60] (ovpn-121-60.rdu2.redhat.com [10.10.121.60])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D8E485DC1A;
	Thu, 13 Jul 2017 20:21:29 +0000 (UTC)
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org
References: <20170713163219.9024-1-marcandre.lureau@redhat.com>
	<20170713163219.9024-11-marcandre.lureau@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>, peter.maydell@linaro.org,
	"open list:vvfat" <qemu-block@nongnu.org>, qemu-trivial@nongnu.org,
	Max Reitz <mreitz@redhat.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <873282ab-9f53-6a48-c644-280ebf0e1a81@redhat.com>
Date: Thu, 13 Jul 2017 15:21:28 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170713163219.9024-11-marcandre.lureau@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="m40CrhB2HjXb82kcqH8wUxTQukcC01UUl"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Thu, 13 Jul 2017 20:21:34 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 10/29] vvfat: use
 DIV_ROUND_UP
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
X-List-Received-Date: Thu, 13 Jul 2017 20:21:44 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--m40CrhB2HjXb82kcqH8wUxTQukcC01UUl
Content-Type: multipart/mixed; boundary="3XLLbhCxNLUOSM7mwwX1IXeWgoIM8TVFV";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, peter.maydell@linaro.org,
 "open list:vvfat" <qemu-block@nongnu.org>, qemu-trivial@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Message-ID: <873282ab-9f53-6a48-c644-280ebf0e1a81@redhat.com>
Subject: Re: [Qemu-devel] [PATCH v2 10/29] vvfat: use DIV_ROUND_UP
References: <20170713163219.9024-1-marcandre.lureau@redhat.com>
 <20170713163219.9024-11-marcandre.lureau@redhat.com>
In-Reply-To: <20170713163219.9024-11-marcandre.lureau@redhat.com>

--3XLLbhCxNLUOSM7mwwX1IXeWgoIM8TVFV
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 07/13/2017 11:32 AM, Marc-Andr=C3=A9 Lureau wrote:
> I used the clang-tidy qemu-round check to generate the fix:
> https://github.com/elmarco/clang-tools-extra
>=20
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  block/vvfat.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

>=20
> diff --git a/block/vvfat.c b/block/vvfat.c
> index 4fd28e1e87..c08c4fb525 100644
> --- a/block/vvfat.c
> +++ b/block/vvfat.c
> @@ -437,7 +437,7 @@ static direntry_t *create_long_filename(BDRVVVFATSt=
ate *s, const char *filename)
>          return NULL;
>      }
> =20
> -    number_of_entries =3D (length * 2 + 25) / 26;
> +    number_of_entries =3D DIV_ROUND_UP(length * 2, 26);

Wow - a non-power-of-2!  Good thing our macro works for that.

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--3XLLbhCxNLUOSM7mwwX1IXeWgoIM8TVFV--

--m40CrhB2HjXb82kcqH8wUxTQukcC01UUl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJZZ9ZIAAoJEKeha0olJ0NqCIAH/j/Ip3fzG4cwA0j1YnlSGSwK
QNhAcoGuI53jkZh/b6b2y7msSlw1Y/qTb1heIveLwpHIKN/xiyJeNdHxMXil/nZN
DBo6BXkcBr9RXJ7p2DNFnRzNSjwr0lV4eXnUzG33lH+bHaY72PK4YqflaZ5TiV+g
Sj5v0yYd1oQ9IhTR3F0SAJ6hx4H30PmoMURiJ/2a4L4AqekJdAh01yW72eGFYY4G
HZRdFC7iHWx84Olq9VirQbaYG/k+kwzkcTDZBqKq+KkAAC+MICAoUKumWBrmhSMO
VvyAnFNMYNxSAFyd3SypKEdEORJ/2u7YZjkAx4OJilJWz4i+5ZnyKGumvBlb/Uo=
=/yS+
-----END PGP SIGNATURE-----

--m40CrhB2HjXb82kcqH8wUxTQukcC01UUl--

