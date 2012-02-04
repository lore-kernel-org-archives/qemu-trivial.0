Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Rtgy7-0004Og-0x
	for mharc-qemu-trivial@gnu.org; Sat, 04 Feb 2012 09:51:59 -0500
Received: from eggs.gnu.org ([140.186.70.92]:49110)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@web.de>) id 1Rtgy4-0004HH-9H
	for qemu-trivial@nongnu.org; Sat, 04 Feb 2012 09:51:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jan.kiszka@web.de>) id 1Rtgy3-0008Lc-As
	for qemu-trivial@nongnu.org; Sat, 04 Feb 2012 09:51:56 -0500
Received: from fmmailgate03.web.de ([217.72.192.234]:40064)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@web.de>)
	id 1Rtgxz-0008Ks-O5; Sat, 04 Feb 2012 09:51:51 -0500
Received: from moweb002.kundenserver.de (moweb002.kundenserver.de
	[172.19.20.108])
	by fmmailgate03.web.de (Postfix) with ESMTP id 862401B09E47C;
	Sat,  4 Feb 2012 15:51:50 +0100 (CET)
Received: from mchn199C.mchp.siemens.de ([95.157.56.37]) by smtp.web.de
	(mrweb002) with ESMTPA (Nemesis) id 0Lr2I7-1SXicQ3lat-00eLTT;
	Sat, 04 Feb 2012 15:51:50 +0100
Message-ID: <4F2D45FF.9070204@web.de>
Date: Sat, 04 Feb 2012 15:51:43 +0100
From: Jan Kiszka <jan.kiszka@web.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de;
	rv:1.8.1.12) Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12
	Mnenhy/0.7.5.666
MIME-Version: 1.0
To: Blue Swirl <blauwirbel@gmail.com>
References: <4F2BCCBD.8050009@siemens.com>
	<CAAu8pHvB_cG6KWaq350-ZAdsAiBr+m2FCSzuAX3LAYUdDUHX5A@mail.gmail.com>
	<4F2D2352.80204@web.de>
	<CAAu8pHvBnW2v-q9YG57m0SH9BShbeyor+NY-TjGiT6Cj=f9kRQ@mail.gmail.com>
In-Reply-To: <CAAu8pHvBnW2v-q9YG57m0SH9BShbeyor+NY-TjGiT6Cj=f9kRQ@mail.gmail.com>
X-Enigmail-Version: 1.3.5
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig818B3DA45E29F5EED18FAF63"
X-Provags-ID: V02:K0:x/mh7cq+BKRzfcz/xbZfclgnJdepppJgsduBnsENtbG
	w1lgZFdeJu6i3K5zY0tOcwfW6lQ3OlekEyIB12DdKkD0HUvn7w
	Y1VhyPv0hI/UCDNiDkGGT5REoL2QTG+0rClM6/TYpaAZmkMmdd
	hzzqOK0bP8SAs2iypqqvVls9I4XxW3JWLgsEyazMXSyNK0bJr0
	IeVUVltdOLWB2+TDPlpLQ==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 217.72.192.234
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
	Avi Kivity <avi@redhat.com>
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
X-List-Received-Date: Sat, 04 Feb 2012 14:51:57 -0000

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig818B3DA45E29F5EED18FAF63
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 2012-02-04 13:32, Blue Swirl wrote:
> On Sat, Feb 4, 2012 at 12:23, Jan Kiszka <jan.kiszka@web.de> wrote:
>> On 2012-02-04 13:12, Blue Swirl wrote:
>>> On Fri, Feb 3, 2012 at 12:02, Jan Kiszka <jan.kiszka@siemens.com> wro=
te:
>>>> Helpful to understand guest configurations of things like the i440FX=
's
>>>> PAM.
>>>>
>>>> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
>>>> ---
>>>>  memory.c |    6 ++++--
>>>>  1 files changed, 4 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/memory.c b/memory.c
>>>> index ee4c98a..ea4adda 100644
>>>> --- a/memory.c
>>>> +++ b/memory.c
>>>> @@ -1608,23 +1608,25 @@ static void mtree_print_mr(fprintf_function =
mon_printf, void *f,
>>>>             ml->printed =3D false;
>>>>             QTAILQ_INSERT_TAIL(alias_print_queue, ml, queue);
>>>>         }
>>>> -        mon_printf(f, TARGET_FMT_plx "-" TARGET_FMT_plx " (prio %d)=
: alias %s @%s "
>>>> +        mon_printf(f, TARGET_FMT_plx "-" TARGET_FMT_plx " (prio %d,=
 %s): alias %s @%s "
>>>>                    TARGET_FMT_plx "-" TARGET_FMT_plx "\n",
>>>>                    base + mr->addr,
>>>>                    base + mr->addr
>>>>                    + (target_phys_addr_t)int128_get64(mr->size) - 1,=

>>>>                    mr->priority,
>>>> +                   mr->readonly ? "RO" : "RW",
>>>
>>> I think the reserved regions which are unreadable and unwritable
>>> should be shown as well. Then the output should be a combination of
>>> 'R', 'W' or neither ('-').
>>
>> Reserved regions are in the hand of some other device model (so far on=
ly
>> the KVM kernel). That says nothing about their R/W property. If we eve=
r
>> have a reserved region that is not writable, the owner could still set=

>> the corresponding flag for documentation purposes.
>=20
> OK. But it's also possible for a region to have readable =3D=3D false
> while readonly =3D=3D false, which would imply 'WO' or '-W'. That also
> supports separate 'R', 'W' and '-' flags.

Yep, I encoded the ROM device state as well. And this revealed a
regression of the memory region conversion of the cfi02. Gave up
counting how often I fixed this type of bug in the flash code.

Jan


--------------enig818B3DA45E29F5EED18FAF63
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.16 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk8tRgEACgkQitSsb3rl5xQNLACcD28Ijx7U6x3OJzNW7VFyvFlK
ePwAn09vjMOuyNGp3Zd2T8QO+D64mckf
=VF1L
-----END PGP SIGNATURE-----

--------------enig818B3DA45E29F5EED18FAF63--

