Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T4CnB-0007DA-CX
	for mharc-qemu-trivial@gnu.org; Wed, 22 Aug 2012 11:24:25 -0400
Received: from eggs.gnu.org ([208.118.235.92]:49312)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@web.de>) id 1T4Cn0-0006uR-Vk
	for qemu-trivial@nongnu.org; Wed, 22 Aug 2012 11:24:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jan.kiszka@web.de>) id 1T4Cmq-0002e2-Ng
	for qemu-trivial@nongnu.org; Wed, 22 Aug 2012 11:24:14 -0400
Received: from mout.web.de ([212.227.17.12]:50031)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@web.de>)
	id 1T4Cmk-0002cQ-Nv; Wed, 22 Aug 2012 11:23:58 -0400
Received: from mchn199C.mchp.siemens.de ([95.157.56.37]) by smtp.web.de
	(mrweb102) with ESMTPSA (Nemesis) id 0LoYX0-1TbajP3Px4-00g0KM;
	Wed, 22 Aug 2012 17:23:58 +0200
Message-ID: <5034F985.7020202@web.de>
Date: Wed, 22 Aug 2012 17:23:49 +0200
From: Jan Kiszka <jan.kiszka@web.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de;
	rv:1.8.1.12) Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12
	Mnenhy/0.7.5.666
MIME-Version: 1.0
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <Pine.GSO.4.64.1208212333210.11653@mono> <5034926B.5020808@web.de>
	<Pine.GSO.4.64.1208221214550.8637@mono>
In-Reply-To: <Pine.GSO.4.64.1208221214550.8637@mono>
X-Enigmail-Version: 1.4.3
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enigEC138211C600062050AB9AFD"
X-Provags-ID: V02:K0:9B3hIXoqdaZo55jAz6vSnjc83BAPY1MWGjDecq6MjEz
	6nmSZTuYf7icefdNfg1owdMsSSgdWrWyb/xhOslI/EiB0C14gU
	yTtc5Ye9vRzyKcnUJZTzS6V2aP+enIlcl3dAFW2AI88Li8RQfz
	UpoDiTjQBEm6/wEl4GmSejC9DRVahpz08gX+q0D+yJtbenhvBM
	JwUKxlkMMiVdspHUnDUwQ==
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 212.227.17.12
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] vmware_vga: Cleanup and allow simple
 drivers to work without the fifo
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
X-List-Received-Date: Wed, 22 Aug 2012 15:24:24 -0000

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enigEC138211C600062050AB9AFD
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 2012-08-22 12:19, BALATON Zoltan wrote:
> On Wed, 22 Aug 2012, Jan Kiszka wrote:
>> This is a rather big patch. I strongly suspect you can break it up int=
o
>> smaller pieces that address separate aspects one-by-one. Also, it is
>> definitely to heavy for "qemu-trivial".
>=20
> Despite its size the changes included are fairly simple but I can try t=
o
> break it up. I've sent it to qemu-trivial because it may meet the "Do
> not fall under an actively maintained subsystem."

But that doesn't make it trivial, rather harder (if no one reviewed it).

> category as I've found
> no maintainer for this part. Should I send the revisions only to
> qemu-devel then?

Yes, that's more appropriate IMHO.

Jan



--------------enigEC138211C600062050AB9AFD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.16 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAlA0+YwACgkQitSsb3rl5xRexQCgi1tkVRu5bxY6syLfpQR78RR1
vHgAoNwdN0q2WD6AzXQHXkRdVOJFZDPG
=oqq5
-----END PGP SIGNATURE-----

--------------enigEC138211C600062050AB9AFD--

