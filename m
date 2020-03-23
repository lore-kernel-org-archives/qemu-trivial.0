Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jGOZp-00010C-51
	for mharc-qemu-trivial@gnu.org; Mon, 23 Mar 2020 11:01:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46700)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jGOZl-0000x3-8p
 for qemu-trivial@nongnu.org; Mon, 23 Mar 2020 11:01:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jGOZi-0008FC-Qt
 for qemu-trivial@nongnu.org; Mon, 23 Mar 2020 11:01:13 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:50326)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jGOZi-0008Ee-Mg
 for qemu-trivial@nongnu.org; Mon, 23 Mar 2020 11:01:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584975670;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KKeE6h7tq0L0aScGIdzsCho9ssli9lSjPim6mqvxRxM=;
 b=BU0Cks8YwKGlShlnUNjqp9kULznZ4ESWV9Ft44YYNp1Q0fVLXHQXf6ZWCcooAAWj40mg49
 +EDqEJy0ofrmH/kHh/19wQb0653GB6dpKimAGCqmGJSNYXg6NgXV7ICRhs7dCinPiD0ifp
 E6m8iPhFB8GuYFx2RGTPgAbfZDjpTv4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-285-Jq6xVx5lPtyaYoGzQ6PtdA-1; Mon, 23 Mar 2020 11:01:08 -0400
X-MC-Unique: Jq6xVx5lPtyaYoGzQ6PtdA-1
Received: by mail-wr1-f71.google.com with SMTP id d17so7503031wrw.19
 for <qemu-trivial@nongnu.org>; Mon, 23 Mar 2020 08:01:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=B6se+74uq8IigJ1DNxLJ6QpeoObvmc8ZqUW9UUwi4Q0=;
 b=SUFySQia5yu2N3wLP6WxPYdeQW+4eVXxcPDMWxU7V/m5sXTpmizrgb1pmTW2kuOuLL
 fJ8+HqZcY9Imi6qnnXyvXoEoM2KJFpQPTc1w3IlaEZTqMa6yNlTrZLRURnTl1p0KjFve
 v9KzfqA01h21dmbQkdxYAcOXLEveLdsm2ex2bKQ0v7022Lp3O8lhZuW+clRvVlm0TyiA
 reUELPYimeqtuo3KQvqkflZeMYmAYxUwD0A2KtFVUo/Zmd8ifKGf304n2BOLVa1t1lHJ
 VnHbqf2//qXOcBCKdRdN9EKZb35SIjpsk7NXvRkxE2Y5Za2Wfg9MhfFUGmNHAU5/7gQF
 m9Aw==
X-Gm-Message-State: ANhLgQ1C68vxmoIKs64CKUl2OIPaQF9IvGJh0uAXu1+JSVyJfPThpwef
 +gWi+aBeaYAS2sNCbQrADkxJC/WgCICWu8kPgbzKeyiubOtGtiKRz7PhqjinRFkT8hUMtEpAG4x
 b7e1/iVS/jNmA4d1fNg==
X-Received: by 2002:adf:8187:: with SMTP id 7mr17180843wra.358.1584975667332; 
 Mon, 23 Mar 2020 08:01:07 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsqbZz7XS24jPIEitY/s+pboxe+xe1aAHnfRZBsn+CWsdJyJn151SubRHkXg56MfNDCQw9PTg==
X-Received: by 2002:adf:8187:: with SMTP id 7mr17180780wra.358.1584975666830; 
 Mon, 23 Mar 2020 08:01:06 -0700 (PDT)
Received: from [192.168.1.35] (37.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.37])
 by smtp.gmail.com with ESMTPSA id f14sm21834164wmb.3.2020.03.23.08.01.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Mar 2020 08:01:06 -0700 (PDT)
Subject: Re: [PATCH-for-5.0 v2 00/11] misc: Trivial static code analyzer fixes
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-ppc@nongnu.org,
 BALATON Zoltan <balaton@eik.bme.hu>, Markus Armbruster <armbru@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, Max Reitz <mreitz@redhat.com>,
 Andrzej Zaborowski <balrogg@gmail.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, Michael Tokarev <mjt@tls.msk.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Alistair Francis <alistair@alistair23.me>,
 Fam Zheng <fam@euphon.net>, =?UTF-8?Q?Herv=c3=a9_Poussineau?=
 <hpoussin@reactos.org>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 qemu-trivial@nongnu.org
References: <20200321144110.5010-1-philmd@redhat.com>
 <1c711740-6166-c730-ef67-d07511add1e6@vivier.eu>
 <262f8318-1590-1c48-f4de-a6482fdc3071@redhat.com>
 <10431e44-880a-cbec-c35e-1d425064c40b@vivier.eu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <1016a691-244d-9890-01bb-894e62414963@redhat.com>
Date: Mon, 23 Mar 2020 16:01:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <10431e44-880a-cbec-c35e-1d425064c40b@vivier.eu>
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
X-List-Received-Date: Mon, 23 Mar 2020 15:01:15 -0000

On 3/23/20 3:55 PM, Laurent Vivier wrote:
> Le 23/03/2020 =C3=A0 15:45, Philippe Mathieu-Daud=C3=A9 a =C3=A9crit=C2=
=A0:
>> On 3/23/20 3:32 PM, Laurent Vivier wrote:
>>> Le 21/03/2020 =C3=A0 15:40, Philippe Mathieu-Daud=C3=A9 a =C3=A9crit=C2=
=A0:
>>>> Fix trivial warnings reported by the Clang static code analyzer.
>>>>
>>>> Since v1:
>>>> - Addressed Markus/Zoltan/Aleksandar review comments
>>>>
>>>> Philippe Mathieu-Daud=C3=A9 (11):
>>>>  =C2=A0=C2=A0 block: Avoid dead assignment
>>>>  =C2=A0=C2=A0 blockdev: Remove dead assignment
>>>>  =C2=A0=C2=A0 hw/i2c/pm_smbus: Remove dead assignment
>>>>  =C2=A0=C2=A0 hw/input/adb-kbd: Remove dead assignment
>>>>  =C2=A0=C2=A0 hw/ide/sii3112: Remove dead assignment
>>>>  =C2=A0=C2=A0 hw/isa/i82378: Remove dead assignment
>>>>  =C2=A0=C2=A0 hw/gpio/aspeed_gpio: Remove dead assignment
>>>>  =C2=A0=C2=A0 hw/timer/exynos4210_mct: Remove dead assignments
>>>>  =C2=A0=C2=A0 hw/timer/stm32f2xx_timer: Remove dead assignment
>>>>  =C2=A0=C2=A0 hw/timer/pxa2xx_timer: Add assertion to silent static an=
alyzer
>>>> warning
>>>>  =C2=A0=C2=A0 hw/scsi/esp-pci: Remove dead assignment
>>>>
>>>>  =C2=A0 block.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
>>>>  =C2=A0 blockdev.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
>>>>  =C2=A0 hw/gpio/aspeed_gpio.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
>>>>  =C2=A0 hw/i2c/pm_smbus.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 1 -
>>>>  =C2=A0 hw/ide/sii3112.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 5 +++--
>>>>  =C2=A0 hw/input/adb-kbd.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 6 +-----
>>>>  =C2=A0 hw/isa/i82378.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 8 ++++----
>>>>  =C2=A0 hw/scsi/esp-pci.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 1 -
>>>>  =C2=A0 hw/timer/exynos4210_mct.c=C2=A0 | 3 ---
>>>>  =C2=A0 hw/timer/pxa2xx_timer.c=C2=A0=C2=A0=C2=A0 | 1 +
>>>>  =C2=A0 hw/timer/stm32f2xx_timer.c | 1 -
>>>>  =C2=A0 11 files changed, 12 insertions(+), 20 deletions(-)
>>>>
>>>
>>> I think your series covers cases already covered by:
>>>
>>> [PATCH v3 00/12] redundant code: Fix warnings reported by Clang static
>>> code analyzer
>>> https://patchew.org/QEMU/20200302130715.29440-1-kuhn.ch
>>
>> Unfortunately [for me...] I don't have v3 in my INBOX... *sigh*
>> This was 3 weeks ago. *sigh*.
>>
>> I can see the series in the archives:
>> https://lists.gnu.org/archive/html/qemu-devel/2020-03/msg00219.html
>> But I can't find the outcome, was it queued in the trivial tree?
>> Any idea when this will be merged in the master tree?
>=20
> Some patches are already merged via trivial (1, 2 (should go by SCSI
> queue) 3, 5, 6, 7, 9, 11 (by USB queue), 12).
>=20
> But others needed R-b tags or new version. I didn't check which of your
> patches are already covered by this series.
>=20
> I'm sorry to not have checked your series earlier...

Don't be sorry, the problem is my INBOX that is unreliable.

I was using NNTP last month until I heard it was working properly again,=20
which is not the case apparently. I'll try to find them on NNTP and=20
review them.

>=20
> Thanks,
> Laurent
>=20


