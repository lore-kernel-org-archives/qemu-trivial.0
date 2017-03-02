Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cjTCx-0002x9-Gh
	for mharc-qemu-trivial@gnu.org; Thu, 02 Mar 2017 11:03:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45995)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1cjTCv-0002vK-49
	for qemu-trivial@nongnu.org; Thu, 02 Mar 2017 11:03:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1cjTCu-00051G-7y
	for qemu-trivial@nongnu.org; Thu, 02 Mar 2017 11:03:57 -0500
Received: from mx1.redhat.com ([209.132.183.28]:54492)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1cjTCm-0004yI-VH; Thu, 02 Mar 2017 11:03:49 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0991E2E6063;
	Thu,  2 Mar 2017 16:03:49 +0000 (UTC)
Received: from [10.10.124.87] (ovpn-124-87.rdu2.redhat.com [10.10.124.87] (may
	be forged))
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v22G3kI7019467; Thu, 2 Mar 2017 11:03:47 -0500
To: "Daniel P. Berrange" <berrange@redhat.com>, qemu-devel@nongnu.org
References: <20170302122429.7737-1-berrange@redhat.com>
Cc: qemu-trivial@nongnu.org, Markus Armbruster <armbru@redhat.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <61211fbf-c397-deb8-0726-848dc716fc96@redhat.com>
Date: Thu, 2 Mar 2017 10:03:45 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <20170302122429.7737-1-berrange@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="35AndKl3NFHxHkJQ10MF8rroTF6GaiW86"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Thu, 02 Mar 2017 16:03:49 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qmp: allow setting
 properties to empty string in qmp-shell
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
X-List-Received-Date: Thu, 02 Mar 2017 16:03:58 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--35AndKl3NFHxHkJQ10MF8rroTF6GaiW86
Content-Type: multipart/mixed; boundary="chgOlgxl4AS1LXgDANxajVs3kCLKXKJJU";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: "Daniel P. Berrange" <berrange@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Markus Armbruster <armbru@redhat.com>
Message-ID: <61211fbf-c397-deb8-0726-848dc716fc96@redhat.com>
Subject: Re: [Qemu-devel] [PATCH] qmp: allow setting properties to empty
 string in qmp-shell
References: <20170302122429.7737-1-berrange@redhat.com>
In-Reply-To: <20170302122429.7737-1-berrange@redhat.com>

--chgOlgxl4AS1LXgDANxajVs3kCLKXKJJU
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 03/02/2017 06:24 AM, Daniel P. Berrange wrote:
> The qmp-shell property parser currently rejects attempts to
> set string properties to the empty string eg
>=20
>   (QEMU) migrate-set-parameters  tls-hostname=3D
>   Error while parsing command line: Expected a key=3Dvalue pair, got 't=
ls-hostname=3D'
> command format: <command-name>  [arg-name1=3Darg1] ... [arg-nameN=3Darg=
N]
>=20
> This is caused by checking the wrong condition after splitting
> the parameter on '=3D'. The "partition" method will return "" for
> the separator field, if the seperator was not present, so that
> is the correct thing to check for malformed syntax.
>=20
> Signed-off-by: Daniel P. Berrange <berrange@redhat.com>
> ---
>  scripts/qmp/qmp-shell | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

Probably worth having in 2.9, since we are having the parallel
discussion about permitting an empty string as a way to clear out TLS in
migration parameters.

>=20
> diff --git a/scripts/qmp/qmp-shell b/scripts/qmp/qmp-shell
> index 0373b24..eccb88a 100755
> --- a/scripts/qmp/qmp-shell
> +++ b/scripts/qmp/qmp-shell
> @@ -166,8 +166,8 @@ class QMPShell(qmp.QEMUMonitorProtocol):
> =20
>      def __cli_expr(self, tokens, parent):
>          for arg in tokens:
> -            (key, _, val) =3D arg.partition('=3D')
> -            if not val:
> +            (key, sep, val) =3D arg.partition('=3D')
> +            if sep !=3D '=3D':
>                  raise QMPShellError("Expected a key=3Dvalue pair, got =
'%s'" % arg)
> =20
>              value =3D self.__parse_value(val)
>=20

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--chgOlgxl4AS1LXgDANxajVs3kCLKXKJJU--

--35AndKl3NFHxHkJQ10MF8rroTF6GaiW86
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJYuEJhAAoJEKeha0olJ0NqBbcIAIpdcNrIk30ewBjWuFdJZQUM
KuryXrvaFi0BwY3zqoB5pwGI+ZVP4Es5OMx+tLjCSnGDgT060zDng8XzINOFDbmU
AKQYYQgUZYF2Lav1Y3oPYxrt0pRqxyz6MX/1UW4vIFPfXwL6dWqkaCf/6hN8kVaD
fTlXWiA6feQagEOFaE9ii2tJR5y8f9nIAmKVayLxpa5l+5CAUb51Ji6ZKInwcqo0
9OcueHBM6+otlUfVS0QvqGFu8rYpI+HXgawASdCiz5OWKDSxoFtgD8T7c83vdscB
s8+PG3jE61833KevTOvQEdXh4YG0Dr8pBL6mTEa47uC8t5iZZIhXdWUiJJBV3gA=
=PzNY
-----END PGP SIGNATURE-----

--35AndKl3NFHxHkJQ10MF8rroTF6GaiW86--

