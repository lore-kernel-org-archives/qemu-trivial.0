Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04F95D15DAE
	for <qemu-trivial@archiver.kernel.org>; Wed,  3 Dec 2025 16:07:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1vQpNN-0001sj-02; Wed, 03 Dec 2025 11:06:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vQpNI-0001rR-S1
 for qemu-trivial@nongnu.org; Wed, 03 Dec 2025 11:06:40 -0500
Received: from mail-yx1-xb135.google.com ([2607:f8b0:4864:20::b135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vQpNF-00039i-2t
 for qemu-trivial@nongnu.org; Wed, 03 Dec 2025 11:06:40 -0500
Received: by mail-yx1-xb135.google.com with SMTP id
 956f58d0204a3-641e4744e59so7273631d50.2
 for <qemu-trivial@nongnu.org>; Wed, 03 Dec 2025 08:06:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1764777995; x=1765382795; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q5ifr1hwvxTDvDqqLo4QHVtN/OZU32OPGGSADU/Loe4=;
 b=zSg8QjG2FNeGw4xrRSOFIRxp5RGNVJKz+LYzEGwhopBgnlOKNy7SIRDVpP1LiShVcs
 7Ffb4d+tlVpgQ1rMECJJqCFyzfWoFQQ9BOgbvSHJkVCtGa273lVo/+JEtbrZK/ZXzs5G
 oxkWblQbQOLoJoGtSmoaxnStVPIXmWsH8m50CzP9tB80co9TgW6SAvkQRSIZ1N+hYUHG
 Nr/JLyCNcTkxKtLUH1bfEoXmCWs0Gk5n7bAxCrPO0QG4pIUMGB9Y0oLAomSj01Y2mGzg
 KE4/kynEFnGj1zbyCRevTkshfAlZN6VoichCqJVxZzqHYN7aGDOyLzBzwfeCBaJ40PA9
 35/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764777995; x=1765382795;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Q5ifr1hwvxTDvDqqLo4QHVtN/OZU32OPGGSADU/Loe4=;
 b=PSOKoDAZouYLD7eUxFnr5SCZD6GaJ2M/upI1vhg6CUYkTNFKdCBmjt+ArrrWXogfwH
 hlo9NwAskIU85UOl3mxisfN+uGVsWohSDUQgy91A4SuNR/UNLdO1Tp7xhA7T/WdhpFqD
 b5NUz5XvmwQNdQNdfX1ofl/uYFsmI1GmBlQpIBQqmBCoLJzdFD6XESuZ2HWDjCj23jgJ
 I8WzEjfkVUMJ9qJNk4jeLPvIKV4DRLw6JUbAP3D9J1BQk6vpevOv6LDY0k2jnbOMpPdU
 LXH4wMISQX4CQwJxZ6Jiyd5fCpZgZe8va/D4gk6Qf5grv9p5lxp8VAD9IxKFVUaxNFqC
 SqOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjsqw8XbWGKOgRCiiBl2lwz5JACupP1ZmBySa8fWllRFaCLrZrhSRoKjIWMD9sy+jtlrc/lxA4MxeYXYs=@nongnu.org
X-Gm-Message-State: AOJu0Yw+vgBYff+wuaPtZH7ytc1cIzk880PtFmW2qys/Qt+Ms9nGOp9O
 GJI1GVbvhpzmL5braBkupiIHivaM1fBL3V9l7QUt6jR+gdzl1nBen4pdpP/zFPNi0WjNTnJQkzB
 Y5QBS5qMI0j9iIEYKEX92ZK6NsupNZeRG56OPvLTb7Q==
X-Gm-Gg: ASbGnctLNMayy9F209rv2+VlWU1VJuLtpMe0LqwiFIWnij58mmPmiNE/nIfJZetm1bf
 7Q4MQWWXb+JR5eCUWqamiWXHibITphUVoIG/XBXqMVU54mXDlXBerDEWX8OhSGW+1CMuP14hMWi
 yvjKlRrGYdNddDhzVU+xv1N/P3aXo33FqAPGrEgwQW9GcVqZ47JyqCaCwyz2Z4rQtTWjIwPT6TP
 b0WuovvjqhfkX3pVuD5hq3fRNkEwIveKi8OryIKIzuyhtoX7AfcUQAnNQe+lRf2UfwZ8Lhl
X-Google-Smtp-Source: AGHT+IEIDjelFCA/HQ8SJO8/kZiYK/BzXn2/MrVaU0UE1uG0oAzpp/Rx21iHY4NoF1ZG9+19PAtKNYrJ5tB0skXuq6Q=
X-Received: by 2002:a05:690e:d89:b0:641:f5bc:6982 with SMTP id
 956f58d0204a3-6443704baffmr2070029d50.78.1764777995067; Wed, 03 Dec 2025
 08:06:35 -0800 (PST)
MIME-Version: 1.0
References: <20251203131511.153460-1-dave@treblig.org>
 <87a4zzu230.fsf@draig.linaro.org> <aTBCLbDbpXgkTLHr@gallifrey>
In-Reply-To: <aTBCLbDbpXgkTLHr@gallifrey>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 3 Dec 2025 16:06:23 +0000
X-Gm-Features: AWmQ_bmhz82ZVXPHixH8Mu6_wvBa13mvkJgyWAVh9C2TTQbqB3uXnZsjsatqG2s
Message-ID: <CAFEAcA-Uy0UQwGEK+f95BJmDripg1-8vhzPF5qRSY40=duhRUQ@mail.gmail.com>
Subject: Re: [PATCH] qemu-options.hx: Document -M as -machine alias
To: "Dr. David Alan Gilbert" <dave@treblig.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 qemu-trivial@nongnu.org, mjt@tls.msk.ru, laurent@vivier.eu, thuth@redhat.com, 
 pbonzini@redhat.com, jak@jak-linux.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb135.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Wed, 3 Dec 2025 at 14:00, Dr. David Alan Gilbert <dave@treblig.org> wrot=
e:
>
> * Alex Benn=C3=A9e (alex.bennee@linaro.org) wrote:
> > dave@treblig.org writes:
> >
> > > From: "Dr. David Alan Gilbert" <dave@treblig.org>
> > >
> > > -M is used heavily in documentation and scripts, but isn't actually
> > > documented anywhere.
> > > Document it as equivalent to -machine.
> > >
> > > Reported-by: Julian Andres Klode <jak@jak-linux.org>
> > > Signed-off-by: Dr. David Alan Gilbert <dave@treblig.org>
> > > ---
> > >  qemu-options.hx | 12 +++++++-----
> > >  1 file changed, 7 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/qemu-options.hx b/qemu-options.hx
> > > index fca2b7bc74..ec92723f10 100644
> > > --- a/qemu-options.hx
> > > +++ b/qemu-options.hx
> > > @@ -44,6 +44,7 @@ DEF("machine", HAS_ARG, QEMU_OPTION_machine, \
> > >  #endif
> > >      "                memory-backend=3D'backend-id' specifies explici=
tly provided backend for main RAM (default=3Dnone)\n"
> > >      "                cxl-fmw.0.targets.0=3Dfirsttarget,cxl-fmw.0.tar=
gets.1=3Dsecondtarget,cxl-fmw.0.size=3Dsize[,cxl-fmw.0.interleave-granulari=
ty=3Dgranularity]\n"
> > > +    "                sgx-epc.0.memdev=3Dmemid,sgx-epc.0.node=3Dnumai=
d\n"
> > >      "                smp-cache.0.cache=3Dcachename,smp-cache.0.topol=
ogy=3Dtopologylevel\n",
> > >      QEMU_ARCH_ALL)
> > >  SRST
> > > @@ -179,6 +180,9 @@ SRST
> > >
> > >              -machine cxl-fmw.0.targets.0=3Dcxl.0,cxl-fmw.0.targets.1=
=3Dcxl.1,cxl-fmw.0.size=3D128G,cxl-fmw.0.interleave-granularity=3D512
> > >
> > > +    ``sgx-epc.0.memdev=3D@var{memid},sgx-epc.0.node=3D@var{numaid}``
> > > +        Define an SGX EPC section.
> > > +
> >
> > This seems unrelated.
> >
> > >      ``smp-cache.0.cache=3Dcachename,smp-cache.0.topology=3Dtopologyl=
evel``
> > >          Define cache properties for SMP system.
> > >
> > > @@ -208,12 +212,10 @@ SRST
> > >  ERST
> > >
> > >  DEF("M", HAS_ARG, QEMU_OPTION_M,
> > > -    "                sgx-epc.0.memdev=3Dmemid,sgx-epc.0.node=3Dnumai=
d\n",
> > > -    QEMU_ARCH_ALL)
> > > -
> > > +    "-M              as -machine\n", QEMU_ARCH_ALL)
> > >  SRST
> > > -``sgx-epc.0.memdev=3D@var{memid},sgx-epc.0.node=3D@var{numaid}``
> > > -    Define an SGX EPC section.
> > > +``-M``
> > > +    as -machine.

Surprisingly, this and -h/--help are our only two options where
we provide a short synonym. I note that this handling of -M
is not consistent with how we document -h/--help, where we
print both on a single line:
-h or -help     display this help and exit

But it would be trickier to fit that in for -machine and
perhaps confusing given the suboptions.

> > Did we have a merge conflict at some point that messed things up?
>
> It's not clear - it was the only option hanging around in -M and it was
> already appearing wrong in the man output.
> I wondered if it was some requirement to have *something* in the -M
> definition so thought it best to move it at the same time.

It looks like this was incorrectly added under -M by
commit dfce81f1b9 ("vl: Add sgx compound properties to expose
SGX EPC sections to guest"), which should have put it under
-machine like all our other machine suboption documentation.

The result is that the sgx-epc documentation appears OK
in --help because the --help output just concatenates
everything so it gets tacked on after the -machine help,
but it is misrendered in the HTML docs:
https://qemu-project.gitlab.io/qemu/system/invocation.html
as it appears as if a top level option rather than one
indented to indicate that it's a machine sub-option.
So this change fixes that bug (and should ideally say so
in its commit message).

Before that it simply read
-HXCOMM Deprecated by -machine
-DEF("M", HAS_ARG, QEMU_OPTION_M, "", QEMU_ARCH_ALL)

(Commit dfce81f1b9 also silently dropped that "deprecated"
comment, which it shouldn't really have done.)

thanks
-- PMM

