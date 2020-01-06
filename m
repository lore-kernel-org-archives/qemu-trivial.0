Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ioXeL-0000PO-C9
	for mharc-qemu-trivial@gnu.org; Mon, 06 Jan 2020 14:02:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58234)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mlureau@redhat.com>) id 1ioXeF-0000LZ-0u
 for qemu-trivial@nongnu.org; Mon, 06 Jan 2020 14:02:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mlureau@redhat.com>) id 1ioXeE-0001U8-0i
 for qemu-trivial@nongnu.org; Mon, 06 Jan 2020 14:02:42 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:27390
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mlureau@redhat.com>) id 1ioXeD-0001TV-U4
 for qemu-trivial@nongnu.org; Mon, 06 Jan 2020 14:02:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578337361;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eDOMXL6PYZvhiE1pNTv2byexo5Awps+MRrX/h+L1UoM=;
 b=V0MHFaFX3CxopvsTjRp5h6/0i07722Q3g2i2kry16wTVScOzLkm3Q5MqW2s69xpGupOrBW
 CVDTsXvUrrIQ2fU2LMNm1f3O5kK6Qod5J393kBsarQ7hELW4T3Wtm2abAuxgRrJqMoCT53
 0tpn88VPDE/JeliJ86C4BPWci+V0yj0=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-145-VmKUFX07MBmBnf5_OXQ29w-1; Mon, 06 Jan 2020 14:02:38 -0500
Received: by mail-ot1-f71.google.com with SMTP id a12so472071oto.8
 for <qemu-trivial@nongnu.org>; Mon, 06 Jan 2020 11:02:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=eDOMXL6PYZvhiE1pNTv2byexo5Awps+MRrX/h+L1UoM=;
 b=Gsg86kuMXRP6f8IeJ1BP9CK64XCmoEyJSxKQJqkG6UtGhftIgA63G84QoDQF3wwA3V
 Ng0p6tddbhWcW3ujybCYAPh0g9mkfOiWza547wqc+qShgHaXiiaOr0QNYz4v0ZrHUYj0
 QF5jKZFNirCb5hZy9g5gid3V74Zmyph/ZjUXHgp0V/pqk2OsL46IRLQ2R/oqpKUdqBmf
 enp/upUcgtl/XjeN8BHoYTMrOIJe5W9n3sTYqkJGsPjeQBR0Lyab7WhltgHsea8Kgn8w
 Xt0PAyxBubsyZMXD8AUzVx2QD6LiwE+uJ14ADRMZYoeLY5W5vRr8W+ftAqARbiAkO/jM
 RT2A==
X-Gm-Message-State: APjAAAV/Zu5DRXsvnmcs/NJeFO1/mbu139+MYyuAwaKNIXdeTbD9Xwnr
 B/nROqL38XJQ6JbnZ1PibL2ZAVqU8QM7/5rK48tc22682Duq0iZvFVPfFm7wIXqusoVrvlgLVQv
 06UmUyFC7+230S5zJ+XrgQeImmfwOuwhs2w==
X-Received: by 2002:aca:6042:: with SMTP id u63mr6346954oib.76.1578337357444; 
 Mon, 06 Jan 2020 11:02:37 -0800 (PST)
X-Google-Smtp-Source: APXvYqx2bBsKNI1FS4EWyh3vQWNa48xPTe0xrAsNRmnVqFTFWPs8dS07I3CtfwcBZPqJ+VTA0CZx2yT6PTecEQPKplo=
X-Received: by 2002:aca:6042:: with SMTP id u63mr6346942oib.76.1578337357250; 
 Mon, 06 Jan 2020 11:02:37 -0800 (PST)
MIME-Version: 1.0
References: <20200106182425.20312-1-danielhb413@gmail.com>
 <20200106182425.20312-9-danielhb413@gmail.com>
In-Reply-To: <20200106182425.20312-9-danielhb413@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Mon, 6 Jan 2020 23:02:24 +0400
Message-ID: <CAMxuvaw=b2qy4LqJvQqRz+3pzB5OHtaaHmxfHSU99xYjzmet7Q@mail.gmail.com>
Subject: Re: [PATCH v1 08/59] chardev/char-mux.c: remove 'send_char' label
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, qemu-trivial <qemu-trivial@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
X-MC-Unique: VmKUFX07MBmBnf5_OXQ29w-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
X-List-Received-Date: Mon, 06 Jan 2020 19:02:45 -0000

On Mon, Jan 6, 2020 at 10:25 PM Daniel Henrique Barboza
<danielhb413@gmail.com> wrote:
>
> CC: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> CC: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

> ---
>  chardev/char-mux.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/chardev/char-mux.c b/chardev/char-mux.c
> index 200c62a0d0..edbaaf5cbf 100644
> --- a/chardev/char-mux.c
> +++ b/chardev/char-mux.c
> @@ -140,7 +140,7 @@ static int mux_proc_byte(Chardev *chr, MuxChardev *d,=
 int ch)
>      if (d->term_got_escape) {
>          d->term_got_escape =3D 0;
>          if (ch =3D=3D term_escape_char) {
> -            goto send_char;
> +            return 1;
>          }
>          switch (ch) {
>          case '?':
> @@ -174,7 +174,6 @@ static int mux_proc_byte(Chardev *chr, MuxChardev *d,=
 int ch)
>      } else if (ch =3D=3D term_escape_char) {
>          d->term_got_escape =3D 1;
>      } else {
> -    send_char:
>          return 1;
>      }
>      return 0;
> --
> 2.24.1
>


