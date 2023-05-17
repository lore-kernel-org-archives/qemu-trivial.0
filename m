Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pzOsp-0007ut-R7
	for mharc-qemu-trivial@gnu.org; Wed, 17 May 2023 17:40:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pzOso-0007ui-3m
 for qemu-trivial@nongnu.org; Wed, 17 May 2023 17:40:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pzOsX-0003ub-9d
 for qemu-trivial@nongnu.org; Wed, 17 May 2023 17:40:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684359612;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z1o846Dh8wWPEH2D8VFjFRkhhoxdmIXC1lQDghM5J44=;
 b=NyVk+jo+qyZNiiMDoN+9D8n2rFi4rmmmOFU6PEQm8xEpMd+WOVSA88nPiBuoVfhooowvOt
 Dvov5/EE9Fl0VlsVAoUUKCxWTvbk6ZmostkYCrPHMP+mwuOS5S3CSzXPOgyNFqUx5pujDx
 KOmemMmFPAmp1P/erfgq3npydMb0KRg=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-439-R_qMoraAMUS9YBO9QnZorA-1; Wed, 17 May 2023 17:40:11 -0400
X-MC-Unique: R_qMoraAMUS9YBO9QnZorA-1
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-25353056618so354529a91.1
 for <qemu-trivial@nongnu.org>; Wed, 17 May 2023 14:40:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684359610; x=1686951610;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z1o846Dh8wWPEH2D8VFjFRkhhoxdmIXC1lQDghM5J44=;
 b=c5HVgfkqz55WE96x6c+HW6Y2y3TY1K9ZZBrpujy1uJowJgAUE3ygOCFnpzCnmAeGBD
 T+wf4qHUBYfmVey4aDbgHKtI3gu6M7QjA1Msnhd1OMchWxVrtD77e1eBjTpZxGSbrSDM
 +Kj0/UesPcnruNZdpoTNJVYoqYnlaDkPlBFCx2sLNgORsevAj9nqsS71me36Dz4juq1K
 MMe8a+yzwVjvZRSr6RDT6MX4N9XKPoDcZwZi2HfvP99jCFtTkdsgcne2vfxtIxrc7kgh
 MEFAfmYXz4di756ZSatWchTu74zNxTzglqcvEiccDZEiYI+SySoT2rQ9ps0cCB5sTFyJ
 XODQ==
X-Gm-Message-State: AC+VfDy/LsxD2OBEBY/BMQlXDEk8rglAcSfUzb3N8IXUkvQpI7LM3Mkg
 rG8XdtbI9D/yFOai2qURjBTyEk9VCrCKkBbG/pRQ/dQNxZk9qMLbRbYj1fzeU0chkJqjLzZYWUa
 rihO1Y/oKnY5XeqyfI+jUKeePP/f9C+6lPw==
X-Received: by 2002:a17:90a:fa4f:b0:24d:e3dc:4b10 with SMTP id
 dt15-20020a17090afa4f00b0024de3dc4b10mr297880pjb.23.1684359610033; 
 Wed, 17 May 2023 14:40:10 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7AEXzEfg+Oc8KiznkPoccG+FXwVyMg0Kvq0pofdPAk79RrD6KRLxC/sm8wbNof1n3kGEAGP81w/YbSH1JzBAs=
X-Received: by 2002:a17:90a:fa4f:b0:24d:e3dc:4b10 with SMTP id
 dt15-20020a17090afa4f00b0024de3dc4b10mr297866pjb.23.1684359609767; Wed, 17
 May 2023 14:40:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230224153410.19727-1-philmd@linaro.org>
In-Reply-To: <20230224153410.19727-1-philmd@linaro.org>
From: John Snow <jsnow@redhat.com>
Date: Wed, 17 May 2023 17:39:58 -0400
Message-ID: <CAFn=p-ZmCVwwE=MN+V+1+-tG-N2HZxrKpYrcipJn-2SLUJfmCg@mail.gmail.com>
Subject: Re: [PATCH] hw/ide: Remove unuseful IDE_DMA__COUNT definition
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-block@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 17 May 2023 21:40:30 -0000

On Fri, Feb 24, 2023 at 10:34=E2=80=AFAM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> First, IDE_DMA__COUNT represents the number of enumerated
> values, but is incorrectly listed as part of the enum.
>
> Second, IDE_DMA_CMD_str() is internal to core.c and only
> takes sane enums from ide_dma_cmd. So no need to check the
> 'enval' argument is within the enum range. Only checks
> IDE_DMA_CMD_lookup[] entry is not NULL.
>
> Both combined, IDE_DMA__COUNT can go.
>
> Reduce IDE_DMA_CMD_lookup[] scope which is only used locally.
>

You reviewed the patch where this got written in :)

I didn't think anything actually protected us from giving
IDE_DMA_CMD_str() a bogus integer. I'm not familiar with the idea that
it takes "only sane enums". Is that true? Or, is it just because it's
internal to the file that we can statically prove that it's true?

--js

> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/ide/core.c             | 10 +++++-----
>  include/hw/ide/internal.h |  3 ---
>  2 files changed, 5 insertions(+), 8 deletions(-)
>
> diff --git a/hw/ide/core.c b/hw/ide/core.c
> index 5d1039378f..8bf61e7267 100644
> --- a/hw/ide/core.c
> +++ b/hw/ide/core.c
> @@ -63,19 +63,19 @@ static const int smart_attributes[][12] =3D {
>      { 190,  0x03, 0x00, 0x45, 0x45, 0x1f, 0x00, 0x1f, 0x1f, 0x00, 0x00, =
0x32},
>  };
>
> -const char *IDE_DMA_CMD_lookup[IDE_DMA__COUNT] =3D {
> +static const char *IDE_DMA_CMD_lookup[] =3D {
>      [IDE_DMA_READ] =3D "DMA READ",
>      [IDE_DMA_WRITE] =3D "DMA WRITE",
>      [IDE_DMA_TRIM] =3D "DMA TRIM",
> -    [IDE_DMA_ATAPI] =3D "DMA ATAPI"
> +    [IDE_DMA_ATAPI] =3D "DMA ATAPI",
>  };
>
>  static const char *IDE_DMA_CMD_str(enum ide_dma_cmd enval)
>  {
> -    if ((unsigned)enval < IDE_DMA__COUNT) {
> -        return IDE_DMA_CMD_lookup[enval];
> +    if (!IDE_DMA_CMD_lookup[enval]) {
> +        return "DMA UNKNOWN CMD";
>      }
> -    return "DMA UNKNOWN CMD";
> +    return IDE_DMA_CMD_lookup[enval];
>  }
>
>  static void ide_dummy_transfer_stop(IDEState *s);
> diff --git a/include/hw/ide/internal.h b/include/hw/ide/internal.h
> index fc0aa81a88..e864fe8caf 100644
> --- a/include/hw/ide/internal.h
> +++ b/include/hw/ide/internal.h
> @@ -352,11 +352,8 @@ enum ide_dma_cmd {
>      IDE_DMA_WRITE,
>      IDE_DMA_TRIM,
>      IDE_DMA_ATAPI,
> -    IDE_DMA__COUNT
>  };
>
> -extern const char *IDE_DMA_CMD_lookup[IDE_DMA__COUNT];
> -
>  #define ide_cmd_is_read(s) \
>          ((s)->dma_cmd =3D=3D IDE_DMA_READ)
>
> --
> 2.38.1
>


