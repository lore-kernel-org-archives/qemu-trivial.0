Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hOeo4-0008Iy-5B
	for mharc-qemu-trivial@gnu.org; Thu, 09 May 2019 04:53:36 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52774)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hOeo1-0008Gx-Fr
	for qemu-trivial@nongnu.org; Thu, 09 May 2019 04:53:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hOeo0-00077N-KK
	for qemu-trivial@nongnu.org; Thu, 09 May 2019 04:53:33 -0400
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d]:42996)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hOeo0-00076l-F7
	for qemu-trivial@nongnu.org; Thu, 09 May 2019 04:53:32 -0400
Received: by mail-ot1-x32d.google.com with SMTP id f23so1564041otl.9
	for <qemu-trivial@nongnu.org>; Thu, 09 May 2019 01:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=9tgr5jOglCE79HDmTY6YwZ6spoWQSi5fVFVTFdu7qls=;
	b=f2Be26l8j3hnR/LVlMO0rybI4kGtEWkoL8yEiZFUaLUjb1zxgT0mnxQTudpp/dyHab
	KaPpjUagVQOZxLSCBrU7M9DAPswk4+clysciS8Jjlf26ZmfaPbwtwjrn9ZFjyHPpREl1
	LJu07kagdFEE29MWgU4xPEDYkX17VmDeLkR4elYHQmMO9v4s31oH188AbZQgOK4JVEef
	FTjnoh6AKR0YUSLfMxGHrRoMU1Y/xJhDsfbgDW/Dmv6Jy9lYZRO5wjL6I2ZKnmZrPcJ1
	zzEtZebBdOW63gLLIYahPlhmOq02YbxSxBmFgkmTXArRB1AfgBG9ML3rjrZzNmafpSr8
	Rx8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=9tgr5jOglCE79HDmTY6YwZ6spoWQSi5fVFVTFdu7qls=;
	b=FNDZBoyrtmyzRRXDhmdcQAlDX40lzV31KMR9ZMeXXJFUkvOyNBL540J98eG2TE+bVi
	efMO6GTsMG1dTJuQgvn+QpmqeOChrexHIWrkSrcE5y1hFAqWcyF7/3Okz2NsaGwSZzY3
	/iLBJqdqnKWK43U77Ux0T5prjLmv1CcJtWsbV/Mt9WbqISNfyGWYiUpKzXuOeGXrHNEk
	NmwQIxsR1HRItoZWlhTGqe2PJuw0aeG3b7kGPYneQju7PhisFK3Rrk94y/IqgrJWD9u/
	l/mJSL1P+fmUdefvBnixlGKn6rMt3bHvatie72UD/gyGlzjZPx/Zm5SN+cjuGPPhuWg0
	gTsg==
X-Gm-Message-State: APjAAAU6mCeCR/VgziV+hzxf1KLLv6ea75ZMrV1cLcyh/0aoxNLjoIOC
	6JMAEltySxW15fxBMABrj2vOWiQentui3gE5iuq9mQ==
X-Google-Smtp-Source: APXvYqwRuP6Eh3oB7IcvNccUE5TaR2e60SOpnmm/ITefMFxN7cHLNlQBhH9syrJiGfa4gBLPtlxPvC3EyIgpCL8YxFE=
X-Received: by 2002:a9d:6855:: with SMTP id c21mr820371oto.151.1557392011274; 
	Thu, 09 May 2019 01:53:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190502185835.15185-1-laurent@vivier.eu>
	<CAFEAcA9-hAU5dxUmSWtbvrPEXE-nCP1uLvLbOby-_EXZ27o+8g@mail.gmail.com>
	<87sgtv4wjo.fsf@zen.linaroharston> <87imulaude.fsf@dusky.pond.sub.org>
	<87tve53sy7.fsf@zen.linaroharston> <87zhnw58pa.fsf@dusky.pond.sub.org>
In-Reply-To: <87zhnw58pa.fsf@dusky.pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 May 2019 09:53:20 +0100
Message-ID: <CAFEAcA-s0UYr0VW3ccG07r=BiGCVtDHkRb6yW0X_ev-zAkOxvw@mail.gmail.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>, 
	Eduardo Habkost <ehabkost@redhat.com>,
	Viktor Prutyanov <viktor.prutyanov@phystech.edu>, 
	QEMU Trivial <qemu-trivial@nongnu.org>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
	Jason Wang <jasowang@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
	Laurent Vivier <laurent@vivier.eu>, 
	Fabien Chouteau <chouteau@adacore.com>,
	QEMU Developers <qemu-devel@nongnu.org>, 
	Gerd Hoffmann <kraxel@redhat.com>,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Michael Roth <mdroth@linux.vnet.ibm.com>,
	Aurelien Jarno <aurelien@aurel32.net>, 
	Artyom Tarasenko <atar4qemu@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::32d
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL 00/13] Trivial branch patches
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
X-List-Received-Date: Thu, 09 May 2019 08:53:34 -0000

On Thu, 9 May 2019 at 09:32, Markus Armbruster <armbru@redhat.com> wrote:
>
> Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:
> > I couldn't replicate the bug with access to my s390 account so I think
> > it might be existing build artefact related which is odd.
>
> Any ideas on how to debug this further?

It's consistently failed for me both times I've tried
to merge the pullreq, on both s390 and ppc (which is
doing a straightforward 'git merge, then do an incremental
build out-of-tree'). Alex has access to the s390 box,
and there's a ppc box in the gcc compile farm...

thanks
-- PMM

