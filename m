Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZXwu5-0007Dk-CJ
	for mharc-qemu-trivial@gnu.org; Fri, 04 Sep 2015 15:44:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53775)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1ZXwu2-0007Ap-Tl
	for qemu-trivial@nongnu.org; Fri, 04 Sep 2015 15:44:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1ZXwu1-0006re-Pe
	for qemu-trivial@nongnu.org; Fri, 04 Sep 2015 15:44:02 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52064)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1ZXwtx-0006qR-Dm; Fri, 04 Sep 2015 15:43:57 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id 1E439C0AF3D4;
	Fri,  4 Sep 2015 19:43:57 +0000 (UTC)
Received: from [10.3.113.113] (ovpn-113-113.phx2.redhat.com [10.3.113.113])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t84JhuGE000328; Fri, 4 Sep 2015 15:43:56 -0400
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <1441395661-22447-1-git-send-email-marcandre.lureau@redhat.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <55E9F47C.8080807@redhat.com>
Date: Fri, 4 Sep 2015 13:43:56 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <1441395661-22447-1-git-send-email-marcandre.lureau@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="G2j1KsF6FFTcSLErhqArghOSee7DU41NE"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qapi-schema: remove
	legacy<> from doc
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
X-List-Received-Date: Fri, 04 Sep 2015 19:44:04 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--G2j1KsF6FFTcSLErhqArghOSee7DU41NE
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 09/04/2015 01:41 PM, marcandre.lureau@redhat.com wrote:
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>=20
> The legacy<> type is no longer used since 7ce7ffe02.
>=20
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  qapi-schema.json | 15 ++++++---------
>  1 file changed, 6 insertions(+), 9 deletions(-)

> @@ -1689,10 +1686,10 @@
>  #
>  # @property: The property name to read
>  #
> -# Returns: The property value.  The type depends on the property type.=
  legacy<>
> -#          properties are returned as #str.  child<> and link<> proper=
ties are
> -#          returns as #str pathnames.  All integer property types (u8,=
 u16, etc)
> -#          are returned as #int.
> +# Returns: The property value.  The type depends on the property
> +#          type. child<> and link<> properties are returns as #str

While at it, please fix the pre-existing typo:

s/returns/returned/

> +#          pathnames.  All integer property types (u8, u16, etc) are
> +#          returned as #int.

With that fixed,
Reviewed-by: Eric Blake <eblake@redhat.com>

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--G2j1KsF6FFTcSLErhqArghOSee7DU41NE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJV6fR8AAoJEKeha0olJ0Nqr34H/3QK/wr4EINl10zJMJU0qCKk
4qFXPLLcwI42gcCs8FyNhsEhNskrspVppX0cOPMTYJtodU43ZZwObrGNI+a8EjzQ
GeAusgCjlVKVbRa7/9QiQimbskQtixt2bc3XSmySmYOA97eODCTpgqxsZIa5B3gj
cU05MmYQvMd8D9BnrwJHrBRcN1iiHLdmPw4V/cze2i/MNygatesqHyrMF7i71aIl
bLA49hDB6mpuxk+/YRVBWkVajEfvDDp8ubNVAnrnuokPj2abNTqCNP6TUrA1Q2LY
zaCTm/9fWsmgU7odhgy6TpsypDlG+TLAt5lEV1tyB1LBe7Y5H0hT+5kvhSzC8Gc=
=PNkH
-----END PGP SIGNATURE-----

--G2j1KsF6FFTcSLErhqArghOSee7DU41NE--

