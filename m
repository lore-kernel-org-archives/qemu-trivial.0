Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UjTy1-0001eW-H6
	for mharc-qemu-trivial@gnu.org; Mon, 03 Jun 2013 08:34:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54860)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1UjTxt-0001Wl-El
	for qemu-trivial@nongnu.org; Mon, 03 Jun 2013 08:34:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1UjTxo-0005K2-JG
	for qemu-trivial@nongnu.org; Mon, 03 Jun 2013 08:34:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37758)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1UjTxd-0005H9-N9; Mon, 03 Jun 2013 08:34:05 -0400
Received: from int-mx12.intmail.prod.int.phx2.redhat.com
	(int-mx12.intmail.prod.int.phx2.redhat.com [10.5.11.25])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r53CY3PD018837
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 3 Jun 2013 08:34:03 -0400
Received: from [10.3.113.96] (ovpn-113-96.phx2.redhat.com [10.3.113.96])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r53CY09L012411; Mon, 3 Jun 2013 08:34:02 -0400
Message-ID: <51AC8D38.90205@redhat.com>
Date: Mon, 03 Jun 2013 06:34:00 -0600
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>
References: <1370251243-20352-1-git-send-email-mjt@msgid.tls.msk.ru>
In-Reply-To: <1370251243-20352-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Enigmail-Version: 1.5.1
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="----enig2QFMDPOUJUTTPOPOJMAGB"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.25
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH trivial] acpi: actually
 require either data= or file= for -acpitable
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
X-List-Received-Date: Mon, 03 Jun 2013 12:34:28 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
------enig2QFMDPOUJUTTPOPOJMAGB
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 06/03/2013 03:20 AM, Michael Tokarev wrote:
> Initially the code ensured that we have exactly one of
> data=3D or file=3D option for -acpitable.  But after some
> transformations, the condition becomes
>=20
>   if (has_data =3D=3D has_file) { error }
>=20
> to mean, probably, that both should not be set at the same
> time.  But this condition does not cover the case when
> neither is set, and we generate bogus acpi table in this
> case.
>=20
> Instead, check if sum of the two is exactly 1.
>=20
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
>  hw/acpi/core.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/hw/acpi/core.c b/hw/acpi/core.c
> index 42eeace..2815d8c 100644
> --- a/hw/acpi/core.c
> +++ b/hw/acpi/core.c
> @@ -249,7 +249,7 @@ void acpi_table_add(const QemuOpts *opts, Error **e=
rrp)
>      if (err) {
>          goto out;
>      }
> -    if (hdrs->has_file =3D=3D hdrs->has_data) {

NACK.

hdrs->has_file and hdrs->has_data are both bool.  Pre-patch, the table
of possible combinations is:

false =3D=3D false =3D> error message, zero given
false =3D=3D true =3D> okay, exactly one given
true =3D=3D false =3D> okay, exactly one given
true =3D=3D true =3D> error message, two given

which is already what you want.

> +    if (!hdrs->has_file + !hdrs->has_data !=3D 1) {

Meanwhile, the post-patch logic is harder to read, in my opinion.

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


------enig2QFMDPOUJUTTPOPOJMAGB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.13 (GNU/Linux)
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJRrI04AAoJEKeha0olJ0NqEOYIAI7QDD4/dNnkfsWHUnvELZvw
9nc8WFyb4oBTlzykbAonzbPLF3WwLuo/k4bSF6l9Woz1NdVwhH6udIWa/LVYKxDP
VoG+1A1hIqJIbORR94JJmlZE0h6mvwcb8rHSdDEAgJ/mN3aV4SVT3ZXApV59mQP0
ip+7OVeoXg1PyYQGeVrJ2gVLExDkuFO2ghU9xzHhcDjhoBHvqq49KtGMR33bpmMY
rTwgFrXo4WkaK/cNxy9UkoDge41DYYnSb+hq0ovauGPK3TKJ33+5eJ+HW6AgC33k
VPcwwQ397KTYAlVcVYBfYQHMUWvrKtfxwPqACK3R1CD7Ivpq45R8WmC3Myf9fqY=
=VDwL
-----END PGP SIGNATURE-----

------enig2QFMDPOUJUTTPOPOJMAGB--

