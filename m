Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ygg65-0004y9-Dm
	for mharc-qemu-trivial@gnu.org; Fri, 10 Apr 2015 17:04:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39652)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1Ygg62-0004tq-9U
	for qemu-trivial@nongnu.org; Fri, 10 Apr 2015 17:04:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1Ygg5z-0006zX-1x
	for qemu-trivial@nongnu.org; Fri, 10 Apr 2015 17:04:14 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59287)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1Ygg5y-0006zJ-Pa; Fri, 10 Apr 2015 17:04:10 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t3AL49dF013165
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Fri, 10 Apr 2015 17:04:10 -0400
Received: from [10.3.113.51] (ovpn-113-51.phx2.redhat.com [10.3.113.51])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t3AL49sl014692; Fri, 10 Apr 2015 17:04:09 -0400
Message-ID: <55283AC8.9090109@redhat.com>
Date: Fri, 10 Apr 2015 15:04:08 -0600
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: qemu-devel@nongnu.org
References: <1428699583-15237-1-git-send-email-eblake@redhat.com>
In-Reply-To: <1428699583-15237-1-git-send-email-eblake@redhat.com>
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="fsMj5FFET5se08mr16QlBAdLfAhDQnk0E"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, armbru@redhat.com, lcapitulino@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qapi: Drop dead genlist
	parameter
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
X-List-Received-Date: Fri, 10 Apr 2015 21:04:15 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--fsMj5FFET5se08mr16QlBAdLfAhDQnk0E
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 04/10/2015 02:59 PM, Eric Blake wrote:
> Defaulting a parameter to True, then having all callers omit
> or pass an explicit True for that parameter, is pointless.
> Looks like it has been dead since introduction in commit 06d64c6.
>=20
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>  scripts/qapi-visit.py | 36 ++++++++++++++++--------------------
>  1 file changed, 16 insertions(+), 20 deletions(-)

> @@ -510,8 +507,7 @@ exprs =3D parse_schema(input_file)
>  # for built-in types in our header files and simply guard them
>  fdecl.write(guardstart("QAPI_VISIT_BUILTIN_VISITOR_DECL"))
>  for typename in builtin_types.keys():

Sorry; this doesn't apply to current master.  I'll send a v2 that
doesn't depend on my pending qapi nested struct series.

> -    fdecl.write(generate_declaration(typename, None, genlist=3DTrue,
> -                                     builtin_type=3DTrue))
> +    fdecl.write(generate_declaration(typename, None, builtin_type=3DTr=
ue))
>  fdecl.write(guardend("QAPI_VISIT_BUILTIN_VISITOR_DECL"))
>=20
>  # ...this doesn't work for cases where we link in multiple objects tha=
t
>=20

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--fsMj5FFET5se08mr16QlBAdLfAhDQnk0E
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJVKDrIAAoJEKeha0olJ0NqQZkH/R0K4tOxgqX7fok1rIn8sJ8a
Gk1BrPZyT7o0HRlCgU4lIrlIWXMt8qCq6eNWg4GMt0/XjQB2GFUsUeKZDqv2mtkx
c/NyKZK5TJNbW8f2VY652YQdionra9PwLDBVrkvZ04BDd6jW4/fzRoDINVXQa4R0
Fo/6ltJaSlKY7AH+g/bpvh6dMf7yRlWxmAayo+txgPdxhjvU29MY4dlddJ1gktM+
N0g9TAUWJ7sDG3NKXTFhfyv46TZNR/I5HC4KLwSCOySxOZYBo/5JggvjNYxwn9Oc
6qIvN15nVE/oeXV3LQ7xaBg6ohBFqjO6O2Aa4V0MByxEvf8/Ez75bEb4Bf4lfrk=
=5zj2
-----END PGP SIGNATURE-----

--fsMj5FFET5se08mr16QlBAdLfAhDQnk0E--

