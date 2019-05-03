Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hMa1w-0005Zc-3H
	for mharc-qemu-trivial@gnu.org; Fri, 03 May 2019 11:23:20 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59273)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hMa1t-0005Vd-9I
	for qemu-trivial@nongnu.org; Fri, 03 May 2019 11:23:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hMa1s-0002rs-BT
	for qemu-trivial@nongnu.org; Fri, 03 May 2019 11:23:17 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:36991)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hMa1s-0002pR-5q
	for qemu-trivial@nongnu.org; Fri, 03 May 2019 11:23:16 -0400
Received: by mail-ot1-x343.google.com with SMTP id u3so168466otq.4
	for <qemu-trivial@nongnu.org>; Fri, 03 May 2019 08:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=MM3r1FelcMy7Ge5cg7T3YTSEvPOSts9EPRJNBOPlTmg=;
	b=kZfWUY6FnY+FRcBI9clf0qi/U3MRWXsTd6iRehwoAxXqS+nO4afv5fYqekk4AYIGAM
	EooPwYKjydTNWwyaqKJs8k2cYqN7FXOtDHW63hAJ+1pSIAQVN/zG7MS5FR3avHQOdELi
	aPyPM2ml3Ljz+qnRzKuX8fTSvzOAb5IGZJ5DN9yVihsfBY5nZR4UGbgyyFrMZU2v3Ghy
	QqFWv7ieVdzk8pzogrfkGqdFmyNwQi0ije1OKoBtn4lg43zGBjxgPDS+5Dd72DPFjoTR
	FpGI1CpaZHk4ft5azaoZJQI7N4YEFUc01uqLVSogC7pnR2s6FyakbhCAu8lu72jWYNiD
	XdOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=MM3r1FelcMy7Ge5cg7T3YTSEvPOSts9EPRJNBOPlTmg=;
	b=aRGF8OupLVEeoO+7vxck4+3vW9XYsZW29z6td1ZNOva9FMl//MU1gwkGkmB4jXINcH
	rKO8Hn92ykSYGdXywbMfLo7+17JAz0ErURklnyeJXQm05BBx4Q3A7cSXxShtdsmjY+Iu
	/6LgMRiV1tyaLbXe3wyKpxhBdnIQz0dgZSBspHG3W4hYkPGyJkn2swj7kTIM34Pw0S/4
	gY/bYAZSXsroFxDmlafi6x2ea2qGICjJmyt3PpngFvT8gppIeUaDjgS1e1ORnUMaCPJF
	jbgdNehoQtdPDsQZAncIrPYhv3IrmDMRiS5F5FJBrTNzqQWETdrKxtUbggIzpulqr8GK
	ggIg==
X-Gm-Message-State: APjAAAU3D9JMXrnUBrZNyYWVmulNGrFvzhn11p1TyxfavzVoU9QEDeaR
	PAJ3lhjXU1xDBD4w4NfVbAh0ZDfQvu/o7y5uW2uw5A==
X-Google-Smtp-Source: APXvYqzzvTNktCTxIr0vU40qrF958g7SdvBaGaRJTHuyn7+Hx0TwfbMXpiqSO55yp4iUKrOl6+AOyPbZBG6HZAz09UM=
X-Received: by 2002:a9d:6d19:: with SMTP id o25mr6355124otp.151.1556896992360; 
	Fri, 03 May 2019 08:23:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190503002206.9751-1-driver1998@foxmail.com>
	<20190503003618.10089-1-driver1998@foxmail.com>
	<aa0dce0b-1be0-7247-8f81-c4f265ba0009@redhat.com>
In-Reply-To: <aa0dce0b-1be0-7247-8f81-c4f265ba0009@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 May 2019 16:23:01 +0100
Message-ID: <CAFEAcA9a8oQHe+cbSotO+BR2-iqgKOBV5Pg4n1aOBY7_tnvqFg@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Cao Jiaxi <driver1998@foxmail.com>, QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, Stefan Weil <sw@weilnetz.de>, 
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	Samuel Thibault <samuel.thibault@ens-lyon.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v3 1/4] QEMU_PACKED: Remove
 gcc_struct attribute in Windows non x86 targets
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
X-List-Received-Date: Fri, 03 May 2019 15:23:18 -0000

On Fri, 3 May 2019 at 06:07, Thomas Huth <thuth@redhat.com> wrote:
>
> On 03/05/2019 02.36, Cao Jiaxi wrote:
> > gcc_struct is for x86 only, and it generates an warning on ARM64 Clang/=
MinGW targets.
> >
> > Signed-off-by: Cao Jiaxi <driver1998@foxmail.com>
> > ---
> >  contrib/libvhost-user/libvhost-user.h | 2 +-
> >  include/qemu/compiler.h               | 2 +-
> >  scripts/cocci-macro-file.h            | 7 ++++++-
> >  slirp/src/util.h                      | 2 +-
> >  4 files changed, 9 insertions(+), 4 deletions(-)

> > diff --git a/slirp/src/util.h b/slirp/src/util.h
> > index 01f1e0e068..278828fe3f 100644
> > --- a/slirp/src/util.h
> > +++ b/slirp/src/util.h
> > @@ -43,7 +43,7 @@
> >  #include <netinet/in.h>
> >  #endif
> >
> > -#if defined(_WIN32)
> > +#if defined(_WIN32) && (defined(__x86_64__) || defined(__i386__))
> >  # define SLIRP_PACKED __attribute__((gcc_struct, packed))
> >  #else
> >  # define SLIRP_PACKED __attribute__((packed))
> >
>
> The slirp code is currently on its way into a separate module, so you
> might need to provide that hunk to the libslirp folks again... I'm
> putting the slirp maintainers on CC:, maybe they can pick it up from here=
.

Yes, the slirp module has now landed in master, so this patch
definitely needs to be split into two. I've kept in my
target-arm.next tree the parts which are applicable to
the QEMU repo itself (ie everything except the slirp/ change),
so we just need a new patch for the slirp submodule part.

Marc-Andr=C3=A9, Samuel -- what's the process for submitting and
getting reviewed changes to the slirp submodule now it's a
separate project ?

thanks
-- PMM

