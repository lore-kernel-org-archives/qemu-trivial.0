Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZxM6C-0008Dw-8R
	for mharc-qemu-trivial@gnu.org; Fri, 13 Nov 2015 16:41:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59976)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1ZxM69-000896-KR
	for qemu-trivial@nongnu.org; Fri, 13 Nov 2015 16:41:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1ZxM68-0002SF-JQ
	for qemu-trivial@nongnu.org; Fri, 13 Nov 2015 16:41:33 -0500
Received: from mx1.redhat.com ([209.132.183.28]:42994)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1ZxM64-0002RN-8X; Fri, 13 Nov 2015 16:41:28 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id EC276368E3;
	Fri, 13 Nov 2015 21:41:27 +0000 (UTC)
Received: from [10.3.113.115] (ovpn-113-115.phx2.redhat.com [10.3.113.115])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tADLfRnc014104; Fri, 13 Nov 2015 16:41:27 -0500
To: "Daniel P. Berrange" <berrange@redhat.com>, qemu-devel@nongnu.org
References: <1447436727-26484-1-git-send-email-berrange@redhat.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <56465906.50509@redhat.com>
Date: Fri, 13 Nov 2015 14:41:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1447436727-26484-1-git-send-email-berrange@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="8RT5UvSoqf8wcB4SoU2JthfHHfcE2Nd18"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] crypto: avoid two coverity
 false positive error reports
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
X-List-Received-Date: Fri, 13 Nov 2015 21:41:34 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--8RT5UvSoqf8wcB4SoU2JthfHHfcE2Nd18
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 11/13/2015 10:45 AM, Daniel P. Berrange wrote:
> In qcrypto_tls_creds_get_path() coverity complains that
> we are checking '*creds' for NULL, despite having
> dereferenced it previously. This is harmless bug due
> to fact that the trace call was too early. Moving it
> after the cleanup gets the desired semantics.
>=20
> In qcrypto_tls_creds_check_cert_key_purpose() coverity
> complains that we're passing a pointer to a previously
> free'd buffer into gnutls_x509_crt_get_key_purpose_oid()
> This is harmless because we're passing a size =3D=3D 0, so
> gnutls won't access the buffer, but rather just report
> what size it needs to be. We can avoid it though by
> explicitly setting the buffer to NULL after free'ing
> it.
>=20
> Signed-off-by: Daniel P. Berrange <berrange@redhat.com>
> ---
>  crypto/tlscreds.c     | 4 ++--
>  crypto/tlscredsx509.c | 1 +
>  2 files changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--8RT5UvSoqf8wcB4SoU2JthfHHfcE2Nd18
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJWRlkHAAoJEKeha0olJ0NqClEIAIp94/ccg8y0Q3sGlj0Id1Ww
sF27MPaXq9snqFtSV+MAKwfnotRCvyMkI/PopedizVXP/mvdI9eU8Jle5gVMzQMB
Z36PwrzKSf/gNgpJAWjK+eHTcGFV87lElnoRYddXNwk76WRix2V143GDFNSZTwQb
Y9siVF1IUNGnGJ/HZAmMUwpdqdiehi4S3CxIGzlIHD92TG1XZWkZ12AdJrDTpNDp
rXhLZfjUIdRCxqJQKBK9FFLfyDxVyJ5KEXBu047aWUDPcSslGtRu1/Rken7bDHNK
PtBkuXkXS0NSGBoa11vAyCjgEZd5r8Mi9x78txMRL4YModnwv8N7Vzc4to8IXZA=
=35JX
-----END PGP SIGNATURE-----

--8RT5UvSoqf8wcB4SoU2JthfHHfcE2Nd18--

