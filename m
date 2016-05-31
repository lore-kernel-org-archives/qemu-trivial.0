Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b7nn4-0002Gi-QH
	for mharc-qemu-trivial@gnu.org; Tue, 31 May 2016 13:49:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59080)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1b7nn2-0002EH-Vg
	for qemu-trivial@nongnu.org; Tue, 31 May 2016 13:49:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1b7nn1-0005yn-15
	for qemu-trivial@nongnu.org; Tue, 31 May 2016 13:49:15 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59962)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1b7nmp-0005wq-KW; Tue, 31 May 2016 13:49:03 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2F7AC80F65;
	Tue, 31 May 2016 17:49:03 +0000 (UTC)
Received: from [10.3.116.22] (ovpn-116-22.phx2.redhat.com [10.3.116.22])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u4VHn2r1018298; Tue, 31 May 2016 13:49:02 -0400
To: Laurent Vivier <lvivier@redhat.com>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
References: <1464712565-14857-1-git-send-email-lvivier@redhat.com>
	<1464712565-14857-5-git-send-email-lvivier@redhat.com>
Cc: qemu-block@nongnu.org
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <574DCE8E.6000703@redhat.com>
Date: Tue, 31 May 2016 11:49:02 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1464712565-14857-5-git-send-email-lvivier@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="RcaRwbEQ7bp9m7W0j8ip7Xp1p5jhJE4Fp"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Tue, 31 May 2016 17:49:03 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 04/16] qed: Use DIV_ROUND_UP
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
X-List-Received-Date: Tue, 31 May 2016 17:49:18 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--RcaRwbEQ7bp9m7W0j8ip7Xp1p5jhJE4Fp
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 05/31/2016 10:35 AM, Laurent Vivier wrote:
> Replace (((n) + (d) - 1) /(d)) by DIV_ROUND_UP(n,d).
>=20
> This patch is the result of coccinelle script
> scripts/coccinelle/round.cocci
>=20
> CC: qemu-block@nongnu.org
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
>  block/qed-check.c | 3 +--
>  block/qed.c       | 3 +--
>  2 files changed, 2 insertions(+), 4 deletions(-)
>=20

Reviewed-by: Eric Blake <eblake@redhat.com>

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--RcaRwbEQ7bp9m7W0j8ip7Xp1p5jhJE4Fp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJXTc6OAAoJEKeha0olJ0NqolAIAJbZArvHjF7kn1ax9YYRYB+H
EvM5HyCTd2VRhZGagWwkGXvjnreSLe7rw7SVZ/uYAX8w5xNEfriF0plHCuOMhKaZ
HCjiOGOfCGj3yfLGPmCHfFnVz4JmzYPl4Lfod8SuZHbPzaixWmCeR4viZq7tdu4b
OUc2pWvwvI2WIubqPEeVT/xTYwU6qheu7gp0Dn30vPMNo2+vrHNg0rnayNep859E
MxkcXemj+wjurkjUUvNI1z8zveJSB/KMuglXJAnenK6kfToVx1IPgyPwe9Ss0tOB
i9t7FTlsBrS8EyTASU4Kwq2IjXkEpKr1DnDm5XNbfA1mDLQGT7T0GcMYMSRsYNw=
=0KCY
-----END PGP SIGNATURE-----

--RcaRwbEQ7bp9m7W0j8ip7Xp1p5jhJE4Fp--

