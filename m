Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lEtxi-0001NX-1h
	for mharc-qemu-trivial@gnu.org; Wed, 24 Feb 2021 08:12:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lEtxf-0001Lr-53
 for qemu-trivial@nongnu.org; Wed, 24 Feb 2021 08:12:15 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:45004)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lEtxW-0004Sg-I9
 for qemu-trivial@nongnu.org; Wed, 24 Feb 2021 08:12:14 -0500
Received: by mail-ej1-x62e.google.com with SMTP id w1so2943193ejf.11
 for <qemu-trivial@nongnu.org>; Wed, 24 Feb 2021 05:12:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Tzoa8C+Zlvv75pkQYDqXV0W8pQmKCJwDIVjozxFOjow=;
 b=sD/FR7WFlEl0v5zJLf4geRYmCc5qL5atTxrbPEG0Gn1hUl76fSP6u9gwY25JvWeOfh
 /yEmA3X0QlPueMPADvpcgtnOkOhyeIRMVACsLUmpudsICTzLuUkr3dCy77/xADHjFBwc
 xq6Sj/hZftl8oOO0tN4GtF6AFihrV+1wN4sj4JJFBl+qVB+lY/L44v0N7V44GOz/boxC
 xJhT9iyKReUp/Bbr6oNN2AzXMkikx3u653yXT9yAyNv/Lkm0dZOfnHoSw7fGVlMIZjwT
 RhambfrU59jM3KIp6dxi8p4Zh3PhEVtG4V3k3A25jI5YJOaROAopIiO8d0Rn+4vW9Fso
 JUJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Tzoa8C+Zlvv75pkQYDqXV0W8pQmKCJwDIVjozxFOjow=;
 b=MCYpm7Q0pxMJc/ZcsJ8H8ZlldbWJn8svGhh2oel3QZF4VI6cyey5FDytPThsmMwUUz
 Rs/XeUQIFOR8Vgnt8vcrlPFNtSjL4fj7pzXTADvj4atnRLO9N4IxnAKaIedZlqWw4GUd
 PVzILME9siAUlPQ0YCS9Srb6gaeOlCqmFXAjE+4WdCi5UXMVHSJ01LJ+la+8R/z6PkNv
 1FI0kxX2oGA3WYqggkWOKddyGHcjWKVANLX3U8+QZJQwRDuBzdLPRNbRdbcD9oL05Z4/
 7mjvzcZvxdU73SUr21aUdIBGNbLJDoqZ5WL80BuKvGWMLMxmEeQWzMgCMbpcNxm+qMjv
 mLjg==
X-Gm-Message-State: AOAM5303dxtIGI3Dv/2BfdyYhLvXM0jOVDgag7DenTdr1nvux+bT/Haw
 YzGBTCY+eGLFVFmbjrCrrBIEmTjJ+QhJDYbhYpCt4Q==
X-Google-Smtp-Source: ABdhPJxEF7BcR4+g1MWO5/LkP0n5ec4u9iDGQ85GqcezlAgjbrT0DBRL3CKxitMyhsu5sghKEHt2yVoOL5SP5CB4g4w=
X-Received: by 2002:a17:906:1ecc:: with SMTP id
 m12mr12042016ejj.4.1614172323275; 
 Wed, 24 Feb 2021 05:12:03 -0800 (PST)
MIME-Version: 1.0
References: <20210224120923.3154325-1-philmd@redhat.com>
In-Reply-To: <20210224120923.3154325-1-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 24 Feb 2021 13:11:52 +0000
Message-ID: <CAFEAcA8OxLPeOb0TEAKSU-qJYntFPhmPeqooW5=C_55B8X+d_A@mail.gmail.com>
Subject: Re: [PATCH] meson: Only generate trace files for selected targets
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Wed, 24 Feb 2021 13:12:15 -0000

On Wed, 24 Feb 2021 at 12:11, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> We don't need to generate trace files for targets we
> are not building. Restrict the the ones selected.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  meson.build | 10 +---------
>  1 file changed, 1 insertion(+), 9 deletions(-)
>
> diff --git a/meson.build b/meson.build
> index 05a67c20d93..c9b0433667d 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1826,15 +1826,6 @@
>    trace_events_subdirs +=3D [
>      'accel/tcg',
>      'hw/core',
> -    'target/arm',
> -    'target/hppa',
> -    'target/i386',
> -    'target/i386/kvm',
> -    'target/mips',
> -    'target/ppc',
> -    'target/riscv',
> -    'target/s390x',
> -    'target/sparc',
>    ]
>  endif
>
> @@ -2166,6 +2157,7 @@
>    t =3D target_arch[arch].apply(config_target, strict: false)
>    arch_srcs +=3D t.sources()
>    arch_deps +=3D t.dependencies()
> +  trace_events_subdirs +=3D ['target' / arch]

This will catch all the 'target/foo' entries deleted above,
but what about 'target/i386/kvm' ?

thanks
-- PMM

