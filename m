Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dYGVG-0004MW-Pg
	for mharc-qemu-trivial@gnu.org; Thu, 20 Jul 2017 14:48:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50084)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dYGVE-0004L1-5W
	for qemu-trivial@nongnu.org; Thu, 20 Jul 2017 14:48:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dYGVA-0003i1-8E
	for qemu-trivial@nongnu.org; Thu, 20 Jul 2017 14:48:48 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54884)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1dYGUy-0003ay-VZ; Thu, 20 Jul 2017 14:48:33 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6878A7A170;
	Thu, 20 Jul 2017 18:48:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 6878A7A170
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eblake@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 6878A7A170
Received: from [10.10.120.37] (ovpn-120-37.rdu2.redhat.com [10.10.120.37])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3414182062;
	Thu, 20 Jul 2017 18:48:27 +0000 (UTC)
To: Richard Henderson <rth@twiddle.net>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
References: <1500568290-7966-1-git-send-email-peter.maydell@linaro.org>
	<d4b6f6a0-3479-795a-97b2-68c98a6b0c24@twiddle.net>
Cc: patches@linaro.org, Cornelia Huck <cohuck@redhat.com>,
	Alexander Graf <agraf@suse.de>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Kamil Rytarowski <kamil@netbsd.org>, qemu-ppc@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <c1526558-db87-734b-c1dd-7601ceaa682c@redhat.com>
Date: Thu, 20 Jul 2017 13:48:27 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <d4b6f6a0-3479-795a-97b2-68c98a6b0c24@twiddle.net>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="ptnBeRnfV2VN8mJbelkq3ISvi7tKo6Lm6"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Thu, 20 Jul 2017 18:48:31 +0000 (UTC)
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
X-List-Received-Date: Thu, 20 Jul 2017 18:48:49 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--ptnBeRnfV2VN8mJbelkq3ISvi7tKo6Lm6
Content-Type: multipart/mixed; boundary="tWRSQ5PDCQCok4CpDNUxXP87gj00nKr6Q";
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
Message-ID: <c1526558-db87-734b-c1dd-7601ceaa682c@redhat.com>
Subject: Re: [Qemu-devel] [PATCH for-2.10] Use qemu_tolower() and
 qemu_toupper(), not tolower() and toupper()
References: <1500568290-7966-1-git-send-email-peter.maydell@linaro.org>
 <d4b6f6a0-3479-795a-97b2-68c98a6b0c24@twiddle.net>
In-Reply-To: <d4b6f6a0-3479-795a-97b2-68c98a6b0c24@twiddle.net>

--tWRSQ5PDCQCok4CpDNUxXP87gj00nKr6Q
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 07/20/2017 01:26 PM, Richard Henderson wrote:
> On 07/20/2017 06:31 AM, Peter Maydell wrote:
>> gdbstub.c:914:13: warning: array subscript has type 'char'
>>
>> This reflects the fact that toupper() and tolower() give
>> undefined behaviour if they are passed a value that isn't
>> a valid 'unsigned char' or EOF.
>=20
> Not saying we shouldn't use qemu_tolower etc, but this statement is not=

> true at all.  Officially, the argument to toupper and tolower is type i=
nt.

Correct. Officially, the argument to toupper is an int, but
range-constrained to the set of ints that represent either EOF or an
unsigned char value.  Calling toupper(char) (on platforms where char is
signed) is thus undefined behavior for chars < 0 (and which happen to
not coincide with EOF).

>=20
> This sounds like a bug in NetBSD -- though it may not even be that, as
> they may have done something clever and put the symbol in the middle of=

> the data.  A trick that worked before compiler warnings got smarter.

No, it is intentional of NetBSD.  In fact, the Cygwin environment also
INTENTIONALLY uses C99 magic to make gcc complain about calling
toupper(char) while being silent on toupper(int) and toupper(unsigned
char).  Because you really DO have portability problems (even if
toupper(char) _happens_ to work on most platforms, even where char is
signed, does not make it portable).  In fact, I'd love it if glibc would
also adopt the appropriate gcc magic to warn about nonportable usage of
ctype functions on signed char.

=46rom Cygwin's ctype.h:

/* These macros are intentionally written in a manner that will trigger
   a gcc -Wall warning if the user mistakenly passes a 'char' instead
   of an int containing an 'unsigned char'.  Note that the sizeof will
   always be 1, which is what we want for mapping EOF to __CTYPE_PTR[0];
   the use of a raw index inside the sizeof triggers the gcc warning if
   __c was of type char, and sizeof masks side effects of the extra __c.
   Meanwhile, the real index to __CTYPE_PTR+1 must be cast to int,
   since isalpha(0x100000001LL) must equal isalpha(1), rather than being
   an out-of-bounds reference on a 64-bit machine.  */
#define __ctype_lookup(__c) ((__CTYPE_PTR+sizeof(""[__c]))[(int)(__c)])

#define isalpha(__c)    (__ctype_lookup(__c)&(_U|_L))

>=20
> Anyway, should we poison the iso name so this doesn't creep in again?

Yes, for ALL of the ctype names where we work around the issue (and
maybe we should work around the issue in more places?)

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--tWRSQ5PDCQCok4CpDNUxXP87gj00nKr6Q--

--ptnBeRnfV2VN8mJbelkq3ISvi7tKo6Lm6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAllw+vsACgkQp6FrSiUn
Q2pe1QgAiQbxtPnwzrSr+84yT1L6lI5OLFZ/9pvI69zgw6c4IH1/PTYuLtxe7wy6
eOWZUFxh0hU8oWTPdMzaIsb9oFsmv/5KpLhLq9W5ouKlFBjmqmXEbrvdHE1bDJZk
KP1wpGSug7zfOXZOCchpEB03c3BNX2qDGOqRgA4xv1cCD/Cgv2sEFaRi83+nu2fe
l9TaYAxEGxLJCBebMMwOxT1uHrvRRq0KO461IjgH8PfmGVrlpHs4mB7a/HES61Dj
YKVIwh+e6hkQ5GaBSSwneGjZ10Ly9lsOFwVWYkLLxhWeXNvW1dlM/i9LNmuTk/kk
8PyFC88YANb3F7ztLbOS3M6yvKZeOg==
=QhC7
-----END PGP SIGNATURE-----

--ptnBeRnfV2VN8mJbelkq3ISvi7tKo6Lm6--

