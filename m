Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S1ISB-0003Rc-3R
	for mharc-qemu-trivial@gnu.org; Sat, 25 Feb 2012 09:18:27 -0500
Received: from eggs.gnu.org ([208.118.235.92]:43140)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1S1IS4-0003Qk-Ui
	for qemu-trivial@nongnu.org; Sat, 25 Feb 2012 09:18:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1S1IS0-0002xd-CP
	for qemu-trivial@nongnu.org; Sat, 25 Feb 2012 09:18:20 -0500
Received: from mx1.redhat.com ([209.132.183.28]:7545)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1S1IS0-0002xW-4N; Sat, 25 Feb 2012 09:18:16 -0500
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q1PEIEfK030471
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Sat, 25 Feb 2012 09:18:14 -0500
Received: from [10.3.113.31] (ovpn-113-31.phx2.redhat.com [10.3.113.31])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q1PEIDA4001575; Sat, 25 Feb 2012 09:18:14 -0500
Message-ID: <4F48EDA3.2080700@redhat.com>
Date: Sat, 25 Feb 2012 07:18:11 -0700
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120209 Thunderbird/10.0.1
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1330178223-31717-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1330178223-31717-1-git-send-email-sw@weilnetz.de>
X-Enigmail-Version: 1.3.5
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enig5CDFE87853B2A3826F56FAD8"
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Anthony Liguori <aliguori@us.ibm.com>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] vnc: Add break statement
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
X-List-Received-Date: Sat, 25 Feb 2012 14:18:25 -0000

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig5CDFE87853B2A3826F56FAD8
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 02/25/2012 06:57 AM, Stefan Weil wrote:
> This was not a bug, but it is not common practice to omit the break sta=
tement
> from the last case statement before an empty default case.
>=20
> Any change of the default case would introduce a bug.
>=20
> This was reported as a warning by splint.
>=20
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  ui/vnc-enc-hextile-template.h |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
>=20
> diff --git a/ui/vnc-enc-hextile-template.h b/ui/vnc-enc-hextile-templat=
e.h
> index b9f9f5e..a7310e1 100644
> --- a/ui/vnc-enc-hextile-template.h
> +++ b/ui/vnc-enc-hextile-template.h
> @@ -175,6 +175,7 @@ static void CONCAT(send_hextile_tile_, NAME)(VncSta=
te *vs,
>  	    /* we really don't have to invalidate either the bg or fg
>  	       but we've lost the old values.  oh well. */
>  	}
> +        break;

TABs vs. space looks odd.  Does this file also need a whitespace cleanup?=


--=20
Eric Blake   eblake@redhat.com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--------------enig5CDFE87853B2A3826F56FAD8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBCAAGBQJPSO2kAAoJEKeha0olJ0NqessH/is5vHDMHuE55oe5H8XE7N32
FFvBVr13jYByr+FT3MtPR4cnON/O2T0B//1+6shuE8fCpvhoUStf5OTYORyL33rp
JYexTmKpjSOMgEwmchuolD+86JocrcI/9Ho8gliZ8MsI99OOtLJstCBOyYJPb+w9
oQpQbiwvOORNRs64/ba2pAmXQSMZmbpvOvGwOqbMRaF0BisHB0wx6g8ot3PbzBfr
nGvQxBdIafn7bV5oR4Xqgw5uyyO7p3fKPWTneFYEb2NpsqVGSpEI7XfiRe+WiICe
OY0EAXJXtVjJUcSrizGitkqiyugmHOw+kuIkEpYWfMlUYqeYLMC1GapY6+0nK88=
=XZa9
-----END PGP SIGNATURE-----

--------------enig5CDFE87853B2A3826F56FAD8--

