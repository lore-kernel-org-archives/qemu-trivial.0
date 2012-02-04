Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Rteev-0005QR-FG
	for mharc-qemu-trivial@gnu.org; Sat, 04 Feb 2012 07:24:01 -0500
Received: from eggs.gnu.org ([140.186.70.92]:57459)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@web.de>) id 1Rteer-0005F6-OE
	for qemu-trivial@nongnu.org; Sat, 04 Feb 2012 07:23:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jan.kiszka@web.de>) id 1Rteeq-0005XM-L9
	for qemu-trivial@nongnu.org; Sat, 04 Feb 2012 07:23:57 -0500
Received: from fmmailgate04.web.de ([217.72.192.242]:55329)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@web.de>)
	id 1Rteen-0005Wz-At; Sat, 04 Feb 2012 07:23:53 -0500
Received: from moweb001.kundenserver.de (moweb001.kundenserver.de
	[172.19.20.114])
	by fmmailgate04.web.de (Postfix) with ESMTP id 0D6CC7138F8A;
	Sat,  4 Feb 2012 13:23:52 +0100 (CET)
Received: from mchn199C.mchp.siemens.de ([95.157.56.37]) by smtp.web.de
	(mrweb001) with ESMTPA (Nemesis) id 0MfYXz-1SDors1N8N-00Op8b;
	Sat, 04 Feb 2012 13:23:51 +0100
Message-ID: <4F2D2352.80204@web.de>
Date: Sat, 04 Feb 2012 13:23:46 +0100
From: Jan Kiszka <jan.kiszka@web.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de;
	rv:1.8.1.12) Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12
	Mnenhy/0.7.5.666
MIME-Version: 1.0
To: Blue Swirl <blauwirbel@gmail.com>
References: <4F2BCCBD.8050009@siemens.com>
	<CAAu8pHvB_cG6KWaq350-ZAdsAiBr+m2FCSzuAX3LAYUdDUHX5A@mail.gmail.com>
In-Reply-To: <CAAu8pHvB_cG6KWaq350-ZAdsAiBr+m2FCSzuAX3LAYUdDUHX5A@mail.gmail.com>
X-Enigmail-Version: 1.3.5
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enigA935425AE780C261F8209223"
X-Provags-ID: V02:K0:uf/8FZgFqtJrbHJWbZkohlgU2+4YJTqT+SR2fe9HGYq
	jJa0ExTOUOjEL9hN7j+TnpPXwnN/WLDFZSRBfET+4bExj3tlP4
	UneN+KcpavXDkKGNRhBDXlH6sfJ8ir1oAfX/M+qfTyTMYYfGFW
	VKhpq8usXYxyVfHTn2ZhdCu2zh3QQ2nmWCYRoqDyUaFgDlqUm7
	T2cjcZSm4C0T8DYdEu24A==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 217.72.192.242
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
X-List-Received-Date: Sat, 04 Feb 2012 12:23:58 -0000

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enigA935425AE780C261F8209223
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 2012-02-04 13:12, Blue Swirl wrote:
> On Fri, Feb 3, 2012 at 12:02, Jan Kiszka <jan.kiszka@siemens.com> wrote=
:
>> Helpful to understand guest configurations of things like the i440FX's=

>> PAM.
>>
>> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
>> ---
>>  memory.c |    6 ++++--
>>  1 files changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/memory.c b/memory.c
>> index ee4c98a..ea4adda 100644
>> --- a/memory.c
>> +++ b/memory.c
>> @@ -1608,23 +1608,25 @@ static void mtree_print_mr(fprintf_function mo=
n_printf, void *f,
>>             ml->printed =3D false;
>>             QTAILQ_INSERT_TAIL(alias_print_queue, ml, queue);
>>         }
>> -        mon_printf(f, TARGET_FMT_plx "-" TARGET_FMT_plx " (prio %d): =
alias %s @%s "
>> +        mon_printf(f, TARGET_FMT_plx "-" TARGET_FMT_plx " (prio %d, %=
s): alias %s @%s "
>>                    TARGET_FMT_plx "-" TARGET_FMT_plx "\n",
>>                    base + mr->addr,
>>                    base + mr->addr
>>                    + (target_phys_addr_t)int128_get64(mr->size) - 1,
>>                    mr->priority,
>> +                   mr->readonly ? "RO" : "RW",
>=20
> I think the reserved regions which are unreadable and unwritable
> should be shown as well. Then the output should be a combination of
> 'R', 'W' or neither ('-').

Reserved regions are in the hand of some other device model (so far only
the KVM kernel). That says nothing about their R/W property. If we ever
have a reserved region that is not writable, the owner could still set
the corresponding flag for documentation purposes.

Jan


--------------enigA935425AE780C261F8209223
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.16 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk8tI1YACgkQitSsb3rl5xQAZACeII9oKsOHxcjOKH2ISRLFJ1GZ
neYAn3wUHWjjapIdeB8HS/sFkp+qvJyq
=lSgJ
-----END PGP SIGNATURE-----

--------------enigA935425AE780C261F8209223--

