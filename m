Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RvQvY-0004D7-Mm
	for mharc-qemu-trivial@gnu.org; Thu, 09 Feb 2012 05:08:32 -0500
Received: from eggs.gnu.org ([140.186.70.92]:54529)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@web.de>) id 1RvQvR-0003pS-FS
	for qemu-trivial@nongnu.org; Thu, 09 Feb 2012 05:08:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jan.kiszka@web.de>) id 1RvQvQ-0000OY-6R
	for qemu-trivial@nongnu.org; Thu, 09 Feb 2012 05:08:25 -0500
Received: from fmmailgate02.web.de ([217.72.192.227]:43863)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@web.de>)
	id 1RvQvE-0000M5-Ao; Thu, 09 Feb 2012 05:08:12 -0500
Received: from moweb001.kundenserver.de (moweb001.kundenserver.de
	[172.19.20.114])
	by fmmailgate02.web.de (Postfix) with ESMTP id 6FBBB1C0B6E02;
	Thu,  9 Feb 2012 11:08:11 +0100 (CET)
Received: from mchn199C.mchp.siemens.de ([95.157.56.37]) by smtp.web.de
	(mrweb002) with ESMTPA (Nemesis) id 0Lecda-1SK3Vd03B8-00qAJC;
	Thu, 09 Feb 2012 11:08:11 +0100
Message-ID: <4F339B0A.3070601@web.de>
Date: Thu, 09 Feb 2012 11:08:10 +0100
From: Jan Kiszka <jan.kiszka@web.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de;
	rv:1.8.1.12) Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12
	Mnenhy/0.7.5.666
MIME-Version: 1.0
To: Stefan Hajnoczi <stefanha@gmail.com>
References: <4F2BCCBD.8050009@siemens.com>
	<CAAu8pHvB_cG6KWaq350-ZAdsAiBr+m2FCSzuAX3LAYUdDUHX5A@mail.gmail.com>
	<4F2D2352.80204@web.de>
	<CAAu8pHvBnW2v-q9YG57m0SH9BShbeyor+NY-TjGiT6Cj=f9kRQ@mail.gmail.com>
	<4F2D45FF.9070204@web.de>
	<20120209083513.GA30956@stefanha-thinkpad.localdomain>
In-Reply-To: <20120209083513.GA30956@stefanha-thinkpad.localdomain>
X-Enigmail-Version: 1.3.5
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig65B789E0CAF390A84EAF8893"
X-Provags-ID: V02:K0:4MEcRhJeEDsZR4xfBo7+IH4vzlGSYfOH4iux3+II74z
	H8UqW7pVQffp2LDL1crDHvELYg+DwAAWme7kobhrAjcvK/H/zM
	BU68KMdlDne4Ygcxj0LYrZdm/IacGBPQ3D2R/cff1ZhhuVas5l
	W8wfLjMx0vIsO/G03fO9xyb2PZyA8E6DxxDhRKOWPnCtwaC6/J
	yX6G/JylD+DnmhbQ3t/+g==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 217.72.192.227
Cc: Blue Swirl <blauwirbel@gmail.com>, qemu-trivial <qemu-trivial@nongnu.org>,
	qemu-devel <qemu-devel@nongnu.org>, Avi Kivity <avi@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH] memory-region: Report if region is
 read-only on info mtree
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
X-List-Received-Date: Thu, 09 Feb 2012 10:08:31 -0000

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig65B789E0CAF390A84EAF8893
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 2012-02-09 09:35, Stefan Hajnoczi wrote:
> On Sat, Feb 04, 2012 at 03:51:43PM +0100, Jan Kiszka wrote:
>> On 2012-02-04 13:32, Blue Swirl wrote:
>>> On Sat, Feb 4, 2012 at 12:23, Jan Kiszka <jan.kiszka@web.de> wrote:
>>>> On 2012-02-04 13:12, Blue Swirl wrote:
>>>>> On Fri, Feb 3, 2012 at 12:02, Jan Kiszka <jan.kiszka@siemens.com> w=
rote:
>>>>>> Helpful to understand guest configurations of things like the i440=
FX's
>>>>>> PAM.
>>>>>>
>>>>>> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
>>>>>> ---
>>>>>>  memory.c |    6 ++++--
>>>>>>  1 files changed, 4 insertions(+), 2 deletions(-)
>>>>>>
>>>>>> diff --git a/memory.c b/memory.c
>>>>>> index ee4c98a..ea4adda 100644
>>>>>> --- a/memory.c
>>>>>> +++ b/memory.c
>>>>>> @@ -1608,23 +1608,25 @@ static void mtree_print_mr(fprintf_functio=
n mon_printf, void *f,
>>>>>>             ml->printed =3D false;
>>>>>>             QTAILQ_INSERT_TAIL(alias_print_queue, ml, queue);
>>>>>>         }
>>>>>> -        mon_printf(f, TARGET_FMT_plx "-" TARGET_FMT_plx " (prio %=
d): alias %s @%s "
>>>>>> +        mon_printf(f, TARGET_FMT_plx "-" TARGET_FMT_plx " (prio %=
d, %s): alias %s @%s "
>>>>>>                    TARGET_FMT_plx "-" TARGET_FMT_plx "\n",
>>>>>>                    base + mr->addr,
>>>>>>                    base + mr->addr
>>>>>>                    + (target_phys_addr_t)int128_get64(mr->size) - =
1,
>>>>>>                    mr->priority,
>>>>>> +                   mr->readonly ? "RO" : "RW",
>>>>>
>>>>> I think the reserved regions which are unreadable and unwritable
>>>>> should be shown as well. Then the output should be a combination of=

>>>>> 'R', 'W' or neither ('-').
>>>>
>>>> Reserved regions are in the hand of some other device model (so far =
only
>>>> the KVM kernel). That says nothing about their R/W property. If we e=
ver
>>>> have a reserved region that is not writable, the owner could still s=
et
>>>> the corresponding flag for documentation purposes.
>>>
>>> OK. But it's also possible for a region to have readable =3D=3D false=

>>> while readonly =3D=3D false, which would imply 'WO' or '-W'. That als=
o
>>> supports separate 'R', 'W' and '-' flags.
>>
>> Yep, I encoded the ROM device state as well. And this revealed a
>> regression of the memory region conversion of the cfi02. Gave up
>> counting how often I fixed this type of bug in the flash code.
>=20
> Is this patch ready to go?  Seems fine to me but do you still want to
> add the 'WO' output that Blue Swirl suggested?

There is v2 on the list, but I removed trival from CC due to the
discussion. Needs an ack from Blue, I think.

Jan


--------------enig65B789E0CAF390A84EAF8893
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.16 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk8zmwoACgkQitSsb3rl5xTVzwCguoTtIOvZstK02rsks+5YPD1X
abAAoI1JSNr8lKpSqwgC4XSFftVYoAQ2
=K5LT
-----END PGP SIGNATURE-----

--------------enig65B789E0CAF390A84EAF8893--

