Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hoNY4-0005R4-4k
	for mharc-qemu-trivial@gnu.org; Fri, 19 Jul 2019 03:43:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38146)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1hoNY1-0005Qs-TV
 for qemu-trivial@nongnu.org; Fri, 19 Jul 2019 03:43:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1hoNY0-0001FM-SX
 for qemu-trivial@nongnu.org; Fri, 19 Jul 2019 03:43:21 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:33544)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <aleksandar.m.mail@gmail.com>)
 id 1hoNY0-0001Ei-NN; Fri, 19 Jul 2019 03:43:20 -0400
Received: by mail-oi1-x242.google.com with SMTP id u15so23619539oiv.0;
 Fri, 19 Jul 2019 00:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=ZEhjQqYWJlC1PXZc+ba2fnfuvQnzfPZPJBfzLHYeKVU=;
 b=EjVYtrbeYjNMRIXoQxqrF8N+6yDhWxLToEY/ctQJFZHl6/PbVvByuWG4c0Nm04kFom
 qqrMYy69K6zkErJb2DTf17XP88v4QpkFz3WtXO5NpF98C8+Cpa2uWyhGzZ2LpMgt2SoX
 +yMAEevHrN3dhmhQFOYmBnryCAZSaMgYkhW1YqtkxoFZcA/x2NH3Hyzi7h+JjXV4ffQl
 lg6nTbH4HGb/afFOseGudVZFiVcrbJSWM9VVD8QgCvKsu0koJKVU6NRNgCcm1nY2AuZr
 Uz1Tn4xpR9rpK/YTWmPW8SqwuBlYYZOgJHf8kW4v+BxLYA4N9HPo2PBYF8fp8xkbRoWp
 oY/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=ZEhjQqYWJlC1PXZc+ba2fnfuvQnzfPZPJBfzLHYeKVU=;
 b=K0H+brCFmJ/LsPT9ZcowDoaijApVfpK7ZD2KsVyIJmg/0d5vQkYmXYsiD3mXRxpcQk
 GBMpgJb4injWlz+3O4Z1ixaEhGCsKIMIjnmc80cLVe0R7SSjDFXTrecDKcZ6OeJoq4M8
 nzeWPFukaSB1VBjDCqP7gCm4DU5TkDWqrTYtOD3sKvdubwziXPCj0La9hziMsPtvc0Sb
 8hX28gwPIaCvVMDi4PRuSfHWs4E8JK/dLpR7mGFGkHZtPW7sTqrfVH2T5ckDd9YV7k3c
 wA14Ag/TNoX0pI5KOVw1CgRAUZUreFS3FBVAzMAXaGgky71FJwI2d8g0nw5yHEzqa/L/
 yazg==
X-Gm-Message-State: APjAAAXuqTXPbYZ3kRCCLPAulFYSixO10Pd7TpkGxVc0T7CxvI0KlAmU
 Xf71q7Qmbtdq3rg71PgpWyFTlAZsZhDKdcx/jnM=
X-Google-Smtp-Source: APXvYqyDgIXcyylHtkArMTjKUJCy+I6XVWvIhExG3e4rgXQlPoEWG7yj5hLJj47gxXnlo5V5oGAONTooKSdviXQSbmo=
X-Received: by 2002:aca:4083:: with SMTP id
 n125mr25055633oia.106.1563522199050; 
 Fri, 19 Jul 2019 00:43:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:4798:0:0:0:0:0 with HTTP; Fri, 19 Jul 2019 00:43:18
 -0700 (PDT)
Received: by 2002:a9d:4798:0:0:0:0:0 with HTTP; Fri, 19 Jul 2019 00:43:18
 -0700 (PDT)
In-Reply-To: <6241fd95-789f-f560-2170-0544cded1720@redhat.com>
References: <20190718193441.12490-1-sw@weilnetz.de>
 <6241fd95-789f-f560-2170-0544cded1720@redhat.com>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Fri, 19 Jul 2019 09:43:18 +0200
Message-ID: <CAL1e-=h01=ouAuTiPK7mGqCJVX4C-WQUEVZngFBG5nthDQ936g@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, 
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Weil <sw@weilnetz.de>
Content-Type: multipart/alternative; boundary="00000000000045dcf0058e03e1f3"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] audio: Add missing fall
 through comments
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
X-List-Received-Date: Fri, 19 Jul 2019 07:43:22 -0000

--00000000000045dcf0058e03e1f3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Jul 19, 2019 9:30 AM, "Philippe Mathieu-Daud=C3=A9" <philmd@redhat.com> =
wrote:
>
> On 7/18/19 9:34 PM, Stefan Weil wrote:
> > Signed-off-by: Stefan Weil <sw@weilnetz.de>
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>

Philippe, how do you test these comments?

Yours, Aleksandar

> > ---
> >  audio/audio.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/audio/audio.c b/audio/audio.c
> > index 5fd9a58a80..a7a13e900a 100644
> > --- a/audio/audio.c
> > +++ b/audio/audio.c
> > @@ -304,6 +304,7 @@ void audio_pcm_init_info (struct audio_pcm_info
*info, struct audsettings *as)
> >
> >      case AUDIO_FORMAT_S16:
> >          sign =3D 1;
> > +        /* fall through */
> >      case AUDIO_FORMAT_U16:
> >          bits =3D 16;
> >          shift =3D 1;
> > @@ -311,6 +312,7 @@ void audio_pcm_init_info (struct audio_pcm_info
*info, struct audsettings *as)
> >
> >      case AUDIO_FORMAT_S32:
> >          sign =3D 1;
> > +        /* fall through */
> >      case AUDIO_FORMAT_U32:
> >          bits =3D 32;
> >          shift =3D 2;
> >
>

--00000000000045dcf0058e03e1f3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
On Jul 19, 2019 9:30 AM, &quot;Philippe Mathieu-Daud=C3=A9&quot; &lt;<a hre=
f=3D"mailto:philmd@redhat.com">philmd@redhat.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On 7/18/19 9:34 PM, Stefan Weil wrote:<br>
&gt; &gt; Signed-off-by: Stefan Weil &lt;<a href=3D"mailto:sw@weilnetz.de">=
sw@weilnetz.de</a>&gt;<br>
&gt;<br>
&gt; Reviewed-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@=
redhat.com">philmd@redhat.com</a>&gt;<br>
&gt; Tested-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@re=
dhat.com">philmd@redhat.com</a>&gt;<br>
&gt;</p>
<p dir=3D"ltr">Philippe, how do you test these comments?</p>
<p dir=3D"ltr">Yours, Aleksandar</p>
<p dir=3D"ltr">&gt; &gt; ---<br>
&gt; &gt;=C2=A0 audio/audio.c | 2 ++<br>
&gt; &gt;=C2=A0 1 file changed, 2 insertions(+)<br>
&gt; &gt; <br>
&gt; &gt; diff --git a/audio/audio.c b/audio/audio.c<br>
&gt; &gt; index 5fd9a58a80..a7a13e900a 100644<br>
&gt; &gt; --- a/audio/audio.c<br>
&gt; &gt; +++ b/audio/audio.c<br>
&gt; &gt; @@ -304,6 +304,7 @@ void audio_pcm_init_info (struct audio_pcm_in=
fo *info, struct audsettings *as)<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 case AUDIO_FORMAT_S16:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sign =3D 1;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* fall through */<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 case AUDIO_FORMAT_U16:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bits =3D 16;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 shift =3D 1;<br>
&gt; &gt; @@ -311,6 +312,7 @@ void audio_pcm_init_info (struct audio_pcm_in=
fo *info, struct audsettings *as)<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 case AUDIO_FORMAT_S32:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sign =3D 1;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* fall through */<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 case AUDIO_FORMAT_U32:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bits =3D 32;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 shift =3D 2;<br>
&gt; &gt; <br>
&gt;<br>
</p>

--00000000000045dcf0058e03e1f3--

