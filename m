Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ily8Q-0001rZ-GY
	for mharc-qemu-trivial@gnu.org; Mon, 30 Dec 2019 11:43:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51753)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1ily8O-0001r9-4V
 for qemu-trivial@nongnu.org; Mon, 30 Dec 2019 11:43:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1ily8M-0005FN-Pf
 for qemu-trivial@nongnu.org; Mon, 30 Dec 2019 11:43:11 -0500
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230]:42287)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1ily8M-0005Dn-HJ
 for qemu-trivial@nongnu.org; Mon, 30 Dec 2019 11:43:10 -0500
Received: by mail-lj1-x230.google.com with SMTP id y4so19495149ljj.9
 for <qemu-trivial@nongnu.org>; Mon, 30 Dec 2019 08:43:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZjUhiqstMZuj78cqOT1rhjHaT3mb+h7oGr+unit2u0w=;
 b=VcjM742hEnICaPVExdGd+nuKw3LUw3RCSWITxxiwMgK56en0+BtPq+CIrDRO0Qzt3a
 86DA5T//wHsphWl7GiIgyzDSHOfPcdRwfI14HpbFt6TbnWwTUFe42KC9MS8PFqhjCRXL
 c/gspFv9H1zoSRGR8W3VsFtSWu3TjQA3wJyE6Sf205UigllrKxoise3/lUea+Co+EdN3
 oFc3sUyP1huKomHEEo/YcuNJQ6EQalen9FN9BXBesYGT1O8GcVt9moUKH3QbPj+9r3sO
 WOJASILKmTU/+sMujYWan7vy2I2ix0WNsbkViJ0+VHN8SjIYSZiPEMbtyfRIFMdfejn6
 UrZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZjUhiqstMZuj78cqOT1rhjHaT3mb+h7oGr+unit2u0w=;
 b=O4PhhJzy1X2t2MkMJsjUhDjVqupoGempSM+AZC1giIf3ayWGDuhidmWHw7yLu731nc
 GPcMEf1/8mAyj/FF5aIezVGY/+TloaDHMwlJMHt7/h/hh5bTifr1pp826+nII7xZKHIa
 mNmtACfg8vKHdcehpLgQMKvvDnplwbP33yOlhA2yZ6XJPuGovTzuD1R0zeEK6Yk0bqFO
 J4rAazot1wQGv+hCi023Scj3gR/yuiChgFpBhFM0pEmLQCDl24cnAUYyAsPrxFUu3NHd
 CtAZw3VFXsx2WqVyLdeYOksgvBfMWARr/cRjx+8ibHJ0ailsCUj869/YxDikpAOhL6zM
 cAqw==
X-Gm-Message-State: APjAAAWVBaDBk8feWsOm2fqC1Buz5vYbd9I6O/dVOiFGE2iw6oBgtrAS
 YSpHCUPddTx9irLDLYw3eFRZLcHN9IVvFEjwAlEDfw==
X-Google-Smtp-Source: APXvYqxoBQ2SedT5TFF67ACfrJIu1XS5GRSdKDBvJZCLezKRL2ZzuPUmLyAKQLDpIZMRQWxv46Kje8wKQd8EN0jAFmA=
X-Received: by 2002:a05:651c:239:: with SMTP id
 z25mr39600358ljn.48.1577724188187; 
 Mon, 30 Dec 2019 08:43:08 -0800 (PST)
MIME-Version: 1.0
References: <20191230111801.26315-1-philmd@redhat.com>
In-Reply-To: <20191230111801.26315-1-philmd@redhat.com>
From: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Date: Mon, 30 Dec 2019 16:42:55 +0000
Message-ID: <CAHDbmO2-LeyiGcaZxDdxGr+BZVyUhM0aXeAqSy8pBG+_zBpz9g@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Remove Claudio Fontana bouncing email
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, 
 Claudio Fontana <claudio.fontana@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000ca708a059aee8940"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::230
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
X-List-Received-Date: Mon, 30 Dec 2019 16:43:13 -0000

--000000000000ca708a059aee8940
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

On Mon, 30 Dec 2019, 11:19 Philippe Mathieu-Daud=C3=A9, <philmd@redhat.com>
wrote:

> Claudio Fontana Huawei email is bouncing, remove it.
>
>   The message you sent to claudio.fontana@huawei.com couldn't be
>   delivered due to: Recipient email address is possibly incorrect.
>
>   Further information:
>     5.1.1 Error: invalid recipients
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  MAINTAINERS | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 387879aebc..8db4de6b9a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2383,7 +2383,6 @@ F: plugins/
>  F: tests/plugin
>
>  AArch64 TCG target
> -M: Claudio Fontana <claudio.fontana@huawei.com>
>  M: Claudio Fontana <claudio.fontana@gmail.com>
>  S: Maintained
>  L: qemu-arm@nongnu.org
> --
> 2.21.0
>
>
>

--000000000000ca708a059aee8940
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Reviewed-by: Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.=
bennee@linaro.org">alex.bennee@linaro.org</a>&gt;</div><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 30 Dec 2019, 11:19=
 Philippe Mathieu-Daud=C3=A9, &lt;<a href=3D"mailto:philmd@redhat.com">phil=
md@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Claudi=
o Fontana Huawei email is bouncing, remove it.<br>
<br>
=C2=A0 The message you sent to <a href=3D"mailto:claudio.fontana@huawei.com=
" target=3D"_blank" rel=3D"noreferrer">claudio.fontana@huawei.com</a> could=
n&#39;t be<br>
=C2=A0 delivered due to: Recipient email address is possibly incorrect.<br>
<br>
=C2=A0 Further information:<br>
=C2=A0 =C2=A0 5.1.1 Error: invalid recipients<br>
<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@red=
hat.com" target=3D"_blank" rel=3D"noreferrer">philmd@redhat.com</a>&gt;<br>
---<br>
=C2=A0MAINTAINERS | 1 -<br>
=C2=A01 file changed, 1 deletion(-)<br>
<br>
diff --git a/MAINTAINERS b/MAINTAINERS<br>
index 387879aebc..8db4de6b9a 100644<br>
--- a/MAINTAINERS<br>
+++ b/MAINTAINERS<br>
@@ -2383,7 +2383,6 @@ F: plugins/<br>
=C2=A0F: tests/plugin<br>
<br>
=C2=A0AArch64 TCG target<br>
-M: Claudio Fontana &lt;<a href=3D"mailto:claudio.fontana@huawei.com" targe=
t=3D"_blank" rel=3D"noreferrer">claudio.fontana@huawei.com</a>&gt;<br>
=C2=A0M: Claudio Fontana &lt;<a href=3D"mailto:claudio.fontana@gmail.com" t=
arget=3D"_blank" rel=3D"noreferrer">claudio.fontana@gmail.com</a>&gt;<br>
=C2=A0S: Maintained<br>
=C2=A0L: <a href=3D"mailto:qemu-arm@nongnu.org" target=3D"_blank" rel=3D"no=
referrer">qemu-arm@nongnu.org</a><br>
-- <br>
2.21.0<br>
<br>
<br>
</blockquote></div>

--000000000000ca708a059aee8940--

