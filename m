Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dXWes-0006z0-LM
	for mharc-qemu-trivial@gnu.org; Tue, 18 Jul 2017 13:51:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50847)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dXWep-0006ws-TU
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 13:51:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dXWep-0002xj-0m
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 13:51:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45056)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1dXWek-0002sy-EO; Tue, 18 Jul 2017 13:51:34 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3407D7DCE9;
	Tue, 18 Jul 2017 17:51:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 3407D7DCE9
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eblake@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 3407D7DCE9
Received: from [10.10.120.160] (ovpn-120-160.rdu2.redhat.com [10.10.120.160])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2D4987F8C0;
	Tue, 18 Jul 2017 17:51:31 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	qemu-trivial@nongnu.org, Dmitry Fleytman <dmitry@daynix.com>,
	Jason Wang <jasowang@redhat.com>
References: <20170718061005.29518-1-f4bug@amsat.org>
	<20170718061005.29518-10-f4bug@amsat.org>
Cc: qemu-devel@nongnu.org
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <6818fd68-0741-76f0-4d2c-a4d975e9d131@redhat.com>
Date: Tue, 18 Jul 2017 12:51:30 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170718061005.29518-10-f4bug@amsat.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="V45CnDOBNvOtN7p6GFp9PhWlkgxJdAvEN"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Tue, 18 Jul 2017 17:51:33 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH 09/29] net: use QEMU_IS_ALIGNED macro
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
X-List-Received-Date: Tue, 18 Jul 2017 17:51:41 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--V45CnDOBNvOtN7p6GFp9PhWlkgxJdAvEN
Content-Type: multipart/mixed; boundary="rTOxq8BW08MMNKgd6TWNRkoJRRA2IqWDw";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-trivial@nongnu.org, Dmitry Fleytman <dmitry@daynix.com>,
 Jason Wang <jasowang@redhat.com>
Cc: qemu-devel@nongnu.org
Message-ID: <6818fd68-0741-76f0-4d2c-a4d975e9d131@redhat.com>
Subject: Re: [PATCH 09/29] net: use QEMU_IS_ALIGNED macro
References: <20170718061005.29518-1-f4bug@amsat.org>
 <20170718061005.29518-10-f4bug@amsat.org>
In-Reply-To: <20170718061005.29518-10-f4bug@amsat.org>

--rTOxq8BW08MMNKgd6TWNRkoJRRA2IqWDw
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 07/18/2017 01:09 AM, Philippe Mathieu-Daud=C3=A9 wrote:
> Applied using the Coccinelle semantic patch scripts/coccinelle/use_osde=
p.cocci
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  net/eth.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/net/eth.c b/net/eth.c
> index 5b9ba26a56..187a6812f6 100644
> --- a/net/eth.c
> +++ b/net/eth.c
> @@ -332,7 +332,7 @@ eth_setup_ip4_fragmentation(const void *l2hdr, size=
_t l2hdr_len,
>          uint16_t frag_off_units =3D frag_offset / IP_FRAG_UNIT_SIZE;
>          uint16_t new_ip_off;
> =20
> -        assert(frag_offset % IP_FRAG_UNIT_SIZE =3D=3D 0);
> +        assert(QEMU_IS_ALIGNED(frag_offset, IP_FRAG_UNIT_SIZE));
>          assert((frag_off_units & ~IP_OFFMASK) =3D=3D 0);

This line is also a candidate for using the macro, albeit in the form
QEMU_IS_ALIGNED(frag_off_units, IP_OFFMASK + 1), which might not make as
much sense (but it DOES re-visit my question of whether the coccinelle
script should be taught more patterns)

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--rTOxq8BW08MMNKgd6TWNRkoJRRA2IqWDw--

--V45CnDOBNvOtN7p6GFp9PhWlkgxJdAvEN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAlluSqIACgkQp6FrSiUn
Q2q6igf/egf/6v3M4wV/mYbWLqTbfbEZ5u9oCR+6s+zT52/+VUmPPUR9efHh5J9S
Y2zqzj6ytEmrUIiYv7NAKVe9RxM0sad3GoPJEvfb9jdAw8nPERSE4bcquX9IfBoa
ARU51sK4b4004suxZ+2yQXa3/DpkvkFPZdASJB/lrbvloF7DIPrNEGESg3FdnV4M
HCEVqNf1qlY4H7MikPQ5M/cZOZEPKB5dAOEN2WXj4qyRevRb7zVKdiTE/YDebJAC
H1ag3b1QvG03NCLFLy35amrokpnXa4G4PU4mAqpdQBxooCO6lJEiwIygzZ0Z2tZW
fN8WLWzbjtwK9RvhT5Tn7yPxDl9z4A==
=qKtd
-----END PGP SIGNATURE-----

--V45CnDOBNvOtN7p6GFp9PhWlkgxJdAvEN--

