Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iudvO-0004Hf-BX
	for mharc-qemu-trivial@gnu.org; Thu, 23 Jan 2020 09:57:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40091)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iudvL-0004Ce-61
 for qemu-trivial@nongnu.org; Thu, 23 Jan 2020 09:57:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iudvK-0007lS-5T
 for qemu-trivial@nongnu.org; Thu, 23 Jan 2020 09:57:35 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:36223)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iudvJ-0007ix-Ur
 for qemu-trivial@nongnu.org; Thu, 23 Jan 2020 09:57:34 -0500
Received: by mail-ot1-x343.google.com with SMTP id m2so3006237otq.3
 for <qemu-trivial@nongnu.org>; Thu, 23 Jan 2020 06:57:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=78OoLEKFshaco3XqlhTyDxZN2Mdmre/EN0v1XtzbuR0=;
 b=ZWmV9fw7omIzoYFDr9pbun5Qfn3dVDRHV4eAiqcI08YWzC/lXrf6WZEcfJ1DWaX3wq
 uHzQUXzgfz5kBsTDzHjXPn3IkBBd6X9+bqLWLXTlUCr8WrwR+uokTnZUmxJOSnFkHm6Q
 GrYGZE52ERXMWOdYyQxwD9L3+2vCBoqbT7BkBPx8FfvMunp0ycengbtd099f0Lpcz+I0
 qYI6m/7MCO+vSV32ycQLSiWk3QFBUlxRKAE/T4Bj/24o66MTfDUGkBHtZFeMkDMQhMGf
 62gPC1tqlu7DHDh6rIh5AQIYNv5QQxkbbFbTtJikJBCa/2r/U0PwzHrcXtrNum2J0sE7
 iTyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=78OoLEKFshaco3XqlhTyDxZN2Mdmre/EN0v1XtzbuR0=;
 b=T2dhBi5HXxtveYMFc1ilrcNO3sPtGRXvMqf4Z0bsU7FEgfHq180uNEGQND7t9jQusf
 4lWzwG3YU5km55IC56IcFxAytmMET0NO3U8+uovj9JQPD+yrps3rFNd8HBimCknRmxup
 VTJKENzUHKNjZpcTu5S/I1RtziyWibaxXvtFrQMtILbKZLt82zRO1uslDk/784X5fHAY
 tFbOFMZ28WeaON2w6BfbPz3lhTrFBA+jO4bRN8hjBTgSDjHLa+l5gA86BDsVTEO8L8n4
 Vw7wLkxxd8Y9heKFwEMHrkNANVsWN0dCWK35BQ2kybIBuxY6FAKW9FfSijia4CQ5gQNI
 mqOw==
X-Gm-Message-State: APjAAAVTg6th09krQlg4Ajs53R+hIO7Jpw9xq1lEuIfDBF8dSGqgOGXR
 ZTeJxXKPAPpi+NnqFHu5OiLarGroqxgpCYyf8Gr5fw==
X-Google-Smtp-Source: APXvYqxeoCf+W762Ucg8W/W4FjNefJdeQ8bYNiSyC9LFCiEAsMtG9gtLOoHuwJfzdfCTdoTooem8+bs3ddCSunh36B8=
X-Received: by 2002:a05:6830:184:: with SMTP id
 q4mr11914530ota.232.1579791453016; 
 Thu, 23 Jan 2020 06:57:33 -0800 (PST)
MIME-Version: 1.0
References: <20200121213853.9601-1-f4bug@amsat.org>
In-Reply-To: <20200121213853.9601-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Jan 2020 14:57:22 +0000
Message-ID: <CAFEAcA_yVNoFjgTcdCfxzzLLrz2jpENS9FZVp9vWS2X-R11REA@mail.gmail.com>
Subject: Re: [PATCH] hw/misc/stm32f4xx_syscfg: Fix copy/paste error
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Alistair Francis <alistair@alistair23.me>, 
 QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
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
X-List-Received-Date: Thu, 23 Jan 2020 14:57:37 -0000

On Tue, 21 Jan 2020 at 21:38, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Missed in 870c034da0b, hopefully reported by Coverity.
>
> Fixes: Coverity CID 1412793 (Incorrect expression)
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
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



Applied to target-arm.next, thanks.

-- PMM

