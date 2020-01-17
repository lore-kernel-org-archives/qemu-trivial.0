Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1isUuN-0005El-DK
	for mharc-qemu-trivial@gnu.org; Fri, 17 Jan 2020 11:55:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49067)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1isUuI-0005BY-DW
 for qemu-trivial@nongnu.org; Fri, 17 Jan 2020 11:55:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1isUuE-0004m5-RF
 for qemu-trivial@nongnu.org; Fri, 17 Jan 2020 11:55:38 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:57980
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1isUuE-0004le-OD
 for qemu-trivial@nongnu.org; Fri, 17 Jan 2020 11:55:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579280134;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Nd0bXqos5it2fsYYHTou3mK1Mjt3pFhpidQ/WPuFGaA=;
 b=ME6EE6EO5xlJNhV+k1YZQPP+wkLCeSySaHXylqTFQpowFrzY6XLutodDUX0MGbKbidzZna
 3rIPnWmknKwquly1mexefAJzWkKj3g209aMPGjF6mmAD4vjGi2oTk2JXAuN79ZUCvOWXv4
 J4k2PUCbbMww4p50yDdtJhg4SwbUlHo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-23-heLEcz-tOG20pGX-a5iHww-1; Fri, 17 Jan 2020 11:55:32 -0500
Received: by mail-wr1-f69.google.com with SMTP id t3so10666087wrm.23
 for <qemu-trivial@nongnu.org>; Fri, 17 Jan 2020 08:55:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fyzRTIOREV58jx4vZ8G3KluoMzSIgrPRzuLoPsJGsrM=;
 b=FP3gFzHAqyjCrR5W66XoUlvQY6qR5ep0SfKkr1CLuAdNG80kbqN50+wYu/zwFgzIBS
 eieQoU6JRY3YugQ9zVFK7mnx/ZAYrU/BO2Ee+yLqtCYVLtpuWNWNXXzLOvRJPqrYsluA
 i5RWHFpqO14Y220AjSqnCJwVtrMxZB/heSsYhNTugD4sHwSMrqmfiGQCJ6jTmfC1pud5
 PAPCL4Nygzo3Vm/EK2mfa/w7V/Vr2ZlDk4tslA4t7H2m8Bf50WMq7+vNxyVx6FVrhkwB
 cUUjG+crOa3LQztMdJprTlIYqJZARoNTeZMihv9sm/pCXULzWPvKq7XUDUmXVyEmCo1V
 xBgg==
X-Gm-Message-State: APjAAAXuD1pZKaGMsr+8vkg1eaST2Celcx0kJzQmB1jyrLgND09Czllq
 YrbiLCbMWvlR2SaZ8lB8it33ZF95BmDLJ89/fb9v/D2DpbKyjsVdbWHNQALvY5cx1yAm8v2StPi
 JGBFI6ExQ3fRPC1i+UA==
X-Received: by 2002:a1c:66d6:: with SMTP id a205mr5741996wmc.171.1579280131512; 
 Fri, 17 Jan 2020 08:55:31 -0800 (PST)
X-Google-Smtp-Source: APXvYqxwx7nOl6UUhTKNBw8l8IrVVx64aDd5IKkeOwfNbfiQu/J+NlayTvdjMRyJVdNddPB2Ehkbgg==
X-Received: by 2002:a1c:66d6:: with SMTP id a205mr5741958wmc.171.1579280131208; 
 Fri, 17 Jan 2020 08:55:31 -0800 (PST)
Received: from [192.168.1.35] (113.red-83-57-172.dynamicip.rima-tde.net.
 [83.57.172.113])
 by smtp.gmail.com with ESMTPSA id 16sm9951251wmi.0.2020.01.17.08.55.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Jan 2020 08:55:30 -0800 (PST)
Subject: Re: [PATCH v2 0/6] Fix more GCC9 -O3 warnings
To: qemu-devel@nongnu.org
Cc: Aleksandar Markovic <aleksandar.m.mail@gmail.com>,
 Andrew Jeffery <andrew@aj.id.au>, Andrey Smirnov <andrew.smirnov@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Joel Stanley <joel@jms.id.au>, =?UTF-8?B?S8WRdsOhZ8OzLCBab2x0w6Fu?=
 <dirty.ice.hu@gmail.com>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Markus Armbruster <armbru@redhat.com>, Olivier Danet <odanet@caramail.com>,
 Peter Chubb <peter.chubb@nicta.com.au>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <20191218192526.13845-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <a6eaee52-52fb-3541-fc67-fd2af35ae655@redhat.com>
Date: Fri, 17 Jan 2020 17:55:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191218192526.13845-1-philmd@redhat.com>
Content-Language: en-US
X-MC-Unique: heLEcz-tOG20pGX-a5iHww-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
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
X-List-Received-Date: Fri, 17 Jan 2020 16:55:42 -0000

Cc'ing qemu-trivial as this series is fully reviewed.

On 12/18/19 8:25 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> Fix some trivial warnings when building with -O3.
>=20
> v2:
> - addressed Thomas and Aleksandar comments
> - dropped 'hw/scsi/megasas: Silent GCC9 duplicated-cond warning'
> - dropped 'qemu-io-cmds: Silent GCC9 format-overflow warning'
>=20
> Philippe Mathieu-Daud=C3=A9 (6):
>    audio/audio: Add missing fall through comment
>    hw/display/tcx: Add missing fall through comments
>    hw/timer/aspeed_timer: Add a fall through comment
>    hw/net/imx_fec: Rewrite fall through comments
>    hw/net/imx_fec: Remove unuseful FALLTHROUGH comments
>    hw/pci-host/designware: Remove unuseful FALLTHROUGH comment
>=20
>   audio/audio.c            | 1 +
>   hw/display/tcx.c         | 2 ++
>   hw/net/imx_fec.c         | 7 ++++---
>   hw/pci-host/designware.c | 2 +-
>   hw/timer/aspeed_timer.c  | 2 +-
>   5 files changed, 9 insertions(+), 5 deletions(-)
>=20
> Cc: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
> Cc: Andrew Jeffery <andrew@aj.id.au>
> Cc: Andrey Smirnov <andrew.smirnov@gmail.com>
> Cc: "C=C3=A9dric Le Goater" <clg@kaod.org>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: Joel Stanley <joel@jms.id.au>
> Cc: "K=C5=91v=C3=A1g=C3=B3, Zolt=C3=A1n" <dirty.ice.hu@gmail.com>
> Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Cc: Markus Armbruster <armbru@redhat.com>
> Cc: Olivier Danet <odanet@caramail.com>
> Cc: Peter Chubb <peter.chubb@nicta.com.au>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: qemu-arm@nongnu.org
>=20


