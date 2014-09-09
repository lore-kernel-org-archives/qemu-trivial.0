Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XRN4c-0005Id-9p
	for mharc-qemu-trivial@gnu.org; Tue, 09 Sep 2014 11:11:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40830)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1XRN4T-00054c-QX
	for qemu-trivial@nongnu.org; Tue, 09 Sep 2014 11:11:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1XRN4P-00045Q-9h
	for qemu-trivial@nongnu.org; Tue, 09 Sep 2014 11:11:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:64614)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1XRN48-000404-EC; Tue, 09 Sep 2014 11:10:44 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s89FAbX2009826
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Tue, 9 Sep 2014 11:10:37 -0400
Received: from [10.3.113.28] (ovpn-113-28.phx2.redhat.com [10.3.113.28])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s89FAa0L012824; Tue, 9 Sep 2014 11:10:37 -0400
Message-ID: <540F186C.2030508@redhat.com>
Date: Tue, 09 Sep 2014 09:10:36 -0600
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.7.0
MIME-Version: 1.0
To: zhanghailiang <zhang.zhanghailiang@huawei.com>, qemu-devel@nongnu.org
References: <1409738096-35644-1-git-send-email-zhang.zhanghailiang@huawei.com>
In-Reply-To: <1409738096-35644-1-git-send-email-zhang.zhanghailiang@huawei.com>
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="20RvcCX0uSr7Dp9tlr6Cc3sDcJGoBNDxB"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, luonengjun@huawei.com, lersek@redhat.com,
	peter.huangpeng@huawei.com, lcapitulino@redhat.com
Subject: Re: [Qemu-trivial] [PATCH v3] dump: let dump_error return error
	info to caller
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
X-List-Received-Date: Tue, 09 Sep 2014 15:11:12 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--20RvcCX0uSr7Dp9tlr6Cc3sDcJGoBNDxB
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 09/03/2014 03:54 AM, zhanghailiang wrote:
> The second parameter of dump_error is unused, but one purpose of
> using this function is to report the error info.
>=20
> Use error_set to return the error info to the caller.
>=20
> Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
> ---
>  V3:
> - Drop the '\n' in the message when call dump_error(comment of Eric Bla=
ke)=20
>  V2:
> - Return the error reason to the caller which suggested by Luiz Capitul=
ino.
> ---
>  dump.c | 165 ++++++++++++++++++++++++++++++++-------------------------=
--------
>  1 file changed, 82 insertions(+), 83 deletions(-)
>=20
> diff --git a/dump.c b/dump.c
> index 71d3e94..a08a711 100644
> --- a/dump.c
> +++ b/dump.c
> @@ -81,9 +81,10 @@ static int dump_cleanup(DumpState *s)
>      return 0;
>  }
> =20
> -static void dump_error(DumpState *s, const char *reason)
> +static void dump_error(DumpState *s, Error **errp, const char *reason)=


I still think it is unusual to list the errp argument in the middle,
instead of the end.  But not necessarily a show-stopper.


> -static int write_elf64_header(DumpState *s)
> +static int write_elf64_header(DumpState *s, Error **errp)
>  {
>      Elf64_Ehdr elf_header;
>      int ret;
> @@ -126,14 +127,14 @@ static int write_elf64_header(DumpState *s)
> =20
>      ret =3D fd_write_vmcore(&elf_header, sizeof(elf_header), s);
>      if (ret < 0) {
> -        dump_error(s, "dump: failed to write elf header.\n");
> +        dump_error(s, errp, "dump: failed to write elf header.");

We tend to avoid trailing '.' in error messages


> +static int write_dump_pages(DumpState *s, Error **errp)
>  {
>      int ret =3D 0;
>      DataCache page_desc, page_data;
> @@ -1241,7 +1244,7 @@ static int write_dump_pages(DumpState *s)
>      ret =3D write_cache(&page_data, buf, TARGET_PAGE_SIZE, false);
>      g_free(buf);
>      if (ret < 0) {
> -        dump_error(s, "dump: failed to write page data(zero page).\n")=
;
> +        dump_error(s, errp, "dump: failed to write page data(zero page=
).");

Pre-existing, but worth fixing: space before () in English sentences.

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--20RvcCX0uSr7Dp9tlr6Cc3sDcJGoBNDxB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg

iQEcBAEBCAAGBQJUDxhsAAoJEKeha0olJ0Nq/qMH/iyOVnHsNFSaHgIk2Jdwlcqj
BKyPGAVd0swGY96OZx4mtR/Cu1DzHI5Q3+Y05QUVgZaT3IIzKxp5I6tQ9HGaKxbv
hfjwvahbqXYsLRfdnguSDRByw5glQN6Z8ecQzyxQsXEsmh6xoJXV6tNKztVFZngN
lxZM0LK5nNbqFQygEEPJXLJnOefmbkdUa7g16+p9vkRNA8RXOgZHV7OOzJv0Az5c
GJJjUnBM9WXf3JjY2NR16rK1mo0AIpX4HKrz+fukbd4KmTRzrP9wq8EiNr4yAljA
SXEQ2QD2fP3/8pBfhER5ipUeAYGZWHufTOPV25Uw66q5n0cpNF8VBOKLuPHtka8=
=h7ic
-----END PGP SIGNATURE-----

--20RvcCX0uSr7Dp9tlr6Cc3sDcJGoBNDxB--

