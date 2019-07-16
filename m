Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hnLDO-0006hd-A2
	for mharc-qemu-trivial@gnu.org; Tue, 16 Jul 2019 07:01:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58273)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <rfried.dev@gmail.com>) id 1hnLDM-0006ZM-5p
 for qemu-trivial@nongnu.org; Tue, 16 Jul 2019 07:01:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <rfried.dev@gmail.com>) id 1hnLDJ-0006M9-RW
 for qemu-trivial@nongnu.org; Tue, 16 Jul 2019 07:01:43 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:41454)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <rfried.dev@gmail.com>)
 id 1hnLDC-0006D0-3G; Tue, 16 Jul 2019 07:01:37 -0400
Received: by mail-wr1-x441.google.com with SMTP id c2so17248319wrm.8;
 Tue, 16 Jul 2019 04:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Y/nrn1aTBBWiysRlPUFbQtjQuzJcAjKwSSO7nD8QQOo=;
 b=HRdH4wS7FFN3Q0/o52Yl8KUEwq7xNcBdHTayjh0lVvNs+s59xwhIRaCog+8fB991j1
 uuB5FvLWoPJkU8bTqS3nuNHT5+sskniV39tOK6BxWrmL5//t7qPfxi2V8tr8noc4M48P
 ZTBe9PBarxo3ffpfyxpLIPgjWsZxhPr19q9dq6wn6bgdNudbUY9+tCiRmf6LG/dDFEEt
 CWYhP8RpwHXPoNViKdjbYm7MhGe+7DKQVBrGtq9v2Usc/rXeEHyAccXWYygKChBOgRBY
 C8sePfFZqhadec+Zyj2m69ZmKB0VYTc0wOwafa6Uiu1nouKVpBjX2/mL6DU2KlqepYNp
 1O6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Y/nrn1aTBBWiysRlPUFbQtjQuzJcAjKwSSO7nD8QQOo=;
 b=f4XpcJ0OfKDLP+h73nwVAG9eEySIJRFBNPwId94YoyXSLC3TYwGJdjAHV2PdFyLCtO
 Vchm/CWWH2nnHn3Gw9KgqvuG3qHi/LstvjlVrE1bW914yotSHAnN54An8Lbn4UqguY52
 n6/qk8kpI9mRuO+JMftdEF1zRZv/0wLiITbLW62fiIJau73/vc9gKtQysDm2oK96XCic
 jsSjNLHzyooUi8S9ayUCyVrQWqTeIBWUxbFWU1dFpqRGfCoBl8qHFOvxr8U8VgxucuVB
 zMCleTZnNyxa/mKf871McImulyY0fuBk27vk+uR4Fmz4SpAC6WqumlrzB/amhkHQjpdo
 ppWQ==
X-Gm-Message-State: APjAAAWKGek0Yy/k7ZoZRdsoYNsDr5kcNb/ZCs+lW43vrwHHNhTEuqCL
 OsOQ+V0uue0d8NgksWuWLk3nXniRaa/MkCAruoo=
X-Google-Smtp-Source: APXvYqzxlsYTxG4iu27yLGHJfiiVnpBWNDDvUHVmxIh1Kky0Bvn5/NfZ7J5KntS5o1qKpfw+ttG9YvLNEsEI1GYBrvA=
X-Received: by 2002:adf:ed8a:: with SMTP id c10mr36701175wro.33.1563274887142; 
 Tue, 16 Jul 2019 04:01:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190615051722.13994-1-rfried.dev@gmail.com>
 <CAGi-RUJazCVVh9NwpQ1AHfPdPLW1aYxKst6w6PKfCk2doBz_9w@mail.gmail.com>
 <8422687a-f410-64a4-1211-b06a4f26681e@redhat.com>
In-Reply-To: <8422687a-f410-64a4-1211-b06a4f26681e@redhat.com>
From: Ramon Fried <rfried.dev@gmail.com>
Date: Tue, 16 Jul 2019 14:01:16 +0300
Message-ID: <CAGi-RUJHBfNedjaFvotpBAH-PcMox-j8aDpYzP6a5VhxseykgQ@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Jason Wang <jasowang@redhat.com>, 
 Alistair Francis <alistair@alistair23.me>,
 "open list:Xilinx Zynq" <qemu-arm@nongnu.org>, 
 Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::441
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] net: cadence_gem: clear RX
 control descriptor
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
X-List-Received-Date: Tue, 16 Jul 2019 11:01:45 -0000

On Tue, Jul 16, 2019 at 10:19 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> On 7/16/19 9:11 AM, Ramon Fried wrote:
> > ping
> >
> > On Sat, Jun 15, 2019 at 8:17 AM Ramon Fried <rfried.dev@gmail.com> wrot=
e:
> >>
> >> The RX ring descriptors control field is used for setting
> >> SOF and EOF (start of frame and end of frame).
> >> The SOF and EOF weren't cleared from the previous descriptors,
> >> causing inconsistencies in ring buffer.
> >> Fix that by clearing the control field of every descriptors we're
> >> processing.
> >>
> >> Signed-off-by: Ramon Fried <rfried.dev@gmail.com>
> >> ---
> >>  hw/net/cadence_gem.c | 7 +++++++
> >>  1 file changed, 7 insertions(+)
> >>
> >> diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
> >> index ecee22525c..d83a82bdb0 100644
> >> --- a/hw/net/cadence_gem.c
> >> +++ b/hw/net/cadence_gem.c
> >> @@ -406,6 +406,11 @@ static inline void rx_desc_set_sof(uint32_t *desc=
)
> >>      desc[1] |=3D DESC_1_RX_SOF;
> >>  }
> >>
> >> +static inline void rx_desc_clear(uint32_t *desc)
> >> +{
> >> +    desc[1]  =3D 0;
> >> +}
> >> +
> >>  static inline void rx_desc_set_eof(uint32_t *desc)
> >>  {
> >>      desc[1] |=3D DESC_1_RX_EOF;
> >> @@ -994,6 +999,8 @@ static ssize_t gem_receive(NetClientState *nc, con=
st uint8_t *buf, size_t size)
> >>          bytes_to_copy -=3D MIN(bytes_to_copy, rxbufsize);
> >>
> >>          /* Update the descriptor.  */
> >> +        rx_desc_clear(s->rx_desc[q]);
>
> Maybe move the call before the comment, regardless:
Make sense, sent v2.
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>
> >> +
> >>          if (first_desc) {
> >>              rx_desc_set_sof(s->rx_desc[q]);
> >>              first_desc =3D false;
> >> --
> >> 2.21.0
> >>

