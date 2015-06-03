Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z0EET-0000ca-Cn
	for mharc-qemu-trivial@gnu.org; Wed, 03 Jun 2015 15:21:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52313)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1Z0EEQ-0000ZK-F9
	for qemu-trivial@nongnu.org; Wed, 03 Jun 2015 15:21:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1Z0EEP-0000EF-8b
	for qemu-trivial@nongnu.org; Wed, 03 Jun 2015 15:21:42 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40319)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1Z0EEJ-0000DM-I4; Wed, 03 Jun 2015 15:21:35 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id 2D6F7C6586;
	Wed,  3 Jun 2015 19:21:35 +0000 (UTC)
Received: from [10.3.113.213] (ovpn-113-213.phx2.redhat.com [10.3.113.213])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t53JLY2X001796; Wed, 3 Jun 2015 15:21:34 -0400
Message-ID: <556F53BE.4000107@redhat.com>
Date: Wed, 03 Jun 2015 13:21:34 -0600
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>, qemu-devel@nongnu.org
References: <1433357036-19160-1-git-send-email-dgilbert@redhat.com>
In-Reply-To: <1433357036-19160-1-git-send-email-dgilbert@redhat.com>
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="KVrhEl0mBuBRlGo8TIQi112VdInph1W9u"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] Grammar: 'as to'->'as for'
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
X-List-Received-Date: Wed, 03 Jun 2015 19:21:43 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--KVrhEl0mBuBRlGo8TIQi112VdInph1W9u
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 06/03/2015 12:43 PM, Dr. David Alan Gilbert (git) wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>=20
> Fixup migrate-incoming text as requested by Eric in:
>=20
>  http://lists.nongnu.org/archive/html/qemu-devel/2015-03/msg03362.html
>=20
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>  qmp-commands.hx | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

>=20
> diff --git a/qmp-commands.hx b/qmp-commands.hx
> index 14e109e..ab5b11b 100644
> --- a/qmp-commands.hx
> +++ b/qmp-commands.hx
> @@ -686,7 +686,7 @@ Notes:
> =20
>  (1) QEMU must be started with -incoming defer to allow migrate-incomin=
g to
>      be used
> -(2) The uri format is the same as to -incoming
> +(2) The uri format is the same as for -incoming
> =20
>  EQMP
>      {
>=20

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--KVrhEl0mBuBRlGo8TIQi112VdInph1W9u
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJVb1O+AAoJEKeha0olJ0Nq80kH/ihtPSlBjQAuiu4E1pxTI52+
cV/SxT158BgEt0nDlwX+1ppV99u78Bu7w/XhHHqqWwgTNyLpN+Wf+mN35yEg4XmX
i+DWzov6ZKtV4HLo0TaC38jjdk3rJ7Pqt3lfQO2nbS/RCTDpHvBODNrvSFV9RYGu
IsXVgzsH93Tr5Z7yHVNtTOJPsVlekpZsS7eYxrzbcYi5+G24T81+xgko0cA2iecQ
SHQg5BULHMDU+Od+IS7kFcnE/sVqE+bDkKunMPa3ToIa5ftHvElXoOS5rPtcNl2B
kio8jqned50zJ//FmobxS/AY93Yt53KcfISODh81VhoECLyv+mlHKtrGwK6oM9E=
=i1QG
-----END PGP SIGNATURE-----

--KVrhEl0mBuBRlGo8TIQi112VdInph1W9u--

