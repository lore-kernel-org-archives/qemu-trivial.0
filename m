Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YTudd-0001HS-J8
	for mharc-qemu-trivial@gnu.org; Fri, 06 Mar 2015 10:58:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39776)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1YTudV-0001GR-Uw
	for qemu-trivial@nongnu.org; Fri, 06 Mar 2015 10:58:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1YTudO-0001v0-IM
	for qemu-trivial@nongnu.org; Fri, 06 Mar 2015 10:58:01 -0500
Received: from mx1.redhat.com ([209.132.183.28]:47944)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1YTudO-0001uW-9h; Fri, 06 Mar 2015 10:57:54 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t26Fvqeq012781
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Fri, 6 Mar 2015 10:57:53 -0500
Received: from [10.3.113.113] (ovpn-113-113.phx2.redhat.com [10.3.113.113])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t26FvprC016473; Fri, 6 Mar 2015 10:57:51 -0500
Message-ID: <54F9CE7F.9010104@redhat.com>
Date: Fri, 06 Mar 2015 08:57:51 -0700
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <1425632998-616-1-git-send-email-armbru@redhat.com>
In-Reply-To: <1425632998-616-1-git-send-email-armbru@redhat.com>
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="TfQmFnXaxtBnvFMqdXoxqKXSt4nsefj56"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, lcapitulino@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 0/2] monitor: Fix and clean
	up around .user_print
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
X-List-Received-Date: Fri, 06 Mar 2015 15:58:08 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--TfQmFnXaxtBnvFMqdXoxqKXSt4nsefj56
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 03/06/2015 02:09 AM, Markus Armbruster wrote:
> A more thorough cleanup of the area is in the works, but I want to get
> this out quickly, so it makes 2.3.
>=20
> I think it can go via -trivial, if Luiz doesn't mind.
>=20
> Markus Armbruster (2):
>   hmp: Fix definition of command quit
>   qmp: Drop unused .user_print from command definitions

Reviewed-by: Eric Blake <eblake@redhat.com>

>=20
>  hmp-commands.hx | 1 -
>  qmp-commands.hx | 4 ----
>  2 files changed, 5 deletions(-)
>=20

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--TfQmFnXaxtBnvFMqdXoxqKXSt4nsefj56
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJU+c5/AAoJEKeha0olJ0NqKAkH/3YwPKX2vl3PHTl70wTUNjKO
op1oI1xzTO7wJtCe7K4dMqFs69CEvh1iH3aEI8r8yk8/lEgpWxB8pM62WEQPBFoj
KRYZZMf9zl2SrOivBrbMKVvw2W3CaOOJv5tAzJQnCLdjA4E3fsRHZgR8996AOtOw
ygOdYBFgwdsKABaNIO8AVMlFt6kaUVXLAUJN4EW4LM93hZ0JNBEoxXf+yYq95guQ
LUC++tJlhy1KK/75m02HQNPILMkmB6xOslIBc7wXYO+S7kkg5pTZID7Z9UjR+/7r
cFQjeOJyHga1mK6InjoCefk7TGRhdlJ5AzwUAhxN2FbOFp6JskUoQf/YIViuSvo=
=KqC8
-----END PGP SIGNATURE-----

--TfQmFnXaxtBnvFMqdXoxqKXSt4nsefj56--

