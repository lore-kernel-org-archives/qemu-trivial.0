Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mUnLn-0007vk-Lo
	for mharc-qemu-trivial@gnu.org; Mon, 27 Sep 2021 05:55:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mUnLi-0007rO-Bp
 for qemu-trivial@nongnu.org; Mon, 27 Sep 2021 05:55:02 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:43683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mUnLf-0005pS-Qx
 for qemu-trivial@nongnu.org; Mon, 27 Sep 2021 05:55:02 -0400
Received: by mail-wr1-x432.google.com with SMTP id x20so6065471wrg.10
 for <qemu-trivial@nongnu.org>; Mon, 27 Sep 2021 02:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=jhw/SVDuUwd/aFiSKD2igaFIywXAwoWZZ37t7zIoWm0=;
 b=gmsglJ2oHZHlId005mxc7vcHYg6S6hldqL2bogvCPHEBhUdu3uEam2EANS/5Ln6i5H
 y+2IARo4sFgo2qkamqLbIggdDPFCwUz+MBOS+Rz1kM295DMUoP/QK96tEWDDlC3ahqod
 xC4cc8YjhS7hYv3wAYaEwMJJgYCS507DQqNxezS9ZRzcrwosE53jjNE5oiDRXpn+/ZXn
 4lDCjUFtZnUvEQE5siSO23HHVf0uVtpFu5jGjETYSncqLa5ZaQqkMpjALXANCpdCrRhz
 SjbgOIHfmJvqNphCRMJ64lI43iX66EjnoUuhf4Q/OY7XKuihz/TSWU5srW0XhVVSPHba
 aJbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=jhw/SVDuUwd/aFiSKD2igaFIywXAwoWZZ37t7zIoWm0=;
 b=Ay7bvG1brtI3s4rlE2pfkXVIhySTdvY2dFOgZvcA4GozP/gdZwHTGz2gHgyqEv0pHp
 IBBAhtUKWdRF2PYWiuYl+gdlNsZk3DpiHTDgc407r0GvLujOkXCCefgW6Gllqfsqi/0g
 lu1MhqUB8t89Yjkedexjoq4l+HrPaIbwCYl3DfKXqxzyJe5tykezj82J33sX1p+rgcnn
 b6vqfwz4n5JqZfBL4or1yeCBFgwdjwkkV0jNqRRm+licJdGU1J+TBrGaVzBAcbpXqna3
 w/d/yxOssBNQUm5nEjthKnS2zJgVlhEvm3wmJTQM4sNA20vI2Mq098qC6lHmkn32mkvM
 Y8Nw==
X-Gm-Message-State: AOAM533cW3ILR2A9zd9usZSc/RzS0QFHWxXe116YbbuSuyTbW7TK4Nj5
 32RDVMOVlW2VUmlWT7e6Jw9sndyKor566PtVmjtCPg==
X-Google-Smtp-Source: ABdhPJyFkhD+x0oFNbwhQuU5NTd917l/eEfev2dH3pM2XFO8bRf6LZ+NaKqjF/xS8tXmHlAn4Agz2fk8rqeaqCWrrHE=
X-Received: by 2002:adf:f185:: with SMTP id h5mr27448151wro.302.1632736495977; 
 Mon, 27 Sep 2021 02:54:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210926220103.1721355-1-f4bug@amsat.org>
 <20210926220103.1721355-2-f4bug@amsat.org>
 <CAFEAcA_pRwZz=cK7=EjTsffhfhkXA-WvfecYWQ16sHYW+yQJBA@mail.gmail.com>
 <CAAdtpL7DesxBWZkjZdrWtSVNuqzqthPR-MMdCCd4LMg+Rnudww@mail.gmail.com>
In-Reply-To: <CAAdtpL7DesxBWZkjZdrWtSVNuqzqthPR-MMdCCd4LMg+Rnudww@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Sep 2021 10:54:02 +0100
Message-ID: <CAFEAcA-+VJgRJjBCaVQak0kq4ruku64riNOESFAse3+ZJdWq0w@mail.gmail.com>
Subject: Re: [PATCH 1/2] bsd-user: Only process meson rules on BSD host
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 Warner Losh <imp@bsdimp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 27 Sep 2021 09:55:02 -0000

On Mon, 27 Sept 2021 at 10:40, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
>
> On Mon, Sep 27, 2021 at 11:15 AM Peter Maydell <peter.maydell@linaro.org>=
 wrote:
> > On Sun, 26 Sept 2021 at 23:04, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat=
.org> wrote:
> > > Reported-by: Warner Losh <imp@bsdimp.com>
> > > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> > > ---
> > >  bsd-user/meson.build | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > >
> > > diff --git a/bsd-user/meson.build b/bsd-user/meson.build
> > > index 03695493408..a7607e1c884 100644
> > > --- a/bsd-user/meson.build
> > > +++ b/bsd-user/meson.build
> > > @@ -1,3 +1,7 @@
> > > +if not config_host.has_key('CONFIG_BSD')
> > > +  subdir_done()
> > > +endif
> > > +
> > >  bsd_user_ss.add(files(
> > >    'bsdload.c',
> > >    'elfload.c',
> >
> >
> > So, what's the reason for this change?
>
> https://lore.kernel.org/qemu-devel/CANCZdfprC16ezJQCWJmYEApX6eym9nxSOqAtB=
AGr+cziS4r2qw@mail.gmail.com/
>
> linux-user/meson.build is evaluated on bsd, and bsd-user/meson.build on L=
inux.

True, but "meson.build is evaluated but just does nothing or
adds files to a sourceset that isn't used" is pretty common
(hw/pci/meson.build is evaluated even if we're not building
a system with PCI support, for example). If there's a reason
why bsd-user and linux-user are special we should explain it,
I think.

thanks
-- PMM

