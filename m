Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h3NgH-0001aN-0T
	for mharc-qemu-trivial@gnu.org; Mon, 11 Mar 2019 12:21:37 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53446)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1h3NgF-0001Ya-1t
	for qemu-trivial@nongnu.org; Mon, 11 Mar 2019 12:21:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1h3NgE-0002Rq-8r
	for qemu-trivial@nongnu.org; Mon, 11 Mar 2019 12:21:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36244)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1h3NgC-0002PC-0p; Mon, 11 Mar 2019 12:21:32 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 391AD308FB9D;
	Mon, 11 Mar 2019 16:21:31 +0000 (UTC)
Received: from [10.3.118.35] (ovpn-118-35.phx2.redhat.com [10.3.118.35])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9555560123;
	Mon, 11 Mar 2019 16:21:28 +0000 (UTC)
To: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
	<philmd@redhat.com>
References: <1552300145-12526-1-git-send-email-thuth@redhat.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=eblake@redhat.com; keydata=
	xsBNBEvHyWwBCACw7DwsQIh0kAbUXyqhfiKAKOTVu6OiMGffw2w90Ggrp4bdVKmCaEXlrVLU
	xphBM8mb+wsFkU+pq9YR621WXo9REYVIl0FxKeQo9dyQBZ/XvmUMka4NOmHtFg74nvkpJFCD
	TUNzmqfcjdKhfFV0d7P/ixKQeZr2WP1xMcjmAQY5YvQ2lUoHP43m8TtpB1LkjyYBCodd+LkV
	GmCx2Bop1LSblbvbrOm2bKpZdBPjncRNob73eTpIXEutvEaHH72LzpzksfcKM+M18cyRH+nP
	sAd98xIbVjm3Jm4k4d5oQyE2HwOur+trk2EcxTgdp17QapuWPwMfhaNq3runaX7x34zhABEB
	AAHNHkVyaWMgQmxha2UgPGVibGFrZUByZWRoYXQuY29tPsLAegQTAQgAJAIbAwULCQgHAwUV
	CgkICwUWAgMBAAIeAQIXgAUCS8fL9QIZAQAKCRCnoWtKJSdDahBHCACbl/5FGkUqJ89GAjeX
	RjpAeJtdKhujir0iS4CMSIng7fCiGZ0fNJCpL5RpViSo03Q7l37ss+No+dJI8KtAp6ID+PMz
	wTJe5Egtv/KGUKSDvOLYJ9WIIbftEObekP+GBpWP2+KbpADsc7EsNd70sYxExD3liwVJYqLc
	Rw7so1PEIFp+Ni9A1DrBR5NaJBnno2PHzHPTS9nmZVYm/4I32qkLXOcdX0XElO8VPDoVobG6
	gELf4v/vIImdmxLh/w5WctUpBhWWIfQDvSOW2VZDOihm7pzhQodr3QP/GDLfpK6wI7exeu3P
	pfPtqwa06s1pae3ad13mZGzkBdNKs1HEm8x6zsBNBEvHyWwBCADGkMFzFjmmyqAEn5D+Mt4P
	zPdO8NatsDw8Qit3Rmzu+kUygxyYbz52ZO40WUu7EgQ5kDTOeRPnTOd7awWDQcl1gGBXgrkR
	pAlQ0l0ReO57Q0eglFydLMi5bkwYhfY+TwDPMh3aOP5qBXkm4qIYSsxb8A+i00P72AqFb9Q7
	3weG/flxSPApLYQE5qWGSXjOkXJv42NGS6o6gd4RmD6Ap5e8ACo1lSMPfTpGzXlt4aRkBfvb
	NCfNsQikLZzFYDLbQgKBA33BDeV6vNJ9Cj0SgEGOkYyed4I6AbU0kIy1hHAm1r6+sAnEdIKj
	cHi3xWH/UPrZW5flM8Kqo14OTDkI9EtlABEBAAHCwF8EGAEIAAkFAkvHyWwCGwwACgkQp6Fr
	SiUnQ2q03wgAmRFGDeXzc58NX0NrDijUu0zx3Lns/qZ9VrkSWbNZBFjpWKaeL1fdVeE4TDGm
	I5mRRIsStjQzc2R9b+2VBUhlAqY1nAiBDv0Qnt+9cLiuEICeUwlyl42YdwpmY0ELcy5+u6wz
	mK/jxrYOpzXKDwLq5k4X+hmGuSNWWAN3gHiJqmJZPkhFPUIozZUCeEc76pS/IUN72NfprZmF
	Dp6/QDjDFtfS39bHSWXKVZUbqaMPqlj/z6Ugk027/3GUjHHr8WkeL1ezWepYDY7WSoXwfoAL
	2UXYsMAr/uUncSKlfjvArhsej0S4zbqim2ZY6S8aRWw94J3bSvJR+Nwbs34GPTD4Pg==
Organization: Red Hat, Inc.
Message-ID: <6d46de0f-a443-2c90-334b-edd34325ac16@redhat.com>
Date: Mon, 11 Mar 2019 11:21:27 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <1552300145-12526-1-git-send-email-thuth@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="3NYOdmDI1QFfX0zYfAGB1voUcH6HJV7K1"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Mon, 11 Mar 2019 16:21:31 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] configure: Remove old
 *-config-devices.mak.d files when running configure
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
X-List-Received-Date: Mon, 11 Mar 2019 16:21:36 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--3NYOdmDI1QFfX0zYfAGB1voUcH6HJV7K1
Content-Type: multipart/mixed; boundary="Ai0J8rrq78vGQcQwhIcRM172fTZY1VoOM";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>
Message-ID: <6d46de0f-a443-2c90-334b-edd34325ac16@redhat.com>
Subject: Re: [PATCH] configure: Remove old *-config-devices.mak.d files when
 running configure
References: <1552300145-12526-1-git-send-email-thuth@redhat.com>
In-Reply-To: <1552300145-12526-1-git-send-email-thuth@redhat.com>

--Ai0J8rrq78vGQcQwhIcRM172fTZY1VoOM
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 3/11/19 5:29 AM, Thomas Huth wrote:
> When running "make" in a build directory from the pre-Kconfig merge tim=
e,
> the build process currently fails with:
>=20
>  make: *** No rule to make target `.../default-configs/pci.mak',
>   needed by `aarch64-softmmu/config-devices.mak'.  Stop.
>=20
> To make sure that this problem at least goes away when the user runs
> "configure" (or "sh config.status") again, we have to make sure that
> we re-generate the .mak.d files. Thus remove the old stale files
> while running the configure script.
>=20
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  configure | 3 +++
>  1 file changed, 3 insertions(+)

What are the conditions for make deciding it needs to rerun
config.status? Are end users still going to get 'make' failing with the
cryptic message (where we just advise on-list and on-wiki to
'./config.status' to fix it), or is there a way to build in a dependency
so that the makefile itself knows that if config.status has to be rerun,
that takes priority over any other rule that depends on .mak files?

>=20
> diff --git a/configure b/configure
> index b354e74..32c847f 100755
> --- a/configure
> +++ b/configure
> @@ -1792,6 +1792,9 @@ EOF
>  exit 0
>  fi
> =20
> +# Remove old dependency files to make sure that they get properly rege=
nerated
> +rm -f *-config-devices.mak.d
> +
>  if ! has $python; then
>    error_exit "Python not found. Use --python=3D/path/to/python"
>  fi
>=20

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


--Ai0J8rrq78vGQcQwhIcRM172fTZY1VoOM--

--3NYOdmDI1QFfX0zYfAGB1voUcH6HJV7K1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAlyGiwcACgkQp6FrSiUn
Q2r86Af/VRJDF3RUpBcpcETmr4Xbb9lGe8m+lHqXP4I7R05e4Fvckxwrc523PDoX
JtEBRZzJn9aUtdjdj9teN7xevsMHoMK/g8+ZZ8YBYZEiWuIJXEqvWdQkjQwDBCb4
nWu/6BHqCz9TVs2mhVZ3am5/q8aLw76Lkr/N2+9Ya+C4+liRrpQEUvmb+bsL0orQ
Y2HM1/8Yw377uF6JXIYGMB+tiyZ46u6XTIi93S1Cis+BZAcKLDJtEycZe7WeyLDo
HzQzKV724WbKQ7QgJbcG/xt3jbysJbCUCIb54fl+oZ8lkiZd2AGewgi0fl0hUZDt
IHDOOiO9mVfDSB1aTMYIP6dehirNJQ==
=25cx
-----END PGP SIGNATURE-----

--3NYOdmDI1QFfX0zYfAGB1voUcH6HJV7K1--

