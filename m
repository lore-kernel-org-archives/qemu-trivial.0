Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dYJ0b-0001ze-CO
	for mharc-qemu-trivial@gnu.org; Thu, 20 Jul 2017 17:29:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55219)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dYJ0Y-0001wy-09
	for qemu-trivial@nongnu.org; Thu, 20 Jul 2017 17:29:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dYJ0W-0005KF-Gc
	for qemu-trivial@nongnu.org; Thu, 20 Jul 2017 17:29:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51856)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1dYJ0O-00056r-5L; Thu, 20 Jul 2017 17:29:08 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A6C0261E51;
	Thu, 20 Jul 2017 21:29:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com A6C0261E51
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eblake@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com A6C0261E51
Received: from [10.10.120.37] (ovpn-120-37.rdu2.redhat.com [10.10.120.37])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D593758824;
	Thu, 20 Jul 2017 21:29:04 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <rth@twiddle.net>
References: <1500568290-7966-1-git-send-email-peter.maydell@linaro.org>
	<d4b6f6a0-3479-795a-97b2-68c98a6b0c24@twiddle.net>
	<CAFEAcA8tkW2bk_O3iDO-wWpY9EUbUNkUL93OShipsvckj-jkoQ@mail.gmail.com>
Cc: "patches@linaro.org" <patches@linaro.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, Cornelia Huck <cohuck@redhat.com>, 
	Alexander Graf <agraf@suse.de>, QEMU Developers <qemu-devel@nongnu.org>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Kamil Rytarowski <kamil@netbsd.org>,
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <2bba3c89-e4f0-655b-c9ed-aab911beaaa7@redhat.com>
Date: Thu, 20 Jul 2017 16:29:03 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8tkW2bk_O3iDO-wWpY9EUbUNkUL93OShipsvckj-jkoQ@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="O85mhTwOtepEwxiG6CcWot9deDBgTX3Rm"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Thu, 20 Jul 2017 21:29:07 +0000 (UTC)
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
X-List-Received-Date: Thu, 20 Jul 2017 21:29:19 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--O85mhTwOtepEwxiG6CcWot9deDBgTX3Rm
Content-Type: multipart/mixed; boundary="HvgowAhinaCV7QmOCLVBQ4F7Xsdpx9pT6";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <rth@twiddle.net>
Cc: "patches@linaro.org" <patches@linaro.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, Cornelia Huck <cohuck@redhat.com>,
 Alexander Graf <agraf@suse.de>, QEMU Developers <qemu-devel@nongnu.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Kamil Rytarowski <kamil@netbsd.org>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Message-ID: <2bba3c89-e4f0-655b-c9ed-aab911beaaa7@redhat.com>
Subject: Re: [Qemu-devel] [PATCH for-2.10] Use qemu_tolower() and
 qemu_toupper(), not tolower() and toupper()
References: <1500568290-7966-1-git-send-email-peter.maydell@linaro.org>
 <d4b6f6a0-3479-795a-97b2-68c98a6b0c24@twiddle.net>
 <CAFEAcA8tkW2bk_O3iDO-wWpY9EUbUNkUL93OShipsvckj-jkoQ@mail.gmail.com>
In-Reply-To: <CAFEAcA8tkW2bk_O3iDO-wWpY9EUbUNkUL93OShipsvckj-jkoQ@mail.gmail.com>

--HvgowAhinaCV7QmOCLVBQ4F7Xsdpx9pT6
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 07/20/2017 04:03 PM, Peter Maydell wrote:
> On 20 July 2017 at 19:26, Richard Henderson <rth@twiddle.net> wrote:
>> On 07/20/2017 06:31 AM, Peter Maydell wrote:
>>>
>>> gdbstub.c:914:13: warning: array subscript has type 'char'
>>>
>>> This reflects the fact that toupper() and tolower() give
>>> undefined behaviour if they are passed a value that isn't
>>> a valid 'unsigned char' or EOF.
>>
>>
>> Not saying we shouldn't use qemu_tolower etc, but this statement is no=
t true
>> at all.  Officially, the argument to toupper and tolower is type int.
>=20
> (I was going to quote POSIX here but I see Eric has done so already.)
>=20
>> This sounds like a bug in NetBSD -- though it may not even be that, as=
 they
>> may have done something clever and put the symbol in the middle of the=
 data.
>> A trick that worked before compiler warnings got smarter.
>=20
> https://ftp.netbsd.org/pub/NetBSD/NetBSD-current/src/sys/sys/ctype_inli=
ne.h
> The implementation is
>   #define toupper(c) ((int)((_toupper_tab_ + 1)[(c)]))
>=20
> (where I assume _toupper_tab_ is the obvious array.)

In fact, if NetBSD's implementation is anything like Cygwin's, then it
is a safe bet that _toupper_tab_ is a symbol that lands in the middle of
a larger 384-byte array, such that _toupper_tab_[-1] (for (signed
char)'\xfe') happens to resolve to a valid image address, and will have
the same contents as _toupper_tab_[255] (for (unsigned char)'\xfe'),
precisely to cater to so many clueless programs have forgotten about
signed char widening to negative values (even though the standard says
the behavior is undefined, quality-of-implementation demands that you
try to do the sane thing anyway).

The table is of course only MOSTLY symmetric; there are some single-byte
locales where isspace((unsigned char)'\xff') is true but isspace(EOF) is
false (in using the magic-middle-of-array locations, _tab_[0] cannot
always match _tab_[256] in all locales).  And it is wraparound where
'\xff' collides with -1 that explains WHY C99 documents the range to be
ints corresponding to unsigned char.

Side note: NetBSD has a bug in their ctype.h.
toupper(INT64_C(0x100000001)) is supposed to be the same as toupper(1),
since POSIX requires toupper() to be available as a function (and
permits a macro as well).  A function with an int parameter must
gracefully truncate a 64-bit input down to 32-bits, so the macro must do
the same; but the NetBSD macro uses all 64 bits to dereference into
garbage memory locations.  Fortunately, no one runs into the bug in real
life because no one really tries to pass 64-bit numbers to ctype macros.

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--HvgowAhinaCV7QmOCLVBQ4F7Xsdpx9pT6--

--O85mhTwOtepEwxiG6CcWot9deDBgTX3Rm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAllxIJ8ACgkQp6FrSiUn
Q2rd0Qf8ChmWXpaI5CiSNi58Em0kyliT+zYnluN65o/NeUVji0ZHy7bdvYmQo4qC
leoprhcAAMi/eCygben3eWUovRc5e0KqvDvyiD0MayIVWh1V6KFCbr4FzbsBKVoJ
Ki1RePkNtyWYHDrhJHi/9H3r/Rek+24kvi+prx+/lDJrXzlLUdSrizmcgkccGJjf
uOIjeSETL9we2otnPd3rKRwhTm08T+jAiKASSaJRqTm7/N3oeKHRyLbFTt1wmEVC
sLwHWk7RyTt+VsbF1dtumag+6xaAoJaJJrz761tZhuychHfAk70x2hscBeFySPzZ
EuUY3GNbbdgqkTgUuFZQDpQD7UdgmA==
=UiQj
-----END PGP SIGNATURE-----

--O85mhTwOtepEwxiG6CcWot9deDBgTX3Rm--

