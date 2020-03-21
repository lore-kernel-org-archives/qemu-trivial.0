Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jFd7F-00032s-05
	for mharc-qemu-trivial@gnu.org; Sat, 21 Mar 2020 08:20:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40737)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jFd7D-00032f-70
 for qemu-trivial@nongnu.org; Sat, 21 Mar 2020 08:20:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jFd7C-00049W-2K
 for qemu-trivial@nongnu.org; Sat, 21 Mar 2020 08:20:35 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:51883)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jFd7A-00048Y-7f
 for qemu-trivial@nongnu.org; Sat, 21 Mar 2020 08:20:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584793231;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/Jdy9cM4yEkHa5BYOrLX/ZvLh08lyhMZqVUzEW6/vdc=;
 b=Kzpb6M8MG6E8hq6qfmCK9EpKUqpfYk+D3dBH7Vv/U4nvhyAMhGMEilCdSGLyoBItfWPZ5J
 E0uYF8JME+m1Dz1/1o7NPax9iN0Dz8yAfrVXW4qTLA3cz2kdWvun0PxHS2G0iKMVdzeh5Z
 D3xzuPUbXfvCBs70LQe8po5VLNZELNI=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-267-Wf177zRWNWOQQLoUyUrECQ-1; Sat, 21 Mar 2020 08:20:26 -0400
X-MC-Unique: Wf177zRWNWOQQLoUyUrECQ-1
Received: by mail-ed1-f71.google.com with SMTP id t1so6755515edv.2
 for <qemu-trivial@nongnu.org>; Sat, 21 Mar 2020 05:20:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=d0Qv/xpPKwvzSW/cvuupg5cn1SBat6NtfdKMxcB1t74=;
 b=A619gvslETpk8ukb6t/GoYK0hgh5sYETVFVFvceptCpzgvPN+bc3xmdlDGqBuda2L1
 3tZjZG5aJwU66hkTG4mg9hCKsLSvGB4s8V/3RzLTfsIHl9psmnDlIgPUADOz7M7Avp6w
 VGLJG2ryFxGnXNRcUUrsdfjdFImxfF94TB1VIx18fQ5B/CFTjs1T9e2V/JmhDyPmNsmA
 Td4eRYvgRkpsW8EuDsIYdkndBup1r6hqrjRk2Dy7nISolCbnY4PGhhuGMQCx0cDNp6or
 q0a/srv+upjx1qLOvSrdpz+G/1Ua2gw19WAxbWHybirFeEtsf/N0ZdLN3iG8Seqgz4mw
 m7pA==
X-Gm-Message-State: ANhLgQ3iIneI3ZT+Pn+jH7lUwrml2mQTR5EgdYd9tYQfKyB2C8xnkAZE
 g83pa77HKDBJk+5R+GB2EqAzrJNmhTcLhzLppg2py6/LB9yzm7T1yEmi8sd/xXNiu9fMqmqNtwu
 hsauFIvWs5nmDgTL/tw==
X-Received: by 2002:a50:ed06:: with SMTP id j6mr13038313eds.89.1584793224760; 
 Sat, 21 Mar 2020 05:20:24 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vs/rvcri/kawgabzmYXNC30aSF7aXzaAQU9WhRkxRncuRvO06EdaSpW3bNFIqWA7qIey19NTw==
X-Received: by 2002:a50:ed06:: with SMTP id j6mr13038282eds.89.1584793224557; 
 Sat, 21 Mar 2020 05:20:24 -0700 (PDT)
Received: from [192.168.1.35] (37.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.37])
 by smtp.gmail.com with ESMTPSA id z22sm578021edl.6.2020.03.21.05.20.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 21 Mar 2020 05:20:23 -0700 (PDT)
Subject: Re: [PATCH-for-5.0 00/11] misc: Trivial static code analyzer fixes
To: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Cc: qemu-devel@nongnu.org, Fam Zheng <fam@euphon.net>,
 Peter Maydell <peter.maydell@linaro.org>, "Michael S. Tsirkin"
 <mst@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>, qemu-block@nongnu.org,
 qemu-trivial@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 John Snow <jsnow@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Kevin Wolf <kwolf@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 Laurent Vivier <laurent@vivier.eu>, Max Reitz <mreitz@redhat.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20200321114615.5360-1-philmd@redhat.com>
 <CAHiYmc7JCR-_2Vb8hm1ob56-e3Et+1mtsoftt-CzY76i_qe2QA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <21211cae-5ccb-0851-7c24-9a6b84924ad1@redhat.com>
Date: Sat, 21 Mar 2020 13:20:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAHiYmc7JCR-_2Vb8hm1ob56-e3Et+1mtsoftt-CzY76i_qe2QA@mail.gmail.com>
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
X-List-Received-Date: Sat, 21 Mar 2020 12:20:36 -0000

On 3/21/20 1:01 PM, Aleksandar Markovic wrote:
> 12:47 PM Sub, 21.03.2020. Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com=
=20
> <mailto:philmd@redhat.com>> =D1=98=D0=B5 =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=
=D0=B0=D0=BE/=D0=BB=D0=B0:
>  >
>  > Fix trivial warnings reported by the Clang static code analyzer.
>  >
>=20
> Philippe,
>=20
> It would be useful and customary for this type of fixes to provide here=
=20
> the environment you used for obtaining the warnings (clang version,=20
> configure parameters, and all needed elenents to repro the warnings).

https://clang-analyzer.llvm.org/

$ sudo dnf install clang-analyzer
$ ../configure
$ scan-build make

>=20
> Regards,
> Aleksandar
>=20
>  > Philippe Mathieu-Daud=C3=A9 (11):
>  > =C2=A0 block: Remove dead assignment
>  > =C2=A0 blockdev: Remove dead assignment
>  > =C2=A0 hw/i2c/pm_smbus: Remove dead assignment
>  > =C2=A0 hw/input/adb-kbd: Remove dead assignment
>  > =C2=A0 hw/ide/sii3112: Remove dead assignment
>  > =C2=A0 hw/isa/i82378: Remove dead assignment
>  > =C2=A0 hw/gpio/aspeed_gpio: Remove dead assignment
>  > =C2=A0 hw/timer/exynos4210_mct: Remove dead assignments
>  > =C2=A0 hw/timer/stm32f2xx_timer: Remove dead assignment
>  > =C2=A0 hw/timer/pxa2xx_timer: Add assertion to silent static analyzer =
warning
>  > =C2=A0 hw/scsi/esp-pci: Remove dead assignment
>  >
>  > =C2=A0block.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 2 +-
>  > =C2=A0blockdev.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 2 +-
>  > =C2=A0hw/gpio/aspeed_gpio.c=C2=A0 =C2=A0 =C2=A0 | 4 ++--
>  > =C2=A0hw/i2c/pm_smbus.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 -
>  > =C2=A0hw/ide/sii3112.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-
>  > =C2=A0hw/input/adb-kbd.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 -
>  > =C2=A0hw/isa/i82378.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 8 +++=
+----
>  > =C2=A0hw/scsi/esp-pci.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 -
>  > =C2=A0hw/timer/exynos4210_mct.c=C2=A0 | 3 ---
>  > =C2=A0hw/timer/pxa2xx_timer.c=C2=A0 =C2=A0 | 1 +
>  > =C2=A0hw/timer/stm32f2xx_timer.c | 1 -
>  > =C2=A011 files changed, 10 insertions(+), 16 deletions(-)
>  >
>  > --
>  > 2.21.1
>  >
>  >
>=20


