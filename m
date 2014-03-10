Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WN4SK-0004JF-No
	for mharc-qemu-trivial@gnu.org; Mon, 10 Mar 2014 13:57:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41014)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1WN4SE-0004CI-Kl
	for qemu-trivial@nongnu.org; Mon, 10 Mar 2014 13:57:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1WN4SA-0005Ff-8E
	for qemu-trivial@nongnu.org; Mon, 10 Mar 2014 13:57:34 -0400
Received: from mx1.redhat.com ([209.132.183.28]:5516)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1WN4S1-0005EB-5j; Mon, 10 Mar 2014 13:57:21 -0400
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s2AHvJjP031943
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 10 Mar 2014 13:57:19 -0400
Received: from [10.3.113.154] (ovpn-113-154.phx2.redhat.com [10.3.113.154])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id s2AHvIph017116; Mon, 10 Mar 2014 13:57:19 -0400
Message-ID: <531DFCFE.2000006@redhat.com>
Date: Mon, 10 Mar 2014 11:57:18 -0600
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: "Gabriel L. Somlo" <gsomlo@gmail.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
References: <20140310171456.GS17184@ERROL.INI.CMU.EDU>
In-Reply-To: <20140310171456.GS17184@ERROL.INI.CMU.EDU>
X-Enigmail-Version: 1.6
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="WX5ikvDwcqEoSusRqniUtfO7IRfx7BAFF"
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Add qga/qapi-generated to
	.gitignore
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
X-List-Received-Date: Mon, 10 Mar 2014 17:57:39 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--WX5ikvDwcqEoSusRqniUtfO7IRfx7BAFF
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 03/10/2014 11:14 AM, Gabriel L. Somlo wrote:
> The folder "qga/qapi-generated" shows up after building QEMU, and
> gets in the way during e.g. "git add ."; Add it to .gitignore to
> keep it from accidentally ending up in the wrong place.
>=20
> Signed-off-by: Gabriel Somlo <somlo@cmu.edu>
> ---
>  .gitignore | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/.gitignore b/.gitignore
> index ef7019f..a0895c9 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -21,6 +21,7 @@
>  libdis*
>  libuser
>  /linux-headers/asm
> +qga/qapi-generated

Why didn't you anchor it?

/qga/qapi-generated

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--WX5ikvDwcqEoSusRqniUtfO7IRfx7BAFF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJTHfz+AAoJEKeha0olJ0Nq7QMIAKBU/pLlJaHDyjfHsEsPSdLP
MG1wL9E2Jfw1/dBGvT9wwIHPm95T7AUUcyLL4Z4Ky815cdX4kvRZGBFcRxpdeOd8
KS0Zc7ZefaEGTiA470y92DZ4vjDWW4EEPbzsDS5N463zMrGrlGEC3+uNQW4g25z5
lvpG9Ivg3XFt28TC2YOOhPBC9xuw8AiATjfQkR2RecrppGgPYxQGeUrf8vFbBy7/
AsxtDhxlJURRhRK973uXXl3E9VFY7soZmSLcqE5Ere+l8FYez1TkVl/kERdubG+V
gLwIEG68GTwsuX6XMUcwTSEaWMHhWayDWGnRyxErEQ06gykbIujnHLDvqv+1O4I=
=F2Gu
-----END PGP SIGNATURE-----

--WX5ikvDwcqEoSusRqniUtfO7IRfx7BAFF--

