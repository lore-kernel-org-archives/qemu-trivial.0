Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XemQA-0003wM-OQ
	for mharc-qemu-trivial@gnu.org; Thu, 16 Oct 2014 10:52:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42392)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1XemQ4-0003wC-KS
	for qemu-trivial@nongnu.org; Thu, 16 Oct 2014 10:52:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1XemPy-0005yR-A9
	for qemu-trivial@nongnu.org; Thu, 16 Oct 2014 10:52:48 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58089)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1XemPy-0005w3-2M; Thu, 16 Oct 2014 10:52:42 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s9GEqdF7024096
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Thu, 16 Oct 2014 10:52:40 -0400
Received: from [10.3.113.124] (ovpn-113-124.phx2.redhat.com [10.3.113.124])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s9GEqck2019052; Thu, 16 Oct 2014 10:52:39 -0400
Message-ID: <543FDBB6.1070204@redhat.com>
Date: Thu, 16 Oct 2014 08:52:38 -0600
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.1
MIME-Version: 1.0
To: Michal Privoznik <mprivozn@redhat.com>, qemu-devel@nongnu.org
References: <26626bbd0b1652d964c39937c378bb53089260f6.1413465100.git.mprivozn@redhat.com>
In-Reply-To: <26626bbd0b1652d964c39937c378bb53089260f6.1413465100.git.mprivozn@redhat.com>
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="LbCkLfHUAJoMIQJ7nwURvew0F7qx365aS"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, kwolf@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] util: Improve
	os_mem_prealloc error message
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
X-List-Received-Date: Thu, 16 Oct 2014 14:52:53 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--LbCkLfHUAJoMIQJ7nwURvew0F7qx365aS
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 10/16/2014 07:13 AM, Michal Privoznik wrote:
> Currently, when the preallocating guest memory process fails, an not

s/an/a/

> so helpful error message is printed out:
>=20
>     # virsh start migt10
>     error: Failed to start domain migt10
>     error: internal error: process exited while connecting to monitor:
>     os_mem_prealloc: failed to preallocate pages
>=20
>>From the error message it's not clear at the first glance where the
> problem lies. However, changing the error message might give uses a

s/uses/users/

> clue.
>=20
> Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
> ---
>  util/oslib-posix.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20

Reviewed-by: Eric Blake <eblake@redhat.com>

> diff --git a/util/oslib-posix.c b/util/oslib-posix.c
> index 016a047..8c9d80e 100644
> --- a/util/oslib-posix.c
> +++ b/util/oslib-posix.c
> @@ -390,7 +390,8 @@ void os_mem_prealloc(int fd, char *area, size_t mem=
ory)
>      pthread_sigmask(SIG_UNBLOCK, &set, &oldset);
> =20
>      if (sigsetjmp(sigjump, 1)) {
> -        fprintf(stderr, "os_mem_prealloc: failed to preallocate pages\=
n");
> +        fprintf(stderr, "os_mem_prealloc: Insufficient free host memor=
y "
> +                        "pages available to allocate guest RAM\n");
>          exit(1);
>      } else {
>          int i;
>=20

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--LbCkLfHUAJoMIQJ7nwURvew0F7qx365aS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg

iQEcBAEBCAAGBQJUP9u2AAoJEKeha0olJ0NqUpQH/A8R2rXPE6tXyRefIpojFzlf
z9aBSgSQRkaft/z1I4zCD4IG1ITLpO8cvvGJ+udhKJ9yNQPqut+JUI8MRPx60Uu2
DLLUqKjnVK8CZjdWQBOOaziJdcKuNG+JOrPsdF9kuLhHxqLMloAU6gGOckgdD7Yx
DacSyMUamBKC8YAUeqZ60aMDUk0cEqDSXLaI8TZMMGHr2RsZWkJG7mb4mI8EM2zq
YfUyop8leydaiLUyvoP86PTc2Ab4jCi39dGVPsKQ2ZIfczd24HLi/qwMtvEBNYS7
7nyjs9tyC2LjtY/Ay5pmaLKIolxIFVmM3C+1NKFSaxWyDmkpVSi8YnkBO/emg30=
=fLWW
-----END PGP SIGNATURE-----

--LbCkLfHUAJoMIQJ7nwURvew0F7qx365aS--

