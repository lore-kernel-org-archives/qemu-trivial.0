Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jFezO-0008Ij-6H
	for mharc-qemu-trivial@gnu.org; Sat, 21 Mar 2020 10:20:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56261)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <balaton@eik.bme.hu>) id 1jFezI-0008AJ-GH
 for qemu-trivial@nongnu.org; Sat, 21 Mar 2020 10:20:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <balaton@eik.bme.hu>) id 1jFezH-0004px-BS
 for qemu-trivial@nongnu.org; Sat, 21 Mar 2020 10:20:32 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:36960)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <balaton@eik.bme.hu>)
 id 1jFez8-0004ii-58; Sat, 21 Mar 2020 10:20:22 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 495027475F6;
 Sat, 21 Mar 2020 15:20:20 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 2143B74638A; Sat, 21 Mar 2020 15:20:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 1E965746381;
 Sat, 21 Mar 2020 15:20:20 +0100 (CET)
Date: Sat, 21 Mar 2020 15:20:20 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>
cc: Aleksandar Markovic <aleksandar.m.mail@gmail.com>, 
 Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>, 
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>, 
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>, 
 "Michael S. Tsirkin" <mst@redhat.com>, 
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>, 
 Andrew Jeffery <andrew@aj.id.au>, 
 Alistair Francis <alistair@alistair23.me>, 
 Michael Tokarev <mjt@tls.msk.ru>, 
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, 
 Markus Armbruster <armbru@redhat.com>, 
 Igor Mitsyanko <i.mitsyanko@gmail.com>, 
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, 
 =?ISO-8859-15?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>, 
 Joel Stanley <joel@jms.id.au>, Paolo Bonzini <pbonzini@redhat.com>, 
 Kevin Wolf <kwolf@redhat.com>, David Gibson <david@gibson.dropbear.id.au>, 
 John Snow <jsnow@redhat.com>, Max Reitz <mreitz@redhat.com>, 
 =?ISO-8859-15?Q?C=E9dric_Le_Goater?= <clg@kaod.org>
Subject: Re: [PATCH-for-5.0 05/11] hw/ide/sii3112: Remove dead assignment
In-Reply-To: <11fc4c44-fb8c-9698-e59f-5592b7d8efea@redhat.com>
Message-ID: <alpine.BSF.2.22.395.2003211518410.82121@zero.eik.bme.hu>
References: <20200321114615.5360-1-philmd@redhat.com>
 <20200321114615.5360-6-philmd@redhat.com>
 <CAL1e-=hQPwJ3XKrt4ip2S92ScjyjS63-A4REDeXzyiCt1Phx6A@mail.gmail.com>
 <alpine.BSF.2.22.395.2003211511170.82121@zero.eik.bme.hu>
 <11fc4c44-fb8c-9698-e59f-5592b7d8efea@redhat.com>
User-Agent: Alpine 2.22 (BSF 395 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1442607649-1584800420=:82121"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2001:738:2001:2001::2001
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sat, 21 Mar 2020 14:20:33 -0000

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1442607649-1584800420=:82121
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On Sat, 21 Mar 2020, Philippe Mathieu-Daud=C3=A9 wrote:
> On 3/21/20 3:12 PM, BALATON Zoltan wrote:
>> On Sat, 21 Mar 2020, Aleksandar Markovic wrote:
>>> On Saturday, March 21, 2020, Philippe Mathieu-Daud=C3=A9 <philmd@redh=
at.com>
>>> wrote:
>>>=20
>>>> Fix warning reported by Clang static code analyzer:
>>>>=20
>>>> =C2=A0=C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hw/ide/sii3112.o
>>>> =C2=A0 hw/ide/sii3112.c:204:9: warning: Value stored to 'val' is nev=
er read
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val =3D 0;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^=C2=A0=C2=A0=
=C2=A0=C2=A0 ~
>>>>=20
>>>> Reported-by: Clang Static Analyzer
>>>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>>>> ---
>>>> =C2=A0hw/ide/sii3112.c | 2 +-
>>>> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>>>>=20
>>>> diff --git a/hw/ide/sii3112.c b/hw/ide/sii3112.c
>>>> index 06605d7af2..36f1905ddb 100644
>>>> --- a/hw/ide/sii3112.c
>>>> +++ b/hw/ide/sii3112.c
>>>> @@ -125,7 +125,7 @@ static uint64_t sii3112_reg_read(void *opaque, h=
waddr
>>>> addr,
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val =3D (uint32_t)d=
->regs[1].sien << 16;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 default:
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val =3D 0;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>>=20
>>>=20
>>> There is another function in the same file, having a similar switch
>>> statement. There is no warning for that second tunction, since "val" =
is=20
>>> its
>>> parameter, not a local varioble, like is the case here. This means th=
at=20
>>> the
>>> proposed change introduces inconsistency between two functions, there=
fore
>>> it is better to remove the initialization of "val" to 0, than to remo=
ve
>>> this line in "default" section.
>>=20
>> Oh, actually I think the warning was for that statement not for the on=
e=20
>> patched as it makes more sense there where val is assigned in void=20
>> sii3112_reg_write() where it's indeed not used so maybe that was meant=
 to=20
>> be patched instead?
>
> Ah, the warning is for hw/ide/sii3112.c:204 but I incorrectly patched=20
> hw/ide/sii3112.c:128 =3D)

Now you may patch both to replace val =3D 0 with break to keep symmetry. =
My=20
Reviewed-by stands (even if apparently not much use). Thanks for=20
Aleksandar for spotting it.

Regards,
BALATON Zoltan
--3866299591-1442607649-1584800420=:82121--

