Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1U0HSx-00018C-Jj
	for mharc-qemu-trivial@gnu.org; Tue, 29 Jan 2013 15:07:35 -0500
Received: from eggs.gnu.org ([208.118.235.92]:54729)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1U0HSt-0000yj-Vu
	for qemu-trivial@nongnu.org; Tue, 29 Jan 2013 15:07:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1U0HSs-0001dW-Bs
	for qemu-trivial@nongnu.org; Tue, 29 Jan 2013 15:07:31 -0500
Received: from mx1.redhat.com ([209.132.183.28]:28675)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1U0HSk-0001bt-RL; Tue, 29 Jan 2013 15:07:23 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r0TK7Mfh005400
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 29 Jan 2013 15:07:22 -0500
Received: from [10.3.113.27] (ovpn-113-27.phx2.redhat.com [10.3.113.27])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r0TK7LbG009643; Tue, 29 Jan 2013 15:07:21 -0500
Message-ID: <51082BF9.6020900@redhat.com>
Date: Tue, 29 Jan 2013 13:07:21 -0700
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130110 Thunderbird/17.0.2
MIME-Version: 1.0
To: Michal Privoznik <mprivozn@redhat.com>
References: <8f03011d18d9d8cb51a4c2339f2ae4be7cfe1052.1359478671.git.mprivozn@redhat.com>
In-Reply-To: <8f03011d18d9d8cb51a4c2339f2ae4be7cfe1052.1359478671.git.mprivozn@redhat.com>
X-Enigmail-Version: 1.5.0
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="----enig2HFUPVIGKNJHECKDKTNGG"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] qmp-commands.hx:
 s/tray-open/tray_open/ to match qapi schema
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
X-List-Received-Date: Tue, 29 Jan 2013 20:07:33 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
------enig2HFUPVIGKNJHECKDKTNGG
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 01/29/2013 09:58 AM, Michal Privoznik wrote:
> Currently, we are using 'tray_open' in QMP and 'tray-open' in
> HMP. However, the QMP documentation was mistakenly using the
> HMP version.
>=20
> Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
> ---
>=20
> diff to v1:
> -add S-o-b line
>=20
>  qmp-commands.hx | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

>=20
> diff --git a/qmp-commands.hx b/qmp-commands.hx
> index f58a841..f90efe5 100644
> --- a/qmp-commands.hx
> +++ b/qmp-commands.hx
> @@ -1659,7 +1659,7 @@ Each json-object contain the following:
>           - Possible values: "unknown"
>  - "removable": true if the device is removable, false otherwise (json-=
bool)
>  - "locked": true if the device is locked, false otherwise (json-bool)
> -- "tray-open": only present if removable, true if the device has a tra=
y,
> +- "tray_open": only present if removable, true if the device has a tra=
y,
>                 and it is open (json-bool)
>  - "inserted": only present if the device is inserted, it is a json-obj=
ect
>     containing the following:
>=20

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


------enig2HFUPVIGKNJHECKDKTNGG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.13 (GNU/Linux)
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJRCCv5AAoJEKeha0olJ0NqDfwIAIwG2/dIG/pLDhnNwYP9fCXy
LKdhx6aHtuIUT9UuvzKvjFiuqH9JgaZl4yL1KB4Ed8FCcTdtGgkmtc1BplSTL5qk
nOW8vAoUDHHqhgqQqMjnW8Ql01rxr1f6rvlM1EVykLNag8oVeGj7txnX3eeM8ws2
9f/+nA6AXOnIszDX5LdlIKtO+YcGiSpBNAQUi8klWGm/eIra5Fa4Pipa1Ep7EzCs
7sP2f0SdIWzkaHU0yiTArDyMuBw+acwOvT3UdrQv+gJtdsz6Vo7sAK3Zzuwxb2QD
mGvkgyG5cPVe0TOW7iqgZzHtz0Z7Z9DLPG8tG5K/pg86NfZG7B31pghnzKfyU4s=
=TTx6
-----END PGP SIGNATURE-----

------enig2HFUPVIGKNJHECKDKTNGG--

