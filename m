Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dYGkY-0003Cq-7u
	for mharc-qemu-trivial@gnu.org; Thu, 20 Jul 2017 15:04:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52811)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dYGkU-0003A8-5t
	for qemu-trivial@nongnu.org; Thu, 20 Jul 2017 15:04:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dYGkR-0002rw-Tz
	for qemu-trivial@nongnu.org; Thu, 20 Jul 2017 15:04:32 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58660)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1dYGkK-0002ka-Mu; Thu, 20 Jul 2017 15:04:24 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 47A162F86C3;
	Thu, 20 Jul 2017 19:04:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 47A162F86C3
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eblake@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 47A162F86C3
Received: from [10.10.120.37] (ovpn-120-37.rdu2.redhat.com [10.10.120.37])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3A0E017B40;
	Thu, 20 Jul 2017 19:04:21 +0000 (UTC)
To: Richard Henderson <rth@twiddle.net>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
References: <1500568290-7966-1-git-send-email-peter.maydell@linaro.org>
	<d4b6f6a0-3479-795a-97b2-68c98a6b0c24@twiddle.net>
	<c1526558-db87-734b-c1dd-7601ceaa682c@redhat.com>
	<06919388-6794-d0a0-f014-b95a9cc68460@twiddle.net>
Cc: patches@linaro.org, Cornelia Huck <cohuck@redhat.com>,
	Alexander Graf <agraf@suse.de>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Kamil Rytarowski <kamil@netbsd.org>, qemu-ppc@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <10223971-6e02-fe3f-337f-de9c14081582@redhat.com>
Date: Thu, 20 Jul 2017 14:04:20 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <06919388-6794-d0a0-f014-b95a9cc68460@twiddle.net>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="XDcaAcknROkKp4V1nnXkWgRpVFj0iK6mc"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Thu, 20 Jul 2017 19:04:23 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for-2.10] Use qemu_tolower()
 and qemu_toupper(), not tolower() and toupper()
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
X-List-Received-Date: Thu, 20 Jul 2017 19:04:37 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--XDcaAcknROkKp4V1nnXkWgRpVFj0iK6mc
Content-Type: multipart/mixed; boundary="wI9Br6BQgnhREbTkhwXpFkkuMTQ6xEDLw";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Richard Henderson <rth@twiddle.net>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
Cc: patches@linaro.org, Cornelia Huck <cohuck@redhat.com>,
 Alexander Graf <agraf@suse.de>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Kamil Rytarowski <kamil@netbsd.org>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Message-ID: <10223971-6e02-fe3f-337f-de9c14081582@redhat.com>
Subject: Re: [Qemu-devel] [PATCH for-2.10] Use qemu_tolower() and
 qemu_toupper(), not tolower() and toupper()
References: <1500568290-7966-1-git-send-email-peter.maydell@linaro.org>
 <d4b6f6a0-3479-795a-97b2-68c98a6b0c24@twiddle.net>
 <c1526558-db87-734b-c1dd-7601ceaa682c@redhat.com>
 <06919388-6794-d0a0-f014-b95a9cc68460@twiddle.net>
In-Reply-To: <06919388-6794-d0a0-f014-b95a9cc68460@twiddle.net>

--wI9Br6BQgnhREbTkhwXpFkkuMTQ6xEDLw
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 07/20/2017 01:57 PM, Richard Henderson wrote:
> On 07/20/2017 08:48 AM, Eric Blake wrote:
>> On 07/20/2017 01:26 PM, Richard Henderson wrote:
>>> On 07/20/2017 06:31 AM, Peter Maydell wrote:
>>>> gdbstub.c:914:13: warning: array subscript has type 'char'
>>>>
>>>> This reflects the fact that toupper() and tolower() give
>>>> undefined behaviour if they are passed a value that isn't
>>>> a valid 'unsigned char' or EOF.
>>>
>>> Not saying we shouldn't use qemu_tolower etc, but this statement is n=
ot
>>> true at all.  Officially, the argument to toupper and tolower is type=

>>> int.
>>
>> Correct. Officially, the argument to toupper is an int, but
>> range-constrained to the set of ints that represent either EOF or an
>> unsigned char value.
>=20
> Please show me that language in C11 (or any other version).

POSIX:
http://pubs.opengroup.org/onlinepubs/9699919799/functions/toupper.html

> For toupper(): [CX] [Option Start]  The functionality described on this=
 reference page is aligned with the ISO C standard. Any conflict between =
the requirements described here and the ISO C standard is unintentional. =
This volume of POSIX.1-2008 defers to the ISO C standard. [Option End]
>=20
> The toupper() [CX] [Option Start]  and toupper_l() [Option End]  functi=
ons have as a domain a type int, the value of which is representable as a=
n unsigned char or the value of EOF. If the argument has any other value,=
 the behavior is undefined.

So POSIX is claiming it is a C99 requirement.

And I found this in C11:

7.4 Character handling <ctype.h>
1 The header <ctype.h> declares several functions useful for classifying
and mapping
characters. 198) In all cases the argument is an int, the value of which
shall be
representable as an unsigned char or shall equal the value of the macro
EOF. If the
argument has any other value, the behavior is undefined.


--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--wI9Br6BQgnhREbTkhwXpFkkuMTQ6xEDLw--

--XDcaAcknROkKp4V1nnXkWgRpVFj0iK6mc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAllw/rQACgkQp6FrSiUn
Q2pYAQgAhZCq/f3XEuKR6gyHIN4klKXhXjqPopDI0j8P6od2LQoFFSYlgyzFT51/
JVhinewpWm1DkEwsLyMPBgNg22wKPH6LVfAJstWSSQOR0/nbw6VdTWejnjX/a4CI
BTeQNCqDNtE/iqnuOFzKBG1/gKlg/83txRQUnZD4cSA8xRsQUPq1ulAhXnfFakOa
m92vhe7B2Nb98MrNAuJatn55flCWhlvFZV1T2Z6Lsr4ZX1Ovm6+7hokroEYXSuOB
CRpCTSN6XCrolrly4xphcZenvDkNOXjoOvJTWl/3moEiL2x2IwSwiNXdSGkWUBJp
SafLjkpcX+kvdJbFA4SQehtd+tjJ2w==
=QrOi
-----END PGP SIGNATURE-----

--XDcaAcknROkKp4V1nnXkWgRpVFj0iK6mc--

