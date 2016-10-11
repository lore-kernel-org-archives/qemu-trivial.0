Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1btzS8-0002Wl-7K
	for mharc-qemu-trivial@gnu.org; Tue, 11 Oct 2016 11:58:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45452)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1btzS3-0002Sx-Sj
	for qemu-trivial@nongnu.org; Tue, 11 Oct 2016 11:58:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1btzS1-0003me-Qi
	for qemu-trivial@nongnu.org; Tue, 11 Oct 2016 11:58:46 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44754)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1btzRt-0003ii-EL; Tue, 11 Oct 2016 11:58:37 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A402E7EAA3;
	Tue, 11 Oct 2016 15:58:36 +0000 (UTC)
Received: from [10.3.116.193] (ovpn-116-193.phx2.redhat.com [10.3.116.193])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9BFwYFu018013; Tue, 11 Oct 2016 11:58:35 -0400
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>
References: <1476199177-32411-1-git-send-email-thuth@redhat.com>
	<1476199177-32411-2-git-send-email-thuth@redhat.com>
Cc: Victor Kaplansky <victork@redhat.com>, Michael Tsirkin <mst@redhat.com>,
	qemu-trivial@nongnu.org, qemu-ppc@nongnu.org,
	Sascha Silbe <x-qemu@se-silbe.de>,
	David Gibson <david@gibson.dropbear.id.au>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <e230867b-47dc-1eb2-fe74-4becee0e7add@redhat.com>
Date: Tue, 11 Oct 2016 10:58:33 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <1476199177-32411-2-git-send-email-thuth@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="qX57qGuqITp33mmxGgI6OoV1JIo6siMTS"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Tue, 11 Oct 2016 15:58:36 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/3] tests/boot-sector: Use
 minimum length for the Forth boot script
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
X-List-Received-Date: Tue, 11 Oct 2016 15:58:51 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--qX57qGuqITp33mmxGgI6OoV1JIo6siMTS
Content-Type: multipart/mixed; boundary="Q3v0KS1qujvRiNqgfpaaMNehIM90C8Fo4";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Victor Kaplansky <victork@redhat.com>, Michael Tsirkin <mst@redhat.com>,
 qemu-trivial@nongnu.org, qemu-ppc@nongnu.org,
 Sascha Silbe <x-qemu@se-silbe.de>, David Gibson <david@gibson.dropbear.id.au>
Message-ID: <e230867b-47dc-1eb2-fe74-4becee0e7add@redhat.com>
Subject: Re: [Qemu-devel] [PATCH 1/3] tests/boot-sector: Use minimum length
 for the Forth boot script
References: <1476199177-32411-1-git-send-email-thuth@redhat.com>
 <1476199177-32411-2-git-send-email-thuth@redhat.com>
In-Reply-To: <1476199177-32411-2-git-send-email-thuth@redhat.com>

--Q3v0KS1qujvRiNqgfpaaMNehIM90C8Fo4
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 10/11/2016 10:19 AM, Thomas Huth wrote:
> The pxe-test is quite slow on ppc64 with tcg. We can speed it up
> a little bit by decreasing the size of the file that has to be
> loaded via TFTP.
>=20
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  tests/boot-sector.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/tests/boot-sector.c b/tests/boot-sector.c
> index e3193c0..0168fd0 100644
> --- a/tests/boot-sector.c
> +++ b/tests/boot-sector.c
> @@ -72,6 +72,7 @@ static uint8_t boot_sector[0x7e000] =3D {

The size of 0x7e000...

>  int boot_sector_init(const char *fname)
>  {
>      FILE *f =3D fopen(fname, "w");
> +    size_t len =3D sizeof boot_sector;
> =20
>      if (!f) {
>          fprintf(stderr, "Couldn't open \"%s\": %s", fname, strerror(er=
rno));
> @@ -80,13 +81,12 @@ int boot_sector_init(const char *fname)
> =20
>      /* For Open Firmware based system, we can use a Forth script inste=
ad */
>      if (strcmp(qtest_get_arch(), "ppc64") =3D=3D 0) {
> -        memset(boot_sector, ' ', sizeof boot_sector);
> -        sprintf((char *)boot_sector, "\\ Bootscript\n%x %x c! %x %x c!=
\n",
> +        len =3D sprintf((char *)boot_sector, "\\ Bootscript\n%x %x c! =
%x %x c!\n",

=2E..is enough to ensure the sprintf() doesn't overflow.  Still, I think
an snprintf() would be a bit nicer on maintainers to not have to worry
about whether overflow is even possible.

>                  LOW(SIGNATURE), BOOT_SECTOR_ADDRESS + SIGNATURE_OFFSET=
,
>                  HIGH(SIGNATURE), BOOT_SECTOR_ADDRESS + SIGNATURE_OFFSE=
T + 1);

Worth reindenting this to match the line above?

>      }
> =20
> -    fwrite(boot_sector, 1, sizeof boot_sector, f);
> +    fwrite(boot_sector, 1, len, f);

At any rate, the change makes sense, and I can't find anything
technically wrong with it, so feel free to add:
Reviewed-by: Eric Blake <eblake@redhat.com>

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--Q3v0KS1qujvRiNqgfpaaMNehIM90C8Fo4--

--qX57qGuqITp33mmxGgI6OoV1JIo6siMTS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJX/QwpAAoJEKeha0olJ0NqyM8H/3ndZ6V9rSmkUkr/58XnNZ4E
AIOXw942IQ1yySW4mdpanqIbEkom2b3CzeVdTcdMZjzQfPvfPL7CUzRK8OlJOiaX
/Fm+f+BXCE/4LOtweUN3LuZqWBm8+cBwGSyjoAf0Pb6kzYZsrBCEPgKg61l9qKpU
qxHzmG3fbg1ayah7IOlJuqs/QKFt73RCxTy4/AQx9Mi3C5tj6q/rdfG7j2g3elI1
NyBa65w6CONRildZRDBbXF1Gy/nlgTHblBeU2wvGQpPjqAJDrvSK3e6s0LzkqESG
QvkmzlewfIoM811gHEQcW8sBNl04RJ+YaiOR26lcqqVv9d+pO86B92Wlgl2SMl0=
=fdRg
-----END PGP SIGNATURE-----

--qX57qGuqITp33mmxGgI6OoV1JIo6siMTS--

