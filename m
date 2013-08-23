Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VCuS7-0007rD-Hq
	for mharc-qemu-trivial@gnu.org; Fri, 23 Aug 2013 12:43:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39946)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1VCuS1-0007kK-1Y
	for qemu-trivial@nongnu.org; Fri, 23 Aug 2013 12:43:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1VCuRv-0003rU-Mu
	for qemu-trivial@nongnu.org; Fri, 23 Aug 2013 12:43:04 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53422)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1VCuRm-0003mZ-8H; Fri, 23 Aug 2013 12:42:50 -0400
Received: from int-mx01.intmail.prod.int.phx2.redhat.com
	(int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r7NGgmS3003505
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 23 Aug 2013 12:42:48 -0400
Received: from [10.3.113.37] (ovpn-113-37.phx2.redhat.com [10.3.113.37])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r7NGglYn008115; Fri, 23 Aug 2013 12:42:47 -0400
Message-ID: <52179107.9070302@redhat.com>
Date: Fri, 23 Aug 2013 10:42:47 -0600
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130805 Thunderbird/17.0.8
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1377275808-9017-1-git-send-email-peter.maydell@linaro.org>
In-Reply-To: <1377275808-9017-1-git-send-email-peter.maydell@linaro.org>
X-Enigmail-Version: 1.5.2
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="JHJBtiFx3WpQgUCJu8KNlDIvUC5gMX2PK"
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.11
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Jan Kiszka <jan.kiszka@siemens.com>,
	qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] slirp/arp_table.c: Avoid
 shifting into sign bit of signed integers
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
X-List-Received-Date: Fri, 23 Aug 2013 16:43:09 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--JHJBtiFx3WpQgUCJu8KNlDIvUC5gMX2PK
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 08/23/2013 10:36 AM, Peter Maydell wrote:
> "0xf << 28" shifts right into the sign bit, since 0xf is a signed
> integer. Use the 'U' suffix to force an unsigned shift to avoid
> this undefined behaviour and a clang sanitizer warning.
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  slirp/arp_table.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--JHJBtiFx3WpQgUCJu8KNlDIvUC5gMX2PK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJSF5EHAAoJEKeha0olJ0Nqa4sH/ikCj2zeLkyMurctQ6aQDEUI
NCqG18j9QQsw+pg3DTXvreoIpy5WHrJr9AmyDmPXYNgG0K5fbDdilgtlG7xIaVLJ
a0C8ydtdMJXquYv0U6pIVyv4mFRAFT94fgjQ2J84J2TEeh8CPS3395MghwsbK+mf
PPAjLhGwZz82lGnXa5bFr5hjHZ6vPCdA/vLLWP6NFmHx4aFLyy1C6a/p3kIuEkF9
Gog+e64PSzLL/R0Ya7Ar4SFmYxX/tq8jBVY6mRpyNpKRMHVq1KoasYojdYwkSvcX
atUxwDXnEhh6E29pWrIQmHhpjGQLByNWUqeoynqnLII+5jGfxL1jWIo6om6QrLo=
=hYnq
-----END PGP SIGNATURE-----

--JHJBtiFx3WpQgUCJu8KNlDIvUC5gMX2PK--

