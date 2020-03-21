Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jFerF-00010i-Pb
	for mharc-qemu-trivial@gnu.org; Sat, 21 Mar 2020 10:12:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54669)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jFerC-0000yg-SM
 for qemu-trivial@nongnu.org; Sat, 21 Mar 2020 10:12:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jFerB-0005KD-Bt
 for qemu-trivial@nongnu.org; Sat, 21 Mar 2020 10:12:10 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:31471)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jFerB-0005Ix-3v
 for qemu-trivial@nongnu.org; Sat, 21 Mar 2020 10:12:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584799927;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vdctJkNr5flfamIlFadkGaxBCJU9nr8W/MsX0dp2l2I=;
 b=AQYd09d+SlEur792/nXQOFU1UqEqmJxtpN1kckTBulq2PscUQOfRR4Acog+ldFmF4JQnBC
 +3fqym3yUvGjdLPLtNjmE4f46iTY4vEbaX9MzROp//m1nSyOzXmUK3DHxPF0AzAkm9PrO7
 /qCUU73OxY4Hve04Mg5nEz5p4I+xi00=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-446-_RqRCv9OMFGNryY8nH17cQ-1; Sat, 21 Mar 2020 10:12:05 -0400
X-MC-Unique: _RqRCv9OMFGNryY8nH17cQ-1
Received: by mail-ed1-f69.google.com with SMTP id m24so7556412edq.8
 for <qemu-trivial@nongnu.org>; Sat, 21 Mar 2020 07:12:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5YTr7B8Vhgph7+l62ANtSEn/6x+hhNiv2LZGdPA8a70=;
 b=FjCYP91MTTYrFOph3l+3XwqT6Z9kgP8Q4zkEpLLizEg8WqC1+oAzzpdKGruL1FYJCH
 lRkF7NnqtMA0IyOvanM+17iwYACT43SRH1JVFsrxTiY1izu3Vgp1ElOSyv1nCJgZPoYE
 C4snAPB0fUIOayhflCPlyeW+OBJQn37m4GKLrjj1qdcI14MzitMlD2Z66TbwZpiGms0/
 yPcD4Nt7ieQ3i3UX0UHL2EX6mh8ehnwvp25u0pvJVJFt0Femjb14M/qGsHTovkXAOL3F
 qgNlDnhqqzyTP33h8NhlhDT5mBfSC1uqKvSBP4N5x/n1h6de6Gl629w+0kL1OsCWADzw
 TDFg==
X-Gm-Message-State: ANhLgQ3BtZlz0wrirf7nL6wR04zGmeEg85i24S5ERUWgCrSQks14AonG
 nEZzTmrZibQZ7Hj92zOF1AERh+KoXDKGQYPswL1UTCmGjdjLhlDcHvwYIQLhxZJYsY/B9TK4X9g
 0J3lE+cF6KepqAbQW/Q==
X-Received: by 2002:a17:906:c835:: with SMTP id
 dd21mr12788922ejb.140.1584799924262; 
 Sat, 21 Mar 2020 07:12:04 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vswvkINXM0tFJgCuBXez3xd6Rkdtm0y9xcA9GO2JYtSqgDsa1eOwjCFZ/2m9CnVXgMc2rEQ2A==
X-Received: by 2002:a17:906:c835:: with SMTP id
 dd21mr12788886ejb.140.1584799923899; 
 Sat, 21 Mar 2020 07:12:03 -0700 (PDT)
Received: from [192.168.1.35] (37.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.37])
 by smtp.gmail.com with ESMTPSA id oz27sm579169ejb.13.2020.03.21.07.12.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 21 Mar 2020 07:12:02 -0700 (PDT)
Subject: Re: [PATCH-for-5.0 07/11] hw/gpio/aspeed_gpio: Remove dead assignment
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-devel@nongnu.org, Fam Zheng <fam@euphon.net>,
 Peter Maydell <peter.maydell@linaro.org>, "Michael S. Tsirkin"
 <mst@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>, qemu-block@nongnu.org,
 qemu-trivial@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, Andrzej Zaborowski <balrogg@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 John Snow <jsnow@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Kevin Wolf <kwolf@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 Max Reitz <mreitz@redhat.com>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20200321114615.5360-1-philmd@redhat.com>
 <20200321114615.5360-8-philmd@redhat.com>
 <alpine.BSF.2.22.395.2003211420450.82121@zero.eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <41f0d6a5-8699-e272-4832-fc1fce2e019e@redhat.com>
Date: Sat, 21 Mar 2020 15:12:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <alpine.BSF.2.22.395.2003211420450.82121@zero.eik.bme.hu>
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
X-List-Received-Date: Sat, 21 Mar 2020 14:12:12 -0000

On 3/21/20 2:22 PM, BALATON Zoltan wrote:
> On Sat, 21 Mar 2020, Philippe Mathieu-Daud=C3=A9 wrote:
>> Fix warning reported by Clang static code analyzer:
>>
>> =C2=A0hw/gpio/aspeed_gpio.c:717:18: warning: Value stored to 'g_idx' dur=
ing=20
>> its initialization is never read
>> =C2=A0=C2=A0=C2=A0=C2=A0 int set_idx, g_idx =3D *group_idx;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~=C2=A0=C2=A0 ~~~~~~~~~~
>>
>> Reported-by: Clang Static Analyzer
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>> ---
>> hw/gpio/aspeed_gpio.c | 4 ++--
>> 1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/gpio/aspeed_gpio.c b/hw/gpio/aspeed_gpio.c
>> index 41e11ea9b0..cc07ab9866 100644
>> --- a/hw/gpio/aspeed_gpio.c
>> +++ b/hw/gpio/aspeed_gpio.c
>> @@ -714,11 +714,11 @@ static void aspeed_gpio_write(void *opaque,=20
>> hwaddr offset, uint64_t data,
>> static int get_set_idx(AspeedGPIOState *s, const char *group, int=20
>> *group_idx)
>> {
>> =C2=A0=C2=A0=C2=A0 AspeedGPIOClass *agc =3D ASPEED_GPIO_GET_CLASS(s);
>> -=C2=A0=C2=A0=C2=A0 int set_idx, g_idx =3D *group_idx;
>> +=C2=A0=C2=A0=C2=A0 int set_idx;
>>
>> =C2=A0=C2=A0=C2=A0 for (set_idx =3D 0; set_idx < agc->nr_gpio_sets; set_=
idx++) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const GPIOSetProperties *set_=
props =3D &agc->props[set_idx];
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (g_idx =3D 0; g_idx < AS=
PEED_GROUPS_PER_SET; g_idx++) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (int g_idx =3D 0; g_idx =
< ASPEED_GROUPS_PER_SET; g_idx++) {
>=20
> Is declaring variables here allowed by coding style? Shouldn't you only=
=20
> remove init value from above?

You are right, it is not (yet?) allowed by QEMU coding style.

>=20
> Regards,
> BALATON Zoltan
>=20
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!=
strncmp(group, set_props->group_label[g_idx],=20
>> strlen(group))) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 *group_idx =3D g_idx;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 return set_idx;
>>


