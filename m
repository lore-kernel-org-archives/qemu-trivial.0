Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jVWsk-0004TJ-OT
	for mharc-qemu-trivial@gnu.org; Mon, 04 May 2020 04:55:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jVWsj-0004St-CG
 for qemu-trivial@nongnu.org; Mon, 04 May 2020 04:55:21 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:51745
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jVWsi-0007E3-Fa
 for qemu-trivial@nongnu.org; Mon, 04 May 2020 04:55:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588582519;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h8P3tGI3kiqYUeeflyHBGusrWXC5jLElipyiQHqcMGU=;
 b=NXtZmBGgrQKnJoSOBCq3tQadFfWUf1UofAQDRiXnT9U4y4a04/QkcAmWLWuFOqqfr13JUR
 Pdm3WQYcRvs5NjLJwt0egYu07SZFKO8/709eXq9Z0IqK/8t4Ti+Mql+I95zKgWcan9XIST
 IQ7HmZXppwWJsWUydnGCl0CgAl/OvYw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-49-Yttq5ezwPg2KTiJfvxRTMw-1; Mon, 04 May 2020 04:55:14 -0400
X-MC-Unique: Yttq5ezwPg2KTiJfvxRTMw-1
Received: by mail-wm1-f71.google.com with SMTP id f81so3161220wmf.2
 for <qemu-trivial@nongnu.org>; Mon, 04 May 2020 01:55:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZlBmAYZeLeMHKY+ebeItpklGAIY7YH9L3NjRuRuI7vM=;
 b=oqgGg/JwLQdDmOQGrlBBBK5DicKS8yjUVs2zIW95UwrgNDYn+yfRiiycIiXCGWiXMo
 yca1tJvlHjjzdLe1y5EwIwwaXEEKHaH2KSODI7jCFdgFo1eyPHc/phh1lE9ymlOyqPID
 ns5OgRPyUuA62aco2/wugiZ4fR5rk60BHk5BM+oCzU6Rp5kltQmDMLV7qXE0uS40LQbC
 tE0ZVVRboihHOkoL2DP3pAKcr0zOL7bo8iOV92boiLU6J2lOwyOpME1KA7O+uJPte2aE
 YTjwaQc6x3tNDnpPO3In2vY6kLFxQ/Ah+teW+V97LHNKOD2YDS/BgujB1dw3WK5tNX6y
 OPXQ==
X-Gm-Message-State: AGi0PuazTSOH/bZyPz5CJxq1RZMqiD5rWLxPMbNv7YNHF/KfeNfUUkJB
 t710PiOWefHUZzE1ULk9OI9sSHbjwo3YWKZxgNe++ygWTaGoFIVr4Ls8FQwzR3hS9OjLTRaiQtS
 Jhga25YMDmRHw4kIzJw==
X-Received: by 2002:a1c:ba56:: with SMTP id k83mr13124306wmf.1.1588582512839; 
 Mon, 04 May 2020 01:55:12 -0700 (PDT)
X-Google-Smtp-Source: APiQypJYqTN90joqgOWn8X8YJQh01c+IieSQAPCFyq/a896rjv7yEFt06EYmm7WyncXUBDbRKS+Jog==
X-Received: by 2002:a1c:ba56:: with SMTP id k83mr13124290wmf.1.1588582512657; 
 Mon, 04 May 2020 01:55:12 -0700 (PDT)
Received: from [192.168.1.39] (26.red-88-21-207.staticip.rima-tde.net.
 [88.21.207.26])
 by smtp.gmail.com with ESMTPSA id b191sm13184709wmd.39.2020.05.04.01.55.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 May 2020 01:55:12 -0700 (PDT)
Subject: Re: [PATCH v3 0/9] misc: Trivial static code analyzer fixes
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>
References: <20200422133152.16770-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <59cb7a72-9411-48d7-062d-539b46c3221c@redhat.com>
Date: Mon, 4 May 2020 10:55:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200422133152.16770-1-philmd@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.81; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/04 01:14:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
X-List-Received-Date: Mon, 04 May 2020 08:55:21 -0000

On 4/22/20 3:31 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> Fix trivial warnings reported by the Clang static code analyzer.
>=20
> Only patch #2 'blockdev: Remove dead assignment' misses review.

Thanks to Max this series is now fully reviewed, so... ping?

>=20
> The official Clang static code analyzer documentation is on:
> https://clang-analyzer.llvm.org/
>=20
> On Fedora I simply used it as:
>=20
>    $ sudo dnf install clang-analyzer
>    $ ../configure
>    $ scan-build make
>=20
> Since v2:
> - Based on lvivier/trivial-patches-for-5.1
> - Removed dup patches from Kuhn Chenqun
> Since v1:
> - Addressed Markus/Zoltan/Aleksandar review comments
>=20
> Philippe Mathieu-Daud=C3=A9 (9):
>    block: Avoid dead assignment
>    blockdev: Remove dead assignment
>    hw/i2c/pm_smbus: Remove dead assignment
>    hw/input/adb-kbd: Remove dead assignment
>    hw/ide/sii3112: Remove dead assignment
>    hw/isa/i82378: Remove dead assignment
>    hw/gpio/aspeed_gpio: Remove dead assignment
>    hw/timer/stm32f2xx_timer: Remove dead assignment
>    hw/timer/pxa2xx_timer: Add assertion to silent static analyzer warning
>=20
>   block.c                    | 2 +-
>   blockdev.c                 | 2 +-
>   hw/gpio/aspeed_gpio.c      | 2 +-
>   hw/i2c/pm_smbus.c          | 1 -
>   hw/ide/sii3112.c           | 5 +++--
>   hw/input/adb-kbd.c         | 6 +-----
>   hw/isa/i82378.c            | 8 ++++----
>   hw/timer/pxa2xx_timer.c    | 1 +
>   hw/timer/stm32f2xx_timer.c | 1 -
>   9 files changed, 12 insertions(+), 16 deletions(-)
>=20


