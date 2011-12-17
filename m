Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Rbv6N-0006Oe-IK
	for mharc-qemu-trivial@gnu.org; Sat, 17 Dec 2011 09:19:03 -0500
Received: from eggs.gnu.org ([140.186.70.92]:58462)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1Rbv6L-0006OF-Hs
	for qemu-trivial@nongnu.org; Sat, 17 Dec 2011 09:19:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1Rbv6J-0003rX-Uj
	for qemu-trivial@nongnu.org; Sat, 17 Dec 2011 09:19:01 -0500
Received: from mx1.redhat.com ([209.132.183.28]:52225)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1Rbv6J-0003r6-MK; Sat, 17 Dec 2011 09:18:59 -0500
Received: from int-mx12.intmail.prod.int.phx2.redhat.com
	(int-mx12.intmail.prod.int.phx2.redhat.com [10.5.11.25])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id pBHEIvxl012817
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Sat, 17 Dec 2011 09:18:57 -0500
Received: from [10.3.113.3] ([10.3.113.3])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id pBHEIu9I025254; Sat, 17 Dec 2011 09:18:56 -0500
Message-ID: <4EECA4CF.5030407@redhat.com>
Date: Sat, 17 Dec 2011 07:18:55 -0700
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1324110459-3932-1-git-send-email-sw@weilnetz.de>
	<1324110459-3932-4-git-send-email-sw@weilnetz.de>
	<CAFEAcA8MY3zc7xLD_PosE_fHnOL+jn54wX7TAS8MxE=4vVa+Bw@mail.gmail.com>
	<4EEC86E9.7080404@weilnetz.de>
	<CAFEAcA-Dpy1a-hsN6oxPn6M=3LTwtfpR2c8J2Gz_a7-TfYQv-A@mail.gmail.com>
In-Reply-To: <CAFEAcA-Dpy1a-hsN6oxPn6M=3LTwtfpR2c8J2Gz_a7-TfYQv-A@mail.gmail.com>
X-Enigmail-Version: 1.3.4
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enigAEF3AE2E0D946BFC54C06920"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.25
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 03/11] configure: Fix
 compiler warning in config.log (integer from pointer)
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
X-List-Received-Date: Sat, 17 Dec 2011 14:19:02 -0000

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enigAEF3AE2E0D946BFC54C06920
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 12/17/2011 07:09 AM, Peter Maydell wrote:
>> Typically NULL is defined to be ((void *)0 for C
>> (that's the reason why I used a type cast, too). Only for
>> C++ it is defined without a type cast.
>=20
> The C standard permits plain "0" as a definition of NULL.

POSIX concurs with the C standard that a plain "0" can be used for
representing a null pointer, but requires that the macro NULL be defined
as ((void*)0) as a tighter requirement than C.

http://pubs.opengroup.org/onlinepubs/9699919799/basedefs/V1_chap03.html#t=
ag_03_244
http://pubs.opengroup.org/onlinepubs/9699919799/basedefs/stddef.h.html#ta=
g_13_47

> We use plain 0 for a null pointer constant in various
> existing tests in configure; this is simpler and avoids
> dragging in stddef.h. I would prefer that.

I agree that configure tests should be as small as possible while still
being correct, and use of a 0 constant without a cast, rather than NULL,
is appropriate in that context.

--=20
Eric Blake   eblake@redhat.com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--------------enigAEF3AE2E0D946BFC54C06920
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBCAAGBQJO7KTQAAoJEKeha0olJ0Nq5RgH/2z37HTv9z0jtU1xebzItV1x
K7XZtP5muBcEkNkoJCm/kTsOKetS0BBea6sobCFMkSaYcSmOc9qqTRR/dCfhZel+
RR/t6DIrkQ4yKjo7KaQ7Xzj7KaJKxJoAelIb1nJh6tshhiPpgV93la6hP2u3rGTy
3Hfnmly6CS1/fVoj0q7kd+WGp8qs+k4VO/jZhItlXdceQ81cSAb3H6BB44Mzr042
4CByfQO/0Uh0j5Y9DhhesvP3pGr65pQ1mUTTDkelnr8EoUwNFdsAgg2YUg7DEJ3a
RHbibQyAfIDfQVGi6h8feSD2mxIBlrpSNxKh6i+K+r1UbA8msLF3Fssw1y5tTPQ=
=mWde
-----END PGP SIGNATURE-----

--------------enigAEF3AE2E0D946BFC54C06920--

