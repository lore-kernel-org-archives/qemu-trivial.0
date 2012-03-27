Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SCaHk-0003DM-In
	for mharc-qemu-trivial@gnu.org; Tue, 27 Mar 2012 13:34:20 -0400
Received: from eggs.gnu.org ([208.118.235.92]:60100)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1SCaHh-000348-5O
	for qemu-trivial@nongnu.org; Tue, 27 Mar 2012 13:34:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1SCaHc-0001z2-G5
	for qemu-trivial@nongnu.org; Tue, 27 Mar 2012 13:34:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39200)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1SCaHQ-0001wh-Fg; Tue, 27 Mar 2012 13:34:00 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q2RHXuIu015270
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 27 Mar 2012 13:33:56 -0400
Received: from [10.3.113.127] (ovpn-113-127.phx2.redhat.com [10.3.113.127])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q2RHXu1t004465; Tue, 27 Mar 2012 13:33:56 -0400
Message-ID: <4F71FA03.8010807@redhat.com>
Date: Tue, 27 Mar 2012 11:33:55 -0600
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120316 Thunderbird/11.0
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1332869033-5558-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1332869033-5558-1-git-send-email-sw@weilnetz.de>
X-Enigmail-Version: 1.4
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enig2B54DA4D955A4399E09134A7"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Andreas Faerber <andreas.faerber@web.de>, qemu-devel@nongnu.org,
	Emre Ersin <emre.ersin@gmail.com>
Subject: Re: [Qemu-trivial] [PATCH v2] Fix conversion from lower to upper
 case with Turkish locale
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
X-List-Received-Date: Tue, 27 Mar 2012 17:34:18 -0000

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig2B54DA4D955A4399E09134A7
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 03/27/2012 11:23 AM, Stefan Weil wrote:
> Some locale settings let make fail or create wrong results
> because tr '[:lower:]' '[:upper:]' which is used to convert
> from lower to upper case depends on the locale.
>=20
=2E..
>=20
> v2:
> POSIX says that 'tr a-z' is unspecified outside of the POSIX
> locale, so we must set LC_ALL=3DC to make sure that we are using
> POSIX (hint from Eric Blake, thanks).
>=20
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  configure             |    6 +++---
>  scripts/create_config |    6 +++---
>  scripts/tracetool     |    4 ++--
>  3 files changed, 8 insertions(+), 8 deletions(-)

Not being a regular reviewer on this list, I'm not sure I know the
subtle difference between 'Acked-by' and 'Reviewed-by' to know which one
I should be adding; but this patch resolves my objection on v1.

[Side note - POSIX actually requires:
tr a-z A-Z
to do the 26-letter case conversion, and that use of '[a-z]' means you
are transliterating 28 characters, by changing '[' and ']' to
themselves.  But on older Solaris tr, you had to provide the [] to get
range expansion rather than transliteration of a literal '-', so your
patch is the right approach for maximal portability]

--=20
Eric Blake   eblake@redhat.com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--------------enig2B54DA4D955A4399E09134A7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBCAAGBQJPcfoDAAoJEKeha0olJ0NqFyUH/3d2+mpw5MAbV1bR5hvsrA/o
+dNxuSrfhT1GkNXf2AvdTNfPQsAch0Xh8f8Sg/3GTwBAyt7a9l3PJxfdiw8EgcY2
e7asb4oKH5P15s8Afclw7Ga7XAiqcsJjfpwtV8OH/13L0y1XM3XfPuD7vuex+/iE
AvqkGHhucF7xwKJ9WxCxjfeUiWY7cCf0kJ69RcHBzvhpydp8nYI0ur/fszilQyZM
Dk2r3kvky+4eTwlZjmb2iDcgbAtikV/QrOpDza7puFHOmhjIBDySpvWtEhA5Y4sH
TYBkxKxHnfLpKoGIjsFxuafCn5Iz437KvHs0iL63sNVqvSzxq1Ih2ZdZm+q8uV4=
=3bQu
-----END PGP SIGNATURE-----

--------------enig2B54DA4D955A4399E09134A7--

