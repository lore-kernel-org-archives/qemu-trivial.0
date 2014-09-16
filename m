Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XTija-00072m-49
	for mharc-qemu-trivial@gnu.org; Mon, 15 Sep 2014 22:43:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57678)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1XTijU-0006wB-6S
	for qemu-trivial@nongnu.org; Mon, 15 Sep 2014 22:43:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1XTijP-0003BG-RQ
	for qemu-trivial@nongnu.org; Mon, 15 Sep 2014 22:43:08 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52854)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1XTijG-00038s-KD; Mon, 15 Sep 2014 22:42:54 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s8G2gT3J028068
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Mon, 15 Sep 2014 22:42:29 -0400
Received: from [10.3.113.56] (ovpn-113-56.phx2.redhat.com [10.3.113.56])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s8G2gTL5002600; Mon, 15 Sep 2014 22:42:29 -0400
Message-ID: <5417A394.7050104@redhat.com>
Date: Mon, 15 Sep 2014 20:42:28 -0600
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.0
MIME-Version: 1.0
To: zhanghailiang <zhang.zhanghailiang@huawei.com>, qemu-trivial@nongnu.org
References: <1410835011-13292-1-git-send-email-zhang.zhanghailiang@huawei.com>
In-Reply-To: <1410835011-13292-1-git-send-email-zhang.zhanghailiang@huawei.com>
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="VDw6N81aXPMqQQI2d35mVXHppL0RqUaVI"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: luonengjun@huawei.com, qemu-devel@nongnu.org, peter.huangpeng@huawei.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] vl: Print maxmem in hex
 format for error message
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
X-List-Received-Date: Tue, 16 Sep 2014 02:43:12 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--VDw6N81aXPMqQQI2d35mVXHppL0RqUaVI
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 09/15/2014 08:36 PM, zhanghailiang wrote:
> In error message, maxmem is printed in Dec but ram_size in Hex.
> It is better to print them in same format.
> Also use error_report instead of fprintf.
>=20
> Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
> ---
>  vl.c | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
>=20
> diff --git a/vl.c b/vl.c
> index 5db0d08..ea60f93 100644
> --- a/vl.c
> +++ b/vl.c
> @@ -3358,34 +3358,34 @@ int main(int argc, char **argv, char **envp)
> =20
>                      sz =3D qemu_opt_get_size(opts, "maxmem", 0);
>                      if (sz < ram_size) {
> -                        fprintf(stderr, "qemu: invalid -m option value=
: maxmem "
> -                                "(%" PRIu64 ") <=3D initial memory ("
> -                                RAM_ADDR_FMT ")\n", sz, ram_size);
> +                        error_report("qemu: invalid -m option value: m=
axmem "
> +                                "(0x%" PRIx64 ") <=3D initial memory (=
0x"
> +                                RAM_ADDR_FMT ")", sz, ram_size);
>                          exit(EXIT_FAILURE);
>                      }
> =20
>                      slots =3D qemu_opt_get_number(opts, "slots", 0);
>                      if ((sz > ram_size) && !slots) {
> -                        fprintf(stderr, "qemu: invalid -m option value=
: maxmem "
> -                                "(%" PRIu64 ") more than initial memor=
y ("
> +                        error_report("qemu: invalid -m option value: m=
axmem "

doesn't error_report already prepend  a variation of "qemu", making your
"qemu: " redundant?

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--VDw6N81aXPMqQQI2d35mVXHppL0RqUaVI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg

iQEcBAEBCAAGBQJUF6OUAAoJEKeha0olJ0NqXvAH+gMOpCO6KIltqKATGzg24NTJ
9sa4Z6RwMuBZVFPZEEneQU0sNdx3b5/6H7p0MP4FKAZzhcV7qwKPmrdDOM4HzCbE
EMGQ16tON1SNzQjlrKxbb80R3Hi0aP/PPd00T7udAaQEbeuBgpwyRzCfguijvsYy
6+5srIqPlTe4xR8flP9hPObByFJzFdMCl8WTOqodmWJvpg4DY0y1zur8LI+j8sD5
65C+NYN8JJ6eNI3WxrqhXt+UiCwgVYgroI0xdjtPxdg3LkajTvfNMfOFGLS0zVjr
o6qHI0Spj1Doh/LBjUYgmhFbcXfLUID+yCbi2+3kI9QtHbK9HpN6ra5OL/14i4Q=
=k3JO
-----END PGP SIGNATURE-----

--VDw6N81aXPMqQQI2d35mVXHppL0RqUaVI--

