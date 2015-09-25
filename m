Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZfUWx-0007uE-Qz
	for mharc-qemu-trivial@gnu.org; Fri, 25 Sep 2015 11:03:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60440)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1ZfUWq-0007ho-Mm
	for qemu-trivial@nongnu.org; Fri, 25 Sep 2015 11:03:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1ZfUWm-0000U5-Gx
	for qemu-trivial@nongnu.org; Fri, 25 Sep 2015 11:03:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44952)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1ZfUWf-0000Pf-IK; Fri, 25 Sep 2015 11:03:05 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id B16F5C0B918B;
	Fri, 25 Sep 2015 15:03:04 +0000 (UTC)
Received: from [10.3.113.141] (ovpn-113-141.phx2.redhat.com [10.3.113.141])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t8PF33nB030186; Fri, 25 Sep 2015 11:03:03 -0400
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <1443189844-20341-1-git-send-email-marcandre.lureau@redhat.com>
	<1443189844-20341-2-git-send-email-marcandre.lureau@redhat.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <56056226.9030804@redhat.com>
Date: Fri, 25 Sep 2015 09:03:02 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <1443189844-20341-2-git-send-email-marcandre.lureau@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="HPDrjBqxgPMJ2TKlEh5rW9cld49704aDa"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial <qemu-trivial@nongnu.org>, armbru@redhat.com
Subject: Re: [Qemu-trivial] [PATCH 01/36] qapi: add comment block before
	ChardevDummy
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
X-List-Received-Date: Fri, 25 Sep 2015 15:03:22 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--HPDrjBqxgPMJ2TKlEh5rW9cld49704aDa
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 09/25/2015 08:03 AM, marcandre.lureau@redhat.com wrote:
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>=20
> This is mainly to please the doc generation that requires comment block=

> before the declaration.
>=20
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  qapi-schema.json | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

Could be taken through trivial branch now without waiting for pending
qapi patches, hence I've added a cc.

>=20
> diff --git a/qapi-schema.json b/qapi-schema.json
> index 516c95b..3e2e53d 100644
> --- a/qapi-schema.json
> +++ b/qapi-schema.json
> @@ -3042,13 +3042,17 @@
>  { 'struct': 'ChardevRingbuf', 'data': { '*size'  : 'int' } }
> =20
>  ##
> +# @ChardevDummy
> +##
> +{ 'struct': 'ChardevDummy', 'data': { } }

I might eventually reach the point where we could use:

{ 'union': 'ChardevBackend', 'data': { ...
  'pty': {},
=2E.. } }

instead of needing 'pty': 'ChardevDummy'.  But my current pending series
doesn't get us quite there yet, so it would be a separate cleanup anyways=
=2E

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--HPDrjBqxgPMJ2TKlEh5rW9cld49704aDa
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJWBWImAAoJEKeha0olJ0Nq7JAIAIZbu8JUQZjNah7ScnksqhKf
G/xOCPqeLhuprvNwHq695h6ibnh3qchufZYT1C8Kl+pT7UKVKvJZnRUAUJxprAzG
QTyV5/k6c2AdUVvhHzYf0gnpbVyCzv/v74RaWRLOGEolMxHeMp4EjBUH7EyORmtN
vTQFaGjb5K7QfqGW4rtyPKY6A2k05/XD3FuoEwUTobYnOOn8nLyC7Qs73j8dIp7B
o1kCvPmG9XJQTzj3Zt8IwEmayPEjZa/759d1tbdpmfbqIEQjT9kFNaG1Shn9Nmbp
jDWV0h3H6AMtrG3hUF1/TNhpw/ke4hDkzmINeJcyoi4iQwSAC2N5h9YR2xRCeIQ=
=VrTA
-----END PGP SIGNATURE-----

--HPDrjBqxgPMJ2TKlEh5rW9cld49704aDa--

