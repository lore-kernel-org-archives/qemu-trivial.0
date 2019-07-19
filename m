Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hoSvg-0004FJ-Sj
	for mharc-qemu-trivial@gnu.org; Fri, 19 Jul 2019 09:28:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35685)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hoSvd-0003xW-8i
 for qemu-trivial@nongnu.org; Fri, 19 Jul 2019 09:28:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hoSvb-0001YS-7S
 for qemu-trivial@nongnu.org; Fri, 19 Jul 2019 09:28:05 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:37539)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hoSvZ-0001SZ-7r
 for qemu-trivial@nongnu.org; Fri, 19 Jul 2019 09:28:03 -0400
Received: by mail-ot1-x341.google.com with SMTP id s20so32729431otp.4
 for <qemu-trivial@nongnu.org>; Fri, 19 Jul 2019 06:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ECweQ8b5l2IXjTHHRPDiyXHCMEYiAltfuQKVLF+9+Ms=;
 b=vDb8SeFej0bFJaUjtpGy2PwnXz9eirk4pUk8tFijTLZah3re55SESJqP0cEYIXVmxv
 /mUmJgU0gvM/aQAihp+RK3aruLPE4ByBz6Fimlggi76CermZgyZOz4NHObJ4riZcUc+p
 phuSdVV3NjYIbxKUBkdbXTdyU6cTBSXrIngw4QWAktG50jAM5BlpRDWvQvHpN1UZwKke
 U5U8JVsREtu9G22K50zvh4pUaxulsSWUPzObD7+Xnu1CDSKBrWoadTpZfAZ0BkSAnkuS
 UmGlRQdSfNKVhtr9UftcxuG++KRyIAE2gM39kIVuNLW4P732/fCAwq3sNSojH2sv44P1
 LR6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ECweQ8b5l2IXjTHHRPDiyXHCMEYiAltfuQKVLF+9+Ms=;
 b=oi5c5CuCWgzhB5M6fdRB/rJ/nhFKczhI3o/2ggdu5yNBAmdBQo5Q8wqsyT3BLcZcMb
 pAy/fdgy7U/oJslU8ue2v7XCnd51JQkCijJl+V+BCPATBIrp4v/y8CT05piFBOotAdto
 HeE7TjkpzAyJvg/mQ++HU3iEaQwoirxTXSEYDJcoqMYsJYopIzxEVYtNmxomIph1ddWZ
 Vu4fZN+BHkc/a4XgefGqbO/FVlDe/cbUGqC6NRubnSJeGgGrfOzXHn6WlqLtvHJ0IAIS
 bIvNYxssw7/fqJ5b6dJb8pYDD1mwaQ4dyiQXCw6Nd/CUUxVwh2SuHxtpDUaIMz51A43G
 8PZQ==
X-Gm-Message-State: APjAAAXyb7WId+OVH6QXX221K5mmWZbbn/xIpFQYFJByT3O3ghB7iwlO
 jdBRi0HbhzHUmIacxP1LZeKsguwtmWkuL+tXdSxxLg==
X-Google-Smtp-Source: APXvYqypePzgWa+haxMU3TbByP3/Ib8erdkrKPdFjxIVA+eajSA9rnB58T9ey4EBpOKCNWvlm/Ls3KMIimrm0l6ulc0=
X-Received: by 2002:a9d:5f1a:: with SMTP id f26mr2895672oti.91.1563542880085; 
 Fri, 19 Jul 2019 06:28:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190719131425.10835-1-philmd@redhat.com>
 <20190719131425.10835-4-philmd@redhat.com>
In-Reply-To: <20190719131425.10835-4-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Jul 2019 14:27:49 +0100
Message-ID: <CAFEAcA98bsjtbROzG9dew78ibu-QMSww028-vFSXQ389HJOq0A@mail.gmail.com>
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
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-trivial] [PATCH-for-4.1 3/7] hw/block/pflash_cfi02:
 Rewrite a fall through comment
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
X-List-Received-Date: Fri, 19 Jul 2019 13:28:07 -0000

On Fri, 19 Jul 2019 at 14:14, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> GCC9 is confused by this comment when building with CFLAG
> -Wimplicit-fallthrough=3D2:
>
>   hw/block/pflash_cfi02.c: In function =E2=80=98pflash_write=E2=80=99:
>   hw/block/pflash_cfi02.c:574:16: error: this statement may fall through =
[-Werror=3Dimplicit-fallthrough=3D]
>     574 |             if (boff =3D=3D 0x55 && cmd =3D=3D 0x98) {
>         |                ^
>   hw/block/pflash_cfi02.c:581:9: note: here
>     581 |         default:
>         |         ^~~~~~~
>   cc1: all warnings being treated as errors
>
> Rewrite the comment using 'fall through' which is recognized by
> GCC and static analyzers.
>
> Reported-by: Stefan Weil <sw@weilnetz.de>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/block/pflash_cfi02.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
> index f68837a449..42886f6af5 100644
> --- a/hw/block/pflash_cfi02.c
> +++ b/hw/block/pflash_cfi02.c
> @@ -577,7 +577,7 @@ static void pflash_write(void *opaque, hwaddr offset,=
 uint64_t value,
>                  pfl->cmd =3D 0x98;
>                  return;
>              }
> -            /* No break here */
> +            /* fall through */
>          default:
>              DPRINTF("%s: invalid write for command %02x\n",
>                      __func__, pfl->cmd);
> --

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

