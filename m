Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WzsVU-00045l-63
	for mharc-qemu-trivial@gnu.org; Wed, 25 Jun 2014 15:05:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60100)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1WzsVO-0003yM-76
	for qemu-trivial@nongnu.org; Wed, 25 Jun 2014 15:05:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1WzsVJ-0007lv-A1
	for qemu-trivial@nongnu.org; Wed, 25 Jun 2014 15:05:14 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43418)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1WzsV9-0007Rr-6B; Wed, 25 Jun 2014 15:04:59 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s5PJ4wjK024609
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Wed, 25 Jun 2014 15:04:58 -0400
Received: from [10.3.113.62] (ovpn-113-62.phx2.redhat.com [10.3.113.62])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s5PJ4vc5003679; Wed, 25 Jun 2014 15:04:57 -0400
Message-ID: <53AB1D59.1050501@redhat.com>
Date: Wed, 25 Jun 2014 13:04:57 -0600
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
References: <1403722493-26602-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1403722493-26602-1-git-send-email-sw@weilnetz.de>
X-Enigmail-Version: 1.6
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="O2lv3a20mtvt913wqXf287dBF0MCOIDDE"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qemu-char: Fix compiler
	warning (-Wuninitialized)
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
X-List-Received-Date: Wed, 25 Jun 2014 19:05:19 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--O2lv3a20mtvt913wqXf287dBF0MCOIDDE
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 06/25/2014 12:54 PM, Stefan Weil wrote:
> qemu-char.c:155:8: warning:
>  'res' may be used uninitialized in this function [-Wuninitialized]

Igor beat you to it:
https://lists.gnu.org/archive/html/qemu-devel/2014-06/msg05986.html

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--O2lv3a20mtvt913wqXf287dBF0MCOIDDE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJTqx1ZAAoJEKeha0olJ0NqpdcH/RATp6y7pBmehhv61l919TYy
DVtoqhCV/Vsn+Dq+QuA+PRDlOvdzViGonpmKezM/G/tZ7UveNxCKePjpjVJWZRDM
8eQ+A2mhkn95dusYSM5/q5JWsgKP0Io3kuS0q40C+2hcyKfLkzQ/CLxTp77VGX/e
YTvfZUEeHxMXBoV/gM16cBAVIiOzwuqh8kI2afRwITqW/DRlAe5uN64D2DyLo8RB
3S/eaw1qfRIrFacd66GRZ4kdfmX/cXgJIRI4GJCn8BryMP3c5fOkCFLs0ASWv1JP
OmdN90lUMlDfgG/GyCWNQgE+CIsErbQtOsylJjbH3I++EUdj3iWCesvJA0ztdZE=
=GyIi
-----END PGP SIGNATURE-----

--O2lv3a20mtvt913wqXf287dBF0MCOIDDE--

