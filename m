Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iWnnu-0005ys-3n
	for mharc-qemu-trivial@gnu.org; Mon, 18 Nov 2019 15:39:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58016)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iWnnq-0005sW-SU
 for qemu-trivial@nongnu.org; Mon, 18 Nov 2019 15:39:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iWnno-00046N-Fy
 for qemu-trivial@nongnu.org; Mon, 18 Nov 2019 15:39:17 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:44003
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iWnno-00042N-CH
 for qemu-trivial@nongnu.org; Mon, 18 Nov 2019 15:39:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574109555;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C+UnvLb2il2q4qfOGiJWyz8kIdvyXQUj7C8Hq862OOs=;
 b=QnbHczJ8X+Qy3WBNieGG+4A1VG5FGxTzIlwced6c+IPBF+OBe8aWSeZ+CLANhm3K4XFWIO
 myPSQnTnzzVWW2raRAwYJW/s8dNE2T21MLdlPkzpsiSeOPXKmOvSPN9AMPiwmRAGQj1o8v
 ohmnyU4Y3Gss1F+XaOAd/PnpOMCagPU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-401-lSYLLby2Mny6IA3D0kfncg-1; Mon, 18 Nov 2019 15:39:13 -0500
Received: by mail-wr1-f71.google.com with SMTP id e3so16437496wrs.17
 for <qemu-trivial@nongnu.org>; Mon, 18 Nov 2019 12:39:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JlPKUZeit3/7iGUBOkANZ4DyJEBGwGomS/W11dX1ClY=;
 b=qk71fmppYuBRlyQXpztt7m3RXmlKCB3Wn8h+Rg3VztSMG5JTFTuluaiXPENdbAiuAv
 c/Q6wD3PN3Gp2l07m3yuNBa1zUIE3OV+2YPi+IMx+h9oEQhRvFeSV/AZDAB5ShTGLB2u
 QNbM+NnlSZR3lrxYRMIxAQK/hdQ/pFK5+mNEv20A+/CsaZMa/Fqn6Ifg9QPoWe2gxZBB
 A4oiM3hHNiuGcXiSEu0Ldt/R/2CGwohKjzvNc72EjrwP8mXuXBoSOGXj98ZFXcjUTZU2
 Usitn0eJmrT9H9Bm0D712Ml0jMgZyWHXcdyBUySEFngV515QHKSsXI27hWnkuVZCauup
 Ly1w==
X-Gm-Message-State: APjAAAU18lo+cIu8nENtqximQZwZmzF3nrIpVttlgv+GlfE9jQwEsYQ0
 QdoQdrqUwMP6gaUAfM4nj+kHXUEXdChzUIp5P1/N7utydFBP+77kPWMqT7RU7AiIbPYZkf0YSAm
 unGEjcGY33RDbpFimsA==
X-Received: by 2002:adf:cf0c:: with SMTP id o12mr32236207wrj.102.1574109552175; 
 Mon, 18 Nov 2019 12:39:12 -0800 (PST)
X-Google-Smtp-Source: APXvYqyBAgR/aI9DkqytiLhsCB8azewoBq5yjClsgLkT2gPx+aP/Zqa81nrrhVHe+XdzzPwMMffQKg==
X-Received: by 2002:adf:cf0c:: with SMTP id o12mr32236171wrj.102.1574109551886; 
 Mon, 18 Nov 2019 12:39:11 -0800 (PST)
Received: from [192.168.1.35] (131.red-88-21-102.staticip.rima-tde.net.
 [88.21.102.131])
 by smtp.gmail.com with ESMTPSA id 19sm27717933wrc.47.2019.11.18.12.39.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Nov 2019 12:39:10 -0800 (PST)
Subject: Re: [PATCH v2 1/3] hw/block/pflash: Remove dynamic field width from
 trace events
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Cc: Max Reitz <mreitz@redhat.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>, qemu-block@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-trivial@nongnu.org
References: <20191108144042.30245-1-philmd@redhat.com>
 <20191108144042.30245-2-philmd@redhat.com>
 <9e7990b7-87ed-84d4-5256-8397bc25a1f4@redhat.com>
 <dd59a9d2-d5c8-b054-191b-bbbfd9d7b7b1@redhat.com>
 <159b1679-72cf-bb0d-ca2f-0f626adebaf3@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <6923dbfc-7171-eaa6-e7f3-db560a8b1857@redhat.com>
Date: Mon, 18 Nov 2019 21:39:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <159b1679-72cf-bb0d-ca2f-0f626adebaf3@redhat.com>
Content-Language: en-US
X-MC-Unique: lSYLLby2Mny6IA3D0kfncg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
X-List-Received-Date: Mon, 18 Nov 2019 20:39:20 -0000

On 11/18/19 8:21 PM, Eric Blake wrote:
> On 11/14/19 3:26 PM, Philippe Mathieu-Daud=C3=A9 wrote:
>=20
>>>> -=C2=A0=C2=A0=C2=A0 trace_pflash_data_read(offset, width << 1, ret);
>>>> +=C2=A0=C2=A0=C2=A0 trace_pflash_data_read(offset, width << 3, ret);
>>>
>>> Umm, why is width changing?=C2=A0 That's not mentioned in the commit me=
ssage.
>>
>> Previously it was used to set the format width: [1, 2, 4] -> [2, 4, 8].
>>
>> We usually log the width in byte (accessed at memory location) or bits=
=20
>> (used by the bus). When using this device I'm custom to think in bus=20
>> access width.
>>
>> Regardless whichever format we prefer, a change is needed.
>>
>=20
>>
>> Do you prefer using a "-bit" suffix? As
>>
>> "offset:0x%04"PRIx64" width:%d-bit value:0x%04x cmd:0x%02x wcycle:%u"
>>
>> I can also simply remove this information. Ideally I'd revert this=20
>> patch once the we get this format parsable by the SystemTap backend.
>=20
> Reporting either 'width:8-bit'/'width:16-bit' (explicit bits) or=20
> 'width:1'/'width:2' (implying byte) is fine by me.=C2=A0 Showing a bus wi=
dth=20
> in bytes adequately explains why you are using <<3 (aka converting bits=
=20
> to bytes), and how it compares to the previous <<1 (converting bits to=20
> number of hex characters).=C2=A0 But whichever you pick (tracing bit widt=
h=20
> vs. byte width, and how it differs from previous usage of width as=20
> output-character count), documenting it in the commit message will make=
=20
> life easier to understand the change.

Yes you are right, I should have documented to avoid wasting review time=20
clearing the confusion.


