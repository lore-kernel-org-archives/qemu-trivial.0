Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iuDDj-0002LF-NJ
	for mharc-qemu-trivial@gnu.org; Wed, 22 Jan 2020 05:26:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58131)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1iuDDg-0002Hv-CW
 for qemu-trivial@nongnu.org; Wed, 22 Jan 2020 05:26:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1iuDDe-0002ug-Pl
 for qemu-trivial@nongnu.org; Wed, 22 Jan 2020 05:26:44 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:40056)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1iuDDe-0002te-IM
 for qemu-trivial@nongnu.org; Wed, 22 Jan 2020 05:26:42 -0500
Received: by mail-wr1-x443.google.com with SMTP id c14so6633186wrn.7
 for <qemu-trivial@nongnu.org>; Wed, 22 Jan 2020 02:26:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=HMQpvxEKbEDAeRkf4OY+Hn1X5JhhpxYJX6+ZnaZn7ZE=;
 b=ANzn0hdqBoKoYYGbV/wLvEH8YyAKk194fBMDRdByMyHk9LrkuRZjHthno6a50kzorL
 wgCvD+4koGRj64/mjuKug9R4IZHT13WLk3+gjPXh92vZSzze87sQPNYumFsaxTX7WR8b
 sOkBdqhPBcZGWqVEz2wvQ2/tcw6a0uiZDTykmepCKOEp9Nnv+oKPr7Y+tS5toX3FJV+8
 0wmGNq5tC6CTj0F0oZ4hyyoHKv0ylLL3+EfLjQiFZnW/nRCSpeoxg0Ij4Q5zibUIGTvi
 r9WMTdLjHQPFsUsfy5dBqvR9iHaRET1X4cLvGvwGJxTjnqA90cmbkOT1NFyBJWPkrW2W
 MVEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=HMQpvxEKbEDAeRkf4OY+Hn1X5JhhpxYJX6+ZnaZn7ZE=;
 b=XjPpCZmHBrkPi41ZlkY34awzwtrL6PxEsqURyK/HXExVoPmSL0D0hb0HdGawbdsXEN
 lmlSICkCtipDunS321kGkJpnIosmOEj8Nn/QK6qbKPvPYe8d/yspNPRZXy1MugSKsx3D
 L8dJNBjs/s9wJz/oqzNCmWk/rIPpKocZ4bASbovKPFfgfjXFW/nKo4bJLijwkfmQ2kh+
 AxTc/eNKQ/ktJ6tQI3iStuqUuC5t7z7HMaGa6acsfesA5P3+dlbqlGj0bZZhJQkCfGiI
 EeI7nyVNyIb1e9qrpgOSTsnd9NR2oeQIn5e56WnW7aDTn/XMKPa0vBpQ2/pZQkzX/kzv
 Mg3g==
X-Gm-Message-State: APjAAAUnLl5tHbV6we3OBVG3BgFX/O/pKGflomWxdkzxAC5g8YvtOUfI
 M+F6Gb2yJKqJ6UJ5Vydapk+KLxHmUvY=
X-Google-Smtp-Source: APXvYqwB/SnLmn4Tri3v/6Dq6VgEbP7hYWIAeV0eMELMnX6iR6lrh3QzFKzFGZWb9BPKjh9dFJDyvg==
X-Received: by 2002:a5d:4692:: with SMTP id u18mr10468824wrq.206.1579688800384; 
 Wed, 22 Jan 2020 02:26:40 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id t125sm3462104wmf.17.2020.01.22.02.26.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jan 2020 02:26:39 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D17B71FF87;
 Wed, 22 Jan 2020 10:26:38 +0000 (GMT)
References: <20200121213853.9601-1-f4bug@amsat.org>
User-agent: mu4e 1.3.6; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: Alistair Francis <alistair@alistair23.me>, qemu-trivial@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Subject: Re: [PATCH] hw/misc/stm32f4xx_syscfg: Fix copy/paste error
In-reply-to: <20200121213853.9601-1-f4bug@amsat.org>
Date: Wed, 22 Jan 2020 10:26:38 +0000
Message-ID: <871rrr23dt.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
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
X-List-Received-Date: Wed, 22 Jan 2020 10:26:45 -0000


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> Missed in 870c034da0b, hopefully reported by Coverity.
>
> Fixes: Coverity CID 1412793 (Incorrect expression)
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

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
>=20=20
>      trace_stm32f4xx_syscfg_set_irq(irq / 16, irq % 16, level);


--=20
Alex Benn=C3=A9e

