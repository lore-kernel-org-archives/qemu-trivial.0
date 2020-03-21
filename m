Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jFevJ-0005q0-Pr
	for mharc-qemu-trivial@gnu.org; Sat, 21 Mar 2020 10:16:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55691)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jFevG-0005mK-Qn
 for qemu-trivial@nongnu.org; Sat, 21 Mar 2020 10:16:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jFevF-0001qL-MC
 for qemu-trivial@nongnu.org; Sat, 21 Mar 2020 10:16:22 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:37914)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jFevF-0001q5-IO
 for qemu-trivial@nongnu.org; Sat, 21 Mar 2020 10:16:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584800181;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=njLK0rH8vHGOJ+Mc5dURjJtNNPmhW6cJ2g/UU+Cj9/A=;
 b=C7YW9uqJWhwPDHpN2U5ECYrENBVNdudRInTWBP3XoRWfHqgZ5YSegigvSuc42rX8B/YxXE
 DpZx9stj5LE42ifUtoN8NGFGW/Qaq5IOvSFuuxa2UN5Nu24Lj8p+lBb6AnKDqhQeedfviK
 SJ839bqFIlXGuZn1D7xvXf28F1naLJE=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-371-Zdyd3fKTMiuDUBSj4vZpqw-1; Sat, 21 Mar 2020 10:16:18 -0400
X-MC-Unique: Zdyd3fKTMiuDUBSj4vZpqw-1
Received: by mail-ed1-f70.google.com with SMTP id l8so7569680edq.1
 for <qemu-trivial@nongnu.org>; Sat, 21 Mar 2020 07:16:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=B2w5aB3KtXWGYrfsxcpbGSy7pJ3V05lyzlzVysm9X/g=;
 b=kOWhNMy80vLc4BMN7arBMAeV6i9ppoLgNOOqlv1dlCtemRZUTRNDoGdXiRBGsAoNLq
 1T9qcXZ0VwU8JstRCERamANBmtq3Kfoq2ipp9+CMJl2C/+S/NmGx12yiQpbR1CGpRJDt
 l6pnixSwEiRldwr5GFqVjQT0CwgWEma4PkxHzf65eaZ7qJmksIk27iKNnKCRUa1QALvv
 maeDHVurWamZmSXbsipIPmDc8pY2RG4oD3n6wI8qqfO+NHE9b4eULkcjCbbgjhwqsmr1
 kF/g2P0NCD1E4YAugf4ifsl6yzyHfZ/M4p9L6jHDoY3ln7AMwxEAXMEwvg0sOzgwgd4T
 sE5w==
X-Gm-Message-State: ANhLgQ01ddbr1zXdmat18Th6ns95hDsZUIKC7Ls1VfEPuyxu+fpKKCi8
 SGBqnJDMF4DWZLs9HiS1uUFUw90mqP8fXH0JWOSD8gdAtwbyqFyFQT8SW5c4UyEPF7haFUrCPrj
 ejtzYmJLQYcbLa2oxug==
X-Received: by 2002:a17:906:3410:: with SMTP id
 c16mr6339279ejb.304.1584800177723; 
 Sat, 21 Mar 2020 07:16:17 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vs7wM6NYFhNp5nbMUbePHaYyce1N+nccLLUOaxTv3YzytYk+/XBYJxJA5MufqLFdRratLttxw==
X-Received: by 2002:a17:906:3410:: with SMTP id
 c16mr6339251ejb.304.1584800177404; 
 Sat, 21 Mar 2020 07:16:17 -0700 (PDT)
Received: from [192.168.1.35] (37.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.37])
 by smtp.gmail.com with ESMTPSA id l19sm575026ejn.31.2020.03.21.07.16.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 21 Mar 2020 07:16:16 -0700 (PDT)
Subject: Re: [PATCH-for-5.0 05/11] hw/ide/sii3112: Remove dead assignment
To: BALATON Zoltan <balaton@eik.bme.hu>,
 Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, Michael Tokarev <mjt@tls.msk.ru>,
 Alistair Francis <alistair@alistair23.me>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, =?UTF-8?Q?C=c3=a9dric_Le_Goate?=
 =?UTF-8?Q?r?= <clg@kaod.org>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Max Reitz <mreitz@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, "qemu-ppc@nongnu.org"
 <qemu-ppc@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
References: <20200321114615.5360-1-philmd@redhat.com>
 <20200321114615.5360-6-philmd@redhat.com>
 <CAL1e-=hQPwJ3XKrt4ip2S92ScjyjS63-A4REDeXzyiCt1Phx6A@mail.gmail.com>
 <alpine.BSF.2.22.395.2003211511170.82121@zero.eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <11fc4c44-fb8c-9698-e59f-5592b7d8efea@redhat.com>
Date: Sat, 21 Mar 2020 15:16:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <alpine.BSF.2.22.395.2003211511170.82121@zero.eik.bme.hu>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 216.205.24.74
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
X-List-Received-Date: Sat, 21 Mar 2020 14:16:24 -0000

On 3/21/20 3:12 PM, BALATON Zoltan wrote:
> On Sat, 21 Mar 2020, Aleksandar Markovic wrote:
>> On Saturday, March 21, 2020, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.=
com>
>> wrote:
>>
>>> Fix warning reported by Clang static code analyzer:
>>>
>>> =C2=A0=C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hw/ide/sii3112.o
>>> =C2=A0 hw/ide/sii3112.c:204:9: warning: Value stored to 'val' is never =
read
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val =3D 0;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^=C2=A0=C2=A0=C2=
=A0=C2=A0 ~
>>>
>>> Reported-by: Clang Static Analyzer
>>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>>> ---
>>> =C2=A0hw/ide/sii3112.c | 2 +-
>>> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/hw/ide/sii3112.c b/hw/ide/sii3112.c
>>> index 06605d7af2..36f1905ddb 100644
>>> --- a/hw/ide/sii3112.c
>>> +++ b/hw/ide/sii3112.c
>>> @@ -125,7 +125,7 @@ static uint64_t sii3112_reg_read(void *opaque,=20
>>> hwaddr
>>> addr,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val =3D (uint32_t)d->r=
egs[1].sien << 16;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>> =C2=A0=C2=A0=C2=A0=C2=A0 default:
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val =3D 0;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>
>>
>> There is another function in the same file, having a similar switch
>> statement. There is no warning for that second tunction, since "val"=20
>> is its
>> parameter, not a local varioble, like is the case here. This means=20
>> that the
>> proposed change introduces inconsistency between two functions, therefor=
e
>> it is better to remove the initialization of "val" to 0, than to remove
>> this line in "default" section.
>=20
> Oh, actually I think the warning was for that statement not for the one=
=20
> patched as it makes more sense there where val is assigned in void=20
> sii3112_reg_write() where it's indeed not used so maybe that was meant=20
> to be patched instead?

Ah, the warning is for hw/ide/sii3112.c:204 but I incorrectly patched=20
hw/ide/sii3112.c:128 =3D)

>=20
> Regards,
> BALATON Zoltan


