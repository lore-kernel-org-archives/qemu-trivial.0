Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZXwlC-0001Im-IX
	for mharc-qemu-trivial@gnu.org; Fri, 04 Sep 2015 15:34:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52553)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1ZXwlA-0001Ep-2M
	for qemu-trivial@nongnu.org; Fri, 04 Sep 2015 15:34:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1ZXwl9-00032w-6R
	for qemu-trivial@nongnu.org; Fri, 04 Sep 2015 15:34:52 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46095)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1ZXwl3-0002wN-Pt; Fri, 04 Sep 2015 15:34:45 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id 0BEAFABE;
	Fri,  4 Sep 2015 19:34:45 +0000 (UTC)
Received: from [10.3.113.113] (ovpn-113-113.phx2.redhat.com [10.3.113.113])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t84JYiUk030609; Fri, 4 Sep 2015 15:34:44 -0400
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org,
	marcandre.lureau@gmail.com, qemu-trivial@nongnu.org
References: <1441395005-14907-1-git-send-email-lvivier@redhat.com>
	<1441395005-14907-3-git-send-email-lvivier@redhat.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <55E9F253.6010903@redhat.com>
Date: Fri, 4 Sep 2015 13:34:43 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <1441395005-14907-3-git-send-email-lvivier@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="ItkvoUF3mgA4HOXPq5UHmamwu98Nsb5ji"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH v4 2/3] help: fix typo
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
X-List-Received-Date: Fri, 04 Sep 2015 19:34:53 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--ItkvoUF3mgA4HOXPq5UHmamwu98Nsb5ji
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 09/04/2015 01:30 PM, Laurent Vivier wrote:
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
>  qemu-options.hx | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

Subject line might have been more obvious as 'help: add missing newline'

>=20
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 77f5853..ab1af02 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -3510,7 +3510,7 @@ DEF("dump-vmstate", HAS_ARG, QEMU_OPTION_dump_vms=
tate,
>      "                Output vmstate information in JSON format to file=
=2E\n"
>      "                Use the scripts/vmstate-static-checker.py file to=
\n"
>      "                check for possible regressions in migration code\=
n"
> -    "                by comparing two such vmstate dumps.",
> +    "                by comparing two such vmstate dumps.\n",
>      QEMU_ARCH_ALL)
>  STEXI
>  @item -dump-vmstate @var{file}
>=20

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--ItkvoUF3mgA4HOXPq5UHmamwu98Nsb5ji
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJV6fJTAAoJEKeha0olJ0NqAH0IAIBbHK3EBrxPB1nIDhr4T+FP
D6aIlb3bHKDpHJGcLNezdb3bbctF41+jAM6cIPrsOG3OsMxGC9JXwL0doGx9BFw8
R5jzM8NrtxyS193SRJiUQHNEcFQGlb0D0fC19J6J4+A7psuh+E104CG6QlpWvcWc
Y4j7Patwx5k6Tmmy+kBdsI75zrI44U0ycXcdpgnA6gCuSTIOdaAdURvSnT+VY7Lh
9UmZ2L24MFXd+5sfrjd9cExl4UGIQG387gPd31mz/qqO1G2ct1Bu4PLEfQgKen0S
7gMqvBJXkecqVfMhDSBMofWklnGAtpmLeuJgG/FwQ60UeLQCsGN/KwcrQvqR6aA=
=i/3C
-----END PGP SIGNATURE-----

--ItkvoUF3mgA4HOXPq5UHmamwu98Nsb5ji--

