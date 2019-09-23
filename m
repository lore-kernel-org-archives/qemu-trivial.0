Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iCNk8-0003iI-Be
	for mharc-qemu-trivial@gnu.org; Mon, 23 Sep 2019 08:47:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51960)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iCNk5-0003hH-8y
 for qemu-trivial@nongnu.org; Mon, 23 Sep 2019 08:47:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iCNk4-0006nQ-3f
 for qemu-trivial@nongnu.org; Mon, 23 Sep 2019 08:47:00 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:44066)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iCNk3-0006my-Ui
 for qemu-trivial@nongnu.org; Mon, 23 Sep 2019 08:47:00 -0400
Received: by mail-oi1-x243.google.com with SMTP id w6so7400454oie.11
 for <qemu-trivial@nongnu.org>; Mon, 23 Sep 2019 05:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jV176iHH3a7T3Z7Nm5lkp7y1hfpdPt8AAf1Vbsv9mlo=;
 b=ukmwFMMKvEdg+p8uYqffGx9MIw3iVA0NQ0HICz+kzsAifpdL87G+WZS+QTbU5Oo2uL
 QtkiOdoPdwl+VWDDN+m8AkodmYd36usz/3fv8wc9+pWs3EWPJ+RgSx+mSzcgBjewxnmK
 ATcGf3/uMbzHsF8PdR2ghT73zXer69FJUQhapDOxvF4r6R2s7iXXDCpmWGxMCW/3aLac
 32vGMROG6ORpspMu7n5xtg4y1nApBt3p4CcCBp1WS5k4HQ2pRU1t6Hnb7GnzC3F8NQC1
 la72AkUR8Ev4dA72iOOn1ZYHsSVt63WJJsZpkWiU8zga0PQUedtEPwG3C8h8Mr+CKLD9
 gOIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jV176iHH3a7T3Z7Nm5lkp7y1hfpdPt8AAf1Vbsv9mlo=;
 b=aVbbrPARlEl6cjOBEXgeTKw+2QYnAzXEID+KzyzbkFA6yc2NhGaX6j8okAsD+QRBPB
 EI6i1JmdFP79cStmA8VdN+s1pZ3jghba767yGLLYCKPFvL3XTqG07Z/zLil3gz39M/ax
 Dt+wBpX/ZrE5X4Vbk1t7qTHXBOE5fgS8quYzpXENnDaYBbyobRPrh++glIsjJ5sCq6mp
 EO1CGeX+PhTuIeo+v0YohiPp4R/kYRlI7+GdX4oRI9JaOnMvNth/908NPliq/7ZvWzGu
 Ds5JAcPN2i6mnIdp7aHcIIVGxLwTl6IfA5VbXlJuIVXrxMsv2NqtVgj8h63JpopOI63g
 xe1g==
X-Gm-Message-State: APjAAAUe1uaQ/5rYfhI997KUguVJDZ0GFO//jZFCcbfGkqvp6SlwUbmE
 2rExbhfzzaOX5zwvTMy8vr0EpoNi8PoW6B1tcd47lA==
X-Google-Smtp-Source: APXvYqzmBuWVB3XNOwg1Jm00EZvD9MBkuGvA6s7KtruGDKZv8PGmMjIoCLiagpuE10y13JBQFu9eiz7MQZp/Qn+xFaM=
X-Received: by 2002:aca:f54d:: with SMTP id t74mr13547038oih.170.1569242818897; 
 Mon, 23 Sep 2019 05:46:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190923121712.22971-1-thuth@redhat.com>
 <CAFEAcA9jOD_mFOeVaAo5qsoj-Q0-U5qF8c85Am4ObgSn3b6irg@mail.gmail.com>
 <cff2b157-910a-a97d-3fe1-a862e781eac8@redhat.com>
In-Reply-To: <cff2b157-910a-a97d-3fe1-a862e781eac8@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 Sep 2019 13:46:47 +0100
Message-ID: <CAFEAcA-bUT4o0=Vs7zrnx_aS0XBaWuedsUv-rMu5cimV7S5a9A@mail.gmail.com>
Subject: Re: [PATCH] Disallow colons in the parameter of "-accel"
To: Thomas Huth <thuth@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::243
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
X-List-Received-Date: Mon, 23 Sep 2019 12:47:02 -0000

On Mon, 23 Sep 2019 at 13:42, Thomas Huth <thuth@redhat.com> wrote:
>
> On 23/09/2019 14.23, Peter Maydell wrote:
> > This seems pretty ugly.
>
> Yes. The whole "-accel" option is currently ugly. My patch is just a
> temporary work-around to prevent that we later have to deal with the
> fact that users started to use this colon here in the wild and we would
> then have to fight to get rid of it again.
>
> > If -accel is the way we're recommending
> > users configure the accelerator then it should support syntax
> > for specifying everything we could do with the old -machine...
> > option.
>
> No, we certainly don't want to have the colon in here. The idea is
> rather that you could specify multiply "-accel" options one day, e.g.:
>
>  -accel tcg,tb-size=2048 -accel kvm,kernel_irqchip=on
>
> ... and then the accelators are used with the right parameters in the
> order of availability.
>
> Per-accelerator parameters just don't work here if you allow the colon.
>
> (IMHO we should not have let the -accel code enter the repository in
> this shape, but rather insist on a proper implementation right from the
> start - but now that it's there, we have to deal with it and should make
> sure that it does not get worse)

Ah, I hadn't realised that -accel was a (relatively) long-standing
option; I'd just noticed some patches going past recently suggesting
we were starting to recommend it over -machine accel=.
Thanks for trying to clean it up a bit.

-- PMM

