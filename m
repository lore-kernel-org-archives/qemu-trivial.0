Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j6Y8t-0004PZ-Ao
	for mharc-qemu-trivial@gnu.org; Tue, 25 Feb 2020 06:12:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40321)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j6Y8n-0004OM-Kv
 for qemu-trivial@nongnu.org; Tue, 25 Feb 2020 06:12:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j6Y8j-0001wO-R4
 for qemu-trivial@nongnu.org; Tue, 25 Feb 2020 06:12:41 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:43156)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j6Y8j-0001sv-Ku
 for qemu-trivial@nongnu.org; Tue, 25 Feb 2020 06:12:37 -0500
Received: by mail-ot1-x342.google.com with SMTP id p8so11671710oth.10
 for <qemu-trivial@nongnu.org>; Tue, 25 Feb 2020 03:12:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=L/GN5mShHBdnMRsP6mdQ//WBZsXiUqXKixKlNorJjQE=;
 b=zuGh9yAIv9G+F8cH8ykqjiNbtXb5RYe6zff/EI2qlsqNxe9t5iNk7KE+aKI/dDGHsg
 G2JVu72xV9ZcvhCsCyxohw74kQyxUUKW3J4N4SCZ5ip48iJcsu4Lutxm76zlp68QebN5
 2XHwYnyXLi3w97OoYC8QgnGl1QxkAZUiw6rfYs1dGGK8fnwUqrjckCwMJrQ8batj7AZV
 v8wNQ8ZV9HMJn8MCFim4Xs4g5zqLhJippEAwYY2Znk8V+ycHgOkhJFqQu0CuHU170Vg1
 PVeYbfHd+Ck0T9n/2Rv51uSstkKo0rt2+fBcVn4kIPF8/G+2SzROcPkFygqm+gpu12FY
 iMQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=L/GN5mShHBdnMRsP6mdQ//WBZsXiUqXKixKlNorJjQE=;
 b=qX2+dlEneWrxmhRrCLvc+wwhvpg6rRTHazcA0Rmvu/X++M3jAHjlxtmg/TCT8V0gt2
 jO8splKec6q9n2+kRA0wKQisziRfGbLLfbJrYSOLOcwiPl9wjgaNF5z0BCwZv8UyBxcG
 e/PVGu1DIIw5WPqWX6T4kZiQFegVifePCa3dNLyyoK2jczRNqkCWR8CHnAT73U8r5sXf
 qq12uCAq/Fb7andmEPP7bq/LbPIBAgfOK8T/+LulZWM0G+pAVrywyLGOvkdoccfsPkRr
 gQP2nkkfLY085W27UP2JLXScMk3uQAvDBRv4mEjCSh+Tz8IUb4/VSd1uAe4B7DEMEBj1
 GENg==
X-Gm-Message-State: APjAAAUEvISFdIiAPbzfC29LWegRLPO6EafS7+eLzNfYfOhR+sKm4L/Q
 oAr2XcGUVuSxhb5lvrR6p/rk9j0NJjDc4S2P7bQ8jQ==
X-Google-Smtp-Source: APXvYqxTfDOt4FhRBcYRutD1FOqm+EHk0nWZrbqzNksxoTguCqQesMxiAeMNUd7aRRtdcv6xbpf2msooXoUi0bePKKo=
X-Received: by 2002:a05:6830:13da:: with SMTP id
 e26mr41230319otq.97.1582629156559; 
 Tue, 25 Feb 2020 03:12:36 -0800 (PST)
MIME-Version: 1.0
References: <20200223231044.8003-1-philmd@redhat.com>
 <20200223231044.8003-2-philmd@redhat.com>
In-Reply-To: <20200223231044.8003-2-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Feb 2020 11:12:25 +0000
Message-ID: <CAFEAcA_H7aWjtoky=o2uKpNjZnebuskn-fFUMXbq=Gja5vyaBA@mail.gmail.com>
Subject: Re: [PATCH 1/2] hw/arm/gumstix: Simplify since the machines are
 little-endian only
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>,
 Michael Tokarev <mjt@tls.msk.ru>, QEMU Trivial <qemu-trivial@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
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
X-List-Received-Date: Tue, 25 Feb 2020 11:12:45 -0000

On Sun, 23 Feb 2020 at 23:10, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>
> As the Connex and Verdex machines only boot in little-endian,
> we can simplify the code.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---

>  static void gumstix_machine_init(void)
>  {
> +    if (target_words_bigendian()) {
> +        return;
> +    }

I don't think we really need to do this, do we? We don't
in any of the other arm boards that just assume little-endian.
I think TARGET_WORDS_BIGENDIAN will only be true on Arm for
the BE linux-user targets, never for softmmu.

Also, there's a warning comment in the header file for
the declaration of target_words_bigendian() that says
you probably don't want to use it...

If you drop this, then otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

