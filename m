Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YQ0Wb-0002LK-EB
	for mharc-qemu-trivial@gnu.org; Mon, 23 Feb 2015 16:26:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51473)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1YQ0WU-0002Eo-7s
	for qemu-trivial@nongnu.org; Mon, 23 Feb 2015 16:26:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1YQ0WO-0001gN-E3
	for qemu-trivial@nongnu.org; Mon, 23 Feb 2015 16:26:38 -0500
Received: from mx1.redhat.com ([209.132.183.28]:42874)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1YQ0WO-0001gJ-5t; Mon, 23 Feb 2015 16:26:32 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t1NLQU3a019598
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Mon, 23 Feb 2015 16:26:30 -0500
Received: from [10.3.113.36] (ovpn-113-36.phx2.redhat.com [10.3.113.36])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t1NLQTEV027907; Mon, 23 Feb 2015 16:26:29 -0500
Message-ID: <54EB9B04.1070901@redhat.com>
Date: Mon, 23 Feb 2015 14:26:28 -0700
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Alberto Garcia <berto@igalia.com>, qemu-devel@nongnu.org
References: <1424723236-24368-1-git-send-email-berto@igalia.com>
In-Reply-To: <1424723236-24368-1-git-send-email-berto@igalia.com>
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="XL9sGk1mHvH1VAn7OEafEPAAlB3HMESdX"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qmp-commands.hx: Fix
	several typos
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
X-List-Received-Date: Mon, 23 Feb 2015 21:26:44 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--XL9sGk1mHvH1VAn7OEafEPAAlB3HMESdX
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 02/23/2015 01:27 PM, Alberto Garcia wrote:
> Signed-off-by: Alberto Garcia <berto@igalia.com>
> ---
>  qmp-commands.hx | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20

> @@ -2922,7 +2922,7 @@ Channels are described by a json-object, each one=
 contain the following:
>  - "channel-id": channel id.  Usually "0", might be different needed wh=
en
>                  multiple channels of the same type exist, such as mult=
iple
>                  display channels in a multihead setup (json-int)
> -- "tls": whevener the channel is encrypted (json-bool)
> +- "tls": whenever the channel is encrypted (json-bool)

Might be nicer as 'whether' rather than 'whenever'.

But as your version is strictly better than an obvious typo,
Reviewed-by: Eric Blake <eblake@redhat.com>

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--XL9sGk1mHvH1VAn7OEafEPAAlB3HMESdX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJU65sEAAoJEKeha0olJ0NqcH4IAKfDRYLWSmOJ5unMHb4Hdd/6
0zylli2qsFr4CieoNoxMHuLj5rJxVaiNC/Onj06iiCI72JHvjhnAtvl2Nz3yf8XB
/OT8dfSKyUUXTq6shU8MOmFrab8iBdD8x97VmAWo1e9ZxvZlp3GnLzfI6pmGRBKJ
FjJG32jdFna2TF19HxRBJ6JBrxXjmaweQu+7PMIAjvhZVzTT/nnfquEJOmN1FbBw
AjLI5+qY95eRc9JWk54x8mJZxky+dFNU78bmew7RMDriudyHTN168AwxzR8kyYeM
C7h7qflLwcuiRLB9DSE9r33uIhohcHb4XsB6txg9/8s3SFHGlCVbO/uEi5C9xfQ=
=Rk5a
-----END PGP SIGNATURE-----

--XL9sGk1mHvH1VAn7OEafEPAAlB3HMESdX--

