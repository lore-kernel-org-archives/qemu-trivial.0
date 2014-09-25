Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XX8IT-0003fw-Oz
	for mharc-qemu-trivial@gnu.org; Thu, 25 Sep 2014 08:37:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60157)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1XX8IO-0003fl-Kv
	for qemu-trivial@nongnu.org; Thu, 25 Sep 2014 08:37:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1XX8IJ-0007pV-4r
	for qemu-trivial@nongnu.org; Thu, 25 Sep 2014 08:37:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:61399)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1XX8II-0007ot-Su; Thu, 25 Sep 2014 08:37:11 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s8PCaZ6L021591
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Thu, 25 Sep 2014 08:36:36 -0400
Received: from [10.3.113.28] (ovpn-113-28.phx2.redhat.com [10.3.113.28])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s8PCaZuN025350; Thu, 25 Sep 2014 08:36:35 -0400
Message-ID: <54240C52.3030709@redhat.com>
Date: Thu, 25 Sep 2014 06:36:34 -0600
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.0
MIME-Version: 1.0
To: arei.gonglei@huawei.com, qemu-devel@nongnu.org
References: <1411638384-5844-1-git-send-email-arei.gonglei@huawei.com>
	<1411638384-5844-5-git-send-email-arei.gonglei@huawei.com>
In-Reply-To: <1411638384-5844-5-git-send-email-arei.gonglei@huawei.com>
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="PuhULWlj4HeS6g7cVF0TJck8PamIJ5x7P"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, weidong.huang@huawei.com, qemu-trivial@nongnu.org,
	luonengjun@huawei.com, mjt@tls.msk.ru, armbru@redhat.com,
	peter.huangpeng@huawei.com, pbonzini@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 4/4] oslib-posix/win32:
 convert fprintf/perror to error_report
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
X-List-Received-Date: Thu, 25 Sep 2014 12:37:21 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--PuhULWlj4HeS6g7cVF0TJck8PamIJ5x7P
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 09/25/2014 03:46 AM, arei.gonglei@huawei.com wrote:
> From: Gonglei <arei.gonglei@huawei.com>
>=20
> Signed-off-by: Gonglei <arei.gonglei@huawei.com>
> ---
>  util/oslib-posix.c | 8 ++++----
>  util/oslib-win32.c | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)
>=20

> @@ -380,7 +380,7 @@ void os_mem_prealloc(int fd, char *area, size_t mem=
ory)
> =20
>      ret =3D sigaction(SIGBUS, &act, &oldact);
>      if (ret) {
> -        perror("os_mem_prealloc: failed to install signal handler");
> +        error_report("os_mem_prealloc: failed to install signal handle=
r");
>          exit(1);
>      }
> =20
> @@ -390,7 +390,7 @@ void os_mem_prealloc(int fd, char *area, size_t mem=
ory)
>      pthread_sigmask(SIG_UNBLOCK, &set, &oldset);
> =20
>      if (sigsetjmp(sigjump, 1)) {
> -        fprintf(stderr, "os_mem_prealloc: failed to preallocate pages\=
n");
> +        error_report("os_mem_prealloc: failed to preallocate pages");

Another reduction in error message quality.  You'll definitely need to
respin this series, and at this point, I don't know if you can call it
trivial.

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--PuhULWlj4HeS6g7cVF0TJck8PamIJ5x7P
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg

iQEcBAEBCAAGBQJUJAxTAAoJEKeha0olJ0NqBnkH/12QEy1C+FOWE0bqcZNpIT5y
p06isWQHvHgO2G7g+LFSAYrFmdnK0LFxz/LOlpLrYRmvZ6GcFh9oHMYTACLCmsrq
XlwSNArNM2lCJXDB7ciy44zbhs/TqCqNtiT9vrAkHNeusA9qLH2cyGMvnTnpGmLT
BOZN96z6egZkA2qtOaektypE/xlZfVNYUsSXtU24rp02H/TKzINtM65z4UbCGptw
BN8RNESWAt+2X++dJYMHcJLOk6qLSjGPtX2x4wXqdgKo7DEfcCyZu6fqeFbWQF+0
geJigzjqMLDzO/XDF/msPn8WyJNttAA89CKMdSaW89pNsqTexLMWiE+L9vr2rOA=
=m3ET
-----END PGP SIGNATURE-----

--PuhULWlj4HeS6g7cVF0TJck8PamIJ5x7P--

