Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XOuCH-0006aL-Fj
	for mharc-qemu-trivial@gnu.org; Tue, 02 Sep 2014 15:56:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37598)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1XOuCA-0006Si-IK
	for qemu-trivial@nongnu.org; Tue, 02 Sep 2014 15:56:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1XOuC5-00049d-Jz
	for qemu-trivial@nongnu.org; Tue, 02 Sep 2014 15:56:50 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59506)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1XOuBv-00047T-68; Tue, 02 Sep 2014 15:56:35 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s82JuTad006135
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Tue, 2 Sep 2014 15:56:29 -0400
Received: from [10.3.113.198] (ovpn-113-198.phx2.redhat.com [10.3.113.198])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s82JuSPQ018711; Tue, 2 Sep 2014 15:56:28 -0400
Message-ID: <540620EC.20909@redhat.com>
Date: Tue, 02 Sep 2014 13:56:28 -0600
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.7.0
MIME-Version: 1.0
To: zhanghailiang <zhang.zhanghailiang@huawei.com>, qemu-devel@nongnu.org
References: <1409646337-22960-1-git-send-email-zhang.zhanghailiang@huawei.com>
In-Reply-To: <1409646337-22960-1-git-send-email-zhang.zhanghailiang@huawei.com>
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="Flh0fig7i4ivFb2JBEhRkvn3PgOe67NNe"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, lersek@redhat.com, luonengjun@huawei.com,
	peter.huangpeng@huawei.com, lcapitulino@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] dump: let dump_error
 return error info to caller
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
X-List-Received-Date: Tue, 02 Sep 2014 19:56:55 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Flh0fig7i4ivFb2JBEhRkvn3PgOe67NNe
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 09/02/2014 02:25 AM, zhanghailiang wrote:
> The second parameter of dump_error is unused, but one purpose of
> using this function is to report the error info.
>=20
> Use error_set to return the error info to the caller.
>=20
> Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
> ---
>  V2:
> - Return the error reason to the caller which suggested by Luiz Capitul=
ino.
> ---
>  dump.c | 165 ++++++++++++++++++++++++++++++++-------------------------=
--------
>  1 file changed, 82 insertions(+), 83 deletions(-)
>=20
> diff --git a/dump.c b/dump.c
> index 71d3e94..0ab72e7 100644
> --- a/dump.c
> +++ b/dump.c
> @@ -81,9 +81,10 @@ static int dump_cleanup(DumpState *s)
>      return 0;
>  }
> =20
> -static void dump_error(DumpState *s, const char *reason)
> +static void dump_error(DumpState *s, Error **errp, const char *reason)=


The Error **errp is typically listed last.

>  {
>      dump_cleanup(s);
> +    error_setg(errp, "%s", reason);
>  }
> =20
>  static int fd_write_vmcore(const void *buf, size_t size, void *opaque)=

> @@ -99,7 +100,7 @@ static int fd_write_vmcore(const void *buf, size_t s=
ize, void *opaque)
>      return 0;
>  }
> =20
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
> +        dump_error(s, errp, "dump: failed to write elf header.\n");

This ends up calling error_setg with a trailing newline, which should
not be needed.  It looks like all of your conversions to the new
dump_error should drop the \n in the message.

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--Flh0fig7i4ivFb2JBEhRkvn3PgOe67NNe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg

iQEcBAEBCAAGBQJUBiDsAAoJEKeha0olJ0Nq4FwIAJPerfWPbT++eo0jpZ/Fzc/0
SLDptl8arwDpVepM9882E2vsATphkjvGvivmmSpSj8qDsyAPzkUImDx8DHTWNXtm
F/XuMrEFODj4ZIwsSUfv8kE84GTYsyt1nNv4GR7/poNfvITZohe+XYoILpl3xAbc
siYvoMMsMvDdCKP42ltTY0y6Avl9U2752A8FpVqZF/F8N+ldMVhrqp2yPzSR0eR8
MCFNaFQy4P7FC0Dpw/RiwDlfzXOffTmA91h/09RKu87oK52SVhaIyxJMI53ZNk8B
5cF9kSRX83GuzybiND3VwleiD68fkwTlzD3NswcHC2HWzuNeekpE/JN8+AT/kHI=
=xNNs
-----END PGP SIGNATURE-----

--Flh0fig7i4ivFb2JBEhRkvn3PgOe67NNe--

