Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j6XJ5-0004UV-9U
	for mharc-qemu-trivial@gnu.org; Tue, 25 Feb 2020 05:19:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32871)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j6XJ2-0004QU-75
 for qemu-trivial@nongnu.org; Tue, 25 Feb 2020 05:19:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j6XJ0-0002ls-Tl
 for qemu-trivial@nongnu.org; Tue, 25 Feb 2020 05:19:11 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:35899)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j6XJ0-0002lU-NP
 for qemu-trivial@nongnu.org; Tue, 25 Feb 2020 05:19:10 -0500
Received: by mail-oi1-x241.google.com with SMTP id c16so12047651oic.3
 for <qemu-trivial@nongnu.org>; Tue, 25 Feb 2020 02:19:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=TdkyP/waG7yMrG/55LzQ/BCApLNTU/cpSkgd5WpaZ5s=;
 b=aJWGuqcsByu/PctTrI4xgpYxuFAB4bA2DPvEp3HYGzFo5ooSb3oYOA9ZD3ooOz8jTZ
 Y0fCOWTOpLCQwEx6se80O62AQIFRkGDPjvvupqwQ/rz59l9S4EKjaJJE15ywIBHDcEyn
 ZuTStkywfr+S7igr9M8vyOiyfiEzwtS9FQY7mm3gvJvwJoQf3j9LWJCtn7YQVwteQAm6
 tf49t02Hsdr8klM5iUQPvGSGOpa6EMJRKiqS8X6GrlFdAvy7tA3SfcXcTv4fFw7kzgBG
 4itfHuaO9EDGCfMZuOafXebRWkDoQJiVwT53U8JHN0kfXuxk2gLA0qZEN4zZY5FXfWSK
 f+SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=TdkyP/waG7yMrG/55LzQ/BCApLNTU/cpSkgd5WpaZ5s=;
 b=dBwcR+VdTV4oumdt+zrsafMuE1z+w5dQ3uB65aUMXSY1ipkQVaGkAx2V4zgVNkPBpr
 Z/pfy4alI22YS0fDQHqFOES1Qt7k4UgClcyw7Ub41OZZK77+1Qi6q70K/T0H1GvpzzVQ
 YwXwq4e5X75YRYb2uNI1/Kz1BUhfKSL5koLYT28c7XAEVVmSf0WVSIJLodBxO8Q+w/vu
 xu6xHoEAyOdk1rm2FK0iSg0aE/t16YrTFHmHa3N8i+jma+wSo6eBIGIi0AqYoB2jGkdq
 6Kvd+ZLmCdHesRks90Fe5akd5gSojUynURbESt5kS11b6k/GlSegLohau3MUMvqsQbmq
 RxXw==
X-Gm-Message-State: APjAAAUL7hCb+DhRx4RIQhS/zoWeLhr+bwOEc/K8Xu/8pra+EwNR5zJY
 0k5obtQfSnFZODA+XZ8Dd/2hu3o7gaFYTrlIgD1hFQ==
X-Google-Smtp-Source: APXvYqwgO0aXqWFccuXt5YmWKmc41+jx8r1lIOxjxHtWt1MJgvvcFotRzD5SJ35lz+QWcUVfX/bl1EKJY6LGAfDm0zo=
X-Received: by 2002:a54:4f16:: with SMTP id e22mr3029042oiy.170.1582625949753; 
 Tue, 25 Feb 2020 02:19:09 -0800 (PST)
MIME-Version: 1.0
References: <20200225025923.19328-1-kuhn.chenqun@huawei.com>
 <9206dda7-0e12-b68e-87ca-1985b61381bc@redhat.com>
In-Reply-To: <9206dda7-0e12-b68e-87ca-1985b61381bc@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Feb 2020 10:18:58 +0000
Message-ID: <CAFEAcA-W+brVEmGr29i6JO4GFrnoLAce-qoMQpQc56x6B4BY3A@mail.gmail.com>
Subject: Re: [PATCH] hw/net/imx_fec: write TGSR and TCSR3 in imx_enet_write()
To: Jason Wang <jasowang@redhat.com>
Cc: Chen Qun <kuhn.chenqun@huawei.com>, QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>,
 zhanghailiang <zhang.zhanghailiang@huawei.com>, 
 Peter Chubb <peter.chubb@nicta.com.au>, qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::241
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
X-List-Received-Date: Tue, 25 Feb 2020 10:19:14 -0000

On Tue, 25 Feb 2020 at 05:41, Jason Wang <jasowang@redhat.com> wrote:
>
>
> On 2020/2/25 =E4=B8=8A=E5=8D=8810:59, Chen Qun wrote:
> > The current code causes clang static code analyzer generate warning:
> > hw/net/imx_fec.c:858:9: warning: Value stored to 'value' is never read
> >          value =3D value & 0x0000000f;
> >          ^       ~~~~~~~~~~~~~~~~~~
> > hw/net/imx_fec.c:864:9: warning: Value stored to 'value' is never read
> >          value =3D value & 0x000000fd;
> >          ^       ~~~~~~~~~~~~~~~~~~
> >
> > According to the definition of the function, the two =E2=80=9Cvalue=E2=
=80=9D assignments
> >   should be written to registers.
> >
> > Reported-by: Euler Robot <euler.robot@huawei.com>
> > Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
> > ---
> > I'm not sure if this modification is correct, just from the function
> >   definition, it is correct.
> > ---
> >   hw/net/imx_fec.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
> > index 6a124a154a..92f6215712 100644
> > --- a/hw/net/imx_fec.c
> > +++ b/hw/net/imx_fec.c
> > @@ -855,13 +855,13 @@ static void imx_enet_write(IMXFECState *s, uint32=
_t index, uint32_t value)
> >           break;
> >       case ENET_TGSR:
> >           /* implement clear timer flag */
> > -        value =3D value & 0x0000000f;
> > +        s->regs[index] =3D value & 0x0000000f;
> >           break;

Hi; the datasheet for this SoC says that these bits
of the register are write-1-to-clear, so while this
is definitely a bug I don't think this is the right fix.

> >       case ENET_TCSR0:
> >       case ENET_TCSR1:
> >       case ENET_TCSR2:
> >       case ENET_TCSR3:
> > -        value =3D value & 0x000000fd;
> > +        s->regs[index] =3D value & 0x000000fd;
> >           break;

Here bit 7 is write-1-to-clear, though bits 0 and
2..5 are simple write-the-value.

> >       case ENET_TCCR0:
> >       case ENET_TCCR1:
>
>
> Applied.

Could you drop this from your queue, please?

thanks
-- PMM

