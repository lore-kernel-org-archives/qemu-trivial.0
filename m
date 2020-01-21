Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iu1sZ-0003GK-4l
	for mharc-qemu-trivial@gnu.org; Tue, 21 Jan 2020 17:20:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51826)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1iu1sW-0003DT-7c
 for qemu-trivial@nongnu.org; Tue, 21 Jan 2020 17:20:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1iu1sV-0005yX-8t
 for qemu-trivial@nongnu.org; Tue, 21 Jan 2020 17:20:08 -0500
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242]:42543)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1iu1sS-0005xS-Tx; Tue, 21 Jan 2020 17:20:05 -0500
Received: by mail-lj1-x242.google.com with SMTP id y4so4518950ljj.9;
 Tue, 21 Jan 2020 14:20:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=JHFzAIFwxyGpvLCTen745Sva46nruWDZw5EOHo0p+hY=;
 b=CmJ24gh8g2WudUN3wVoYj7KA+9mwELvtIEimtw5v6bZb8Y55Sp2QnkOBBB8B83TaPe
 x4tU7fjKZSkeEDeTxKKFDleyNn3l24oMMSsdvc1HEhSlRuS52BVgjoX9v0DoKRjPTMDe
 MYUsOCW68uJQ9C6Dq3eDLxnLzo/nmWLCYNPnj3XK5GbnZrezTNZVxGnz3VRNhC5JipGe
 eVCeZ4HAaOeQdJ4XOKDzrNyEpyProns0r+w3H5tHStce6k5fCEzY319WTjUME23aNjEH
 CNM+HLoIWuHKY8qcto9exjAreomqdqU+MWdzfih2QGpGihXEJz5CmKTF629f17lwvCWV
 gRgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=JHFzAIFwxyGpvLCTen745Sva46nruWDZw5EOHo0p+hY=;
 b=dtC/nYSegA0Lo+0ydCnGaq+lzh13aNF/Bq85zNzteOnJL6j+4R5XbirczyeGOpOx1I
 XCA3xMQ7N7ffWXIAr1GS+bxFlq5na0YMWT0dDJuJ05PkbktfoAjoKqt19qnSqLH1GL+t
 Pmggs7d/NEDE4keZf6UKHJ8DwGQeOq9Uh5GvanSGxJkgFzZVn2QgqhUSl1MAqJLtkKNP
 Cbq1dxGXMcIS2BaSVayOS4/5E9UAZ1XmuJCYYGucsbgFeHUoZMYj9CZj0mwjQvlxUQU+
 FlZjzrgnzdzrbWNqiH1FqoQGaLocs7SZB0qu5NaDoO+OC3UAEgQGUE/9AYTnTjNQD8aR
 1gPA==
X-Gm-Message-State: APjAAAUwhb4ZG4awNoF/wYUJPWh6xZHfTnQixWJDJCW5PHVtP8wmex+9
 ZFgxoii21H3i2NNvD+BNRY7IM4WBsMlJXeT7Rtc=
X-Google-Smtp-Source: APXvYqwRTDMqPRIJquhpc/YmHMy/zmFu49PD0J5K46noQWRlWp3GS8Of/c9N221ybUksyzl/RRjCHGiwoGJYhAyfmH0=
X-Received: by 2002:a2e:8755:: with SMTP id q21mr17659585ljj.156.1579645203388; 
 Tue, 21 Jan 2020 14:20:03 -0800 (PST)
MIME-Version: 1.0
References: <20200121213853.9601-1-f4bug@amsat.org>
In-Reply-To: <20200121213853.9601-1-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 22 Jan 2020 08:19:35 +1000
Message-ID: <CAKmqyKNpd38uBkWGNBubcBjs4hpDsFFxakQhaPab07q65DtN3Q@mail.gmail.com>
Subject: Re: [PATCH] hw/misc/stm32f4xx_syscfg: Fix copy/paste error
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair@alistair23.me>, 
 QEMU Trivial <qemu-trivial@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::242
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
X-List-Received-Date: Tue, 21 Jan 2020 22:20:09 -0000

On Wed, Jan 22, 2020 at 7:39 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> Missed in 870c034da0b, hopefully reported by Coverity.
>
> Fixes: Coverity CID 1412793 (Incorrect expression)
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/misc/stm32f4xx_syscfg.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/misc/stm32f4xx_syscfg.c b/hw/misc/stm32f4xx_syscfg.c
> index dbcdca59f8..f960e4ea1e 100644
> --- a/hw/misc/stm32f4xx_syscfg.c
> +++ b/hw/misc/stm32f4xx_syscfg.c
> @@ -47,7 +47,7 @@ static void stm32f4xx_syscfg_set_irq(void *opaque, int =
irq, int level)
>      STM32F4xxSyscfgState *s =3D opaque;
>      int icrreg =3D irq / 4;
>      int startbit =3D (irq & 3) * 4;
> -    uint8_t config =3D config =3D irq / 16;
> +    uint8_t config =3D irq / 16;
>
>      trace_stm32f4xx_syscfg_set_irq(irq / 16, irq % 16, level);
>
> --
> 2.21.1
>
>

