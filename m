Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jH517-0002KG-Ja
	for mharc-qemu-trivial@gnu.org; Wed, 25 Mar 2020 08:20:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47089)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jH515-0002JM-0r
 for qemu-trivial@nongnu.org; Wed, 25 Mar 2020 08:20:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jH513-0004RD-MQ
 for qemu-trivial@nongnu.org; Wed, 25 Mar 2020 08:20:14 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:36835)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jH513-0004Qu-Jq
 for qemu-trivial@nongnu.org; Wed, 25 Mar 2020 08:20:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585138813;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r6WfyK/kpgdBZY/JdAgAwxOCRsA6oRL9vGoxs42l5XA=;
 b=fNrmeQcxxflwwY6gIRE2ktpFXfvEjtCccXKhKvHb/oIBW+aOtW0w7Vq8oL87FWAtMpjh2d
 N1BKPzsUD0ucZBNwhnMUbLBIMK3ro4Q4b/7cXlNk5BOxNFw7n2VQ1ET21KU7QFztH+TG14
 bs9T/vhQp9Yj4C8cieyCvn2pDRKitj0=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-249-Qpqn8wwvPLqdhpnzzhzx6A-1; Wed, 25 Mar 2020 08:20:07 -0400
X-MC-Unique: Qpqn8wwvPLqdhpnzzhzx6A-1
Received: by mail-ed1-f69.google.com with SMTP id i10so1975235edk.13
 for <qemu-trivial@nongnu.org>; Wed, 25 Mar 2020 05:20:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=W97UU/NTWhxAJ/jgFtuTyq2/VkXe1/L2VIqsByX9XLY=;
 b=eoHIMlDs5S41S/VYT0vw3f8Imh1IlAhfj4JKs4cmdWhm2dYfOHyT3OmD3Vv1pG0Op6
 93oXicRcijoRuWa0YBTQMUQ0lUXPj8ksZz+So58cwozXRdHzzPCKEDjNV0ZYQ3T0rSsT
 1BaBrq/8na8Ihpa66LGSMj8Mk410csrFUKmc6x78Ui43pFkYKyxjHYP8FBF3aa3Gwvth
 HNfUvnQwWn4S4qiOPcmgXiavQlf9mIXlH8+rn8KqJ4ybL+WuiL6m0S7gIiS6bBFwaN4y
 D4MkO6i0hGYVqsPiIEid7Uk2gP2YtTGSqNjwg48Qiz89sGD3vs/y+D/0IsWh6xHnANuq
 XOAw==
X-Gm-Message-State: ANhLgQ19TVpnZFeR13wZp+zXeLCrOtE6eaX/B5Qzz9JYrsmzJ0v0dQ9f
 RutXRyiyvw8HSBmM8EwP3e8GEOuACarlTuD17xz8tVUWMMcnImoOGCmfQs6Kcb06fdsE5VH5gGu
 gYiN2gj3ZUm2kqVIAKg==
X-Received: by 2002:a50:8ad2:: with SMTP id k18mr2648838edk.354.1585138806138; 
 Wed, 25 Mar 2020 05:20:06 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvbyeNb/KO4eCiINasGZG+4XUF3mHkttJhHEIpMonNCi4FDruVBxGXI4oAWCvC6QBUs4I81Lw==
X-Received: by 2002:a50:8ad2:: with SMTP id k18mr2648825edk.354.1585138805948; 
 Wed, 25 Mar 2020 05:20:05 -0700 (PDT)
Received: from [192.168.1.35] (37.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.37])
 by smtp.gmail.com with ESMTPSA id l24sm309880ejq.34.2020.03.25.05.20.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Mar 2020 05:20:05 -0700 (PDT)
Subject: Re: [PATCH v5 3/3] timer/exynos4210_mct: Remove redundant statement
 in exynos4210_mct_write()
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: Chen Qun <kuhn.chenqun@huawei.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
Cc: zhang.zhanghailiang@huawei.com, laurent@vivier.eu,
 Euler Robot <euler.robot@huawei.com>, Igor Mitsyanko
 <i.mitsyanko@gmail.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20200325025919.21316-1-kuhn.chenqun@huawei.com>
 <20200325025919.21316-4-kuhn.chenqun@huawei.com>
 <ab8c91a3-46dd-255d-9eb4-5013a7b598cc@redhat.com>
Message-ID: <9eceaa0a-0767-cd50-23f5-82828fcc65e6@redhat.com>
Date: Wed, 25 Mar 2020 13:20:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <ab8c91a3-46dd-255d-9eb4-5013a7b598cc@redhat.com>
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
X-List-Received-Date: Wed, 25 Mar 2020 12:20:16 -0000

On 3/25/20 1:16 PM, Philippe Mathieu-Daud=E9 wrote:
> On 3/25/20 3:59 AM, Chen Qun wrote:
>> Clang static code analyzer show warning:
>> hw/timer/exynos4210_mct.c:1370:9: warning: Value stored to 'index' is=20
>> never read
>> =A0=A0=A0=A0=A0=A0=A0=A0 index =3D GET_L_TIMER_CNT_REG_IDX(offset, lt_i)=
;
>> =A0=A0=A0=A0=A0=A0=A0=A0 ^=A0=A0=A0=A0=A0=A0 ~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~
>> hw/timer/exynos4210_mct.c:1399:9: warning: Value stored to 'index' is=20
>> never read
>> =A0=A0=A0=A0=A0=A0=A0=A0 index =3D GET_L_TIMER_CNT_REG_IDX(offset, lt_i)=
;
>> =A0=A0=A0=A0=A0=A0=A0=A0 ^=A0=A0=A0=A0=A0=A0 ~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~
>> hw/timer/exynos4210_mct.c:1441:9: warning: Value stored to 'index' is=20
>> never read
>> =A0=A0=A0=A0=A0=A0=A0=A0 index =3D GET_L_TIMER_CNT_REG_IDX(offset, lt_i)=
;
>> =A0=A0=A0=A0=A0=A0=A0=A0 ^=A0=A0=A0=A0=A0=A0 ~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~
>>
>> Reported-by: Euler Robot <euler.robot@huawei.com>
>> Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
>> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
>=20
> Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>

Oh and per=20
https://www.mail-archive.com/qemu-devel@nongnu.org/msg691384.html:

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

>=20
>> ---
>> Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>
>> Cc: Peter Maydell <peter.maydell@linaro.org>
>> ---
>> =A0 hw/timer/exynos4210_mct.c | 4 ----
>> =A0 1 file changed, 4 deletions(-)
>>
>> diff --git a/hw/timer/exynos4210_mct.c b/hw/timer/exynos4210_mct.c
>> index 944120aea5..570cf7075b 100644
>> --- a/hw/timer/exynos4210_mct.c
>> +++ b/hw/timer/exynos4210_mct.c
>> @@ -1367,7 +1367,6 @@ static void exynos4210_mct_write(void *opaque,=20
>> hwaddr offset,
>> =A0=A0=A0=A0=A0 case L0_TCNTB: case L1_TCNTB:
>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 lt_i =3D GET_L_TIMER_IDX(offset);
>> -=A0=A0=A0=A0=A0=A0=A0 index =3D GET_L_TIMER_CNT_REG_IDX(offset, lt_i);
>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 /*
>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 * TCNTB is updated to internal register o=
nly after CNT=20
>> expired.
>> @@ -1396,7 +1395,6 @@ static void exynos4210_mct_write(void *opaque,=20
>> hwaddr offset,
>> =A0=A0=A0=A0=A0 case L0_ICNTB: case L1_ICNTB:
>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 lt_i =3D GET_L_TIMER_IDX(offset);
>> -=A0=A0=A0=A0=A0=A0=A0 index =3D GET_L_TIMER_CNT_REG_IDX(offset, lt_i);
>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 s->l_timer[lt_i].reg.wstat |=3D L_WSTAT_ICNT=
B_WRITE;
>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 s->l_timer[lt_i].reg.cnt[L_REG_CNT_ICNTB] =
=3D value &
>> @@ -1438,8 +1436,6 @@ static void exynos4210_mct_write(void *opaque,=20
>> hwaddr offset,
>> =A0=A0=A0=A0=A0 case L0_FRCNTB: case L1_FRCNTB:
>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 lt_i =3D GET_L_TIMER_IDX(offset);
>> -=A0=A0=A0=A0=A0=A0=A0 index =3D GET_L_TIMER_CNT_REG_IDX(offset, lt_i);
>> -
>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 DPRINTF("local timer[%d] FRCNTB write %llx\n=
", lt_i, value);
>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 s->l_timer[lt_i].reg.wstat |=3D L_WSTAT_FRCC=
NTB_WRITE;
>>


