Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jFf57-0002cL-Ra
	for mharc-qemu-trivial@gnu.org; Sat, 21 Mar 2020 10:26:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57296)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jFf54-0002Y1-Mh
 for qemu-trivial@nongnu.org; Sat, 21 Mar 2020 10:26:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jFf53-00085e-N6
 for qemu-trivial@nongnu.org; Sat, 21 Mar 2020 10:26:30 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:53458)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jFf53-00085Q-K4
 for qemu-trivial@nongnu.org; Sat, 21 Mar 2020 10:26:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584800789;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8Z4ixueJjJ4ubeAjWuW5nAjaqvlbdw9Nl7/+fHva+CU=;
 b=QkCbqBBAWISecS7H5nXL+ODpzuQJSm5ge1dREd9/URz4BMOL5nFQ3bdCg5XVZsAFnoWZxU
 5tVUPMGSOqIWkBDwts17Uc6v6A+XHFN4VvH2W00QrvVQ4HP3dFtFKK63Y/ASS6GFScYPhK
 OmArjAX7MVYl+2Xv03LQcJZjzdCWv5E=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-198-JMRyr6dXPVO4jiSm8QIP-g-1; Sat, 21 Mar 2020 10:26:25 -0400
X-MC-Unique: JMRyr6dXPVO4jiSm8QIP-g-1
Received: by mail-ed1-f70.google.com with SMTP id t1so6898548edv.2
 for <qemu-trivial@nongnu.org>; Sat, 21 Mar 2020 07:26:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8fXzrylgCR5TsnuGN9CDtaZ0d54miYJjDG0GGxm3NPM=;
 b=HlVtIjSFBVM7p72Pv4/cbhV0M9a1HiVSyn2vkmLEfqwq/oM9ELMZFHNJBUqXWLJS9y
 f1naqIIxtsgtvlEKuuj4C0ZAhsH6P56n22xdvcY2Y/k1ZAdJ03edbFSiPAChdFjgOtAH
 JqYo2ZpD6E7yEctxwn6PdRsi3xWdx8QP1y52TwhZB9y0VGGci3R9do/llaH317sDvtA2
 /QnWcMUWBiqyynw4aiF5e6d9jUsgCGys22O2HCTKSaBDFxlhTUN60TKQmy/FrDyNXIJf
 duDOH7fcARXOECPLwNBKckVG6BxhT+IfUSFYfp6fVcOw+bIJPn0/B471AEULcl/FSKQ8
 IDOA==
X-Gm-Message-State: ANhLgQ20EsqOy2zINbnonuGXYlSaRaJMs5k2Wda6BmX5/44uBxSR5rHq
 VBY/iA9HcyTcilJw3a4dpDOefaFkSGJVbHUl9BRdBeDnsDXIB1pWSLxinhyYQpdmO53O8C1J/3V
 FqlD2y02G0XenLQ3Edw==
X-Received: by 2002:a05:6402:14da:: with SMTP id
 f26mr7073502edx.96.1584800784458; 
 Sat, 21 Mar 2020 07:26:24 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvOjHNr3YDvQ1Nz9kZ8HTQvl+KMrHaw9aJwXFXslPTJtiGj+E5C1hcJrPqz8a8sAbtOS5MLcg==
X-Received: by 2002:a05:6402:14da:: with SMTP id
 f26mr7073462edx.96.1584800784104; 
 Sat, 21 Mar 2020 07:26:24 -0700 (PDT)
Received: from [192.168.1.35] (37.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.37])
 by smtp.gmail.com with ESMTPSA id e16sm563771ejx.53.2020.03.21.07.26.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 21 Mar 2020 07:26:23 -0700 (PDT)
Subject: Re: [PATCH-for-5.0 05/11] hw/ide/sii3112: Remove dead assignment
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, =?UTF-8?Q?C=c3=a9dric_Le_Goate?=
 =?UTF-8?Q?r?= <clg@kaod.org>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, Laurent Vivier <laurent@vivier.eu>,
 Max Reitz <mreitz@redhat.com>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20200321114615.5360-1-philmd@redhat.com>
 <20200321114615.5360-6-philmd@redhat.com>
 <CAL1e-=hQPwJ3XKrt4ip2S92ScjyjS63-A4REDeXzyiCt1Phx6A@mail.gmail.com>
 <02375897-b520-fefb-a141-c013d29bde28@redhat.com>
Message-ID: <7117b1dd-074b-04bf-61f5-da215faa0b7b@redhat.com>
Date: Sat, 21 Mar 2020 15:26:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <02375897-b520-fefb-a141-c013d29bde28@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 63.128.21.74
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
X-List-Received-Date: Sat, 21 Mar 2020 14:26:31 -0000

On 3/21/20 3:14 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> On 3/21/20 2:39 PM, Aleksandar Markovic wrote:
>>
>>
>> On Saturday, March 21, 2020, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.=
com=20
>> <mailto:philmd@redhat.com>> wrote:
>>
>> =C2=A0=C2=A0=C2=A0 Fix warning reported by Clang static code analyzer:
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 CC=C2=A0 =C2=A0 =C2=A0 hw/ide/sii=
3112.o
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 hw/ide/sii3112.c:204:9: warning: Value s=
tored to 'val' is never=20
>> read
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 val =3D 0;
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^=C2=A0 =C2=
=A0 =C2=A0~
>>
>> =C2=A0=C2=A0=C2=A0 Reported-by: Clang Static Analyzer
>> =C2=A0=C2=A0=C2=A0 Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@re=
dhat.com
>> =C2=A0=C2=A0=C2=A0 <mailto:philmd@redhat.com>>
>> =C2=A0=C2=A0=C2=A0 ---
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0hw/ide/sii3112.c | 2 +-
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A01 file changed, 1 insertion(+), 1 deletio=
n(-)
>>
>> =C2=A0=C2=A0=C2=A0 diff --git a/hw/ide/sii3112.c b/hw/ide/sii3112.c
>> =C2=A0=C2=A0=C2=A0 index 06605d7af2..36f1905ddb 100644
>> =C2=A0=C2=A0=C2=A0 --- a/hw/ide/sii3112.c
>> =C2=A0=C2=A0=C2=A0 +++ b/hw/ide/sii3112.c
>> =C2=A0=C2=A0=C2=A0 @@ -125,7 +125,7 @@ static uint64_t sii3112_reg_read(=
void *opaque,
>> =C2=A0=C2=A0=C2=A0 hwaddr addr,
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0val =3D (uint=
32_t)d->regs[1].sien << 16;
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0default:
>> =C2=A0=C2=A0=C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 val =3D 0;
>> =C2=A0=C2=A0=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
>>
>>
>> There is another function in the same file, having a similar switch=20
>> statement. There is no warning for that second tunction, since "val"=20
>> is its parameter, not a local varioble, like is the case here. This=20
>> means that the proposed change introduces inconsistency between two=20
>> functions, therefore it is better to remove the initialization of=20
>> "val" to 0, than to remove this line in "default" section.
>=20
> No clue why there is no warnings emitted for sii3112_reg_write()...
>=20
> Do you mind sending a patch?

Don't worry I'll follow up.

>=20
>>
>> Regards,
>> Aleksandar
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0}
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0trace_sii3112_read(size, ad=
dr, val);
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0return val;
>> =C2=A0=C2=A0=C2=A0 -- =C2=A0=C2=A0=C2=A0 2.21.1
>>
>>


