Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hMFr4-0001q8-FJ
	for mharc-qemu-trivial@gnu.org; Thu, 02 May 2019 13:50:46 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49056)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1hMFqz-0001o0-MY
	for qemu-trivial@nongnu.org; Thu, 02 May 2019 13:50:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1hMFqy-0008T6-IH
	for qemu-trivial@nongnu.org; Thu, 02 May 2019 13:50:41 -0400
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142]:38963)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1hMFqv-0008Qz-Te; Thu, 02 May 2019 13:50:38 -0400
Received: by mail-lf1-x142.google.com with SMTP id d12so2539726lfk.6;
	Thu, 02 May 2019 10:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=S0HcZYmG35XwM3FB6c/bLgB9OB0qv2fbqqJQy3dSZUY=;
	b=KxHrW0D+mcunpIG0R4LcBRpuuTZGBpWNzNb2YCaK0a3MUg6vexmGfYmRLfMKpfs8kM
	tbcouZF4Yryl6z5fpu2nJanExmdH4NbZdo5pJxw+Xj1y3fw59W12CMoKOqpSCp9eQvhu
	AsPvMd2I9EXLy7FgTsRVv6eKOtW0U2Gn3BT2C0oSD6g9qIEX2t4Qv/K+1miutF9Pe296
	KnibS7NAzEh7opm7+XSyx+mL6WBPQbaCxpTOJDALw+AOFCb2qcOTU+usM5qv4bYqIHVp
	WxctIbDjek2p59KMoArIqonVJQ1J0/IKXl6tF6o3T+0BqbL+h2dC0fTEdO5a0iaNm+ds
	grjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=S0HcZYmG35XwM3FB6c/bLgB9OB0qv2fbqqJQy3dSZUY=;
	b=GBwXXsBFxvQZyyOz+gZ8D80xJF0OE2y41uC+tzJIgOiIdTiwV8iVA85aA5Bfj1YqBA
	1h7HZpyV+P1fnBBPnyXr6SRx23/hJvw8h8eK+Y9X7RWbBUmYt22joB7X4BtbTYU5x7fO
	PoC5xSGXqWUEHfbspOIFUup0B6nRm+0PBsgZBmk/c5tBM4F+rKNCFu68SpQiDyHf/v9J
	ACpvmB/KwGXkAQxTXQ6A1kcb3W1MPApTip5fYPi1uP6aTQ3gn8vWBjfo1LUHfhwLohLX
	yIiUIfFHDHy3N8zDfw5NS2pPhsJcCDYNoBZ0npPsFdZGf/bEpynHT44mf0TfKeos2hzh
	bp7A==
X-Gm-Message-State: APjAAAUM3utKNIesjX+HueSc13hS8DHBoEXT+7dLiTjnzrkAGKH3CwUK
	u8GZiJ0qaTw40YO05kN24yNKHpNHMfkWQO7IXHo=
X-Google-Smtp-Source: APXvYqxAdEkh3A3wZ910t1wUbE6KLTdNyCxyv81ZypOMgen+94wTJB4yMlUfCWVqFA1Dpwa7iqvTj7e8YRk3C0Q+934=
X-Received: by 2002:a19:a40f:: with SMTP id q15mr2482037lfc.121.1556819436262; 
	Thu, 02 May 2019 10:50:36 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1556666645.git.alistair.francis@wdc.com>
	<aeb0e851e027a591eaba99c175011158b1012876.1556666645.git.alistair.francis@wdc.com>
	<20190501094006.GN29808@redhat.com>
In-Reply-To: <20190501094006.GN29808@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 2 May 2019 10:48:39 -0700
Message-ID: <CAKmqyKP_r_Cq7_sZkMovVwfi++nMDCQEkF-XNh95LVW5ONQPYw@mail.gmail.com>
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"kraxel@redhat.com" <kraxel@redhat.com>, 
	"riku.voipio@iki.fi" <riku.voipio@iki.fi>,
	"laurent@vivier.eu" <laurent@vivier.eu>, 
	"qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::142
Subject: Re: [Qemu-trivial] [PATCH v2 3/5] hw/usb/dev-mtp: Fix GCC 9 build
 warning
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 02 May 2019 17:50:43 -0000

On Wed, May 1, 2019 at 2:40 AM Daniel P. Berrang=C3=A9 <berrange@redhat.com=
> wrote:
>
> On Tue, Apr 30, 2019 at 11:28:41PM +0000, Alistair Francis wrote:
> > Fix this warning with GCC 9 on Fedora 30:
> > hw/usb/dev-mtp.c:1715:36: error: taking address of packed member of =E2=
=80=98struct <anonymous>=E2=80=99 may result in an unaligned pointer value =
[-Werror=3Daddress-of-packed-member]
> >  1715 |                             dataset->filename);
> >       |                             ~~~~~~~^~~~~~~~~~
> >
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> >  hw/usb/dev-mtp.c | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> >
> > diff --git a/hw/usb/dev-mtp.c b/hw/usb/dev-mtp.c
> > index 99548b012d..8233beacab 100644
> > --- a/hw/usb/dev-mtp.c
> > +++ b/hw/usb/dev-mtp.c
> > @@ -1711,9 +1711,22 @@ static void usb_mtp_write_metadata(MTPState *s, =
uint64_t dlen)
> >      assert(!s->write_pending);
> >      assert(p !=3D NULL);
> >
> > +/*
> > + * We are about to access a packed struct. We are confident that the p=
ointer
> > + * address won't be unaligned, so we ignore GCC warnings.
> > + */
>
> The data is mis-aligned as we're accessing an int16 array that
> is immediately following an int8 field in a packed struct
>
> This problem is fixed by the following series which Gerd has in the
> USB queue:
>
>   https://lists.gnu.org/archive/html/qemu-devel/2019-04/msg02524.html

Great, that fixes the build issues. Dropping this patch.

Alistair

>
> > +#if defined(CONFIG_PRAGMA_DIAGNOSTIC_AVAILABLE) && QEMU_GNUC_PREREQ(9,=
 0)
> > +#pragma GCC diagnostic push
> > +#pragma GCC diagnostic ignored "-Waddress-of-packed-member"
> > +#endif
> > +
> >      filename =3D utf16_to_str(MIN(dataset->length, filename_chars),
> >                              dataset->filename);
> >
> > +#if defined(CONFIG_PRAGMA_DIAGNOSTIC_AVAILABLE) && QEMU_GNUC_PREREQ(9,=
 0)
> > +#pragma GCC diagnostic pop
> > +#endif
> > +
> >      if (strchr(filename, '/')) {
> >          usb_mtp_queue_result(s, RES_PARAMETER_NOT_SUPPORTED, d->trans,
> >                               0, 0, 0, 0);
>
> Regards,
> Daniel
> --
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|

