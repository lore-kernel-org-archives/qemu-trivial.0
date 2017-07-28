Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dbA5e-0002UC-US
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jul 2017 14:34:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53599)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dbA5d-0002Sk-2e
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 14:34:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dbA5c-0007w7-0J
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 14:34:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36298)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1dbA5X-0007s1-7j; Fri, 28 Jul 2017 14:34:15 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1DB586527C;
	Fri, 28 Jul 2017 18:34:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 1DB586527C
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eblake@redhat.com
Received: from [10.10.120.22] (ovpn-120-22.rdu2.redhat.com [10.10.120.22])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7C8006046A;
	Fri, 28 Jul 2017 18:34:12 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
References: <20170728012542.29975-1-f4bug@amsat.org>
Cc: qemu-trivial@nongnu.org
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <9bf5ddf1-3b81-ceb3-66a0-1d3267e7cae4@redhat.com>
Date: Fri, 28 Jul 2017 13:34:11 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170728012542.29975-1-f4bug@amsat.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="uUD4CgVF4QPKgQPFAkrRmrGjPnXVRgvcb"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Fri, 28 Jul 2017 18:34:13 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH for 2.10 0/8] docs: fix broken paths
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
X-List-Received-Date: Fri, 28 Jul 2017 18:34:22 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--uUD4CgVF4QPKgQPFAkrRmrGjPnXVRgvcb
Content-Type: multipart/mixed; boundary="uA4nWwId9slfrCPm7pkLvQixfOmkED9Hl";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Message-ID: <9bf5ddf1-3b81-ceb3-66a0-1d3267e7cae4@redhat.com>
Subject: Re: [PATCH for 2.10 0/8] docs: fix broken paths
References: <20170728012542.29975-1-f4bug@amsat.org>
In-Reply-To: <20170728012542.29975-1-f4bug@amsat.org>

--uA4nWwId9slfrCPm7pkLvQixfOmkED9Hl
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 07/27/2017 08:25 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> Hi, following Cleber Rosa example I cleaned more invalid references.
>=20
> Eric said this can wait 2.11, however these patches don't change any co=
de
> generated, I think the 2.10 users deserve an up-to-date doc :p

I think what I said was: this doesn't change code and doc updates are
find during freeze, so this is a GOOD candidate for 2.10; but if it
misses 2.10, slipping to 2.11 doesn't hurt.  (If I didn't say that, it's
what I should have done).  But you caught on to my intention, even if in
the process it sounds like I was asking you to wait.

>=20
> I used the following command (and consider include it in some CI test j=
ob):
>=20
> $ git grep docs/ \
>       | sed -ne "s/.* \(docs[^ :)}\"\']*\).*/\1/p" \
>       | sed -e 's/\(.*\)\.$/\1/p' | sort -u | while read p;do
>     ls -ld $p 1>/dev/null

Wait. What? 'ls -ld' with stdout sent to /dev/null?  (I never cease to
be amazed at the random shell constructs that people come up with).  I
guess you are just trying to check for file existence, by going off of
the stderr droppings from ls?  'ls -d' is less effort than 'ls -ld'; and
if all you care about is stderr messages, spawning one ls per filename
is much slower than just doing it wholesale via xargs to minimize ls call=
s:

git grep ... | sort -u | xargs ls -d >/dev/null

But then again, efficiency in generating the list of problems isn't a
bottleneck.

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--uA4nWwId9slfrCPm7pkLvQixfOmkED9Hl--

--uUD4CgVF4QPKgQPFAkrRmrGjPnXVRgvcb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAll7g6MACgkQp6FrSiUn
Q2olQwf/ZaX430jnE16HN4gvAjRyQ7CZT1J/yFW7Sro7zs/Y1rCLRh2kS3T3Xpzz
rG3TKNU1/EQ3VMnq108nL1m9icX5cvYOEPw41SiRqjOCHwbJNue9GdMhM2Ti5OUa
G72z/s6DpB4HZnAZHYTctGi0MknQK9Q8JlnZ2BPadr1QZUovkRgEhdxjOgZ0XcYx
N3VbkQtbrGgOgLW0EkBC3xWy3Q7UWnIClYRFgU8D2Q/Uvb0opdAN27qjSgm6DdbH
R5G0ZFOrOd6QR8RGKaC81yyKImMMgMJorMJG7GQHyLdPzCaqvToV2hWoSWZ5fvHL
NsjLmz1WuY5Z3ZW+ogaNzex7zbezhg==
=OupY
-----END PGP SIGNATURE-----

--uUD4CgVF4QPKgQPFAkrRmrGjPnXVRgvcb--

