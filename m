Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 643DD606A6C6
	for <qemu-trivial@archiver.kernel.org>; Fri, 20 Nov 2026 19:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=jNnbG2AC
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1xUU9D-0005lh-58; Fri, 20 Nov 2026 14:19:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xUU9A-0005kp-BS
 for qemu-trivial@nongnu.org; Fri, 20 Nov 2026 14:19:44 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xUU97-0000kT-NZ
 for qemu-trivial@nongnu.org; Fri, 20 Nov 2026 14:19:43 -0500
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-490f38e9688so978535f8f.0
 for <qemu-trivial@nongnu.org>; Fri, 20 Nov 2026 11:19:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1795202380; x=1795807180; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :user-agent:references:in-reply-to:subject:cc:to:from:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=ICVxdXPot9CJCxdxgy2S6ECrV9GF/v3y+P+NUPzqWXw=;
 b=jNnbG2AC501uIE9pa8vH840bVGEB5xhZMmj7VJH46lZYtel4hbfwjR+zjlb5VDjA9l
 mixfw1Iw36/iJ2evG6NgBuZIHgjZx0wf9Jybkevv3J+w9iPc4bJtHQ81TB7sARkeTj6B
 ND3lXdE0w3BjTInRtStEEuWPLZxGoMCFGClhXnUJRvWfxryWw0QtN8NhIvdQH20kRSzT
 jBaU5v9AcaEn2dRFSQfMkUwUrP+4B/jyIGnR8EYXKlbs/CVH03wGHw/0hSR6ZwOlXNtC
 R+r9nWHLUzdhrWp4ItSO55K9QifATcEX3sGzvhuFXvebDFDNP7n6tzpjinD7xdPVZBkX
 1Yww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795202380; x=1795807180;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :user-agent:references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=ICVxdXPot9CJCxdxgy2S6ECrV9GF/v3y+P+NUPzqWXw=;
 b=JAEe+pIXv2HJHp79PZSeQIXPS1+vQG9lwkhEGLmM9PpGhKA5HOR8Mj/BkMjLZHe/N7
 PsW052LDnV67swxCGE7FAT4DWTLkKY0uwe94R1fm5Lk63wVG5JxzNzRaCg2HaVESqdTl
 4j+xtwijj0Chej0urdYdB61ESKjYQhgAmZ96Qs+JA8/zNDqk3NziW/6DPUWOTrP4KEu8
 M1wtFLxo0DB9TaLXsK5vkvJZUQ4S4NAiLkdMzrr6ogIin9bSghVs1GmZP5m824p4Ucnu
 P3Rb4G6d/2qBMvkBp9MQPyHgVyeDQmQtIv/Amdre8Tw84xm//g4nT0risTAoQxnPntcs
 TyBg==
X-Gm-Message-State: APuU4Z/ePLtDZCMRp5hlPZtvjReTNly1/BfhGrWaLUEGVTb7gOe7yCPG
 oM6cIuD979vnMhSDk7YeHdVQ3r/BVP1Vu9xwa/BrJQeLYwL+NxKJQVx/tgwBAnY7vz2IL7pZXfg
 fUUJt
X-Gm-Gg: AZFdTZeDRHF9wdsjpzShcY3cpA8rp+GXtOrTLRzqkWN2VrMUmtfKQyLNeVAvlD5/B8M
 eHPmJ46SPAerxJQXO8jswTQAfw7JVQDYx0Jhw0yPMXgWHCtrprc1AEfAcYVvmb/OV7wK03dX/2z
 Q3+Y7R5pDLyhZAYXKW7SCIVjRnZDw8AhB+E+ghuBqwWsXooy0Gz8Nfk4fehxa9Sxiu0LeZnGfVr
 rbqWEczX66NJfoEPn398FGgZqlIOCUpkrRXulWn+V+ZyxVcmkm8sUHHiunp0U2ZCp7j8KXTNBqA
 h1O/4GBCqdH3fzQWR9lAGKoJyJhpvUakfTr2iv47j4JROBq3K84Ih8+jIjRcp3n0jVtDgXl6wUW
 O03yhvkrHm6Ilyh/w9BPoNJS/CBaC3H9fFn6Si0iKsIUNDudlfRf6+2TbPcz6HzGiQFugHnTU/x
 bgcxg9dO8hkbmBC2ml52bSf38+X5QuXukIo+0ktObhjkJFrmqsUs0z6y0EjmYRg2rL+mRjs6Zf/
 ieUK2F5zF9YUOtgjzLlPiZaQancqDO2MbpFgG2tbMXK2iWwKaZkS9KdvwHk7HBWfkSea9W7nMKC
 sV+kFprOLPew65XVKcNZfhfYeHex
X-Received: by 2002:a05:6000:2383:b0:492:aff5:da4d with SMTP id
 ffacd0b85a97d-4aa545e244fmr15638960f8f.7.1795202379763; 
 Fri, 20 Nov 2026 11:19:39 -0800 (PST)
Received: from draig.lan ([185.124.0.158]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab658e2e6dsm7459537f8f.6.2026.11.20.11.19.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2026 11:19:39 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 168655F7FE;
 Fri, 20 Nov 2026 19:19:38 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Subject: Re: [PATCH] MAINTAINERS: update Daniel's entries to be consistent
In-Reply-To: <20261120182200.789086-1-alex.bennee@linaro.org> ("Alex
 =?utf-8?Q?Benn=C3=A9e=22's?=
 message of "Fri, 20 Nov 2026 18:22:00 +0000")
References: <20261120182200.789086-1-alex.bennee@linaro.org>
User-Agent: mu4e 1.14.5-pre1; emacs 30.1
Date: Fri, 20 Nov 2026 19:19:37 +0000
Message-ID: <87se0v48fq.fsf@draig.linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
Sender: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> When testing my get_maintainers.py I was shocked to see:
>
>   =E2=9E=9C  ./scripts/get_maintainer.py --list-absent-maintainers-since =
"2 years ago"
>   Maintainer              Last Seen   Email(s)                        Sub=
systems
>   -----------------------------------------------------------------------=
-------
>   ...
>   Daniel P. Berrange      2024-06-10  berrange@redhat.com             QOM=
, QDev, Seccomp, Cryptography, Buffers, I/O Channels, User authorization, S=
ockets, File monitor, Functional testing framework, Build system architectu=
re, Meson, GIT submodules
>
> Which is of course incorrect but tripped up by the fact we have been
> utf-8 clean for some time. There are some entries that are correct so
> fix up the rest in solidarity with my fellow utf-8 using hackers ;-)

You can ignore this as I have found more, I'll include in the series I'm
about to send ;-)

>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  MAINTAINERS | 28 ++++++++++++++--------------
>  1 file changed, 14 insertions(+), 14 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e2bd501f18e..031183706a5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3748,7 +3748,7 @@ T: git https://github.com/kostyanf14/qemu.git qga-w=
in32
>=20=20
>  QOM
>  M: Paolo Bonzini <pbonzini@redhat.com>
> -R: Daniel P. Berrange <berrange@redhat.com>
> +R: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>  S: Supported
>  F: docs/devel/qom.rst
>  F: include/qom/
> @@ -3763,7 +3763,7 @@ F: tests/qtest/qom-test.c
>=20=20
>  QDev
>  M: Paolo Bonzini <pbonzini@redhat.com>
> -R: Daniel P. Berrange <berrange@redhat.com>
> +R: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>  S: Supported
>  F: docs/qdev-device-use.txt
>  F: hw/core/qdev*
> @@ -3996,14 +3996,14 @@ F: tests/qtest/dbus*
>  F: scripts/xml-preprocess*
>=20=20
>  Seccomp
> -M: Daniel P. Berrange <berrange@redhat.com>
> +M: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>  S: Odd Fixes
>  F: system/qemu-seccomp.c
>  F: include/system/seccomp.h
>  F: tests/unit/test-seccomp.c
>=20=20
>  Cryptography
> -M: Daniel P. Berrange <berrange@redhat.com>
> +M: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>  S: Maintained
>  F: crypto/
>  F: include/crypto/
> @@ -4024,20 +4024,20 @@ F: include/qemu/coroutine*
>  F: tests/unit/test-coroutine.c
>=20=20
>  Buffers
> -M: Daniel P. Berrange <berrange@redhat.com>
> +M: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>  S: Odd Fixes
>  F: util/buffer.c
>  F: include/qemu/buffer.h
>=20=20
>  I/O Channels
> -M: Daniel P. Berrange <berrange@redhat.com>
> +M: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>  S: Maintained
>  F: io/
>  F: include/io/
>  F: tests/unit/test-io-*
>=20=20
>  User authorization
> -M: Daniel P. Berrange <berrange@redhat.com>
> +M: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>  S: Maintained
>  F: authz/
>  F: qapi/authz.json
> @@ -4045,14 +4045,14 @@ F: include/authz/
>  F: tests/unit/test-authz-*
>=20=20
>  Sockets
> -M: Daniel P. Berrange <berrange@redhat.com>
> +M: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>  S: Maintained
>  F: include/qemu/sockets.h
>  F: util/qemu-sockets.c
>  F: qapi/sockets.json
>=20=20
>  File monitor
> -M: Daniel P. Berrange <berrange@redhat.com>
> +M: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>  S: Odd Fixes
>  F: util/filemonitor*.c
>  F: include/qemu/filemonitor.h
> @@ -4190,7 +4190,7 @@ F: docs/specs/fsi.rst
>  F: tests/qtest/aspeed_fsi-test.c
>=20=20
>  Firmware schema specifications
> -R: Daniel P. Berrange <berrange@redhat.com>
> +R: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>  R: Kashyap Chamarthy <kchamart@redhat.com>
>  S: Orphan
>  F: docs/interop/firmware.json
> @@ -4691,7 +4691,7 @@ F: tests/vm/freebsd
>  Functional testing framework
>  M: Thomas Huth <th.huth+qemu@posteo.eu>
>  R: Philippe Mathieu-Daud=C3=A9 <philmd@oss.qualcomm.com>
> -R: Daniel P. Berrange <berrange@redhat.com>
> +R: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>  S: Odd Fixes
>  F: docs/devel/testing/functional.rst
>  F: scripts/clean_functional_cache.py
> @@ -4723,7 +4723,7 @@ F: .gitlab-ci.d/custom-runners/debian-13-ppc64le.yml
>  Documentation
>  -------------
>  Build system architecture
> -M: Daniel P. Berrange <berrange@redhat.com>
> +M: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>  S: Odd Fixes
>  F: docs/devel/build-system.rst
>=20=20
> @@ -4753,7 +4753,7 @@ Build System
>  Meson
>  M: Paolo Bonzini <pbonzini@redhat.com>
>  R: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> -R: Daniel P. Berrange <berrange@redhat.com>
> +R: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>  R: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
>  S: Maintained
>  F: meson.build
> @@ -4785,7 +4785,7 @@ F: hw/*/Kconfig*
>  F: target/*/Kconfig*
>=20=20
>  GIT submodules
> -M: Daniel P. Berrange <berrange@redhat.com>
> +M: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>  S: Odd Fixes
>  F: scripts/git-submodule.sh

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

