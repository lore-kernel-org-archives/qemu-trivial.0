Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZkddF-000412-0b
	for mharc-qemu-trivial@gnu.org; Fri, 09 Oct 2015 15:47:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39671)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1ZkKi8-0007lO-Eg
	for qemu-trivial@nongnu.org; Thu, 08 Oct 2015 19:36:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1ZkKhT-0001p8-I4
	for qemu-trivial@nongnu.org; Thu, 08 Oct 2015 19:34:56 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59329)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1ZkKgI-0007yc-CT; Thu, 08 Oct 2015 19:33:02 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id 1E57C8F2E4;
	Thu,  8 Oct 2015 23:33:01 +0000 (UTC)
Received: from [10.3.113.202] (ovpn-113-202.phx2.redhat.com [10.3.113.202])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t98NX0jb003126; Thu, 8 Oct 2015 19:33:00 -0400
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <1444332916-16476-1-git-send-email-thuth@redhat.com>
	<1444332916-16476-6-git-send-email-thuth@redhat.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <5616FD27.9050207@redhat.com>
Date: Thu, 8 Oct 2015 17:32:55 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1444332916-16476-6-git-send-email-thuth@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="BxrTmWkojvJqaR4kgkV5WKPGv3lThjxj8"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Riku Voipio <riku.voipio@iki.fi>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 5/5] linux-user/syscall:
 Replace g_malloc0 + memcpy with g_memdup
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
X-List-Received-Date: Thu, 08 Oct 2015 23:36:02 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--BxrTmWkojvJqaR4kgkV5WKPGv3lThjxj8
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 10/08/2015 01:35 PM, Thomas Huth wrote:
> No need to use g_malloc0 to zero the memory if we memcpy to
> the whole buffer afterwards anyway. Actually, there is even
> a function which combines both steps, g_memdup, so let's use
> this function here instead.
>=20
> Cc: Riku Voipio <riku.voipio@iki.fi>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  linux-user/syscall.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

>=20
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 98b5766..f2ada0a 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -5325,8 +5325,7 @@ static abi_long do_open_by_handle_at(abi_long mou=
nt_fd, abi_long handle,
>          return -TARGET_EFAULT;
>      }
> =20
> -    fh =3D g_malloc0(total_size);
> -    memcpy(fh, target_fh, total_size);
> +    fh =3D g_memdup(target_fh, total_size);
>      fh->handle_bytes =3D size;
>      fh->handle_type =3D tswap32(target_fh->handle_type);
> =20
>=20

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--BxrTmWkojvJqaR4kgkV5WKPGv3lThjxj8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJWFv0oAAoJEKeha0olJ0NqA+kH/RY9mDmFqGMRjz3HgZiiHjn6
CVBskB1spdmSCQr6GgdwzvsgXr5/JG9+KWkH9OOxruLF0e3FXixFp2Fu9Gg9J3M1
mWuDFuHiQ522wqmoWE8r2I82dcuwjKzeNWn9z6TD8GoRN+mYeE707c9GYaGTEkpJ
r/LIp0ge7PUxip3/BsXbDupt3emof2ZiI5zEk3uh4flJG5qywAFGU0nzzCh7ykIf
sY8e+44SN7tvc3d6/GTuXpEgLfGUjLQDkqJHqatpJjEovKT9Z4zYvkALPyzBtQIW
XlCTk+QtViJjc3n7F3+wmFQBVpgF/R56Ri6UK20rNiP+Wthv32LnsojXB2z/Idk=
=kQwo
-----END PGP SIGNATURE-----

--BxrTmWkojvJqaR4kgkV5WKPGv3lThjxj8--

