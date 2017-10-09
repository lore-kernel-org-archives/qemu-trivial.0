Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e1cLD-0002PC-9W
	for mharc-qemu-trivial@gnu.org; Mon, 09 Oct 2017 13:59:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59885)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1e1cLB-0002OJ-3S
	for qemu-trivial@nongnu.org; Mon, 09 Oct 2017 13:59:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1e1cLA-0003BH-94
	for qemu-trivial@nongnu.org; Mon, 09 Oct 2017 13:59:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55390)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1e1cL6-00039K-5q; Mon, 09 Oct 2017 13:59:40 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0940C914E0;
	Mon,  9 Oct 2017 17:59:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 0940C914E0
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eblake@redhat.com
Received: from [10.10.122.223] (ovpn-122-223.rdu2.redhat.com [10.10.122.223])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3E5856155C;
	Mon,  9 Oct 2017 17:59:32 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
	Markus Armbruster <armbru@redhat.com>,
	Michael Roth <mdroth@linux.vnet.ibm.com>
References: <20171006235023.11952-1-f4bug@amsat.org>
	<20171006235023.11952-35-f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	qemu trival <qemu-trivial@nongnu.org>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <e2221fca-f041-c1ac-143e-19fd72b31cd5@redhat.com>
Date: Mon, 9 Oct 2017 12:59:31 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20171006235023.11952-35-f4bug@amsat.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="8tBXAeO3PnjU9iuJmtpdCQBTHNugW7QPO"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Mon, 09 Oct 2017 17:59:39 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH 34/88] qapi: use g_new() family of
 functions
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
X-List-Received-Date: Mon, 09 Oct 2017 17:59:46 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--8tBXAeO3PnjU9iuJmtpdCQBTHNugW7QPO
Content-Type: multipart/mixed; boundary="KOwxMkCjk457d9LEhXbfWKPGMkpFx6PDj";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu trival <qemu-trivial@nongnu.org>
Message-ID: <e2221fca-f041-c1ac-143e-19fd72b31cd5@redhat.com>
Subject: Re: [PATCH 34/88] qapi: use g_new() family of functions
References: <20171006235023.11952-1-f4bug@amsat.org>
 <20171006235023.11952-35-f4bug@amsat.org>
In-Reply-To: <20171006235023.11952-35-f4bug@amsat.org>

--KOwxMkCjk457d9LEhXbfWKPGMkpFx6PDj
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 10/06/2017 06:49 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  qapi/opts-visitor.c           | 2 +-
>  qapi/qapi-clone-visitor.c     | 2 +-
>  qapi/qapi-dealloc-visitor.c   | 2 +-
>  qapi/qobject-output-visitor.c | 2 +-
>  qapi/string-input-visitor.c   | 2 +-
>  qapi/string-output-visitor.c  | 2 +-
>  6 files changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/qapi/opts-visitor.c b/qapi/opts-visitor.c
> index 324b197495..34ac49f3c2 100644
> --- a/qapi/opts-visitor.c
> +++ b/qapi/opts-visitor.c
> @@ -539,7 +539,7 @@ opts_visitor_new(const QemuOpts *opts)
>      OptsVisitor *ov;
> =20
>      assert(opts);
> -    ov =3D g_malloc0(sizeof *ov);
> +    ov =3D g_new0(OptsVisitor, 1);

Transformations like this are harder to justify - you have more typing
rather than less, and no change in the amount of type-safety.

If we really want to convert LHS =3D g_malloc0(sizeof(*LHS)), we probably=

ought to have a stronger justification (consistency might be such an
argument, if the entire series is applied and HACKING is updated to
mention our new preferred style, and where the checked-in Coccinelle
script can be easily re-run in the future to catch regressions).

Converting LHS =3D g_malloc0(sizeof(type)) is a no-brainer, because it
DOES add type-safety, and often results in less typing.  But I haven't
looked at your entire series to see which patches fall in the no-brainer
category vs. the weakly-argued consistency category.

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--KOwxMkCjk457d9LEhXbfWKPGMkpFx6PDj--

--8tBXAeO3PnjU9iuJmtpdCQBTHNugW7QPO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAlnbuQMACgkQp6FrSiUn
Q2pYDAf/bNENuoOOlnvpm4CNBPBADhDkXYCmvXGvIZQ1dzExSgvjJBgXudEcN987
1iBAgJSiNYy48BrfGIAklFFeaAm8rEH1EJ1Jziq2aGPvWYYxg7ja01NTqVx3lKfG
jPLbCVcMOkKfYKcdLeaI6KiSACDO5o4KhIOrzYDZALWqktH2kgXjJuDWLVSAdP0+
JgUPKYhuOG35W/qouZUlALkGwZcDqQSSXekmlw6TMdXTxQRqvz1TvSI230Lgy7Sq
Bx4Kw9dymHNfOzDe3CBFMzWUka15aI8mZ1Ef/jebXxaZdOiOtSEPipQ792dyu5IM
67xAaCN9K/G9cCZqay5iaJJa+ezJKw==
=uA/B
-----END PGP SIGNATURE-----

--8tBXAeO3PnjU9iuJmtpdCQBTHNugW7QPO--

