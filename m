Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jks2J-0000dl-RK
	for mharc-qemu-trivial@gnu.org; Mon, 15 Jun 2020 12:32:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jks2H-0000cd-S6
 for qemu-trivial@nongnu.org; Mon, 15 Jun 2020 12:32:37 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:43469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jks2F-0007IA-Cl
 for qemu-trivial@nongnu.org; Mon, 15 Jun 2020 12:32:37 -0400
Received: by mail-oi1-x243.google.com with SMTP id j189so16393070oih.10
 for <qemu-trivial@nongnu.org>; Mon, 15 Jun 2020 09:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ZelwX56DSyGXsrRtDx0Fo1LHHCV3MBy8/FrDkipWvC8=;
 b=zBW8iBl5epTtN9o/yzkLClhZZ+i2fMJL2Wh9IYV1InrocZMwNJF8qbUvNvrl/aKYH8
 mPn2r58MAJ5WjRS8in5bL9BoVxH8nwikwYH2IMTCjy2rzGMaGeNf8qtbKlte/zVlFUIB
 R+jqCTixs4rsJdc24WVBkdcmKJRfBtc/TbqlT0y0fhd8SIvx7JLwWr2iHuzZEoN623CH
 RUG1yr25lT/cInRbSRLm7pDw9l6uYB9s2B5V9OwjXgIAeABgFU/7S9TEc7o2AC2SbCEa
 ZEOjPnxTtQlWYfPweQvrxNVonNkV/baG6hoHY6P+B931HGpV72BNu/EF7e6Oba4jq7G9
 o8Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ZelwX56DSyGXsrRtDx0Fo1LHHCV3MBy8/FrDkipWvC8=;
 b=MrsX/stPBm6twNWshq6wx3RqqycUxT+Y7gMLitWgRHFaGyqL9sGbfSslADMf0ec5gW
 0OK65CZVw6K+PSS6beAwMtKRM1P3h1qCBTddLaaI/Rk2QeuHmxK87j3Ac4rsSpJKUy7B
 jtnQN6p1fmc+r6al+gqiId7XGw4u9Ud2/liSh/krtFlyEYC3NWE3aXEVfF7wDW8fOf1f
 yKXPHBSrE+G6YlqkeAJxHAmXZb60QR0IBIDKcQDBuNV85a517x2mkKLtQzdjZnzj87LL
 VxDdfPKHxGpYwP/1oVfdCMxNtBR8H6ZQoN+TFXZNwYbwidmLjXe5HyU6VjG39v5dOENW
 hHqw==
X-Gm-Message-State: AOAM5326pEbbvvc6xApbUTYQgXQeEYN5ipqK65DEwlGOOguyVHfwnJuc
 u3jS5pe8SV8iLzdIk3gxjkXqNLaWg9LjE3Sqsm+5GA==
X-Google-Smtp-Source: ABdhPJx0+3tay1ed01q4wis4ixRhUvAwiCiPKjG8iPpmWSzqSF45O3/hGzw2Ki78icpZ648R7zIMb02c+OR2ksvAMdI=
X-Received: by 2002:aca:5152:: with SMTP id f79mr135331oib.146.1592238754102; 
 Mon, 15 Jun 2020 09:32:34 -0700 (PDT)
MIME-Version: 1.0
References: <1591663670-47712-1-git-send-email-wang.yi59@zte.com.cn>
 <94e456a8-0b4f-e1fd-7baa-8f81f36c6872@redhat.com>
 <31290c21-01bb-e191-a166-1595f4fc8549@redhat.com>
In-Reply-To: <31290c21-01bb-e191-a166-1595f4fc8549@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 Jun 2020 17:32:22 +0100
Message-ID: <CAFEAcA-D440Z4-cPdmpMXJcfkxjrHTOvwO2PG5BhyXMzRCQN+w@mail.gmail.com>
Subject: Re: [PATCH] Makefile: Install qemu-[qmp/ga]-ref.* into the directory
 "interop"
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
 Yi Wang <wang.yi59@zte.com.cn>, QEMU Developers <qemu-devel@nongnu.org>,
 xue.zhihong@zte.com.cn, 
 QEMU Trivial <qemu-trivial@nongnu.org>, wang.liang82@zte.com.cn, 
 Liao Pingfang <liao.pingfang@zte.com.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::243;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x243.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Mon, 15 Jun 2020 16:32:38 -0000

On Mon, 15 Jun 2020 at 17:13, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 09/06/20 06:28, Philippe Mathieu-Daud=C3=A9 wrote:
> > On 6/9/20 2:47 AM, Yi Wang wrote:
> >> From: Liao Pingfang <liao.pingfang@zte.com.cn>
> >>
> >> We need install qemu-[qmp/ga]-ref.* files into the subdirectory of qem=
u docs: interop.
> >>
> >> If we visit the following address and click the link to qemu-qmp-ref.h=
tml:
> >> https://www.qemu.org/docs/master/interop/bitmaps.html#basic-qmp-usage
> >>
> >> It will report following error:
> >> "
> >> Not Found
> >> The requested URL /docs/master/interop/qemu-qmp-ref.html was not found=
 on this server.
> >> "
> >>

> Queued, thanks.

I guess this works, but it's kind of odd because it's installing
a non-Sphinx document into the Sphinx manual directory.

I'm hoping we'll be able to land the conversion of the qapigen
stuff to rst this cycle, which will make this change moot;
so I suppose it's the most expedient fix for the moment.

thanks
-- PMM

