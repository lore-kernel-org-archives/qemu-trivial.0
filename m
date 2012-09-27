Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1THJQl-00038K-MG
	for mharc-qemu-trivial@gnu.org; Thu, 27 Sep 2012 15:07:27 -0400
Received: from eggs.gnu.org ([208.118.235.92]:45527)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1THJQk-000358-7y
	for qemu-trivial@nongnu.org; Thu, 27 Sep 2012 15:07:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1THJQd-0006Te-Sv
	for qemu-trivial@nongnu.org; Thu, 27 Sep 2012 15:07:26 -0400
Received: from mail-da0-f45.google.com ([209.85.210.45]:56679)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1THJQd-0006TS-Me
	for qemu-trivial@nongnu.org; Thu, 27 Sep 2012 15:07:19 -0400
Received: by dadn15 with SMTP id n15so458391dad.4
	for <qemu-trivial@nongnu.org>; Thu, 27 Sep 2012 12:07:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=IWjE11XkKqptSkrHAqHl+UOJX5sQgaYSGlUAacyIfEs=;
	b=SDjEKw5a/ZyWB6uMFWh04v8viq2WdLwL9J8rWz/et8zn9tWEwLbOdl4stY7LHj7XVm
	SflgeOPj0e4BrxbFAQPJuY0EVD2ItbOVBAyffal6y0Q+3DiY2ecZQvxWv3RPIJfoXnnE
	H3rUO6ES1ynLYuKM7ujVtuBRPzgy5ncH5oBMordjyp4/mHVgABCUuO7eH/zm5Q6/HL+e
	DipLuPTTjrIS2dWTkb4YmiNllGtf3V2VTy2X4gJCaE4GToeNamj3duHyc7xfdup9ct4o
	CZqTAvOGY+VZsosXIcNDBkHW3HuIE1D/yqH2WDub4Tn48S+0SMm9Xw7nYkpNHUbGKzhQ
	ZgrQ==
MIME-Version: 1.0
Received: by 10.66.78.97 with SMTP id a1mr11773696pax.34.1348772838296; Thu,
	27 Sep 2012 12:07:18 -0700 (PDT)
Received: by 10.66.88.66 with HTTP; Thu, 27 Sep 2012 12:07:18 -0700 (PDT)
In-Reply-To: <1348772258-31168-1-git-send-email-sw@weilnetz.de>
References: <1348772258-31168-1-git-send-email-sw@weilnetz.de>
Date: Thu, 27 Sep 2012 20:07:18 +0100
Message-ID: <CAFEAcA_eSRXRqf5zhug=cYNCDQcWZ_=G5e=gchc1j=BrfC752Q@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQnE3rd/Fc1itLLwg/E0ZwQD9g8srjmPVDzlOC46kitZ7gYmikDUoGzG/8x+O/OuWVuu17ss
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.210.45
Cc: qemu-trivial@nongnu.org, Jan Kiszka <jan.kiszka@siemens.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] slirp: Fix spelling in
 comment (enought -> enough, insure -> ensure)
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 27 Sep 2012 19:07:27 -0000

On 27 September 2012 19:57, Stefan Weil <sw@weilnetz.de> wrote:
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>
> As a non native speaker, I feel that 'ensure' is better here than 'insure'.
> Could a native speaker please confirm that?

I would tend to agree, but I have a feeling this insure/ensure
distinction is more strongly held in British English than
US English...

>  /*
>   * Lower bounds on packet lengths for various types.
> - * For the error advice packets must first insure that the
> - * packet is large enought to contain the returned ip header.
> + * For the error advice packets must first ensure that the
> + * packet is large enough to contain the returned ip header.
>   * Only then can we do the check to see if 64 bits of packet
>   * data have been returned, since we need to check the returned
>   * ip header length.
> --

...however I think the more serious issue with this sentence is
not the spelling but that I really have very little idea
what it is trying to say. Is it "[error advice] packets" or
"error [advice packets]", or "For the error, [advice packets]"
or "For the [error advice], packets" ? And a packet can't
ensure anything anyway, so who is actually ensuring this
(and what happens if they don't do it)?

-- PMM

