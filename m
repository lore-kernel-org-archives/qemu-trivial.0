Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dXWfH-0007Fh-2x
	for mharc-qemu-trivial@gnu.org; Tue, 18 Jul 2017 13:52:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51067)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dXWfE-0007DP-1m
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 13:52:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dXWfD-0003G5-27
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 13:52:04 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34524)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1dXWf8-0003DZ-82; Tue, 18 Jul 2017 13:51:58 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CFD29C0587FD;
	Tue, 18 Jul 2017 17:51:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com CFD29C0587FD
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eblake@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com CFD29C0587FD
Received: from [10.10.120.160] (ovpn-120-160.rdu2.redhat.com [10.10.120.160])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E5A337EE7B;
	Tue, 18 Jul 2017 17:51:55 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	qemu-trivial@nongnu.org, Jiri Pirko <jiri@resnulli.us>,
	Jason Wang <jasowang@redhat.com>
References: <20170718061005.29518-1-f4bug@amsat.org>
	<20170718061005.29518-11-f4bug@amsat.org>
Cc: qemu-devel@nongnu.org
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <53a83027-dde9-9728-90ab-b90a92484445@redhat.com>
Date: Tue, 18 Jul 2017 12:51:55 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170718061005.29518-11-f4bug@amsat.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="CM9t1M1VfFXhBtVqgWMjdV2wBqgBxI6Uv"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Tue, 18 Jul 2017 17:51:57 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH 10/29] net/rocker: use QEMU_IS_ALIGNED
 macro
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
X-List-Received-Date: Tue, 18 Jul 2017 17:52:05 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--CM9t1M1VfFXhBtVqgWMjdV2wBqgBxI6Uv
Content-Type: multipart/mixed; boundary="QaFQr4Rf5ok6uHJW6LWjjoD6JIgAiAq6m";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-trivial@nongnu.org, Jiri Pirko <jiri@resnulli.us>,
 Jason Wang <jasowang@redhat.com>
Cc: qemu-devel@nongnu.org
Message-ID: <53a83027-dde9-9728-90ab-b90a92484445@redhat.com>
Subject: Re: [PATCH 10/29] net/rocker: use QEMU_IS_ALIGNED macro
References: <20170718061005.29518-1-f4bug@amsat.org>
 <20170718061005.29518-11-f4bug@amsat.org>
In-Reply-To: <20170718061005.29518-11-f4bug@amsat.org>

--QaFQr4Rf5ok6uHJW6LWjjoD6JIgAiAq6m
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 07/18/2017 01:09 AM, Philippe Mathieu-Daud=C3=A9 wrote:
> Applied using the Coccinelle semantic patch scripts/coccinelle/use_osde=
p.cocci
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/net/rocker/rocker.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/hw/net/rocker/rocker.c b/hw/net/rocker/rocker.c
> index 4f0f6d71e5..55228f2f52 100644
> --- a/hw/net/rocker/rocker.c
> +++ b/hw/net/rocker/rocker.c
> @@ -1419,7 +1419,7 @@ static int pci_rocker_init(PCIDevice *dev)
>              desc_ring_set_consume(ring, cmd_consume, ROCKER_MSIX_VEC_C=
MD);
>          } else if (i =3D=3D ROCKER_RING_EVENT) {
>              desc_ring_set_consume(ring, NULL, ROCKER_MSIX_VEC_EVENT);
> -        } else if (i % 2 =3D=3D 0) {
> +        } else if (QEMU_IS_ALIGNED(i, 2)) {
>              desc_ring_set_consume(ring, tx_consume,
>                                    ROCKER_MSIX_VEC_TX((i - 2) / 2));
>          } else if (i % 2 =3D=3D 1) {
>=20

Given the if chain, I think you don't want this one.


--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--QaFQr4Rf5ok6uHJW6LWjjoD6JIgAiAq6m--

--CM9t1M1VfFXhBtVqgWMjdV2wBqgBxI6Uv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAlluSrsACgkQp6FrSiUn
Q2pGTAgAqomevxNLRzvDQs6shE+VwqMTWgiwNjEdSLqdSaGCinByVPrcfex2zRR6
5vGJhFYJRF3lPXcSDiv5S5hdSGwfz+2GR2VLDhUH1fZRN0nk4Hz5LesER4pJ7GP1
Lb8iTFKSfoduuBZwPbfMZRbvMAfEGtvwmb2XcFJKsir69Ew+a3jV0GNblNCLyBUT
uzjv8GbXKCeVhOp3Llovo1EesMw4eDzF5wNPXoqWJt5OtyQZbW1VW2JWkH8iQUVF
WKml0xlk8U95EVYgz0WF1XrF6uEiDUhV7FL9akIVWC3BkTl43t0TSnccoaFYnW0w
7nvfmNEsP4vXB5gxC2XRLc8abWKWMQ==
=XfeF
-----END PGP SIGNATURE-----

--CM9t1M1VfFXhBtVqgWMjdV2wBqgBxI6Uv--

