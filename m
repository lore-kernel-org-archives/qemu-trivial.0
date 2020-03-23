Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jGOLA-0005wD-AU
	for mharc-qemu-trivial@gnu.org; Mon, 23 Mar 2020 10:46:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43214)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jGOL6-0005tY-Tw
 for qemu-trivial@nongnu.org; Mon, 23 Mar 2020 10:46:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jGOL5-0001Ab-Gi
 for qemu-trivial@nongnu.org; Mon, 23 Mar 2020 10:46:04 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:42517)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jGOL5-0001AP-Bh
 for qemu-trivial@nongnu.org; Mon, 23 Mar 2020 10:46:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584974763;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8rbiNVhEwOTNTE5kCQAB4GuD6vGvYD7Ldckz1YJB6Cc=;
 b=DGnrMSQ79eAW3nk/IAVgMVpJkr4WY/iOAZcLTlXWuszDEupeuoTH/ezstpxArFkQl9C8H0
 5HbUvt45qTpAidranEBqvOoafjGHyqKhjRkBETdGISfHilG+3/cVyc+KstnDqwG/9oDNoY
 OA8PfVnfKTjX+4V+iPnUXW8lLtjo6NM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-445-OW4-ae4iNMOj08SF1FAT9w-1; Mon, 23 Mar 2020 10:45:58 -0400
X-MC-Unique: OW4-ae4iNMOj08SF1FAT9w-1
Received: by mail-wm1-f71.google.com with SMTP id m4so3642569wmi.5
 for <qemu-trivial@nongnu.org>; Mon, 23 Mar 2020 07:45:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=V2ANNl8/EtbHEsvrQEItRdzFbI+QSLZWoQl4H0q+yj8=;
 b=JvN6Tls/k/EMTQLx9i0fb77aI+/V2573x48ji6I9KQwWx89PPd5u7JKDjePpjh2uou
 UpEMCFz9bidBeyUkMVa+RycrjMW6QL/B6y1swaypTUeruUrMVMvz3pZHomDmQYwN1vzY
 kzZP9j3yNu9WyzJrSFl7gESKDkQgQvI9YJyEkbUf+oja4CJdgAksLutxIv1rN4e4q9K1
 3kK/CDox6kR8zbkoeWxl/+ZpSjyRk5G84+oO4NySiI7iQPJ433xAdGW+dZzIeaNPhu2k
 PXFHEWU9JztkUhh5Qt8fPcZa4eJ7LZq0yquN4Np4dE5up6dS0yww4ULg5ppSJpkDgIOM
 7mdQ==
X-Gm-Message-State: ANhLgQ1l+bEza+8XfauVCtd22Ll9v5+g2mpNADF1CoRTIjpz1epthT2j
 4aL59Vo883xcUv0fWErpgA5eEvt9ER1BXS69nDzEzFr5cMh5HETtz9l54/GFb7YD6DQd5rFGWzT
 pZgVG3hQpe1wnVC3r7g==
X-Received: by 2002:a1c:4c19:: with SMTP id z25mr3837589wmf.46.1584974757416; 
 Mon, 23 Mar 2020 07:45:57 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsmMyws088pfHXqIv0W5NO5iVC88qGt3tp/WqmTR6UgKsOiFeVz1tOPDxjslsxdjPCaHAb9HA==
X-Received: by 2002:a1c:4c19:: with SMTP id z25mr3837522wmf.46.1584974756932; 
 Mon, 23 Mar 2020 07:45:56 -0700 (PDT)
Received: from [192.168.1.35] (37.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.37])
 by smtp.gmail.com with ESMTPSA id k84sm22270879wmk.2.2020.03.23.07.45.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Mar 2020 07:45:56 -0700 (PDT)
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
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <262f8318-1590-1c48-f4de-a6482fdc3071@redhat.com>
Date: Mon, 23 Mar 2020 15:45:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1c711740-6166-c730-ef67-d07511add1e6@vivier.eu>
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
X-List-Received-Date: Mon, 23 Mar 2020 14:46:06 -0000

On 3/23/20 3:32 PM, Laurent Vivier wrote:
> Le 21/03/2020 =C3=A0 15:40, Philippe Mathieu-Daud=C3=A9 a =C3=A9crit=C2=
=A0:
>> Fix trivial warnings reported by the Clang static code analyzer.
>>
>> Since v1:
>> - Addressed Markus/Zoltan/Aleksandar review comments
>>
>> Philippe Mathieu-Daud=C3=A9 (11):
>>    block: Avoid dead assignment
>>    blockdev: Remove dead assignment
>>    hw/i2c/pm_smbus: Remove dead assignment
>>    hw/input/adb-kbd: Remove dead assignment
>>    hw/ide/sii3112: Remove dead assignment
>>    hw/isa/i82378: Remove dead assignment
>>    hw/gpio/aspeed_gpio: Remove dead assignment
>>    hw/timer/exynos4210_mct: Remove dead assignments
>>    hw/timer/stm32f2xx_timer: Remove dead assignment
>>    hw/timer/pxa2xx_timer: Add assertion to silent static analyzer warnin=
g
>>    hw/scsi/esp-pci: Remove dead assignment
>>
>>   block.c                    | 2 +-
>>   blockdev.c                 | 2 +-
>>   hw/gpio/aspeed_gpio.c      | 2 +-
>>   hw/i2c/pm_smbus.c          | 1 -
>>   hw/ide/sii3112.c           | 5 +++--
>>   hw/input/adb-kbd.c         | 6 +-----
>>   hw/isa/i82378.c            | 8 ++++----
>>   hw/scsi/esp-pci.c          | 1 -
>>   hw/timer/exynos4210_mct.c  | 3 ---
>>   hw/timer/pxa2xx_timer.c    | 1 +
>>   hw/timer/stm32f2xx_timer.c | 1 -
>>   11 files changed, 12 insertions(+), 20 deletions(-)
>>
>=20
> I think your series covers cases already covered by:
>=20
> [PATCH v3 00/12] redundant code: Fix warnings reported by Clang static
> code analyzer
> https://patchew.org/QEMU/20200302130715.29440-1-kuhn.ch

Unfortunately [for me...] I don't have v3 in my INBOX... *sigh*
This was 3 weeks ago. *sigh*.

I can see the series in the archives:
https://lists.gnu.org/archive/html/qemu-devel/2020-03/msg00219.html
But I can't find the outcome, was it queued in the trivial tree?
Any idea when this will be merged in the master tree?

What a waste of time...

>=20
> Thanks,
> Laurent
>=20


