Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jFfnH-0004RF-GL
	for mharc-qemu-trivial@gnu.org; Sat, 21 Mar 2020 11:12:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36754)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <balaton@eik.bme.hu>) id 1jFfnF-0004Mp-8j
 for qemu-trivial@nongnu.org; Sat, 21 Mar 2020 11:12:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <balaton@eik.bme.hu>) id 1jFfnE-0001Gl-8f
 for qemu-trivial@nongnu.org; Sat, 21 Mar 2020 11:12:09 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:52287)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <balaton@eik.bme.hu>)
 id 1jFfn3-0001BP-VL; Sat, 21 Mar 2020 11:11:58 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 142A3747DCF;
 Sat, 21 Mar 2020 16:11:56 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id E38E6747DF8; Sat, 21 Mar 2020 16:11:55 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id DE5A3747871;
 Sat, 21 Mar 2020 16:11:55 +0100 (CET)
Date: Sat, 21 Mar 2020 16:11:55 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
cc: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>, 
 Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>, 
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org, 
 qemu-block@nongnu.org, qemu-trivial@nongnu.org, 
 Markus Armbruster <armbru@redhat.com>, 
 =?ISO-8859-15?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>, 
 Joel Stanley <joel@jms.id.au>, Michael Tokarev <mjt@tls.msk.ru>, 
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org, 
 =?ISO-8859-15?Q?C=E9dric_Le_Goater?= <clg@kaod.org>, 
 John Snow <jsnow@redhat.com>, David Gibson <david@gibson.dropbear.id.au>, 
 Kevin Wolf <kwolf@redhat.com>, Igor Mitsyanko <i.mitsyanko@gmail.com>, 
 Max Reitz <mreitz@redhat.com>, Andrew Jeffery <andrew@aj.id.au>, 
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH-for-5.0 01/11] block: Remove dead assignment
In-Reply-To: <CAHiYmc5gpHCUfc5bPMs8Qa7NETYkkj8rfV5dTyqZF4ZQTeNa8Q@mail.gmail.com>
Message-ID: <alpine.BSF.2.22.395.2003211608170.82121@zero.eik.bme.hu>
References: <20200321114615.5360-1-philmd@redhat.com>
 <20200321114615.5360-2-philmd@redhat.com>
 <CAHiYmc5gpHCUfc5bPMs8Qa7NETYkkj8rfV5dTyqZF4ZQTeNa8Q@mail.gmail.com>
User-Agent: Alpine 2.22 (BSF 395 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1870441923-1584803515=:82121"
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 152.66.115.2
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
X-List-Received-Date: Sat, 21 Mar 2020 15:12:10 -0000

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1870441923-1584803515=:82121
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On Sat, 21 Mar 2020, Aleksandar Markovic wrote:
> 12:49 PM Sub, 21.03.2020. Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> =D1=98=D0=B5
> =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BE/=D0=BB=D0=B0:
>>
>> Fix warning reported by Clang static code analyzer:
>>
>>   block.c:3167:5: warning: Value stored to 'ret' is never read
>>       ret =3D bdrv_fill_options(&options, filename, &flags, &local_err=
);
>>       ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>
>> Reported-by: Clang Static Analyzer
>
> Peter, and others,
>
> Is this allowed use of "Reported-by:" mark?
>
> I did not notice it being used this way before. And was under impressio=
n
> that all similar tags/marks must be followed by a person, not a tool.

I think there were previous patches with Reported-by: Euler Robot which=20
may be similar to this usage.

Regards,
BALATON Zoltan

>
> Regards,
> Aleksandar
>
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>> ---
>>  block.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/block.c b/block.c
>> index a2542c977b..908c109a8c 100644
>> --- a/block.c
>> +++ b/block.c
>> @@ -3164,7 +3164,7 @@ static BlockDriverState *bdrv_open_inherit(const
> char *filename,
>>                                      parent->open_flags, parent->optio=
ns);
>>      }
>>
>> -    ret =3D bdrv_fill_options(&options, filename, &flags, &local_err)=
;
>> +    bdrv_fill_options(&options, filename, &flags, &local_err);
>>      if (local_err) {
>>          goto fail;
>>      }
>> --
>> 2.21.1
>>
>>
>
--3866299591-1870441923-1584803515=:82121--

