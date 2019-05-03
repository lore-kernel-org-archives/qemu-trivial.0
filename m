Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hMblQ-0007Ew-17
	for mharc-qemu-trivial@gnu.org; Fri, 03 May 2019 13:14:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34246)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <liboxuan@connect.hku.hk>) id 1hMblN-0007Cz-RT
	for qemu-trivial@nongnu.org; Fri, 03 May 2019 13:14:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <liboxuan@connect.hku.hk>) id 1hMblM-0001RI-TB
	for qemu-trivial@nongnu.org; Fri, 03 May 2019 13:14:21 -0400
Received: from mail-yw1-xc41.google.com ([2607:f8b0:4864:20::c41]:34840)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <liboxuan@connect.hku.hk>)
	id 1hMblM-0001QM-Ih
	for qemu-trivial@nongnu.org; Fri, 03 May 2019 13:14:20 -0400
Received: by mail-yw1-xc41.google.com with SMTP id n188so4870980ywe.2
	for <qemu-trivial@nongnu.org>; Fri, 03 May 2019 10:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=connect-hku-hk.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=x0aCQ5qBwgt9DWvdLtyGVrRtiZ9Wk6BDR2oeCRD0tww=;
	b=XwtuNLM+QPBiu6YJ/ZgNHJn/Eu2EJkRlxi6ienrnS73Za5YMQTvOL/HVprpf1pSvUK
	eUz223PwF8i3d7OClAUgh/xok25X9VLDlQG0qRcPiTnQRE01VEzJwJFywwV5ekGdU+RP
	pbxMf7W5lwGql3JMXsomcD1iuIcKzwA5zoap6K64j/4WBHLMS+RekfIOELv1S/WM9WJk
	onsZoVAIvZYcZvH0jERocokWN53s1rxWt7hMhOfkRw27cPB0lMB3SrjX03sR6gk5rLZv
	jWwyEVZDss7ATwXoslqygXSFwoFv6p/cNmjAEnwRY7aBM4+WulYrUEuQ9O4g0fUo8cOQ
	Orxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=x0aCQ5qBwgt9DWvdLtyGVrRtiZ9Wk6BDR2oeCRD0tww=;
	b=DAa5I9PPTKK/wnTcVBO3pLiRmwTI6IPELrB7hs9uCSU/3Bk45ztSyTLIQMcG/0NLRE
	YcU6cJxohxjIetZqZ3TfyU+KKqjrf8ldDE+KOY/3/DrY5MXdz3Azmh5nwZQUvDRsmQUf
	OJC2NdnZ6v5WuhR9iklwTiIwVbskBOT5f5s6S4Vla/ESdAeHXm/g4zwV4ex/XBjEJj8x
	N4wYELNRhw/7060uK3InQ0Y347AhHWEvAz+RW0OEszUtGxJojMbq0YFbl0QD+P/ArR9z
	9rF/jmZ21kvosl7wjFiDLiXYbsqRPBfZWEucrwf84uYHyf3Go/s1ml3vISynrN8qOd+s
	997g==
X-Gm-Message-State: APjAAAVjzN0geG19dg9YRSqS+YFmK9ctTmbVvRYyr5K7gLRtUczzchTt
	MR6kOZdHNaguFES6kQG9ExdZAWXjTJSSrX8f5NWGbw==
X-Google-Smtp-Source: APXvYqyEmXs627YIjRRJIileqa6wgZqCKVFv1HFs7FjEv24cZY7EBgZIYi6j8qc90R+Dm8CQtSkM+vWmI7myYUJsrow=
X-Received: by 2002:a81:e0d:: with SMTP id 13mr8357280ywo.336.1556903659437;
	Fri, 03 May 2019 10:14:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190503154424.73933-1-liboxuan@connect.hku.hk>
	<87bm0j4im0.fsf@zen.linaroharston>
	<CALM0=-=b+z2aW-cuM=hmk3_oKG7w3ianMo_ZA7gj8zMgCOfC3g@mail.gmail.com>
	<878svn4gnq.fsf@zen.linaroharston>
In-Reply-To: <878svn4gnq.fsf@zen.linaroharston>
From: "LI, BO XUAN" <liboxuan@connect.hku.hk>
Date: Sat, 4 May 2019 01:13:43 +0800
Message-ID: <CALM0=-m0Vd1YMn6s36oRbsqFCwjPwdga5Q0XRoO41dq6iw1Lzg@mail.gmail.com>
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, 
	Eric Blake <eblake@redhat.com>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
	Yuval Shaia <yuval.shaia@oracle.com>, "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000092175c0587fee1cb"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::c41
Subject: Re: [Qemu-trivial] [PATCH v4] hw/virtio/virtio-mmio: Convert
 DPRINTF to trace and log
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
X-List-Received-Date: Fri, 03 May 2019 17:14:23 -0000

--00000000000092175c0587fee1cb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Gotcha, thanks for the tip!

Best regards,
Boxuan Li

On Sat, May 4, 2019 at 1:00 AM Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:

>
> LI, BO XUAN <liboxuan@connect.hku.hk> writes:
>
> > Hi Alex,
> >
> > Sorry about that, I am still trying to get familiar with the patch
> > submission process. Since my patch has been changed from your last
> review,
> > I thought it would be safe to not include the r-b tag from last time.
> Will
> > take care next time!
>
> That's ok. As a general rule as long as you haven't substantially
> changed a patch it's safe to keep previous r-b tags. You can always
> mention it in your cover letter if you are unsure.
>
> --
> Alex Benn=C3=A9e
>

--00000000000092175c0587fee1cb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Gotcha, thanks for the tip!=C2=A0<br><div><br></div><div>B=
est regards,</div><div>Boxuan Li</div></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sat, May 4, 2019 at 1:00 AM Alex B=
enn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org">alex.bennee@linaro=
.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex"><br>
LI, BO XUAN &lt;<a href=3D"mailto:liboxuan@connect.hku.hk" target=3D"_blank=
">liboxuan@connect.hku.hk</a>&gt; writes:<br>
<br>
&gt; Hi Alex,<br>
&gt;<br>
&gt; Sorry about that, I am still trying to get familiar with the patch<br>
&gt; submission process. Since my patch has been changed from your last rev=
iew,<br>
&gt; I thought it would be safe to not include the r-b tag from last time. =
Will<br>
&gt; take care next time!<br>
<br>
That&#39;s ok. As a general rule as long as you haven&#39;t substantially<b=
r>
changed a patch it&#39;s safe to keep previous r-b tags. You can always<br>
mention it in your cover letter if you are unsure.<br>
<br>
--<br>
Alex Benn=C3=A9e<br>
</blockquote></div>

--00000000000092175c0587fee1cb--

