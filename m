Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hjPxp-0008Np-Ll
	for mharc-qemu-trivial@gnu.org; Fri, 05 Jul 2019 11:17:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59299)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hjPxn-0008N6-1o
 for qemu-trivial@nongnu.org; Fri, 05 Jul 2019 11:17:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hjPxi-0003a6-UH
 for qemu-trivial@nongnu.org; Fri, 05 Jul 2019 11:17:24 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:35457)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hjPxi-0002gn-NB
 for qemu-trivial@nongnu.org; Fri, 05 Jul 2019 11:17:22 -0400
Received: by mail-ot1-x342.google.com with SMTP id j19so9404554otq.2
 for <qemu-trivial@nongnu.org>; Fri, 05 Jul 2019 08:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=VegkK88KP3ctyR23gUoOSRsawo/TTK0q4QFJWKTi25o=;
 b=sq1oGuQbdlNZCOVMSKndvKZ9fSsnEffkaCDo8uwyNdFSeYP35IWV0TauCwFdIHsuOe
 UkfECLVeksOy6x4MAecCyALnaVES+5AcDxxPcDFXqt/74Rhz8q04tkZIMtmH0lL3G9LI
 YY/oEE8hWj10Crw1mPmIPMW2wyolqunb84Wu/PxdXmTLf04j4yi7y5fCzGsHZBt559jW
 ia8bkWYvw9onKzIISk0MI8b2GFB23w3l/mwlSBtHI53E1SJ3nkainfjnYOVZnMQVcv0T
 Ln4iXjFdljPc6Lfh+wnuas6ZDNZapIPTmkgzwPRqgiDWSkTOd7tk2joFKTOUf+E22KFt
 wpCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=VegkK88KP3ctyR23gUoOSRsawo/TTK0q4QFJWKTi25o=;
 b=tNSeRfuxUI7JhVeBJtMSpjK8Uu9BuVGDCyCt1qHFRE03P5dt/o81PbI53nTpRPug/w
 QwU3g8yelfFScfdfhaah4Qeyv3T7CjRuLw6i6Bwgv2AAVV6wPs45RT0Urqag1AqbaW5k
 CDk/EJN+Tf2VEBg71WHLEsfsyU7mc2tI1NoiXW2NhKpF/F6htsR3Bv4Dp9KSzwnRgw43
 Vs2dVmVRCiOs46n3wdMAyd9Q1po8czBcF9DKgWZ6WjAC526OZTu07Cl2LP9ycBf+aNyF
 nBYxLRTcTQ94OiXoGkPl++21Lj96eGzagctObDUTMyb5/0HZhTD9pLXwib4Y7Ts4v8yz
 HQNQ==
X-Gm-Message-State: APjAAAVdkN255Nc2w/JUVKcsjQ4JNsTagQsgqv+iPgcwvJ6Wo2tWXSlE
 cNA0eew6mLgVo0IJe9gwSNJ0l9JoPDuZG3xjYvDC/A==
X-Google-Smtp-Source: APXvYqx8S36Tc74/sOZ1S5RXfsYdDAYNxFRGissvq1htBNHiyOsAmF4i7vnsuWs27wCuPJskq8AyATcXVT3VbSJqkL0=
X-Received: by 2002:a9d:6a0f:: with SMTP id g15mr3406631otn.135.1562339831078; 
 Fri, 05 Jul 2019 08:17:11 -0700 (PDT)
MIME-Version: 1.0
References: <156217961567.21218.1941224583128986225@c4a48874b076>
 <0a0abd7a-ce36-6faa-cba8-b6a40e7b503e@vivier.eu>
In-Reply-To: <0a0abd7a-ce36-6faa-cba8-b6a40e7b503e@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Jul 2019 16:16:59 +0100
Message-ID: <CAFEAcA96z+9kMG1iDmBLa-MXuRez7XNyN7TigdaiNCBiy=2UuA@mail.gmail.com>
To: Laurent Vivier <laurent@vivier.eu>
Cc: QEMU Developers <qemu-devel@nongnu.org>, no-reply@patchew.org, 
 QEMU Trivial <qemu-trivial@nongnu.org>, Amit Shah <amit@kernel.org>, 
 Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL v2 0/2] Trivial branch patches
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
X-List-Received-Date: Fri, 05 Jul 2019 15:17:28 -0000

On Fri, 5 Jul 2019 at 16:10, Laurent Vivier <laurent@vivier.eu> wrote:
>
> Le 03/07/2019 =C3=A0 20:46, no-reply@patchew.org a =C3=A9crit :
> > Patchew URL: https://patchew.org/QEMU/20190703152513.29166-1-laurent@vi=
vier.eu/
> >
> ...
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > =3D=3D12708=3D=3DERROR: LeakSanitizer: detected memory leaks
> >
> > Direct leak of 32 byte(s) in 1 object(s) allocated from:
> >     #0 0x56164f580b6e in calloc (/tmp/qemu-test/build/x86_64-softmmu/qe=
mu-system-x86_64+0x19f9b6e)
> > ---
>
> It seems not related. Does it prevent the series to be merged?

Yeah, it's unrelated (an issue in master which is now fixed), but I
had missed your v2 pullreq amongst all the noise. Thanks for the ping --
I'm running it through the test process now.

-- PMM

