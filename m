Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cnmdz-0000Ha-91
	for mharc-qemu-trivial@gnu.org; Tue, 14 Mar 2017 09:37:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60998)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1cnmdw-0000G4-Ou
	for qemu-trivial@nongnu.org; Tue, 14 Mar 2017 09:37:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1cnmdv-0000xs-Qb
	for qemu-trivial@nongnu.org; Tue, 14 Mar 2017 09:37:40 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48914)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1cnmdr-0000vw-36; Tue, 14 Mar 2017 09:37:35 -0400
Received: from smtp.corp.redhat.com (int-mx16.intmail.prod.int.phx2.redhat.com
	[10.5.11.28])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0D7CD80F98;
	Tue, 14 Mar 2017 13:37:35 +0000 (UTC)
Received: from [10.10.121.52] (unknown [10.10.121.52])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 17C0A2D5A1;
	Tue, 14 Mar 2017 13:37:32 +0000 (UTC)
To: Andreas Grapentin <andreas@grapentin.org>, qemu-devel@nongnu.org
References: <20170314101925.16792-1-andreas@grapentin.org>
Cc: qemu-trivial@nongnu.org
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <cb635189-1c52-8b30-d33d-e593febc2a2e@redhat.com>
Date: Tue, 14 Mar 2017 08:37:31 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170314101925.16792-1-andreas@grapentin.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="LcqFluUf1l1xxq7eNlK2rsqRe2XXiSaIE"
X-Scanned-By: MIMEDefang 2.74 on 10.5.11.28
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Tue, 14 Mar 2017 13:37:35 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 0/1] major / minor macros
 are to be included from <sys/sysmacros.h>
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
X-List-Received-Date: Tue, 14 Mar 2017 13:37:41 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--LcqFluUf1l1xxq7eNlK2rsqRe2XXiSaIE
Content-Type: multipart/mixed; boundary="vCl4QfHnmxM94qn0F7QLJdSJM6pCk4MGT";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Andreas Grapentin <andreas@grapentin.org>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Message-ID: <cb635189-1c52-8b30-d33d-e593febc2a2e@redhat.com>
Subject: Re: [Qemu-devel] [PATCH 0/1] major / minor macros are to be included
 from <sys/sysmacros.h>
References: <20170314101925.16792-1-andreas@grapentin.org>
In-Reply-To: <20170314101925.16792-1-andreas@grapentin.org>

--vCl4QfHnmxM94qn0F7QLJdSJM6pCk4MGT
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 03/14/2017 05:19 AM, Andreas Grapentin wrote:
> Building qemu fails with glibc-2.25 and gcc-6.3.1:
>=20
>> qemu/qga/commands-posix.c:656:13: error: In the GNU C Library, "major"=
 is defined
>>  by <sys/sysmacros.h>. For historical compatibility, it is
>>  currently defined by <sys/types.h> as well, but we plan to
>>  remove this soon. To use "major", include <sys/sysmacros.h>
>>  directly. If you did not intend to use a system-defined macro
>>  "major", you should undefine it after including <sys/types.h>. [-Werr=
or]
>>          *devmajor =3D major(st.st_rdev);
>>              ^~~~~~~~~~~~~~~~~~~~~~~~~~
>=20
> A trivial fix is to #include <sys/sysmacros.h> in the respective files.=

>=20
>=20
> Andreas Grapentin (1):
>   major / minor macros are to be included from <sys/sysmacros.h>

NACK. <sys/sysmacros.h> is not a universal file, so you can't blindly
include it without first checking that it exists. We already fixed the
problem correctly in commit 4d04351, which just landed today.

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--vCl4QfHnmxM94qn0F7QLJdSJM6pCk4MGT--

--LcqFluUf1l1xxq7eNlK2rsqRe2XXiSaIE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJYx/IbAAoJEKeha0olJ0NqIM0IAKQWOvZ6oXfnY2eF2rOJiodF
qF1mnHliRNZNcrT4EH8vSSGAh9KzsQrB9FxfJEMk4a/DCvkr0+379FnvMR3JuwW4
jgs4cSjEbqIhBZRde1VukJXw5w7UdT3i35PEJ2jNFQvowTiMoj8fScdhsUSe7KoN
J0pRttEN1If3+YHVLSojFX1sJuVC74eUP3YRQfqFKeAv6ud89YTLcOGgMnVHcUO8
Qat1mfuAU7QXz85pOYPUvbc3SMi0mLY7+I2wO+iY+5uZK0EzTsqoGJXUGFP2jGr7
sH104Zw8Znw0Y2IVjpUa9e+pepERVURta4jlPm3SrRa6gO3TM//iXcPWxGjH8kY=
=gUMB
-----END PGP SIGNATURE-----

--LcqFluUf1l1xxq7eNlK2rsqRe2XXiSaIE--

