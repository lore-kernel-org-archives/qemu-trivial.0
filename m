Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kzeSd-0002G2-Pr
	for mharc-qemu-trivial@gnu.org; Wed, 13 Jan 2021 06:37:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kzeSd-0002Fe-3T
 for qemu-trivial@nongnu.org; Wed, 13 Jan 2021 06:37:11 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:39396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kzeSa-0004Gp-T2
 for qemu-trivial@nongnu.org; Wed, 13 Jan 2021 06:37:10 -0500
Received: by mail-ed1-x532.google.com with SMTP id c7so1535618edv.6
 for <qemu-trivial@nongnu.org>; Wed, 13 Jan 2021 03:37:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4F1rmmgzkcYAHDbt+LpZar8xaojmFJxb7Xqq4gkK6BM=;
 b=SgFzl6SCUKomp9/rXHcmO68qwJXKInafIEhap905AWHxVCUbi0RORFtSY3nUFR7OuQ
 oqeRZ2ySroRQdds2GbD/kcS8T8i47oKm7B+/69CvcqnzZwV2nAMx1pqFYh3UZ2s7skNd
 ym6wsO2JqG+M9zZWX47cqQuI3cPKzUi5nMfYXNM1JItICkmFXeolebL8JvRaKdTYaPD2
 Jhggtnby6OkCeS3FLwjih6uL9behMY3eaB/nQOI+A/l/WXRNoWler+VAfr13XBL6C/q/
 q88viu81oItwi/KcfZofbMI2gI87hC6j/74P2WvZcrbAUkJZne78cabvLkEoor4tVGqP
 If7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4F1rmmgzkcYAHDbt+LpZar8xaojmFJxb7Xqq4gkK6BM=;
 b=YBZFzhEZyW2qFNQJZ5OXB+lrhaO2RhbTgIFeUVODCUOyjrWEHJWPkCwZia4zeGHwi3
 ZrI4MjA5nqwZpQpppNLB8VSJVI4dWdEhwK8A6oFFDVDTC3CW6nBqQ/aDlkAdCgi7mBcg
 MN+G9BwP9ILduZjuPtwG4j330YrSWIntG/yb7Gd/ahF0gUqWe8zHom8cTAFB005rNOab
 /UQgQjlLy4E+H58wwvxTYz9HYlF2giTX4rvSxA0CNzDRlR83W3qd/ZMr1sSHe35EBF8p
 7E3d9ZCNOfudYliSDaIOAOT4inqqsa16u+wieID7WtI4ZF04gEVJvSV/9SeK3fQpyeNw
 MkQg==
X-Gm-Message-State: AOAM532IiR5FDbsOIRRGSjt/Z2bdtOZshlgRdWCeDbaxsoINYh2sO5oG
 inJli60H0l1d0CxbQ6kW81CMuFFMvXide5UACTBvSA==
X-Google-Smtp-Source: ABdhPJzj1xn+B3XyIrFGeol6n1IV8bxn06RSlnQBWgrWcSTcm2KSF8hdIlmMGd/QNyTk+WmtLOQgg5A2jbtfLMcPXZs=
X-Received: by 2002:aa7:d915:: with SMTP id a21mr1389742edr.251.1610537827012; 
 Wed, 13 Jan 2021 03:37:07 -0800 (PST)
MIME-Version: 1.0
References: <20201221005318.11866-1-jiaxun.yang@flygoat.com>
 <20201221005318.11866-4-jiaxun.yang@flygoat.com>
 <fb676594-d25d-5f13-ef1e-0e4a7e77ca63@redhat.com>
In-Reply-To: <fb676594-d25d-5f13-ef1e-0e4a7e77ca63@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 13 Jan 2021 11:36:55 +0000
Message-ID: <CAFEAcA_B_-FXnKOF2=_knv6UntTVDA6oVLzdpX=DpC0smC=ZPw@mail.gmail.com>
Subject: Re: [PATCH 3/9] configure/meson: Only check sys/signal.h on non-Linux
To: Thomas Huth <thuth@redhat.com>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, 
 QEMU Trivial <qemu-trivial@nongnu.org>, Kevin Wolf <kwolf@redhat.com>,
 Fam Zheng <fam@euphon.net>, kvm-devel <kvm@vger.kernel.org>,
 Viktor Prutyanov <viktor.prutyanov@phystech.edu>, 
 Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Alistair Francis <alistair@alistair23.me>, Greg Kurz <groug@kaod.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, qemu-ppc <qemu-ppc@nongnu.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Qemu-block <qemu-block@nongnu.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
 David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
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
X-List-Received-Date: Wed, 13 Jan 2021 11:37:11 -0000

On Wed, 13 Jan 2021 at 07:06, Thomas Huth <thuth@redhat.com> wrote:
>
> On 21/12/2020 01.53, Jiaxun Yang wrote:
> > signal.h is equlevant of sys/signal.h on Linux, musl would complain
> > wrong usage of sys/signal.h.
> >
> > In file included from /builds/FlyGoat/qemu/include/qemu/osdep.h:108,
> >                   from ../tests/qemu-iotests/socket_scm_helper.c:13:
> > /usr/include/sys/signal.h:1:2: error: #warning redirecting incorrect #include <sys/signal.h> to <signal.h> [-Werror=cpp]
> >      1 | #warning redirecting incorrect #include <sys/signal.h> to <signal.h>
> >        |  ^~~~~~~
> >
> > Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> > ---
> >   meson.build | 5 ++++-
> >   1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/meson.build b/meson.build
> > index 372576f82c..1ef8722b3a 100644
> > --- a/meson.build
> > +++ b/meson.build
> > @@ -841,7 +841,10 @@ config_host_data.set('HAVE_DRM_H', cc.has_header('libdrm/drm.h'))
> >   config_host_data.set('HAVE_PTY_H', cc.has_header('pty.h'))
> >   config_host_data.set('HAVE_SYS_IOCCOM_H', cc.has_header('sys/ioccom.h'))
> >   config_host_data.set('HAVE_SYS_KCOV_H', cc.has_header('sys/kcov.h'))
> > -config_host_data.set('HAVE_SYS_SIGNAL_H', cc.has_header('sys/signal.h'))
> > +if targetos != 'linux'
> > +  # signal.h is equlevant of sys/signal.h on Linux
> > +  config_host_data.set('HAVE_SYS_SIGNAL_H', cc.has_header('sys/signal.h'))
> > +endif
>
> Seems like it sys/signal.h was introduced for OpenBSD once (see commit
> 128ab2ff50a), so this new check should be fine.

The right way to fix this would be to apply
https://patchew.org/QEMU/20201027003848.10920-1-mforney@mforney.org/
which got reviewed but never applied (it might need a respin to work
with meson) which simply removes the sys/signal.h include and the
"does the header exist" test entirely -- there is no platform which
needs sys/signal.h.

thanks
-- PMM

