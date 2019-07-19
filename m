Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hoSuw-0000kb-L4
	for mharc-qemu-trivial@gnu.org; Fri, 19 Jul 2019 09:27:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35525)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hoSut-0000Wy-Lf
 for qemu-trivial@nongnu.org; Fri, 19 Jul 2019 09:27:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hoSus-0000hE-L3
 for qemu-trivial@nongnu.org; Fri, 19 Jul 2019 09:27:19 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:42490)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hoSus-0000gN-Eb
 for qemu-trivial@nongnu.org; Fri, 19 Jul 2019 09:27:18 -0400
Received: by mail-ot1-x343.google.com with SMTP id l15so32727500otn.9
 for <qemu-trivial@nongnu.org>; Fri, 19 Jul 2019 06:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3iJes9TBAmHxPIxu+PzOit8mMntNWTqXpnPXCuxWDJ8=;
 b=r2PWhrEjm2P9FCPPDTCdkL3+w4DfRn4z/JgvDdVDBBo6M3G5oQrAZEYV6YJmplvhVI
 KpSNcjZTrUTIlsJ5VDwvQkEHIeCRNss6GRdOLyKtQhHJ4QmaN4G/6uCaG9eiktIyAIby
 XAbmkyjObBecRjp50ZLhOHJym8jOR8huEXzQF+BM3FXAHaSInAYKyDD7urBCQSQXpvpx
 l24b4T4vgvtN1TytrW1wHhutYc5n3D9K2T7YCQ2XEXgTmuNHtNEcd6DooisiHCJOynI7
 Ae4oPq28mxU2Ad1C7qWKjX53bp9IkEVm/DXfzHTSdYr62HmPy+pVq+ucmLzrUp53cMwY
 D6BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3iJes9TBAmHxPIxu+PzOit8mMntNWTqXpnPXCuxWDJ8=;
 b=NNYymOf+221GvjUBUfKDWIZR3DLuirnC6FR32v5q92O8kcvoHetK6MpjLK27y/zZoo
 BbDSUDvjcf/Os0AQbKnfRNcD7E+BGf5tvflCD8wcx2N9si0FRIbvwOu4fQoPeGEr0wPd
 ocng7JKNiLuwCA67boJri4ANyMBBMbF7BshI11uiJhNRbGhIcl46vRTYICL9zM30Ri6A
 o03rHUcmPJaMaN9TvT41gZpIiRvH2GiRVihhtW7nJZJJrT6gJ4upMjpF3NKrP1h0aqh0
 6fVcVJ2SyNbCnTZ7clFu+RUaO2XqoOKwm6Xe6TVzlGRTBnWk1kvYT/olW0e1LR9rrBog
 rqqg==
X-Gm-Message-State: APjAAAX+C4NPpBMCdb3S+u7h00YsoKhi738rZL2u6BCNlpDCG8UkS8dl
 NgxQfycwoIKMzis2vNtJVtFvMfDuMhj+mkS9O8+51w==
X-Google-Smtp-Source: APXvYqw17AicZXZeb0Qps+ZpCk7n92TNb1aqu+nNpU+WNh7n9UWSnkKWZ8aAcPB7/4h4ALnN32G8JTT3L/LOZiHugjs=
X-Received: by 2002:a9d:711e:: with SMTP id n30mr36901471otj.97.1563542837424; 
 Fri, 19 Jul 2019 06:27:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190719131425.10835-1-philmd@redhat.com>
 <20190719131425.10835-3-philmd@redhat.com>
In-Reply-To: <20190719131425.10835-3-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Jul 2019 14:27:06 +0100
Message-ID: <CAFEAcA9oa=f4JQ8whrChb_1-6eOBq13PuGoLu41E6fnQUyGFag@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, 
 David Gibson <david@gibson.dropbear.id.au>, Qemu-block <qemu-block@nongnu.org>,
 Michael Tokarev <mjt@tls.msk.ru>, QEMU Trivial <qemu-trivial@nongnu.org>, 
 Corey Minyard <minyard@acm.org>, Max Reitz <mreitz@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, 
 Kevin Wolf <kwolf@redhat.com>, qemu-ppc <qemu-ppc@nongnu.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-trivial] [PATCH-for-4.1? 2/7] hw/dma/omap_dma: Move
 switch 'fall through' comment to correct place
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
X-List-Received-Date: Fri, 19 Jul 2019 13:27:21 -0000

On Fri, 19 Jul 2019 at 14:14, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> Reported by GCC9 when building with CFLAG -Wimplicit-fallthrough=3D2:
>
>     CC      hw/dma/omap_dma.o
>   hw/dma/omap_dma.c: In function =E2=80=98omap_dma_write=E2=80=99:
>   hw/dma/omap_dma.c:1532:12: error: this statement may fall through [-Wer=
ror=3Dimplicit-fallthrough=3D]
>    1532 |         if (s->model <=3D omap_dma_3_1)
>         |            ^
>   hw/dma/omap_dma.c:1534:5: note: here
>    1534 |     case 0x400:
>         |     ^~~~
>   cc1: all warnings being treated as errors
>
> Correctly place the 'fall through' comment.
>
> Reported-by: Stefan Weil <sw@weilnetz.de>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/dma/omap_dma.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/dma/omap_dma.c b/hw/dma/omap_dma.c
> index eab83c5c3a..6677237d42 100644
> --- a/hw/dma/omap_dma.c
> +++ b/hw/dma/omap_dma.c
> @@ -1531,8 +1531,8 @@ static void omap_dma_write(void *opaque, hwaddr add=
r,
>      case 0x404 ... 0x4fe:
>          if (s->model <=3D omap_dma_3_1)
>              break;
> +        /* fall through */
>      case 0x400:
> -        /* Fall through. */
>          if (omap_dma_sys_write(s, addr, value))
>              break;
>          return;
> -

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

