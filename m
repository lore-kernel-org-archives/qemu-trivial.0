Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WW5ci-0005uR-3M
	for mharc-qemu-trivial@gnu.org; Fri, 04 Apr 2014 11:01:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44053)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1WW5cb-0005ll-U5
	for qemu-trivial@nongnu.org; Fri, 04 Apr 2014 11:01:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1WW5cX-0002CZ-0H
	for qemu-trivial@nongnu.org; Fri, 04 Apr 2014 11:01:33 -0400
Received: from mx1.redhat.com ([209.132.183.28]:19265)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1WW5cW-0002CT-OP; Fri, 04 Apr 2014 11:01:28 -0400
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s34F1S1s009079
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 4 Apr 2014 11:01:28 -0400
Received: from [10.3.113.163] (ovpn-113-163.phx2.redhat.com [10.3.113.163])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id s34F1R30002019; Fri, 4 Apr 2014 11:01:27 -0400
Message-ID: <533EC947.3030706@redhat.com>
Date: Fri, 04 Apr 2014 09:01:27 -0600
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Amos Kong <akong@redhat.com>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
References: <1396572808-21535-1-git-send-email-akong@redhat.com>
In-Reply-To: <1396572808-21535-1-git-send-email-akong@redhat.com>
X-Enigmail-Version: 1.6
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="kehmfGtqtJa5vaM6wpxOliiIDdckLose7"
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: mprivozn@redhat.com, mjt@tls.msk.ru, lersek@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qga: trivial fix for
 unclear document of guest-set-time
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
X-List-Received-Date: Fri, 04 Apr 2014 15:01:38 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--kehmfGtqtJa5vaM6wpxOliiIDdckLose7
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 04/03/2014 06:53 PM, Amos Kong wrote:
> We mixedly used "guest time", "system time", "hardware time", "RTC"

s/mixedly used/mixed the use of/

> in document, it's unclear.

s/document/documentation/

>=20
> This patch just added two remarks of RTC and replace two "guest time"
> by "guest's system time".
>=20
> Signed-off-by: Amos Kong <akong@redhat.com>
> ---
>  qga/commands-posix.c |  2 +-
>  qga/qapi-schema.json | 14 +++++++-------
>  2 files changed, 8 insertions(+), 8 deletions(-)
>=20
> diff --git a/qga/commands-posix.c b/qga/commands-posix.c
> index 6b5f11f..25e4302 100644
> --- a/qga/commands-posix.c
> +++ b/qga/commands-posix.c
> @@ -171,7 +171,7 @@ void qmp_guest_set_time(bool has_time, int64_t time=
_ns, Error **errp)
>      /* Now, if user has passed a time to set and the system time is se=
t, we
>       * just need to synchronize the hardware clock. However, if no tim=
e was
>       * passed, user is requesting the opposite: set the system time fr=
om the
> -     * hardware clock. */
> +     * hardware clock(RTC). */

s/clock(/clock (/

> -# This command tries to set guest time to the given value,
> -# then sets the Hardware Clock to the current System Time.
> -# This will make it easier for a guest to resynchronize
> -# without waiting for NTP. If no @time is specified, then
> -# the time to set is read from RTC.
> +# This command tries to set guest's System Time to the
> +# given value, then sets the Hardware Clock(RTC) to the

and again

With those changes,
Reviewed-by: Eric Blake <eblake@redhat.com>

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--kehmfGtqtJa5vaM6wpxOliiIDdckLose7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJTPslHAAoJEKeha0olJ0NqZhQH/2rsEknMoR2RAfxtoK7hS6+b
enNjWje3hg6Eh2OrpcIan2uABSVFgNvL/bDeyPy3MO247TS1klihqnfwdlaCCbGA
eruQJp1kAdvifWHG6WDj3SNnEccJkwnMvNABFVLPwsuE6Wwf4jsvd2rw5A/PYJNK
5UQ9hhb7kJOFWg5ZJHhek8j4EUY4IK+yCUxoHjgeUEmvzddaKsWVP4CWj6TtUUZW
i62rMF9urV5WLH7ISAd9V706z7ECFwnz16/SOrwuGcg20JUOMjnf3zjvhgcL4lCe
BwJbct7nbuHkyoboJkVq5Ilx6VBsMC+k/56KEx/WGzKZ9GtyOyQYxQpqTKThB/I=
=86JY
-----END PGP SIGNATURE-----

--kehmfGtqtJa5vaM6wpxOliiIDdckLose7--

