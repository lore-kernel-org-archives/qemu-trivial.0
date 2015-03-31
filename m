Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Yd0lo-0008Ta-2L
	for mharc-qemu-trivial@gnu.org; Tue, 31 Mar 2015 14:20:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50598)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1Yd0ll-0008QN-Aa
	for qemu-trivial@nongnu.org; Tue, 31 Mar 2015 14:20:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1Yd0lk-0002xp-GM
	for qemu-trivial@nongnu.org; Tue, 31 Mar 2015 14:20:09 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42161)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1Yd0lf-0002mC-CZ; Tue, 31 Mar 2015 14:20:03 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id CEB7E3C227;
	Tue, 31 Mar 2015 18:20:02 +0000 (UTC)
Received: from [10.3.113.77] (ovpn-113-77.phx2.redhat.com [10.3.113.77])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t2VIK2Pd009927; Tue, 31 Mar 2015 14:20:02 -0400
Message-ID: <551AE551.90402@redhat.com>
Date: Tue, 31 Mar 2015 12:20:01 -0600
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Luiz Capitulino <lcapitulino@redhat.com>, qemu-devel@nongnu.org
References: <20150331133251.5be10dd6@redhat.com>
In-Reply-To: <20150331133251.5be10dd6@redhat.com>
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="R7dSuUFbT2KMukUA3EahhD9CHijCLTW7D"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, armbru@redhat.com
Subject: Re: [Qemu-trivial] [PATCH] balloon: improve error msg when adding
	second device
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
X-List-Received-Date: Tue, 31 Mar 2015 18:20:10 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--R7dSuUFbT2KMukUA3EahhD9CHijCLTW7D
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 03/31/2015 11:32 AM, Luiz Capitulino wrote:
> A VM supports only one balloon device, but due to several changes
> in infrastructure the error message got messed up when trying
> to add a second device. Fix it.
>=20
> Before this fix

>=20
> After this fix

[nice comparison snipped]

>=20
> Signed-off-by: Luiz Capitulino <lcapitulino@redhat.com>
> ---
>=20
> I think this can go through in via -trivial. I also think this
> is so simple and useful that it could be merged during freeze.
>=20
>  balloon.c                  | 1 -
>  hw/virtio/virtio-balloon.c | 2 +-
>  2 files changed, 1 insertion(+), 2 deletions(-)
>=20

Reviewed-by: Eric Blake <eblake@redhat.com>

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--R7dSuUFbT2KMukUA3EahhD9CHijCLTW7D
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJVGuVRAAoJEKeha0olJ0NqChYIAJuJy8sN1nftuPrT//Wdd6db
b8PxGmX8q6pzFCQunpfLw/7Z45UKzLusqyaUuWeCCs7FQOJ0+jofK0Ko7BOqoZnx
cFhdtAiO9i1ATx+WiKohalArl3RNIrob8THM5z9Sll1mE0OGd0vWqw6cbxSQrKqT
41YQIV3JGDAn+x1kVqrJTghPJAlKuV5aqTeT8DD+LPmrsfYhbxfPnreQbrAa7hF7
/L3Zk+yGFUTL1V9wge85+2+qQeZ7WtzXaJwCKXAU9yYDraZLrqNoeGdfgzBCbInq
tQWXGNxUgqe5k9pHwQ0IADAt6Akez8WK5jDO70FCef2Z3WOhX6EPQfXIA0cEVns=
=d7sS
-----END PGP SIGNATURE-----

--R7dSuUFbT2KMukUA3EahhD9CHijCLTW7D--

