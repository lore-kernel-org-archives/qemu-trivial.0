Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eZdtG-0008Tt-4D
	for mharc-qemu-trivial@gnu.org; Thu, 11 Jan 2018 09:31:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57525)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1eZdtD-0008Rs-Fa
	for qemu-trivial@nongnu.org; Thu, 11 Jan 2018 09:31:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1eZdt9-00013E-4l
	for qemu-trivial@nongnu.org; Thu, 11 Jan 2018 09:31:31 -0500
Received: from mx1.redhat.com ([209.132.183.28]:36370)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1eZdsw-0000dh-JZ; Thu, 11 Jan 2018 09:31:14 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 92A1F8B112;
	Thu, 11 Jan 2018 14:31:02 +0000 (UTC)
Received: from [10.10.124.124] (ovpn-124-124.rdu2.redhat.com [10.10.124.124])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 97A9B9CB6;
	Thu, 11 Jan 2018 14:30:56 +0000 (UTC)
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org
References: <20180111142125.17034-1-mjt@msgid.tls.msk.ru>
Cc: David Hildenbrand <david@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <5d07939d-86f7-9599-6635-af805a47a96d@redhat.com>
Date: Thu, 11 Jan 2018 08:30:54 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <20180111142125.17034-1-mjt@msgid.tls.msk.ru>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="v8JtAoaLJtGyxbBUWipcR3dkfS0xiBD9J"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Thu, 11 Jan 2018 14:31:07 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH trivial] qapi-schema.json: spelling
 (independant comparation)
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
X-List-Received-Date: Thu, 11 Jan 2018 14:31:32 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--v8JtAoaLJtGyxbBUWipcR3dkfS0xiBD9J
Content-Type: multipart/mixed; boundary="iFfAp3KvyAeRdvJpvlBSpqgEvc9OmpJnc";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Message-ID: <5d07939d-86f7-9599-6635-af805a47a96d@redhat.com>
Subject: Re: [PATCH trivial] qapi-schema.json: spelling (independant
 comparation)
References: <20180111142125.17034-1-mjt@msgid.tls.msk.ru>
In-Reply-To: <20180111142125.17034-1-mjt@msgid.tls.msk.ru>

--iFfAp3KvyAeRdvJpvlBSpqgEvc9OmpJnc
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 01/11/2018 08:21 AM, Michael Tokarev wrote:
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
>  qapi-schema.json | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

>=20
> diff --git a/qapi-schema.json b/qapi-schema.json
> index 5c06745c79..0262b9f20b 100644
> --- a/qapi-schema.json
> +++ b/qapi-schema.json
> @@ -2023,7 +2023,7 @@
>  #
>  # @static: Expand to a static CPU model, a combination of a static bas=
e
>  #          model name and property delta changes. As the static base m=
odel will
> -#          never change, the expanded CPU model will be the same, inde=
pendant of
> +#          never change, the expanded CPU model will be the same, inde=
pendent of
>  #          independent of QEMU version, machine type, machine options,=
 and
>  #          accelerator options. Therefore, the resulting model can be =
used by
>  #          tooling without having to specify a compatibility machine -=
 e.g. when
> @@ -2102,7 +2102,7 @@
>  ##
>  # @CpuModelCompareResult:
>  #
> -# An enumeration of CPU model comparation results. The result is usual=
ly
> +# An enumeration of CPU model comparison results. The result is usuall=
y
>  # calculated using e.g. CPU features or CPU generations.
>  #
>  # @incompatible: If model A is incompatible to model B, model A is not=

>=20

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--iFfAp3KvyAeRdvJpvlBSpqgEvc9OmpJnc--

--v8JtAoaLJtGyxbBUWipcR3dkfS0xiBD9J
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAlpXdR8ACgkQp6FrSiUn
Q2rDoAf9ErTCIJyluIRG0CkAnYDnyivHkhTWUuJz9LdsJPAIFqgfIZSqqzrKiTtp
9dOUGabWZvFXm1+LDqqa1o8ZX0cP/SsIBlq0Igi5czONSKMgVdx+Nx/7Ud9F5M5v
X1ShFoEGfcK4BvU7xeYbwCcx+6zHXxfdKwy9nozyCwKvn7tCxePxxETZJcb6lZjR
5e35H2h5k7oyMBnuLzgOxPnSSqXGzQV3Dq78KXWHm045uC9iqHqobigXGmQa/rdm
urj7VaqzdAjBk/CyTuOBQlxk8lWZmZemRGQiH9wlzN7d3bsWZyg9b62E+9Bcu4wR
kKjHzvIJUE3FjTi6/WaciJiX2AADyQ==
=uWaO
-----END PGP SIGNATURE-----

--v8JtAoaLJtGyxbBUWipcR3dkfS0xiBD9J--

