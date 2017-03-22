Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cqihC-0002SK-20
	for mharc-qemu-trivial@gnu.org; Wed, 22 Mar 2017 12:01:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34789)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1cqihA-0002QF-Db
	for qemu-trivial@nongnu.org; Wed, 22 Mar 2017 12:01:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1cqih9-0006in-DA
	for qemu-trivial@nongnu.org; Wed, 22 Mar 2017 12:01:08 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50160)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1cqih1-0006XY-DR; Wed, 22 Mar 2017 12:00:59 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 49064C05B1C7;
	Wed, 22 Mar 2017 16:00:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 49064C05B1C7
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eblake@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 49064C05B1C7
Received: from [10.10.121.124] (ovpn-121-124.rdu2.redhat.com [10.10.121.124])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8F64517241;
	Wed, 22 Mar 2017 16:00:57 +0000 (UTC)
To: Vinzenz 'evilissimo' Feenstra <vfeenstr@redhat.com>, qemu-devel@nongnu.org
References: <20170322154649.6947-1-vfeenstr@redhat.com>
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <6d8dfe28-5366-fe25-ff27-d79cdc0bf1f7@redhat.com>
Date: Wed, 22 Mar 2017 11:00:55 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170322154649.6947-1-vfeenstr@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="DfRVoo1hsm4bjR43AquKAIOWcwMvPH4Lv"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Wed, 22 Mar 2017 16:00:59 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qga: Add
 `guest-get-timezone` command
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
X-List-Received-Date: Wed, 22 Mar 2017 16:01:09 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--DfRVoo1hsm4bjR43AquKAIOWcwMvPH4Lv
Content-Type: multipart/mixed; boundary="MdbKfiwGiEdpCeF6RIxNRmUxCD3IjD8qv";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Vinzenz 'evilissimo' Feenstra <vfeenstr@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com
Message-ID: <6d8dfe28-5366-fe25-ff27-d79cdc0bf1f7@redhat.com>
Subject: Re: [Qemu-devel] [PATCH] qga: Add `guest-get-timezone` command
References: <20170322154649.6947-1-vfeenstr@redhat.com>
In-Reply-To: <20170322154649.6947-1-vfeenstr@redhat.com>

--MdbKfiwGiEdpCeF6RIxNRmUxCD3IjD8qv
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 03/22/2017 10:46 AM, Vinzenz 'evilissimo' Feenstra wrote:
> From: Vinzenz Feenstra <vfeenstr@redhat.com>

This is not a trivial patch (it is adding a new feature), so including
qemu-trivial is not necessary, and it should be merged through the qga
maintainer.

>=20
> Adds a new command `guest-get-timezone` reporting the currently
> configured timezone on the system. The information on what timezone is
> currently is configured is useful in case of Windows VMs where the
> offset of the hardware clock is required to have the same offset. This
> can be used for management systems like `oVirt` to detect the timezone
> difference and warn administrators of the misconfiguration.
>=20
> Signed-off-by: Vinzenz Feenstra <vfeenstr@redhat.com>
> ---
>  qga/commands.c       | 19 +++++++++++++++++++
>  qga/qapi-schema.json | 25 +++++++++++++++++++++++++
>  2 files changed, 44 insertions(+)
>=20

> +++ b/qga/qapi-schema.json
> @@ -1042,3 +1042,28 @@
>    'data':    { 'path': 'str', '*arg': ['str'], '*env': ['str'],
>                 '*input-data': 'str', '*capture-output': 'bool' },
>    'returns': 'GuestExec' }
> +
> +
> +##
> +# @GuestTimezone:
> +#
> +# @zone:    Timezone name
> +# @offset:  Offset to UTC in minutes
> +#

Is it worth clarifying that negative numbers imply west of UTC? (There
are some places that get offsets backwards from the usual POSIX
notation, so it never hurts to be specific which direction is intended).


> +##
> +# @guest-get-timezone:
> +#
> +# Retrieves the timezone information from the guest.
> +#
> +# Returns: The guest timezone GuestTimezone information on success.

Sounds rather repetitive; and a struct return is implicitly only
possible on success.  Perhaps it could be shortened to:

# Retrieves timezone information from the guest.
#
# Returns: A GuestTimezone dictionary.

> +#
> +# Since: 2.10
> +##
> +{ 'command': 'guest-get-timezone',
> +  'returns': 'GuestTimezone' }
>=20

But the overall idea makes sense to me, so whether or not you wordsmith
the documentation in the .json file,
Reviewed-by: Eric Blake <eblake@redhat.com>

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--MdbKfiwGiEdpCeF6RIxNRmUxCD3IjD8qv--

--DfRVoo1hsm4bjR43AquKAIOWcwMvPH4Lv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJY0p+3AAoJEKeha0olJ0NqkwsH/RoUKDaK/1XRSMHF0MtRf5+D
UpHF025PYE8KmZ25dznp2DRdoNy713fbvtoaSmBsjpB6pibo7Kh+lDSUDAdpktHj
JHYvQLw9UWOG4USK5bHSOvMGHax3iuyMNED617FhdBNTo5tpS+SjwxYO9U47GEs3
CZcPNlCsjMBe4RSEtPevYBfC6EkQ62UIDQFGrlW4wBVva/NTf1Sus/YpJ2pMVY1z
FSkCbmMmkNkEr1vLrK6T/R5aZxksv11X9q6lu2SkULZCrZHtWkq0XM2VAqv8lHs7
kHeS3ruNXTLSWZdGE0177PjWxvPQsrhJBAA06ZS1KVFO3Nw96PDqoq1AWXbf7uQ=
=eUwk
-----END PGP SIGNATURE-----

--DfRVoo1hsm4bjR43AquKAIOWcwMvPH4Lv--

