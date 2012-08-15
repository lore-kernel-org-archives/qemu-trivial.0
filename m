Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T1db6-00019z-FQ
	for mharc-qemu-trivial@gnu.org; Wed, 15 Aug 2012 09:25:20 -0400
Received: from eggs.gnu.org ([208.118.235.92]:46622)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1T1db2-00010G-WE
	for qemu-trivial@nongnu.org; Wed, 15 Aug 2012 09:25:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1T1db2-00083P-5V
	for qemu-trivial@nongnu.org; Wed, 15 Aug 2012 09:25:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51770)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1T1daz-00082s-Is; Wed, 15 Aug 2012 09:25:13 -0400
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q7FDP9HK020258
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 15 Aug 2012 09:25:09 -0400
Received: from [10.3.113.122] (ovpn-113-122.phx2.redhat.com [10.3.113.122])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q7FDP8YK016412; Wed, 15 Aug 2012 09:25:08 -0400
Message-ID: <502BA333.7010208@redhat.com>
Date: Wed, 15 Aug 2012 07:25:07 -0600
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1345030164-2496-1-git-send-email-peter.maydell@linaro.org>
In-Reply-To: <1345030164-2496-1-git-send-email-peter.maydell@linaro.org>
X-Enigmail-Version: 1.4.3
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enig797AF8ED318C1F65762CA76E"
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [PATCH v2] Makefile: Avoid explicit list of
 directories in clean target
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
X-List-Received-Date: Wed, 15 Aug 2012 13:25:18 -0000

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig797AF8ED318C1F65762CA76E
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 08/15/2012 05:29 AM, Peter Maydell wrote:
> Avoid having an explicit list of directories in the 'clean'
> target by using 'find' to remove all .o and .d files instead.
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Changes v1->v2: use portable 'find -exec' rather than unsafe 'find | xa=
rgs'
> or unportable 'find -print0 | xargs -0'.
>=20
>  Makefile |    7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

--=20
Eric Blake   eblake@redhat.com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--------------enig797AF8ED318C1F65762CA76E
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBCAAGBQJQK6M0AAoJEKeha0olJ0NqcMkH/2OOkWTORF1bufnnD+EWWKvR
WJQ3k1AFIqku1IAX+XDZ9hhnF/qFtSptat5BIDBHPur4K+qrK0EeIt5Zn9fHQNSI
6cibkpVnmPBCvlY375byz/O8usmM9X999MP7Ew/6RhDavCT5gXBVSPFFoUEul5zE
gVcUFVx95lNhteFdLCfptJFUkvbtmEktp9eolKI8BMezb97jWxrbV24Ebh/XztqY
sXzqSh4yuMOFFQYqans5p0Xhz8DJ89vVywzWBF1SPTU3WsQfJOzLI6A3R88Fxy+3
+iZ4G3UOrge1w/khzVIMaqfFjRaWr8Fu7mraPwwSEwfik4lo5dQ7sS5A7fKr2RI=
=BVAN
-----END PGP SIGNATURE-----

--------------enig797AF8ED318C1F65762CA76E--

