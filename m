Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iBMTk-0007EI-3T
	for mharc-qemu-trivial@gnu.org; Fri, 20 Sep 2019 13:13:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34611)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iBMTg-0007DS-Vh
 for qemu-trivial@nongnu.org; Fri, 20 Sep 2019 13:13:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iBMTf-0005vB-G7
 for qemu-trivial@nongnu.org; Fri, 20 Sep 2019 13:13:52 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:44369)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iBMTf-0005ur-9k
 for qemu-trivial@nongnu.org; Fri, 20 Sep 2019 13:13:51 -0400
Received: by mail-ot1-x343.google.com with SMTP id 21so6776439otj.11
 for <qemu-trivial@nongnu.org>; Fri, 20 Sep 2019 10:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=akZy2G337scOZVKyPuAxDiFIaL85vXe8WuizeX52pWw=;
 b=Xt20TEND14dTL83RP0n20or0T9aWtwBA0fe0XsPLIKtKrYoNriqjwBB/IC4OdaUwSu
 5hWmvR1rOuODpbMVwzn3EhvPj3fnDWoIkXTp4M7R0rKPe7j3cD2X/7+UTMKk4LlRs4XP
 553UD9WIhp15iHfY7Su8NdQXqWxufXfFENruC2qn5sZbqOYt6023G8lm8h/BDxA2/CBT
 f/dgKRpsls1XKmpeIjXEBOmM5ckX/3u8/WcH/66uXajwAxCch2Szh/GdLblGFQsjWOGy
 YHdgvj93DT5ep2HC1gjuYpwrSP+sbs203AOh/yQBFUSiT9oMOJnJBBSuTxPnM/CHtXtD
 VCNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=akZy2G337scOZVKyPuAxDiFIaL85vXe8WuizeX52pWw=;
 b=iCjUifqJZGAxubAo46EVtO189MAj548ZHNQX++izmo4Ww3/aR1EOKZg6rWVA0xbUbN
 zOns+8f/gY1RflxS1HnLo2dMiIRBk2m7+vMgskv+2gjlSuUrAxJwFquQDTZhAwfWjem5
 HOiVlEvbTM280DXVd4L2cSuESVi88RnwMzc6n/EUwg7bObVMeEcvEsCGMKagL3QwK9I/
 2Ktoa0o+sSURKI+NJIlKtrOvJvAKrdrBn51BQnGPoByoZSVssZwcgNgrDQDrbXq+6UWF
 2PPTfES0G2HR89K3ugNlV5yGbXmDSk3l9yjQwITkbIHAkA69CDPZyANtxdsIiI5xOnPY
 kWBQ==
X-Gm-Message-State: APjAAAXN4XyXLql6UrlFDgCDYopEUw3u8X6wUmx9HzRid3TucdAb740S
 sGpZ1lukIq2w5AHXJnT0KVDOFXkyhTZzUHVn4MaVEg==
X-Google-Smtp-Source: APXvYqysG/95Yc/pbxR71k6CQG6JzzT21PaA4X+tKW37BQPhwucS212r8sHDois6aNMfinNOCLGp875pYzuVIDO1C10=
X-Received: by 2002:a9d:4615:: with SMTP id y21mr5072991ote.97.1568999630436; 
 Fri, 20 Sep 2019 10:13:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190920171159.18633-1-philmd@redhat.com>
In-Reply-To: <20190920171159.18633-1-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 20 Sep 2019 18:13:38 +0100
Message-ID: <CAFEAcA93w21JOF7cA2zW+gKDXet=T920ghFqRw9qk2KQWmoeow@mail.gmail.com>
Subject: Re: [PATCH] roms: Add a 'make help' target alias
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, 
 John Snow <jsnow@redhat.com>, Laszlo Ersek <lersek@redhat.com>
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
X-List-Received-Date: Fri, 20 Sep 2019 17:13:54 -0000

On Fri, 20 Sep 2019 at 18:12, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> Various C projects provide a 'make help' target. Our root directory
> does so. The roms/ directory lacks a such rule, but already displays
> a help output when the default target is called.
> Add a 'help' target aliased to the default one, to avoid:
>
>   $ make -C roms help
>   make: *** No rule to make target 'help'.  Stop.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  roms/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/roms/Makefile b/roms/Makefile
> index 6cf07d3b44..3ffd13cc7e 100644
> --- a/roms/Makefile
> +++ b/roms/Makefile
> @@ -51,7 +51,7 @@ SEABIOS_EXTRAVERSION=3D"-prebuilt.qemu.org"
>  #
>  EDK2_EFIROM =3D edk2/BaseTools/Source/C/bin/EfiRom
>
> -default:
> +default help:
>         @echo "nothing is build by default"

If you felt like fixing a typo, there's one here: should
be "is built"...

>         @echo "available build targets:"
>         @echo "  bios               -- update bios.bin (seabios)"
> --
> 2.20.1

thanks
-- PMM

