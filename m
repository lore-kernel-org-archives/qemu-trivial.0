Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43CDED15DAE
	for <qemu-trivial@archiver.kernel.org>; Wed,  3 Dec 2025 16:43:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1vQpwl-0002Sm-U3; Wed, 03 Dec 2025 11:43:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vQpwi-0002Rb-NA
 for qemu-trivial@nongnu.org; Wed, 03 Dec 2025 11:43:16 -0500
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vQpwh-00038V-8h
 for qemu-trivial@nongnu.org; Wed, 03 Dec 2025 11:43:16 -0500
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-786a822e73aso71035327b3.3
 for <qemu-trivial@nongnu.org>; Wed, 03 Dec 2025 08:43:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1764780193; x=1765384993; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=EjStxg2vGimEwZJKj+cslyewIsG14DXcZpsoFRzseFQ=;
 b=RE2tgyJPJ24j9TZgsXG6pYlZFcuMuHmmwKCuJhUJKejuFQ7fd6yE2OpQDFkVB00k29
 nWCX8u0LiLBfFwtKNgeuBySFTXBK0MtIFEGDmYcAIY5gxapjzj0Mn2m7ghsRwACV3bcw
 Rn1+0uQ2S/IvD5W4582bUGN48NCD2U28EgUZ4+3hsQzd3UxaCkbaXcrul9U2mysVu0fX
 a+838MQegCfhLYJVyOzrHknvaXysYbvRzJKIGKYK5cp9+E8H6y56JJWn3gorAakx/EoM
 7Y+9OVdzzxkXrggjCLtj9Rxvvn+7/W8jlwDHv8b3BRmLZrmIonOKfDozrjOfxxoU+AJu
 a2cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764780193; x=1765384993;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EjStxg2vGimEwZJKj+cslyewIsG14DXcZpsoFRzseFQ=;
 b=U5NozMnp4y5oWfJvvRQzFRnN6pTTxOKaA0oVaHyUGzis203OxMKYnm7iNNdu242+uA
 IgmQvLwWpITNmkgPDkXV5wA2F0gy0xNdMVoiL0CaowXO3hGby4gUcXCPFNxCcugmc3kN
 KurFMIdGdwpqnSmrci7lZXtmdmEZtFRLPbVh1zvCb88eF3gb4toKWaFWenX/q3ezG7o0
 psdrFO44A6X7XmcTOO2Vna+gc8vc25xmLEfsDExAWjfc8oscjbgIYa8gPbxzz0sKnXqH
 bHzidciKXSfKCYc1oT1P6wNjlsrmANpy+0/y/DEpzqjr8XnuzLWGVPGBzmk+QvDM7zha
 QLXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVojJ+kOsiiR4Wcw/tAvgOVmThLPiJmZdbamIbPtbi0c1GAPrzICb06oLW4yU7qFfO/2dJdkIiAPiNyGqg=@nongnu.org
X-Gm-Message-State: AOJu0YxV93kpXcUkXC8Swsxri0MfAMYZF6b7P16vQmFlu2boH0uJ+YeY
 Fyjo/d5Kq/MLGb4XkIWETy8kCHmPVz86bSd5451lt5vntUAGtpu4ZF0wRAXD/3OxYiPrNYxDbEs
 r6/fpbEdcYXFoOPFVLPdvITHVXN86emPat7s4FJmrEQ==
X-Gm-Gg: ASbGncuTnbr3sySdHrht+nYqDBTOlKKb6og6wr6WklIc2ek5npKm+XBWDw3J7ZgpcOU
 O99ZdKdH6hBbbY5BDM2iwglHJAJTsmEOMvg7/9/D1FN2eEjP3P7VSthfXPKHuRadrg1sv6QKCPc
 gmIpCnLn4HgEsZ4APmjS9z02XOpAdtdWMl4Na0QjkXIkMsZ4TgHIZe1HjD7mCm+Z/agLrDFpLh6
 9N/oJw3tBXGe21kWFjQ5fEK7alj+TsVBY54rzlSCjgo92hgoB44WnTqQwXLnmkNyejzoQ==
X-Google-Smtp-Source: AGHT+IECOp25iMxrCoEtG6XtCVJmujFZ5wijdDkvR3xCKlpr4b+uMfqJIMhHSkhT5EgR3CfKuYkjCSSwl9y5AXOXqF4=
X-Received: by 2002:a05:690c:48c1:b0:786:7797:6d73 with SMTP id
 00721157ae682-78c0c22a1e5mr21308847b3.40.1764780192455; Wed, 03 Dec 2025
 08:43:12 -0800 (PST)
MIME-Version: 1.0
References: <20251203131511.153460-1-dave@treblig.org>
 <87a4zzu230.fsf@draig.linaro.org> <aTBCLbDbpXgkTLHr@gallifrey>
 <CAFEAcA-Uy0UQwGEK+f95BJmDripg1-8vhzPF5qRSY40=duhRUQ@mail.gmail.com>
 <aTBjTzbaX0befChO@gallifrey>
 <CAFEAcA-y5ucBTOgngim5cpuKbFYXajOz0zEeT2S0rC3wnMPSrw@mail.gmail.com>
 <aTBnN6Q72QX3cW55@gallifrey>
In-Reply-To: <aTBnN6Q72QX3cW55@gallifrey>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 3 Dec 2025 16:43:00 +0000
X-Gm-Features: AWmQ_blEUQnM7F3DigD3uppC5hHTEmTM5gRs2Dxk-rbfRh0VPkmrvekxp7APjAU
Message-ID: <CAFEAcA-Gq=MnrfxMq4TqM6T6NYOO28qN1OobPWdNyNAnvS5Y9A@mail.gmail.com>
Subject: Re: [PATCH] qemu-options.hx: Document -M as -machine alias
To: "Dr. David Alan Gilbert" <dave@treblig.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 qemu-trivial@nongnu.org, mjt@tls.msk.ru, laurent@vivier.eu, thuth@redhat.com, 
 pbonzini@redhat.com, jak@jak-linux.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1131.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
Errors-To: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org
Sender: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org

On Wed, 3 Dec 2025 at 16:37, Dr. David Alan Gilbert <dave@treblig.org> wrote:
>
> * Peter Maydell (peter.maydell@linaro.org) wrote:
> > On Wed, 3 Dec 2025 at 16:20, Dr. David Alan Gilbert <dave@treblig.org> wrote:
> > >
> > > * Peter Maydell (peter.maydell@linaro.org) wrote:
> > > > Surprisingly, this and -h/--help are our only two options where
> > > > we provide a short synonym. I note that this handling of -M
> > > > is not consistent with how we document -h/--help, where we
> > > > print both on a single line:
> > > > -h or -help     display this help and exit
> > > >
> > > > But it would be trickier to fit that in for -machine and
> > > > perhaps confusing given the suboptions.
> > >
> > > Right, that's one of the two reasons I kept it separate.
> > > The other reason, is that I couldn't figure out how '-help' and '-h'
> > > both got defined - why is the second DEF(...) not needed?
> >
> > A piece of delicious fudge lurking in system/vl.c: we have
> > this hardcoded entry in the qemu_options[] array before
> > the ones that are generated via the macro-magic from
> > qemu-options.hx:
> >
> >     { "h", 0, QEMU_OPTION_h, QEMU_ARCH_ALL },
> >
> > So we recognize -h on the command line and turn it into
> > QEMU_OPTION_h, the same as -help, but it doesn't result in
> > anything in the documentation (we leave that up to the
> > strings and RST in the DEF("help"...) section).
>
> Hah ok!  I guess that fudge could be removed and make it the
> same way -M works.

Yeah, I was pondering that. Also, we don't document --help in
the HTML docs, only -h.

-- PMM

