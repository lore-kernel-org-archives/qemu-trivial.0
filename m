Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1g9pPV-0005x9-A2
	for mharc-qemu-trivial@gnu.org; Tue, 09 Oct 2018 06:38:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36764)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <liq3ea@gmail.com>) id 1g9pPT-0005w4-8q
	for qemu-trivial@nongnu.org; Tue, 09 Oct 2018 06:38:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <liq3ea@gmail.com>) id 1g9pPS-0002Fg-FB
	for qemu-trivial@nongnu.org; Tue, 09 Oct 2018 06:38:39 -0400
Received: from mail-it1-x141.google.com ([2607:f8b0:4864:20::141]:51339)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <liq3ea@gmail.com>)
	id 1g9pPM-00029j-VI; Tue, 09 Oct 2018 06:38:33 -0400
Received: by mail-it1-x141.google.com with SMTP id 74-v6so1867509itw.1;
	Tue, 09 Oct 2018 03:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=5jUMTIBvtJNDG/fPxToMDAmiSIaN3jxAIggjtq4GlGM=;
	b=h3Fdb9MOVr+8uCKfrVEOkaF20NTwjm7pXeEuyRLm1vocwEAEWkfKF18MZWVuskzz8a
	lXEt8kT9xO1SHDk7yjiw0LMu6wRxDgA+4W3MO8SVr+mB6Vt650ELMZkFdW299vR+Isp1
	9vpnbY2B+0j/L+j0pqUo5p0g+nQIptX4LXO9qhoPvwVgXy6hVV8U84ryqTB2EP7C3TfM
	BfjDsbqxsO8FLvifA4E/y9OnogdMxmCNPZSF6NRSv0yIS/ic1PBIye//VxnyLJGXL1az
	NDJPvn4W2fA6al3jRjXQWA3hho9pV1zAAkI7JDHSh9i7h1UxUP5YEBETk3ogbD6u3ZAu
	KdkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=5jUMTIBvtJNDG/fPxToMDAmiSIaN3jxAIggjtq4GlGM=;
	b=m4lIuGJn5Tv+iy8ZbaWwu4hPj4IU247Xhg3WcXmmxQ3K94MSxFyp+kkwiuO4mcN/i+
	WWc6gMyFoDqJDKrnYjSSvuHH50zGufBCm2vR2jp0NGzF789YIuQSIhUwH5IOsIIgk9vL
	FoGxXbWJnp2D6nGoPA3k1gkO4NlQS0XAAed+qwF4mGNzWiEhsh8wJv4MjoIaehDLSSjM
	pIcurwKuOXoZ1cHbyuNHfZLTeIFxSv4U1Z+VusoPzbW6X4vJrK4FoARWGA75MHbMGAYA
	pJMxw0I0cXZLVzBADFleQljP1f4RQf9r3ear33TM2U6mZKB8F3qjkKXpHO0B3n1OpupI
	Vg+g==
X-Gm-Message-State: ABuFfoiKQEM4IoYqYfsR8iU2WPgAnd9sUfRyz0SPeVlL+V/jhDlTxWeT
	ReHNxTcX1wGbLrJHpXLUrFDFm6vtdLDu0XkNuEw=
X-Google-Smtp-Source: ACcGV61sOxVyu8A9ucqsdNRxplPA3MLNa2JTekWFAr8lXYYnPxGR/7F5ceisGQo0bzLNpFYBjtyj2l4X6bHqBQ/JDZ4=
X-Received: by 2002:a02:8a5a:: with SMTP id
	e26-v6mr20304644jal.89.1539081512226; 
	Tue, 09 Oct 2018 03:38:32 -0700 (PDT)
MIME-Version: 1.0
References: <1539080467-2976-1-git-send-email-liq3ea@gmail.com>
	<CAFEAcA9HOhtPbAOrbvRQfrnfcq14WuW+a5w=EXG3+-9t6Wfx5Q@mail.gmail.com>
In-Reply-To: <CAFEAcA9HOhtPbAOrbvRQfrnfcq14WuW+a5w=EXG3+-9t6Wfx5Q@mail.gmail.com>
From: Li Qiang <liq3ea@gmail.com>
Date: Tue, 9 Oct 2018 18:37:56 +0800
Message-ID: <CAKXe6SJGpJVeaqs5boqWZqtVjKornk6TEEWhUd7TFnnfb-eOSg@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Qemu Developers <qemu-devel@nongnu.org>, qemu-trivial@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000d1163d0577c9565e"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::141
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] memory.h: fix types in
 comments
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
X-List-Received-Date: Tue, 09 Oct 2018 10:38:40 -0000

--000000000000d1163d0577c9565e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Peter Maydell <peter.maydell@linaro.org> =E4=BA=8E2018=E5=B9=B410=E6=9C=889=
=E6=97=A5=E5=91=A8=E4=BA=8C =E4=B8=8B=E5=8D=886:26=E5=86=99=E9=81=93=EF=BC=
=9A

> On 9 October 2018 at 11:21, Li Qiang <liq3ea@gmail.com> wrote:
> > Signed-off-by: Li Qiang <liq3ea@gmail.com>
> > ---
> >  include/exec/memory.h | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
>
> Thanks. Contents of patch
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>
> but the commit message should say "fix typos", not "fix types"
> (a 'typo' is a typing mistake; a 'type' is something like "uint32_t".)
>
>
Indeed, hope the maintainer can fix this typo when queuing this patch, :)

In additon, Cc: qemu-trivial@nongnu.org


>
> thanks
> -- PMM
>

--000000000000d1163d0577c9565e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br><div class=3D"gmail_quote"><div dir=3D"ltr">Peter =
Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@linar=
o.org</a>&gt; =E4=BA=8E2018=E5=B9=B410=E6=9C=889=E6=97=A5=E5=91=A8=E4=BA=8C=
 =E4=B8=8B=E5=8D=886:26=E5=86=99=E9=81=93=EF=BC=9A<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pa=
dding-left:1ex">On 9 October 2018 at 11:21, Li Qiang &lt;<a href=3D"mailto:=
liq3ea@gmail.com" target=3D"_blank">liq3ea@gmail.com</a>&gt; wrote:<br>
&gt; Signed-off-by: Li Qiang &lt;<a href=3D"mailto:liq3ea@gmail.com" target=
=3D"_blank">liq3ea@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 include/exec/memory.h | 6 +++---<br>
&gt;=C2=A0 1 file changed, 3 insertions(+), 3 deletions(-)<br>
<br>
Thanks. Contents of patch<br>
Reviewed-by: Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org" =
target=3D"_blank">peter.maydell@linaro.org</a>&gt;<br>
<br>
but the commit message should say &quot;fix typos&quot;, not &quot;fix type=
s&quot;<br>
(a &#39;typo&#39; is a typing mistake; a &#39;type&#39; is something like &=
quot;uint32_t&quot;.)<br>
<br></blockquote><div><br></div><div>Indeed, hope the maintainer can fix th=
is typo when queuing this patch, :)</div><div><br></div><div>In additon, Cc=
:=C2=A0<a href=3D"mailto:qemu-trivial@nongnu.org" target=3D"_blank">qemu-tr=
ivial@nongnu.org</a></div><div>=C2=A0</div><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
thanks<br>
-- PMM<br>
</blockquote></div></div>

--000000000000d1163d0577c9565e--

