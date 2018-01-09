Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eZ2cS-0005Ib-Hc
	for mharc-qemu-trivial@gnu.org; Tue, 09 Jan 2018 17:43:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51773)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1eZ2cM-0005FA-Q4
	for qemu-trivial@nongnu.org; Tue, 09 Jan 2018 17:43:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1eZ2cL-00077J-Pr
	for qemu-trivial@nongnu.org; Tue, 09 Jan 2018 17:43:38 -0500
Received: from mx1.redhat.com ([209.132.183.28]:57948)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1eZ2cD-00070y-4v; Tue, 09 Jan 2018 17:43:29 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F1D6F83F47;
	Tue,  9 Jan 2018 22:43:27 +0000 (UTC)
Received: from [10.10.124.124] (ovpn-124-124.rdu2.redhat.com [10.10.124.124])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 612261F8;
	Tue,  9 Jan 2018 22:43:25 +0000 (UTC)
To: qemu-devel@nongnu.org
References: <20171129152510.25833-1-eblake@redhat.com>
Cc: pbonzini@redhat.com, famz@redhat.com,
	qemu-trivial <qemu-trivial@nongnu.org>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <00beb02b-c86a-092c-e496-738164d87a4a@redhat.com>
Date: Tue, 9 Jan 2018 16:43:24 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <20171129152510.25833-1-eblake@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="wGGpmEdtlYQDXaJfcYGAepKEB7k0lZ4kH"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Tue, 09 Jan 2018 22:43:28 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] maint: Mention web site
 maintenance in README
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
X-List-Received-Date: Tue, 09 Jan 2018 22:43:43 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--wGGpmEdtlYQDXaJfcYGAepKEB7k0lZ4kH
Content-Type: multipart/mixed; boundary="Z9fImcGMXtKkcVA0mwv8VkrrjYyU0kJZU";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, famz@redhat.com,
 qemu-trivial <qemu-trivial@nongnu.org>
Message-ID: <00beb02b-c86a-092c-e496-738164d87a4a@redhat.com>
Subject: Re: [Qemu-devel] [PATCH] maint: Mention web site maintenance in
 README
References: <20171129152510.25833-1-eblake@redhat.com>
In-Reply-To: <20171129152510.25833-1-eblake@redhat.com>

--Z9fImcGMXtKkcVA0mwv8VkrrjYyU0kJZU
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 11/29/2017 09:25 AM, Eric Blake wrote:
> Now that we have a website that accepts patches on the list, the
> main project should make it easier to find information about that
> process.
>=20
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>=20
> Doc only, so it could go in -rc3 if we have a reason to slip it
> in this late; but I'm also fine if it waits for 2.12.

It's now 2.12 material. Ping!
CC: qemu-trivial

>=20
>  README | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/README b/README
> index b92a07a61a..2c8e1c8cc4 100644
> --- a/README
> +++ b/README
> @@ -68,6 +68,10 @@ the QEMU website
>    https://qemu.org/Contribute/SubmitAPatch
>    https://qemu.org/Contribute/TrivialPatches
>=20
> +The QEMU website is also maintained under source control.
> +
> +  git clone git://git.qemu.org/qemu-web.git
> +  https://www.qemu.org/2017/02/04/the-new-qemu-website-is-up/
>=20
>  Bug reporting
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--Z9fImcGMXtKkcVA0mwv8VkrrjYyU0kJZU--

--wGGpmEdtlYQDXaJfcYGAepKEB7k0lZ4kH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAlpVRYwACgkQp6FrSiUn
Q2pryQf8DAbz1HiRqsGbYPBZhMSunfIXrGjkrulWG15fbf5tTZNVCQH6HthoHWhT
U9hR521ACBKPgziR6Dp8auiqKTb7Uitk2n6TIxapqrRBwTRcU8aYL211a9gi7COq
a1MwmmsyMgkDv6XfURtYcgbykCndARgFKaWtmv5wC6wYb6cqfvIOAQvKGGMUsajl
wO4EBJlVGWzm+7gnDXm7N0BCcAIaru99kxaaxZD4PPsPYLgeaw/agGYc9r5g5YvZ
Fp1L7+TGNpMhxGHAMv3LfsKc9S8j7HqDzDkR4iurFsMHuIP9X63mpms7245JSkgh
ueumtXgZodPhRL7vq2tL9JbP5fauhQ==
=6gZ+
-----END PGP SIGNATURE-----

--wGGpmEdtlYQDXaJfcYGAepKEB7k0lZ4kH--

