Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jFfLr-0000X7-MU
	for mharc-qemu-trivial@gnu.org; Sat, 21 Mar 2020 10:43:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60627)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jFfLo-0000P7-4t
 for qemu-trivial@nongnu.org; Sat, 21 Mar 2020 10:43:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jFfLm-0000QU-Ua
 for qemu-trivial@nongnu.org; Sat, 21 Mar 2020 10:43:48 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:23305)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jFfLm-0000Py-Q7
 for qemu-trivial@nongnu.org; Sat, 21 Mar 2020 10:43:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584801826;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xP1X/vYsg9JeRGG0cK/lMXeLtyzTis334aQojn7RlgE=;
 b=HHIgpkooSOqThk6ov3hkn9C68OEu7nzd0ekSPL6PaGw4RisGtoLzdvQesspOFlpaxLDfeN
 BfyOhMX44k2bCdFb3mS2rvGwPcred8C66opBtu5JA7Src5jYNv55mjoo6P+rGEUFkOSLKn
 JOpXMe9rrDJ96c9zQIW47h9hWKVsqaY=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-309-myyldbW4NaCM_YEoQuGh9w-1; Sat, 21 Mar 2020 10:43:40 -0400
X-MC-Unique: myyldbW4NaCM_YEoQuGh9w-1
Received: by mail-ed1-f70.google.com with SMTP id i10so7610052edk.13
 for <qemu-trivial@nongnu.org>; Sat, 21 Mar 2020 07:43:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=F/OLVnoElxwEF3rlTbyB1ANgms+SlUxPt5Z/ioqo0ws=;
 b=sPjT/Khm4C5U1Pu+yZDgwnc9ErKNrwK0CQDtBPGQNMZQamKNvbgNbcgA63d8aOxfZT
 3AQpYlhwZdJNbx0pVTbRAaNbSH0/XXvBDbhtKFnO9NaQ/SNoyaVEIttQGMeJsh2dmf4m
 DM0D+JEupksUf/lHM5YYaRk1h7Lb14pk+VdZolgZd73pg6YDlB6siALxRROkY1a5cKyw
 rv4BSOHxKkRexP7MWObH/sEZ0M8moiNk/ZHLTqkJl1EIaQKFwKN2Jkat6YU8YHzhWFAR
 JzBg9UEQgHYhkGG+eEJwWBs2l2HClL3ckbSlDJD544IfmEzu3RpcevqOrh1PwPWsi6Sn
 duTg==
X-Gm-Message-State: ANhLgQ2x0garwEWyQYIWucxbwlkPTi1xqHsw04q39OGG1de61kWcMl8z
 w7ItQAlbzvSO5ETwMRvmHaW38owN95JHPezP11BrgaRaZsJRLQjMEzsQwYpQtnISgSbidkEQa1R
 K4psjURvSRg0fYrnUXA==
X-Received: by 2002:a17:906:9451:: with SMTP id
 z17mr12858633ejx.176.1584801818842; 
 Sat, 21 Mar 2020 07:43:38 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vuQpSBay0NoE2JtF/dbQw/BKYEI/H2jAJkkC81gLLfWpRUJt8dIypFXtrHpnZV46cFcJZPGng==
X-Received: by 2002:a17:906:9451:: with SMTP id
 z17mr12858601ejx.176.1584801818627; 
 Sat, 21 Mar 2020 07:43:38 -0700 (PDT)
Received: from [192.168.1.35] (37.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.37])
 by smtp.gmail.com with ESMTPSA id t13sm613293edw.49.2020.03.21.07.43.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 21 Mar 2020 07:43:38 -0700 (PDT)
Subject: Re: [PATCH-for-5.0 v2 00/11] misc: Trivial static code analyzer fixes
To: qemu-devel@nongnu.org
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
 Laurent Vivier <laurent@vivier.eu>, qemu-trivial@nongnu.org
References: <20200321144110.5010-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <f16abe6b-f0d5-60f1-71e4-f4c40e08aa33@redhat.com>
Date: Sat, 21 Mar 2020 15:43:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200321144110.5010-1-philmd@redhat.com>
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
X-List-Received-Date: Sat, 21 Mar 2020 14:43:49 -0000

On 3/21/20 3:40 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> Fix trivial warnings reported by the Clang static code analyzer.

I forgot to add the official Clang static code analyzer documentation is=20
on https://clang-analyzer.llvm.org/ and on Fedora I simply used it as:

$ sudo dnf install clang-analyzer
$ ../configure
$ scan-build make

>=20
> Since v1:
> - Addressed Markus/Zoltan/Aleksandar review comments
>=20
> Philippe Mathieu-Daud=C3=A9 (11):
>    block: Avoid dead assignment
>    blockdev: Remove dead assignment
>    hw/i2c/pm_smbus: Remove dead assignment
>    hw/input/adb-kbd: Remove dead assignment
>    hw/ide/sii3112: Remove dead assignment
>    hw/isa/i82378: Remove dead assignment
>    hw/gpio/aspeed_gpio: Remove dead assignment
>    hw/timer/exynos4210_mct: Remove dead assignments
>    hw/timer/stm32f2xx_timer: Remove dead assignment
>    hw/timer/pxa2xx_timer: Add assertion to silent static analyzer warning
>    hw/scsi/esp-pci: Remove dead assignment
>=20
>   block.c                    | 2 +-
>   blockdev.c                 | 2 +-
>   hw/gpio/aspeed_gpio.c      | 2 +-
>   hw/i2c/pm_smbus.c          | 1 -
>   hw/ide/sii3112.c           | 5 +++--
>   hw/input/adb-kbd.c         | 6 +-----
>   hw/isa/i82378.c            | 8 ++++----
>   hw/scsi/esp-pci.c          | 1 -
>   hw/timer/exynos4210_mct.c  | 3 ---
>   hw/timer/pxa2xx_timer.c    | 1 +
>   hw/timer/stm32f2xx_timer.c | 1 -
>   11 files changed, 12 insertions(+), 20 deletions(-)
>=20


