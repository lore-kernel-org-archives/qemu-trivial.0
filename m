Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1f80Q0-0001CP-9j
	for mharc-qemu-trivial@gnu.org; Mon, 16 Apr 2018 05:27:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44940)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f80Px-0001Bc-KN
	for qemu-trivial@nongnu.org; Mon, 16 Apr 2018 05:27:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f80Pw-0004hJ-TC
	for qemu-trivial@nongnu.org; Mon, 16 Apr 2018 05:27:21 -0400
Received: from mail-ot0-x242.google.com ([2607:f8b0:4003:c0f::242]:45240)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1f80Pw-0004ew-MW
	for qemu-trivial@nongnu.org; Mon, 16 Apr 2018 05:27:20 -0400
Received: by mail-ot0-x242.google.com with SMTP id w2-v6so5650094otj.12
	for <qemu-trivial@nongnu.org>; Mon, 16 Apr 2018 02:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=xzDne0MAUqC7TDqQZeIE7c7Xx88IHN5EzQnixpuxLgA=;
	b=WqVcNG18fbfszwAsOrEwzRzedDffK0N0EC3prQ1aOK6otNOpo/Fqzxc0TiwWgaoQWv
	qKOyE7eJppFTZeaPuJj6FjLQxf43YN8WUfRWtuGSlf2NrMhex2SCEKVgRUhVbpZBlTW8
	gmSU2YWTpB8cjrgJLSIUIFtc+jUd14fqUsKX0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=xzDne0MAUqC7TDqQZeIE7c7Xx88IHN5EzQnixpuxLgA=;
	b=Bo8dyGykReseH2VEz90BnfjeC7uOR8XCE1OEcDHbBm+l5bnsiarI1WWFUiycV0pGFT
	dtHI9021jX2ZjR5wdfn4/L2I5qbLDYRGagMBNw4I4ICC+aK0BItUiiJaIi3+3pGDf1yo
	IGhDDamzBjZrdpWr5I+zfMYvSg9oWNVrUUdA5IJHpwkbqbkfex34gWlkLgEWqFpAap8t
	QLDxVVv1WT+EaWlfz55OYnsVEdtKKaplPLn+5G/raa6ZlJY9UY0Z8fwVT/VMZbu50X1D
	EOHyIMz/s5nbh7jH2td3WLUjG9adQiHTqR9ZvAURlM4+gg/HziKqc43S1+e0mqaYp8N4
	A3Qw==
X-Gm-Message-State: ALQs6tDNRqGfbR9L4JIrUXXLHfyEUjyxLgrJffSIE0wgMQKrMMkMqHOK
	GyuRAu9A78R6y58j1hjt48zkzb52977eE5h6bMZg4A==
X-Google-Smtp-Source: AIpwx4+XNnnCr5jHMN5/YvnxQPIcjsmt9W/AY81lbpbar0+gSCouWMgqLWt3fZosCkF88nlEuGqSmrr3/9n58yxe05E=
X-Received: by 2002:a9d:3539:: with SMTP id
	o54-v6mr846665otc.205.1523870839875; 
	Mon, 16 Apr 2018 02:27:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2286:0:0:0:0:0 with HTTP; Mon, 16 Apr 2018 02:26:59
	-0700 (PDT)
In-Reply-To: <20180414142739.23375-1-mjt@msgid.tls.msk.ru>
References: <20180414142739.23375-1-mjt@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Apr 2018 10:26:59 +0100
Message-ID: <CAFEAcA_isnmigyPV=bZtyJ3r++8pc__7b9z12FEtd6SHJum9mg@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::242
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH trivial for-2.12] Makefile:
 install gtk message catalogs if CONFIG_GTK=y too, not only =m
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Apr 2018 09:27:22 -0000

On 14 April 2018 at 15:27, Michael Tokarev <mjt@tls.msk.ru> wrote:
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index 727ef118f3..8644c2e918 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -856,7 +856,7 @@ ifneq ($(BLOBS),)
>                 $(INSTALL_DATA) $(SRC_PATH)/pc-bios/$$x "$(DESTDIR)$(qemu_datadir)"; \
>         done
>  endif
> -ifeq ($(CONFIG_GTK),m)
> +ifneq ($(filter $(CONFIG_GTK),y m),)
>         $(MAKE) -C po $@
>  endif
>         $(INSTALL_DIR) "$(DESTDIR)$(qemu_datadir)/keymaps"
> --
> 2.11.0

"trivial" and "for 2.12" don't make much sense together at this point in
the release cycle. Is this important enough to go into rc4, or not?

thanks
-- PMM

