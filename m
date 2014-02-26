Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WIoL9-0000AS-QC
	for mharc-qemu-trivial@gnu.org; Wed, 26 Feb 2014 18:56:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54891)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1WIoL2-0008U0-RW
	for qemu-trivial@nongnu.org; Wed, 26 Feb 2014 18:56:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1WIoKy-0007oB-9s
	for qemu-trivial@nongnu.org; Wed, 26 Feb 2014 18:56:32 -0500
Received: from mx1.redhat.com ([209.132.183.28]:54076)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1WIoKp-0007mY-5d; Wed, 26 Feb 2014 18:56:19 -0500
Received: from int-mx01.intmail.prod.int.phx2.redhat.com
	(int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s1QNuG9b002307
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 26 Feb 2014 18:56:16 -0500
Received: from [10.3.113.107] (ovpn-113-107.phx2.redhat.com [10.3.113.107])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id s1QNuG2e025794; Wed, 26 Feb 2014 18:56:16 -0500
Message-ID: <530E7F1F.2040802@redhat.com>
Date: Wed, 26 Feb 2014 16:56:15 -0700
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <1393458706-24883-1-git-send-email-peter.maydell@linaro.org>
In-Reply-To: <1393458706-24883-1-git-send-email-peter.maydell@linaro.org>
X-Enigmail-Version: 1.6
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="wVqIev1CjgjorMjFWjHSb8J6Gx7KI8637"
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.11
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <andreas.faerber@web.de>,
	patches@linaro.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qjson.h: Remove spurious
 GCC_FMT_ATTR markup from qobject_from_json() declaration
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
X-List-Received-Date: Wed, 26 Feb 2014 23:56:37 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--wVqIev1CjgjorMjFWjHSb8J6Gx7KI8637
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 02/26/2014 04:51 PM, Peter Maydell wrote:
> The function qobject_from_json() doesn't actually allow its
> argument to be a format string -- it passes a NULL va_list*
> to qobject_from_jsonv(), and the parser code will then never
> actually intepret %-escape sequences (it tests whether the
> va_list pointer is NULL and will stop with a parse error).
>=20
> The spurious attribute markup causes clang warnings in some
> of the test cases where we programmatically construct JSON
> to feed to qobject_from_json():
>=20
>  tests/test-qmp-input-visitor.c:76:35: warning: format string is not a
>  string literal (potentially insecure) [-Wformat-security]
>     data->obj =3D qobject_from_json(json_string);
>                                   ^~~~~~~~~~~
>=20
> Remove the incorrect attribute.
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  include/qapi/qmp/qjson.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--wVqIev1CjgjorMjFWjHSb8J6Gx7KI8637
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJTDn8fAAoJEKeha0olJ0Nqht4H/0LUHxl7jH0JaYrVrQ5KtVM/
jvqLnExido6cquYvxDA2HWU1jzvdcyzvAV7pzXA/UfDmt1vGuIe7cFd2Jazz+cLs
nZhYKMiJTLZQC8ppEbGiwxSqvSy8ZvWJDoHE7Y5mwxDh4++YVyxYqhbQQGA0fW7/
ugrIL+URytBilh5iIjuCc10pq2HDDxG+CmPLgzQpy4qLiCznHadBjm329K29lPv/
W7jVlXYbisGpT+z7srpRSgDw+hRZ6KiIscOL6XL3MnvFgUMcqUv4lb41IspCoXHP
m3f96llCiuB7tFsTLRaoncjdL8Pk0tvQTdJsTKHSma2fmAgcy1M7B5k72+JOX1E=
=VIuv
-----END PGP SIGNATURE-----

--wVqIev1CjgjorMjFWjHSb8J6Gx7KI8637--

