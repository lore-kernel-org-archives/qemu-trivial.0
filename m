Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YtILk-0005YZ-2W
	for mharc-qemu-trivial@gnu.org; Fri, 15 May 2015 12:20:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48526)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1YtILg-0005Vz-T9
	for qemu-trivial@nongnu.org; Fri, 15 May 2015 12:20:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1YtILf-0003aB-Qi
	for qemu-trivial@nongnu.org; Fri, 15 May 2015 12:20:32 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57386)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1YtILZ-0003XX-Hb; Fri, 15 May 2015 12:20:25 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id 3C6648E67C;
	Fri, 15 May 2015 16:20:25 +0000 (UTC)
Received: from [10.3.113.14] ([10.3.113.14])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t4FGKOt1000671; Fri, 15 May 2015 12:20:24 -0400
Message-ID: <55561CC7.10404@redhat.com>
Date: Fri, 15 May 2015 10:20:23 -0600
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>, Stefan Weil <sw@weilnetz.de>
References: <1431635892-31996-1-git-send-email-sw@weilnetz.de>
	<87y4kqnuc2.fsf@blackfin.pond.sub.org>
In-Reply-To: <87y4kqnuc2.fsf@blackfin.pond.sub.org>
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="4HqxJotUf7IfvhJtcUEWvdr052bjr3nAS"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developer <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] pci: Fix compiler warning
 (MinGW-w64 gcc 4.9)
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
X-List-Received-Date: Fri, 15 May 2015 16:20:34 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--4HqxJotUf7IfvhJtcUEWvdr052bjr3nAS
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 05/15/2015 02:00 AM, Markus Armbruster wrote:
> Stefan Weil <sw@weilnetz.de> writes:
>=20
>> i686-w64-mingw32-gcc 4.9.1 from Debian Jessie complains:
>>

>=20
> This is obviously a bug in that version of MinGW.  Have you reported it=
?

I don't know if Debian has a bug filed against mingw yet, but I
mentioned elsewhere in the thread that I filed a bug for Fedora which is
also impacted.

> Do we really want to work around it?

That, I'm not sure.  It takes a while for updated mingw headers to
propagate, and the fix is small enough that it won't hurt to leave the
fix in place even after updated headers are available.  But since the
problem is a missing attribute in the header causing a compiler warning,
it could be worked around by turning off compiler warnings until a new
header is present.

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--4HqxJotUf7IfvhJtcUEWvdr052bjr3nAS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJVVhzHAAoJEKeha0olJ0Nq9B4H/1GJevOc/i/aONmFzByVQBdE
Y9yioBSIBEcd2sC2z4hzY77be9JEA7wh8Z5WRUZGfFkDxt8bd6XnB5AGhKV4ox9T
2D/uIcq1m5ne8jARi4gD6yKiVfCcqxnXZbmOlvpmdVcJowcjbn9/uBncYbXH5WxS
DswuqmDezRYI45z4X2uOxxL2yQbomfED3sxyGB3jv6/jlhvWzuc+AyafKhfkT18Q
mYnmfF7Niflf412QBGjTpNCUe0vMqHSlMBGs5udixcGW+howziksZZr2IB0+unIK
6MD4IuSH0paa2ijAyv8HvDR2wnj5p+I+J0gydRa9y8HKUs7/p88GHVrJs77Y8Ro=
=FVbn
-----END PGP SIGNATURE-----

--4HqxJotUf7IfvhJtcUEWvdr052bjr3nAS--

