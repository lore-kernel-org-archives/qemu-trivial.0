Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j6sQ9-00086C-CD
	for mharc-qemu-trivial@gnu.org; Wed, 26 Feb 2020 03:51:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47743)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j6sQ6-0007yJ-C9
 for qemu-trivial@nongnu.org; Wed, 26 Feb 2020 03:51:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j6sQ5-0001hG-50
 for qemu-trivial@nongnu.org; Wed, 26 Feb 2020 03:51:54 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:23656
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j6sQ5-0001fx-0B
 for qemu-trivial@nongnu.org; Wed, 26 Feb 2020 03:51:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582707112;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9H8nIzI0bZ6Ki2nWCC0tvpeNrvLyz+DMdGZ2tv5f9R8=;
 b=iADs9BZaNFGXOLpucGWqI9ueSNfERMwi04ZP2sv8BCPspzXOaOAxVmGaFGPtB5KBKuepL9
 1370gM24ban3USKYX8ejqsA8Z5qM1hs2NIrYS2EmwbMhs1pWiosmJSPI9QnTr+mslVQH4n
 oALyfgySGBHn+mS0GVNZ5suXd6NUlJo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-57-dvu6t0t7Na-2hpEADzjvrQ-1; Wed, 26 Feb 2020 03:51:50 -0500
X-MC-Unique: dvu6t0t7Na-2hpEADzjvrQ-1
Received: by mail-wm1-f71.google.com with SMTP id d129so636483wmd.2
 for <qemu-trivial@nongnu.org>; Wed, 26 Feb 2020 00:51:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pBY+buJ/PrYS0KyRBDQiqY6mfxUCj9CE8jY5WaJhUxo=;
 b=t49K+YzX6QaLRN+ccuZzBJzsySAt6gbFyZucXEaYwraTy+/qt7nsAHVKlAQjmGHPzX
 KwGQqL9CD6uFKpXKX7OsS+XTbQFO+6JpNlzI0XuIbEN25ib4oWZ2ge4Awe/rrPNY/kNC
 OUfBN0xWENlFdpCEQAmSRcZQfxkPn2xMMUY/s1tQAQnAAc+10VA+kmVjWe2uKTMHgd0h
 1aRyKZKSBXbwBB10rtqwDbopjAEPSKcc/tEiLJAvrP59uQbWVmKbj9B4HR0jXkO6oedw
 +IsdZpiymQweWoqAHwcA/YFWttd8K66QQCP7cOGiYYcBHTCwGNwQSiWKCifBirKQca1p
 kVRA==
X-Gm-Message-State: APjAAAWdjFwfcEFFgFLqcFWflbHCxD+9sdQfST7h/zOo/S+5hGS1MY9T
 SwiFF6c1R+BlmKYxgdm8LObPjPay2lOenCfbeehNfjpIKg2dzZveTXWOHuLN0wYD3FeXTjsaLTH
 jVtvQJBVSkD5fJUQGuQ==
X-Received: by 2002:a1c:a706:: with SMTP id q6mr3993591wme.23.1582707109430;
 Wed, 26 Feb 2020 00:51:49 -0800 (PST)
X-Google-Smtp-Source: APXvYqydKrZcKsA6Nk5Bzs+vESFZR0/+CxUG0RkSTjZ2OT/nx3TVV70rnK8CVofC88EmUkzkxzQWoA==
X-Received: by 2002:a1c:a706:: with SMTP id q6mr3993557wme.23.1582707109196;
 Wed, 26 Feb 2020 00:51:49 -0800 (PST)
Received: from [192.168.1.35] (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id z14sm2295620wru.31.2020.02.26.00.51.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Feb 2020 00:51:48 -0800 (PST)
Subject: Re: [PATCH v2 09/13] dma/xlnx-zdma: Remove redundant statement in
 zdma_write_dst()
To: kuhn.chenqun@huawei.com, qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Cc: peter.maydell@linaro.org, zhang.zhanghailiang@huawei.com,
 Euler Robot <euler.robot@huawei.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
References: <20200226084647.20636-1-kuhn.chenqun@huawei.com>
 <20200226084647.20636-10-kuhn.chenqun@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <98e70047-e2fa-dca7-74ad-f9aeafd3bf0e@redhat.com>
Date: Wed, 26 Feb 2020 09:51:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200226084647.20636-10-kuhn.chenqun@huawei.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
X-List-Received-Date: Wed, 26 Feb 2020 08:51:55 -0000

On 2/26/20 9:46 AM, kuhn.chenqun@huawei.com wrote:
> From: Chen Qun <kuhn.chenqun@huawei.com>
>=20
> Clang static code analyzer show warning:
> hw/dma/xlnx-zdma.c:399:13: warning: Value stored to 'dst_type' is never r=
ead
>              dst_type =3D FIELD_EX32(s->dsc_dst.words[3], ZDMA_CH_DST_DSC=
R_WORD3,
>              ^          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
>=20
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
> ---
> Cc: Alistair Francis <alistair@alistair23.me>
> Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>=20
> v1->v2: move the 'dst_type' declaration.(Base on Philippe's suggestion).
> ---
>   hw/dma/xlnx-zdma.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/hw/dma/xlnx-zdma.c b/hw/dma/xlnx-zdma.c
> index 8fb83f5b07..eeacad59ce 100644
> --- a/hw/dma/xlnx-zdma.c
> +++ b/hw/dma/xlnx-zdma.c
> @@ -373,7 +373,7 @@ static uint64_t zdma_update_descr_addr(XlnxZDMA *s, b=
ool type,
>   static void zdma_write_dst(XlnxZDMA *s, uint8_t *buf, uint32_t len)
>   {
>       uint32_t dst_size, dlen;
> -    bool dst_intr, dst_type;
> +    bool dst_intr;
>       unsigned int ptype =3D ARRAY_FIELD_EX32(s->regs, ZDMA_CH_CTRL0, POI=
NT_TYPE);
>       unsigned int rw_mode =3D ARRAY_FIELD_EX32(s->regs, ZDMA_CH_CTRL0, M=
ODE);
>       unsigned int burst_type =3D ARRAY_FIELD_EX32(s->regs, ZDMA_CH_DATA_=
ATTR,
> @@ -387,17 +387,17 @@ static void zdma_write_dst(XlnxZDMA *s, uint8_t *bu=
f, uint32_t len)
>       while (len) {
>           dst_size =3D FIELD_EX32(s->dsc_dst.words[2], ZDMA_CH_DST_DSCR_W=
ORD2,
>                                 SIZE);
> -        dst_type =3D FIELD_EX32(s->dsc_dst.words[3], ZDMA_CH_DST_DSCR_WO=
RD3,
> -                              TYPE);
>           if (dst_size =3D=3D 0 && ptype =3D=3D PT_MEM) {
>               uint64_t next;
> +            bool dst_type =3D FIELD_EX32(s->dsc_dst.words[3],
> +                                       ZDMA_CH_DST_DSCR_WORD3,
> +                                       TYPE);
> +
>               next =3D zdma_update_descr_addr(s, dst_type,
>                                             R_ZDMA_CH_DST_CUR_DSCR_LSB);
>               zdma_load_descriptor(s, next, &s->dsc_dst);
>               dst_size =3D FIELD_EX32(s->dsc_dst.words[2], ZDMA_CH_DST_DS=
CR_WORD2,
>                                     SIZE);
> -            dst_type =3D FIELD_EX32(s->dsc_dst.words[3], ZDMA_CH_DST_DSC=
R_WORD3,
> -                                  TYPE);
>           }
>  =20
>           /* Match what hardware does by ignoring the dst_size and only u=
sing
>=20

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>


