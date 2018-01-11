Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eZe7f-0000nh-6B
	for mharc-qemu-trivial@gnu.org; Thu, 11 Jan 2018 09:46:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36008)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1eZe7c-0000la-9z
	for qemu-trivial@nongnu.org; Thu, 11 Jan 2018 09:46:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1eZe7b-00050m-CW
	for qemu-trivial@nongnu.org; Thu, 11 Jan 2018 09:46:24 -0500
Received: from mx1.redhat.com ([209.132.183.28]:30365)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1eZe7V-0004w3-B8; Thu, 11 Jan 2018 09:46:17 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0C0E6653F9;
	Thu, 11 Jan 2018 14:46:16 +0000 (UTC)
Received: from [10.10.124.124] (ovpn-124-124.rdu2.redhat.com [10.10.124.124])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 28FF717DFC;
	Thu, 11 Jan 2018 14:46:14 +0000 (UTC)
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org
References: <20180111143201.17865-1-mjt@msgid.tls.msk.ru>
Cc: qemu-devel@nongnu.org
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <06f69aed-3a7c-1f78-e83e-64e0fbd64791@redhat.com>
Date: Thu, 11 Jan 2018 08:46:14 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <20180111143201.17865-1-mjt@msgid.tls.msk.ru>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="Ec0CX49K14KYlzkQzom2CBy3xvstDIOPx"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Thu, 11 Jan 2018 14:46:16 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH trivial]
 scripts/argparse.py: spelling (independant)
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
X-List-Received-Date: Thu, 11 Jan 2018 14:46:25 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Ec0CX49K14KYlzkQzom2CBy3xvstDIOPx
Content-Type: multipart/mixed; boundary="aq7e0GcF5vhYQuFmi3zmuTX6lLaNQOfQa";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org
Message-ID: <06f69aed-3a7c-1f78-e83e-64e0fbd64791@redhat.com>
Subject: Re: [Qemu-devel] [PATCH trivial] scripts/argparse.py: spelling
 (independant)
References: <20180111143201.17865-1-mjt@msgid.tls.msk.ru>
In-Reply-To: <20180111143201.17865-1-mjt@msgid.tls.msk.ru>

--aq7e0GcF5vhYQuFmi3zmuTX6lLaNQOfQa
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 01/11/2018 08:32 AM, Michael Tokarev wrote:
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
>  scripts/argparse.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/scripts/argparse.py b/scripts/argparse.py
> index 288c1f06c0..27d1f28935 100644
> --- a/scripts/argparse.py
> +++ b/scripts/argparse.py

=46rom the top of the file:

# This is a local copy of the standard library argparse module taken
from PyPI.
# It is licensed under the Python Software Foundation License.  This is a=

# fallback for Python 2.6 which does not include this module.  Python
2.7+ and
# 3+ will never load this module because built-in modules are loaded befo=
re
# anything in sys.path.


> @@ -76,7 +76,7 @@ considered public as object names -- the API of the f=
ormatter objects is
>  still considered an implementation detail.)
>  """
> =20
> -__version__ =3D '1.4.0'  # we use our own version number independant o=
f the
> +__version__ =3D '1.4.0'  # we use our own version number independent o=
f the
>                         # one in stdlib and we release this on pypi.

Is this typo still present in the upstream source that we copied from?
It's our local downstream copy, so we can tweak it, but we might want to
feed this one back upstream.

Reviewed-by: Eric Blake <eblake@redhat.com>

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--aq7e0GcF5vhYQuFmi3zmuTX6lLaNQOfQa--

--Ec0CX49K14KYlzkQzom2CBy3xvstDIOPx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAlpXeLYACgkQp6FrSiUn
Q2oxyQf/VufzckI8PoAG00mQtxG0tP3GzHsmDQz+P0HEUR5sMO7gZBoaIz6476RV
qGX2vgjNxBh6cqROIiuh5nSzPZEvI1ct4FK75dbcWPWgb7tDsDAkgfvwUepgkPcD
pqXPAJW/qeUUPH4D2nc9crFK06arOOfwRWO1uQTdIuKWC13m1OsMZhiRETsaBBZ+
TZrAUcIzDFivyNYHyx/SUIMagFnCHsEtR4DwFBSNze7Vu/AfMhOG5Y3PADL8qsIc
Z/zFdQ3zqDNQ+i73wlJO56kuLUsXHSmMOMom+kcNNwAGE05WfL//zXx1Vozpnfte
ZH19E5uKEKSvi4gIhiZQ/qWm9bTbkA==
=cJVT
-----END PGP SIGNATURE-----

--Ec0CX49K14KYlzkQzom2CBy3xvstDIOPx--

