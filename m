Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jH4xr-00012r-No
	for mharc-qemu-trivial@gnu.org; Wed, 25 Mar 2020 08:16:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46833)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jH4xo-00012Y-KH
 for qemu-trivial@nongnu.org; Wed, 25 Mar 2020 08:16:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jH4xm-0002R6-Mk
 for qemu-trivial@nongnu.org; Wed, 25 Mar 2020 08:16:52 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:58822)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jH4xm-0002Qm-JW
 for qemu-trivial@nongnu.org; Wed, 25 Mar 2020 08:16:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585138610;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9bmV4sOT4NhvGdk2GId5YJPBewxX0veeluic1lE0Lp4=;
 b=M0dbDB/ZIdcRn5RliVJJ+Y3k+51/cDhRgYz6u/A9ithcsTM45y7BQ9S2AzLm0pU+7czbvR
 2pxfan7FFthYYhq1imJg/4QdvjBtVRLHUGa3jczSaScvg/pbIZn49XWad1Gs3XgqN6k7Ng
 XZkynbKK50Myc0EP8dDSxyjHvZ2qK3U=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-OSfcp2H5M7WC5-YRdV7U9g-1; Wed, 25 Mar 2020 08:16:48 -0400
X-MC-Unique: OSfcp2H5M7WC5-YRdV7U9g-1
Received: by mail-ed1-f71.google.com with SMTP id x93so1951792ede.19
 for <qemu-trivial@nongnu.org>; Wed, 25 Mar 2020 05:16:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OXZj8wxpd2CuQfdgX57NxDBKGqs4ewvXpGZHiKXxXh4=;
 b=bj02pZqGxVHcouWdvli5Ss4EuNhQ0/IrdxsXjUj5vtbAvGJUc2Afd74VQinsWHOUDe
 5vit+16IO/NX5qQfJBDPGPm0VbSUUdVNnAaOnHp/vv4UXaGlp5/4/wSmUZlTOY88i+cg
 PjDI6O93TPFh6ryQxcL0xgy1Q/C4fzFrSV6u70VpiHXmDCm2yvVhsYiOBKLvZdkaVDDc
 1PovZ7ZUNdan6gx+/F/eDVa4N0y2Jb9hIcXAg5jvhdm6X7QupszBKQVzngJS4ecoCylh
 wuP/U7T7qpUscwdhDna4HxKF5c9h581+LEOaOeHaIQp43AzF3zUiBMX/OSD6JGl6Enn+
 GsZg==
X-Gm-Message-State: ANhLgQ0LE+dKS/l0/p9qtvg44Iye2hTSJ3tc6lv5ujok/pMQavkQ5V1c
 pkk3+nowYe4f8viMTkzm0s75Q3Y+2BsRBI+Gl3uXTe7dx/MSAmsQiwwzDktSX8AEOoxn4KXBlt/
 1HOoa4q7x2og1nMaK9Q==
X-Received: by 2002:a05:6402:110a:: with SMTP id
 u10mr2579249edv.159.1585138607111; 
 Wed, 25 Mar 2020 05:16:47 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvq2c9xFGvMYiatVInceDNNvVPZtpdNdQR5Ck12cwAexER9ALjtc8Np7K7nlJYKf+Qd0TG13g==
X-Received: by 2002:a05:6402:110a:: with SMTP id
 u10mr2579224edv.159.1585138606836; 
 Wed, 25 Mar 2020 05:16:46 -0700 (PDT)
Received: from [192.168.1.35] (37.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.37])
 by smtp.gmail.com with ESMTPSA id v13sm847252edj.62.2020.03.25.05.16.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Mar 2020 05:16:46 -0700 (PDT)
Subject: Re: [PATCH v5 3/3] timer/exynos4210_mct: Remove redundant statement
 in exynos4210_mct_write()
To: Chen Qun <kuhn.chenqun@huawei.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
Cc: zhang.zhanghailiang@huawei.com, laurent@vivier.eu,
 Euler Robot <euler.robot@huawei.com>, Igor Mitsyanko
 <i.mitsyanko@gmail.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20200325025919.21316-1-kuhn.chenqun@huawei.com>
 <20200325025919.21316-4-kuhn.chenqun@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <ab8c91a3-46dd-255d-9eb4-5013a7b598cc@redhat.com>
Date: Wed, 25 Mar 2020 13:16:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200325025919.21316-4-kuhn.chenqun@huawei.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
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
X-List-Received-Date: Wed, 25 Mar 2020 12:16:55 -0000

On 3/25/20 3:59 AM, Chen Qun wrote:
> Clang static code analyzer show warning:
> hw/timer/exynos4210_mct.c:1370:9: warning: Value stored to 'index' is nev=
er read
>          index =3D GET_L_TIMER_CNT_REG_IDX(offset, lt_i);
>          ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> hw/timer/exynos4210_mct.c:1399:9: warning: Value stored to 'index' is nev=
er read
>          index =3D GET_L_TIMER_CNT_REG_IDX(offset, lt_i);
>          ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> hw/timer/exynos4210_mct.c:1441:9: warning: Value stored to 'index' is nev=
er read
>          index =3D GET_L_TIMER_CNT_REG_IDX(offset, lt_i);
>          ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>=20
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>

Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>

> ---
> Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/timer/exynos4210_mct.c | 4 ----
>   1 file changed, 4 deletions(-)
>=20
> diff --git a/hw/timer/exynos4210_mct.c b/hw/timer/exynos4210_mct.c
> index 944120aea5..570cf7075b 100644
> --- a/hw/timer/exynos4210_mct.c
> +++ b/hw/timer/exynos4210_mct.c
> @@ -1367,7 +1367,6 @@ static void exynos4210_mct_write(void *opaque, hwad=
dr offset,
>  =20
>       case L0_TCNTB: case L1_TCNTB:
>           lt_i =3D GET_L_TIMER_IDX(offset);
> -        index =3D GET_L_TIMER_CNT_REG_IDX(offset, lt_i);
>  =20
>           /*
>            * TCNTB is updated to internal register only after CNT expired=
.
> @@ -1396,7 +1395,6 @@ static void exynos4210_mct_write(void *opaque, hwad=
dr offset,
>  =20
>       case L0_ICNTB: case L1_ICNTB:
>           lt_i =3D GET_L_TIMER_IDX(offset);
> -        index =3D GET_L_TIMER_CNT_REG_IDX(offset, lt_i);
>  =20
>           s->l_timer[lt_i].reg.wstat |=3D L_WSTAT_ICNTB_WRITE;
>           s->l_timer[lt_i].reg.cnt[L_REG_CNT_ICNTB] =3D value &
> @@ -1438,8 +1436,6 @@ static void exynos4210_mct_write(void *opaque, hwad=
dr offset,
>  =20
>       case L0_FRCNTB: case L1_FRCNTB:
>           lt_i =3D GET_L_TIMER_IDX(offset);
> -        index =3D GET_L_TIMER_CNT_REG_IDX(offset, lt_i);
> -
>           DPRINTF("local timer[%d] FRCNTB write %llx\n", lt_i, value);
>  =20
>           s->l_timer[lt_i].reg.wstat |=3D L_WSTAT_FRCCNTB_WRITE;
>=20


