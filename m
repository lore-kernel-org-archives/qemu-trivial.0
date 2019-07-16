Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hnLDa-0007JU-C9
	for mharc-qemu-trivial@gnu.org; Tue, 16 Jul 2019 07:01:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58378)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <rfried.dev@gmail.com>) id 1hnLDV-00072K-MH
 for qemu-trivial@nongnu.org; Tue, 16 Jul 2019 07:01:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <rfried.dev@gmail.com>) id 1hnLDT-0006TP-HU
 for qemu-trivial@nongnu.org; Tue, 16 Jul 2019 07:01:53 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:35834)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <rfried.dev@gmail.com>)
 id 1hnLDN-0006OM-Gf; Tue, 16 Jul 2019 07:01:45 -0400
Received: by mail-wm1-x341.google.com with SMTP id l2so18234964wmg.0;
 Tue, 16 Jul 2019 04:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=mLuPacixCfQL1CqAQgfCd9QBEfriLajdZzVnBsDFPn4=;
 b=iNmU2TJZyaAxRkP9j0BcWKwgxig6Ed8x7tJmb38WV7RCJk/im0DjVWIxJYdG3/TwlX
 NVKPCU080FdJZjAmRhILgGUhrlq4/O+ILvaSmmkfqTHyGpXY2q3rQG8LdSGU1M2gc49Z
 rjH9HlXPq6p287V7P+clOjHZ6FfbS/4s9YgmmBsGAS1eNFny0jXMu2r6r7dYxb7hS/YM
 IUMSbqXy+eUZuCTH+VnIi5tDEj7C+RnkYCZ59fnCVs2dT8GBRnSZ63td3ePqL8u2BTuJ
 mJQRjJSIXKbTVBpqQm6U9V8wWB6WuO/gSa7nqEqWzMNdM4nKTshfbuB3BaYh2CbJOFj9
 ewPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=mLuPacixCfQL1CqAQgfCd9QBEfriLajdZzVnBsDFPn4=;
 b=eOEGxtxp4t4cbuqyJkzJPC6WPB9c0Y9aAClkZX+J+FoJG9aYCAXAl61ZyL+T1SgWVh
 GdMAz4k/lVAKRowXTYMA6Rf9cSBVrLiKPLRzmw/wwGg7YvQAGazvjQ2/mQlrLMwCDkCl
 SRYaEf2p6fiW54glEkjCpkduA3vtyxPeqiQNkFd9fzoL3g+IhrTV7qSi4NSh5Nm3W7z4
 r43vC6nM7lH5EDYtyqiG4n0B7E8g+W+6AESexzuiwT4Z0p5ICv+ZANnvL7x9fnEglbG8
 bxaJYpA8WlW07PFsEiAlTMU1HYNq0gcUhMY3Roy01mSUUHu0RhlYRLv92jQKS/kp2XW8
 EgaQ==
X-Gm-Message-State: APjAAAWdov+jVLKDRKo1zYe1KfkChBqNYdikGfXUcoaevgSjXPX/420v
 NTunSMebcyU1Nn3MLl1YqmWhkJ6mFMZlkajjQqs=
X-Google-Smtp-Source: APXvYqx3kRIuqKEJAuQUkLwBgzbS/D3N01GO5UhazSAMSHQ3yqv85+t+Tp/4MEX0nMGfh5tB6h3k3Ut87oVB3v++V5I=
X-Received: by 2002:a1c:35c2:: with SMTP id c185mr29733757wma.58.1563274904137; 
 Tue, 16 Jul 2019 04:01:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190615051722.13994-1-rfried.dev@gmail.com>
 <555fb9b5-361f-fc3f-ff35-38b993a29edd@redhat.com>
In-Reply-To: <555fb9b5-361f-fc3f-ff35-38b993a29edd@redhat.com>
From: Ramon Fried <rfried.dev@gmail.com>
Date: Tue, 16 Jul 2019 14:01:33 +0300
Message-ID: <CAGi-RUJPD+q8sCbRfffM2bxc7deLNY4Ewg0AOdkMKfJGQs95Aw@mail.gmail.com>
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, 
 "open list:Xilinx Zynq" <qemu-arm@nongnu.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::341
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
X-List-Received-Date: Tue, 16 Jul 2019 11:01:56 -0000

On Tue, Jul 16, 2019 at 11:42 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> On 2019/6/15 =E4=B8=8B=E5=8D=881:17, Ramon Fried wrote:
> > The RX ring descriptors control field is used for setting
> > SOF and EOF (start of frame and end of frame).
> > The SOF and EOF weren't cleared from the previous descriptors,
> > causing inconsistencies in ring buffer.
> > Fix that by clearing the control field of every descriptors we're
> > processing.
> >
> > Signed-off-by: Ramon Fried <rfried.dev@gmail.com>
> > ---
> >   hw/net/cadence_gem.c | 7 +++++++
> >   1 file changed, 7 insertions(+)
> >
> > diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
> > index ecee22525c..d83a82bdb0 100644
> > --- a/hw/net/cadence_gem.c
> > +++ b/hw/net/cadence_gem.c
> > @@ -406,6 +406,11 @@ static inline void rx_desc_set_sof(uint32_t *desc)
> >       desc[1] |=3D DESC_1_RX_SOF;
> >   }
> >
> > +static inline void rx_desc_clear(uint32_t *desc)
>
>
> Nit: is this better to name this as "rx_desc_clear_control()" ?
I agree, sent v2.
>
> Thanks
>
>
> > +{
> > +    desc[1]  =3D 0;
> > +}
> > +
> >   static inline void rx_desc_set_eof(uint32_t *desc)
> >   {
> >       desc[1] |=3D DESC_1_RX_EOF;
> > @@ -994,6 +999,8 @@ static ssize_t gem_receive(NetClientState *nc, cons=
t uint8_t *buf, size_t size)
> >           bytes_to_copy -=3D MIN(bytes_to_copy, rxbufsize);
> >
> >           /* Update the descriptor.  */
> > +        rx_desc_clear(s->rx_desc[q]);
> > +
> >           if (first_desc) {
> >               rx_desc_set_sof(s->rx_desc[q]);
> >               first_desc =3D false;
>
>
>

