Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kGNqw-0006Ja-0P
	for mharc-qemu-trivial@gnu.org; Thu, 10 Sep 2020 10:47:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liq3ea@gmail.com>)
 id 1kGNqq-0006GL-T7; Thu, 10 Sep 2020 10:47:07 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:41036)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liq3ea@gmail.com>)
 id 1kGNqp-0001uV-8U; Thu, 10 Sep 2020 10:47:04 -0400
Received: by mail-ot1-x342.google.com with SMTP id w25so4334409otk.8;
 Thu, 10 Sep 2020 07:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=gRGii109ACTf1SCv0Pay75ufkTGiXupLF/V67dKySns=;
 b=XXWMUJ+yZPcT/k5Oy3jJW6Pu0G4qGsuJ4YwPz1ndf04Or5niSoX0+Ng18TubvtdWe4
 zE6x7R2JEmeaxrALsSoAXuCJAGrIZ+wPZauz8K9ileX4prSA1kWk6L3YkXfn4LzA5dgK
 28DjRU6Lvo1mFXt5PZO7/Zf3ONvxHleIL+wJncD5B0ZQIazPS1YABHyIa8LGvFBg+IQM
 1WaAj5U0Fq591hbNukTsjANq/8Bz+vIRxu63acHxyulqm+7OX6GF+bPE8wGIWCPSlLuL
 rgF4BwG+HKj8pTktNyCdFnua6Ki/8wdJLq9svSdgPuzNEcvC0bnOW0PtPviEo4xYXLAg
 GOCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=gRGii109ACTf1SCv0Pay75ufkTGiXupLF/V67dKySns=;
 b=Xe0cZr4J0YEsl9k7ecFCEMiWOZASSfk3YpkVzqKoTB9b9GTkPOPr9DkDjKYF2Mi0r/
 skU3F6y1C70+0B5mPH24w7elaS3KEzLEgkHjKL9luUb8amiZog4XHwwkC3QFxel4zG40
 E39WwaxEAGzr8UMhPPYspPMy1R2YDmo9yUTtdpOHyZBZ/svDs5lTaaOGLWaf0YXRqHAT
 LsWePksh+p+7ww1fKOKMJakkA/yMBvb+3bYTeyCzoa8d/Z/eGJ5TBFDMHWiEXMKItxqN
 53WqZK0MPHFjr+fSsJki58Hx/4oA2oEz2TXmIYlGhAP+LsLmWoZ6fuW8zE4webOSTOEu
 zipQ==
X-Gm-Message-State: AOAM5319TJXSyjGxhvCtf0tXUaU+iiRbyAWZu8PJ/IhF2MY0piF9wb2a
 Ng8B/CKzIa3UxqSj0UwvFHccLLAkNGtBu4rR9fA=
X-Google-Smtp-Source: ABdhPJxvofxKYwDYE0nNdVZU65dAdLoT1gxWlD+drHfDU7XDXweQ6TlbTc1XQOTVUKLyUTVtSHhWYt3C0MmLb8QeY+I=
X-Received: by 2002:a05:6830:610:: with SMTP id
 w16mr3863303oti.353.1599749221441; 
 Thu, 10 Sep 2020 07:47:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200910135852.516809-1-philmd@redhat.com>
 <20200910135852.516809-2-philmd@redhat.com>
In-Reply-To: <20200910135852.516809-2-philmd@redhat.com>
From: Li Qiang <liq3ea@gmail.com>
Date: Thu, 10 Sep 2020 22:46:25 +0800
Message-ID: <CAKXe6SLhDWvWU_D-87sb0sHfNOO9dkPPS4EiVjuXuHLiCbGKgw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] hw/timer/hpet: Remove dead code
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: Qemu Developers <qemu-devel@nongnu.org>, Thomas Huth <thuth@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>, 
 Laurent Vivier <laurent@vivier.eu>, Dov Murik <dovmurik@linux.vnet.ibm.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=liq3ea@gmail.com; helo=mail-ot1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 10 Sep 2020 14:47:08 -0000

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> =E4=BA=8E2020=E5=B9=B49=E6=
=9C=8810=E6=97=A5=E5=91=A8=E5=9B=9B =E4=B8=8B=E5=8D=8810:01=E5=86=99=E9=81=
=93=EF=BC=9A
>
> This code was never compiled/used, remove it.
>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Dov Murik <dovmurik@linux.vnet.ibm.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/timer/hpet.c | 14 --------------
>  1 file changed, 14 deletions(-)
>
> diff --git a/hw/timer/hpet.c b/hw/timer/hpet.c
> index 380acfa7c8a..b683f64f1d3 100644
> --- a/hw/timer/hpet.c
> +++ b/hw/timer/hpet.c

Maybe we also remove the
"//#define HPET_DEBUG"
in the head of this file?

Thanks,
Li Qiang

> @@ -416,20 +416,6 @@ static void hpet_del_timer(HPETTimer *t)
>      update_irq(t, 0);
>  }
>
> -#ifdef HPET_DEBUG
> -static uint32_t hpet_ram_readb(void *opaque, hwaddr addr)
> -{
> -    printf("qemu: hpet_read b at %" PRIx64 "\n", addr);
> -    return 0;
> -}
> -
> -static uint32_t hpet_ram_readw(void *opaque, hwaddr addr)
> -{
> -    printf("qemu: hpet_read w at %" PRIx64 "\n", addr);
> -    return 0;
> -}
> -#endif
> -
>  static uint64_t hpet_ram_read(void *opaque, hwaddr addr,
>                                unsigned size)
>  {
> --
> 2.26.2
>
>

