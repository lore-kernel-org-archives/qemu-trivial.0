Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C836D12D56
	for <qemu-trivial@archiver.kernel.org>; Wed,  3 Dec 2025 13:28:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1vQmuA-0004DW-F4; Wed, 03 Dec 2025 08:28:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vQmu8-0004BW-RE
 for qemu-trivial@nongnu.org; Wed, 03 Dec 2025 08:28:25 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vQmu7-0004Hw-Aq
 for qemu-trivial@nongnu.org; Wed, 03 Dec 2025 08:28:24 -0500
Received: by mail-wr1-x441.google.com with SMTP id
 ffacd0b85a97d-42e2e2eccd2so2707959f8f.1
 for <qemu-trivial@nongnu.org>; Wed, 03 Dec 2025 05:28:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1764768501; x=1765373301; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6LMjN+FSFiJIUJWtHAecKlsIaVKv4r6zvwFKIfYquUg=;
 b=bif1KnE2SJC2demI2dVkiS4pM2kX0lIMFBcpA6VGclUYzEyiHmCqep/rfRIYXbmq4i
 5VSN+xBhMVLgjbMsog44iybTFbJgjXmOnDzrppClgUZH7FmLmMr+PORE7vLu0JEMQV2P
 6flYENwJp2fjTtkx0ufbc5g3CVBAHY08eRdMH3KZWeRfUBTtlgWIaajDwh4cM4r3cCmO
 NBXkIGjVS84+UMYcXc5vjo46prDo7rAQjckrDKcMc5uCGFVInKP/0J0uMXJ+Cnty/zwO
 /3bxb8PimKBaoH3BD3sWPemly3FiQknb3Dvt0E7ftXW9dS7+teqID8lHBrFIrsEusYI4
 7qMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764768501; x=1765373301;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6LMjN+FSFiJIUJWtHAecKlsIaVKv4r6zvwFKIfYquUg=;
 b=KxVuq4k11XMnD21TlPvnnVRZ0xP7hUZPBPDKgZFgB9FN0/Vo0cFWVVR75f6kUPifX8
 w+gyEBJ8Nruy8vhFOnuSVWmm3vRJ+scrFQVvmdDPYwcnSZSFv4vqCYekp1SeKA2njs4/
 grAGOdRDw4y1lJ64WuOcYMfR3hiO+Uja5DJlRXeJkGRhpEh2NPJCujRCLuIVwduo/MFX
 HZICHoi8r5gBLMzWe/JuWht7XhrwcwGqvMwez4q3D3nyeclpB6QlhexylPDQzLPxndFE
 YpM0pUBGymKoKlOeL3XakxVaIvmqcVT3cftHOuNzoa0teKP8vyIIcexmQwr0hGwg3EgE
 p2Pw==
X-Gm-Message-State: AOJu0YxhR0pX7eNZ94bcSwg9geypuxiNNLvN3qiuitpP6SVGOgMU8BUG
 8BCtcxADP65u/XQjXahw20Fov2bqLMFMAN/QA6U1VSOAEJ03LcSn/WRI2766/JHV/50=
X-Gm-Gg: ASbGncu7EX9l0Rm8Pgf+2OxVBrmRHz1lOLhj4b5QCIFGBKUW2q3gtOm1hT5J0qizbk6
 dc+raTDOvPiKxuwotnwyWm3QF6VJIhJ4k6dL7W6SH8adbxLiwwWZkVi7eRQ0wmwiK6MKa4JV6qv
 xMdf2kspftsBU0QYTDy8KUtICnFOL/LCD0vz6DQkf+0O29w1GBbeSvBr9wkisfee4MWYDQgqmXe
 +EB6fvD8TMeQwYGCTjbQ/jKdqqnWj7ygvOOJe3Kzx9KBzjpxpZydeKKR8t5A1bKqVXJwb2Bbueg
 yHvcPE4ZD+/3y7GTlSeGiB46qgkcX3roOllRZD3QdLKJOFTKW3m7CI6E29J9oJj6mFIXuvjZYJM
 w/5iXxKr3hpwymbLjYiTuy27XEBXUiwLwbhNAXbZk92Uh3qbSXMBzNnt8e2hS8F/Jf0DMj5nGjU
 qOHnaiOOqU+vY=
X-Google-Smtp-Source: AGHT+IHeroVIsRDWizOZ/beLgpVo4DYkOjwZCyhAOL/yKEfCoL7PIshPfm1A8Y45x0nLxJCZUtMsHA==
X-Received: by 2002:a05:6000:2dca:b0:429:8bfe:d842 with SMTP id
 ffacd0b85a97d-42f731678d3mr2422250f8f.4.1764768500747; 
 Wed, 03 Dec 2025 05:28:20 -0800 (PST)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42e1c5c3041sm36671063f8f.6.2025.12.03.05.28.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Dec 2025 05:28:20 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 5C0EA5F7B3;
 Wed, 03 Dec 2025 13:28:19 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: dave@treblig.org
Cc: qemu-trivial@nongnu.org,  mjt@tls.msk.ru,  laurent@vivier.eu,
 thuth@redhat.com,  pbonzini@redhat.com,  jak@jak-linux.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH] qemu-options.hx: Document -M as -machine alias
In-Reply-To: <20251203131511.153460-1-dave@treblig.org> (dave@treblig.org's
 message of "Wed, 3 Dec 2025 13:15:11 +0000")
References: <20251203131511.153460-1-dave@treblig.org>
User-Agent: mu4e 1.12.14-pre3; emacs 30.1
Date: Wed, 03 Dec 2025 13:28:19 +0000
Message-ID: <87a4zzu230.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x441.google.com
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

dave@treblig.org writes:

> From: "Dr. David Alan Gilbert" <dave@treblig.org>
>
> -M is used heavily in documentation and scripts, but isn't actually
> documented anywhere.
> Document it as equivalent to -machine.
>
> Reported-by: Julian Andres Klode <jak@jak-linux.org>
> Signed-off-by: Dr. David Alan Gilbert <dave@treblig.org>
> ---
>  qemu-options.hx | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/qemu-options.hx b/qemu-options.hx
> index fca2b7bc74..ec92723f10 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -44,6 +44,7 @@ DEF("machine", HAS_ARG, QEMU_OPTION_machine, \
>  #endif
>      "                memory-backend=3D'backend-id' specifies explicitly =
provided backend for main RAM (default=3Dnone)\n"
>      "                cxl-fmw.0.targets.0=3Dfirsttarget,cxl-fmw.0.targets=
.1=3Dsecondtarget,cxl-fmw.0.size=3Dsize[,cxl-fmw.0.interleave-granularity=
=3Dgranularity]\n"
> +    "                sgx-epc.0.memdev=3Dmemid,sgx-epc.0.node=3Dnumaid\n"
>      "                smp-cache.0.cache=3Dcachename,smp-cache.0.topology=
=3Dtopologylevel\n",
>      QEMU_ARCH_ALL)
>  SRST
> @@ -179,6 +180,9 @@ SRST
>=20=20
>              -machine cxl-fmw.0.targets.0=3Dcxl.0,cxl-fmw.0.targets.1=3Dc=
xl.1,cxl-fmw.0.size=3D128G,cxl-fmw.0.interleave-granularity=3D512
>=20=20
> +    ``sgx-epc.0.memdev=3D@var{memid},sgx-epc.0.node=3D@var{numaid}``
> +        Define an SGX EPC section.
> +

This seems unrelated.

>      ``smp-cache.0.cache=3Dcachename,smp-cache.0.topology=3Dtopologylevel=
``
>          Define cache properties for SMP system.
>=20=20
> @@ -208,12 +212,10 @@ SRST
>  ERST
>=20=20
>  DEF("M", HAS_ARG, QEMU_OPTION_M,
> -    "                sgx-epc.0.memdev=3Dmemid,sgx-epc.0.node=3Dnumaid\n",
> -    QEMU_ARCH_ALL)
> -
> +    "-M              as -machine\n", QEMU_ARCH_ALL)
>  SRST
> -``sgx-epc.0.memdev=3D@var{memid},sgx-epc.0.node=3D@var{numaid}``
> -    Define an SGX EPC section.
> +``-M``
> +    as -machine.

Did we have a merge conflict at some point that messed things up?

>  ERST
>=20=20
>  DEF("cpu", HAS_ARG, QEMU_OPTION_cpu,

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

