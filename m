Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bHue3-0005lP-LO
	for mharc-qemu-trivial@gnu.org; Tue, 28 Jun 2016 11:09:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42836)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1bHudx-0005aK-Qz
	for qemu-trivial@nongnu.org; Tue, 28 Jun 2016 11:09:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1bHudv-0002UC-E1
	for qemu-trivial@nongnu.org; Tue, 28 Jun 2016 11:09:40 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56115)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1bHudp-0002P1-0E; Tue, 28 Jun 2016 11:09:33 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AA90AC049E17;
	Tue, 28 Jun 2016 15:09:32 +0000 (UTC)
Received: from [10.3.116.72] (ovpn-116-72.phx2.redhat.com [10.3.116.72])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5SF9WSC006966; Tue, 28 Jun 2016 11:09:32 -0400
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
References: <1467125451-16700-1-git-send-email-peter.maydell@linaro.org>
	<1467125451-16700-2-git-send-email-peter.maydell@linaro.org>
Cc: patches@linaro.org
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <5772932B.1000302@redhat.com>
Date: Tue, 28 Jun 2016 09:09:31 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1467125451-16700-2-git-send-email-peter.maydell@linaro.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="T53VODl7mg91NcAlJSmlX5F33XxMpEdFI"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Tue, 28 Jun 2016 15:09:32 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/6] fsdev/9p-iov-marshal.c:
 Don't use cpu_to_*w() functions
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
X-List-Received-Date: Tue, 28 Jun 2016 15:09:45 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--T53VODl7mg91NcAlJSmlX5F33XxMpEdFI
Content-Type: multipart/mixed; boundary="Uif4Nc3WtC9Cl7X3Vj67baOpttl2Ag1tI"
From: Eric Blake <eblake@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
Cc: patches@linaro.org
Message-ID: <5772932B.1000302@redhat.com>
Subject: Re: [Qemu-devel] [PATCH 1/6] fsdev/9p-iov-marshal.c: Don't use
 cpu_to_*w() functions
References: <1467125451-16700-1-git-send-email-peter.maydell@linaro.org>
 <1467125451-16700-2-git-send-email-peter.maydell@linaro.org>
In-Reply-To: <1467125451-16700-2-git-send-email-peter.maydell@linaro.org>

--Uif4Nc3WtC9Cl7X3Vj67baOpttl2Ag1tI
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 06/28/2016 08:50 AM, Peter Maydell wrote:
> Don't use the cpu_to_*w() functions, which we are trying to deprecate.
> Instead just use cpu_to_*() to do the byteswap, which brings the
> code in the marshal function in line with that in the unmarshal.
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  fsdev/9p-iov-marshal.c | 18 ++++++------------
>  1 file changed, 6 insertions(+), 12 deletions(-)
>=20

>          case 'q': {
> -            uint64_t val;
> +            uint64_t val =3D va_arg(ap, uint64_t);;

s/;;/;/

With that fix,
Reviewed-by: Eric Blake <eblake@redhat.com>

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--Uif4Nc3WtC9Cl7X3Vj67baOpttl2Ag1tI--

--T53VODl7mg91NcAlJSmlX5F33XxMpEdFI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJXcpMrAAoJEKeha0olJ0NqorgIAIvTGiTkQOIxWb1KY2Z1BsrO
T8mAHHFvBgnoyatN5wWsnuKleugsZguwRPYRee8LsdjA470vSQrk/OZo5K7ZZreL
XRH3xWWysW8aZVbmnaemehlUQrM+IUxoWsR4atflZYYoX3UsLF6BgySLHtLFCrDi
DEejhG+jbqUd7FsImReqjccNmLB4a6d39yGuGmBOhB5iKxQXSKM+TmztgNrdjOlF
Dw7CVbRUEXVkDKvNd9rJWnVcyOJ7Dt7CDLOvENS6Befa3uClbdVbEtTYknhZDCiO
Dx4EillFa89SzQrl+/U7vOGM4pAnBAK4neHYQbO2C47F+6ydFEEHGAiFymZ9gm8=
=Mgl9
-----END PGP SIGNATURE-----

--T53VODl7mg91NcAlJSmlX5F33XxMpEdFI--

