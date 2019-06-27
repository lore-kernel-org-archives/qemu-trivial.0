Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hgI4r-00004s-RA
	for mharc-qemu-trivial@gnu.org; Wed, 26 Jun 2019 20:15:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60689)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <chmeeedalf@gmail.com>) id 1hgI4l-0008Si-E1
 for qemu-trivial@nongnu.org; Wed, 26 Jun 2019 20:15:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <chmeeedalf@gmail.com>) id 1hgI4j-0006wr-Qm
 for qemu-trivial@nongnu.org; Wed, 26 Jun 2019 20:15:43 -0400
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241]:39379)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <chmeeedalf@gmail.com>)
 id 1hgI4f-0006rk-SA; Wed, 26 Jun 2019 20:15:38 -0400
Received: by mail-lj1-x241.google.com with SMTP id v18so410408ljh.6;
 Wed, 26 Jun 2019 17:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IaKHMsjWD5ArDiMo3LTLBS3S/RnZjLd9z0nGw8nibRA=;
 b=Ao8neZp3KNdrWuKM6Kkqqlq7eoF+qDqzg4yA3ZZWqCGrd4q5kM5Ge2RQfruQsH4vMo
 21bdjUsTVjfUf0nvRuQ2oKIriSjh4vN0S88VrDtWTmECQmP9v1AWbhwlEwWe7sMCEMXG
 Nvffx0FTsJSxiOHiu5efbzmZ4pQdGfeNRLigUH+Zv3YVDSjOjPwE0diQcT08/Dp+JjHV
 qTXjAFc2MX+bDLRN+g4gTntKHGDHszZw9w57QWJ0pMiDQ9dzaAq4Empr2s1kAyRtEhSR
 s1UEBTpZIV9zJJqORNwxQ4AID20X7BPAVxnRKTY27RrzOgmnB/NmPhXtsXunL7zEOgFq
 Su3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IaKHMsjWD5ArDiMo3LTLBS3S/RnZjLd9z0nGw8nibRA=;
 b=GiTIIeGe5c1Js3YAIxoCNzwz8R6fUXrs7xn0cIWOqDvgZonLWlzsgPpr6Rt6m5ayb7
 NvT6JT15pr+P7EnbNavBvWtWccEXJaoSAWOcW6FMKaiSY9hlE8tNbLq2kuljiY0taHpD
 LMw0n4cucKx55dbZUKeLg/CjGu3LB5GYrftd9j2csh4B6kfpJpxUKmmlmMmfQtQdvxwf
 D9vZgso6FuTcDaKAY+/ufBKIowA8s2S3ZNRwNIkf4Vw1Uc9NYRpNz54pOXE7Awxs/WqX
 Wtn1uxOIulu69RCGqj3fCKqxw6osF62sWbVWR1vdU7dGDyTcDUQHfnECg1M3BCLTcrc+
 kPKw==
X-Gm-Message-State: APjAAAVxVB4iiTI3UoL7Rg7JiYicFZhFb3dM7lC1miUKRXx+HAmAMtiz
 R6JrKtLA3mvK14uYK3AMyfsHvqCkPAxfUykt5qU=
X-Google-Smtp-Source: APXvYqz93xSwRqkU7GJocgN10nIceaqryRNT7FroI2iVUTgteDrbRnM/rfeNqLLGFyQlLMKpyeglZULZ9O69zZSsZ1k=
X-Received: by 2002:a2e:970d:: with SMTP id r13mr602143lji.126.1561594536335; 
 Wed, 26 Jun 2019 17:15:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190607135653.6ece685d@titan.knownspace>
 <8676232e-917d-44e2-1149-b25f26698a73@vivier.eu>
 <92053c9c-e7bf-76cb-9399-987f4ab31bfb@vivier.eu>
 <20190626113742.6bcd8a26@titan.knownspace>
 <d60f142d-27ef-bfe5-1eb6-cefb22640625@vivier.eu>
 <20190626130414.08940342@titan.knownspace>
 <CAHSQbTCxP09J9NtFiN4UpdXHJZHtTw_F66hfdAS2sM4=E5GHyQ@mail.gmail.com>
 <477ebe22-eddb-41ba-5811-4a70e639a89a@vivier.eu>
In-Reply-To: <477ebe22-eddb-41ba-5811-4a70e639a89a@vivier.eu>
From: Justin Hibbits <chmeeedalf@gmail.com>
Date: Wed, 26 Jun 2019 19:15:25 -0500
Message-ID: <CAHSQbTCUzR5WiykWGZOH1bvBPWx15_ZA-=7b17c6AnRK4kn3yA@mail.gmail.com>
To: Laurent Vivier <laurent@vivier.eu>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, 
 "Emilio G. Cota" <cota@braap.org>
Content-Type: multipart/alternative; boundary="0000000000009f1b42058c430ff3"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::241
Subject: Re: [Qemu-trivial] Fix cacheline size retrieval on
 FreeBSD/PowerPC(64)
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
X-List-Received-Date: Thu, 27 Jun 2019 00:15:46 -0000

--0000000000009f1b42058c430ff3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 26, 2019, 19:08 Laurent Vivier <laurent@vivier.eu> wrote:

> Le 27/06/2019 =C3=A0 02:02, Justin Hibbits a =C3=A9crit :
> >
> >
> > On Wed, Jun 26, 2019, 13:04 Justin Hibbits <chmeeedalf@gmail.com
> > <mailto:chmeeedalf@gmail.com>> wrote:
> >
> >     On Wed, 26 Jun 2019 18:47:42 +0200
> >     Laurent Vivier <laurent@vivier.eu <mailto:laurent@vivier.eu>> wrote=
:
> >
> >     > Le 26/06/2019 =C3=A0 18:37, Justin Hibbits a =C3=A9crit :
> >     > > On Wed, 26 Jun 2019 18:16:36 +0200
> >     > > Laurent Vivier <laurent@vivier.eu <mailto:laurent@vivier.eu>>
> wrote:
> >     > >
> >     > >> Le 26/06/2019 =C3=A0 18:14, Laurent Vivier a =C3=A9crit :
> >     > >>> Le 07/06/2019 =C3=A0 20:56, Justin Hibbits a =C3=A9crit :
> >     > >>>> The attached very trivial patch fixes a startup bug that
> prevents
> >     > >>>> at least Qemu 3.1 and later from working on FreeBSD/powerpc6=
4.
> >     > >>>>
> >     > >>>> - Justin
> >     > >>>>
> >     > >>>
> >     > >>> Please don't send a patch in attachment but inlined in the
> message
> >     > >>> (you may use "git send-email" for that).
> >     > >>>
> >     > >>> This patch fixes "util: add cacheinfo" that has changed the
> type
> >     > >>> from unsigned to long.
> >     > >>>
> >     > >>> You can add the following line in the commit message:
> >     > >>>
> >     > >>> Fixes: b255b2c8a548 ("util: add cacheinfo")
> >     > >>>
> >     > >>> Reviewed-by: Laurent Vivier <laurent@vivier.eu
> >     <mailto:laurent@vivier.eu>>
> >     > >>>
> >     > >>
> >     > >> CC: author of b255b2c8a548 ("util: add cacheinfo")
> >     > >>
> >     > >> Thanks,
> >     > >> Laurent
> >     > >
> >     > > Hi Laurent,
> >     > >
> >     > > Sorry.  I had never used git send-email before, so wasn't
> >     > > comfortable with it.  I just updated the commit message with yo=
ur
> >     > > feedback and used git send-email to submit the patch.  I hope
> >     > > everything went well.
> >     >
> >     > It seems not. I didn't receive it.
> >     >
> >     > Did you configure the SMTP server. See git-send-email(1):
> >     >
> >     >    Use gmail as the smtp server
> >     >
> >     >        To use git send-email to send your patches through the GMa=
il
> >     > SMTP server, edit ~/.gitconfig to specify your account settings:
> >     >
> >     >            [sendemail]
> >     >                    smtpEncryption =3D tls
> >     >                    smtpServer =3D smtp.gmail.com <
> http://smtp.gmail.com>
> >     >                    smtpUser =3D yourname@gmail.com
> >     <mailto:yourname@gmail.com>
> >     >                    smtpServerPort =3D 587
> >     >
> >     >        If you have multifactor authentication setup on your gmail
> >     > account, you will need to generate an app-specific password for u=
se
> >     > with git send-email. Visit
> >     >        https://security.google.com/settings/security/apppasswords
> to
> >     > create it.
> >     >
> >     >        Once your commits are ready to be sent to the mailing list=
,
> >     > run the following commands:
> >     >
> >     >            $ git format-patch --cover-letter -M origin/master -o
> >     > outgoing/ $ edit outgoing/0000-*
> >     >            $ git send-email outgoing/*
> >     >
> >     >        The first time you run it, you will be prompted for your
> >     > credentials. Enter the app-specific or your regular password as
> >     > appropriate. If you have credential helper configured (see
> >     > git-credential(1)), the password will be saved in the credential
> >     > store so you won=E2=80=99t have to type it the next time.
> >     >
> >     >        Note: the following perl modules are required
> Net::SMTP::SSL,
> >     >        MIME::Base64 and Authen::SASL
> >     >
> >     > Thanks,
> >     > Laurent
> >     >
> >     >
> >
> >     Hm, you're right.  Even after making the config changes and
> installing
> >     the necessary packages, I still have no luck with git send-email.
> Might
> >     take a bit to debug this.
> >
> >     - Justin
> >
> >
> > Sorry for the multiplicity, looks like Gmail forwarded it eventually,
> > but not until I tried several times debugging it.
>
> Not sure, I didn't receive any of them.
>
> Thanks,
> Laurent
>

Sigh, 4 copies ended up in my Gmail spam folder, so I thought it made it
through.

- Justin

>

--0000000000009f1b42058c430ff3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Wed, Jun 26, 2019, 19:08 Laurent Vivier &lt;<a href=
=3D"mailto:laurent@vivier.eu">laurent@vivier.eu</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">Le 27/06/2019 =C3=A0 02:02, Justin Hibbits a =
=C3=A9crit=C2=A0:<br>
&gt; <br>
&gt; <br>
&gt; On Wed, Jun 26, 2019, 13:04 Justin Hibbits &lt;<a href=3D"mailto:chmee=
edalf@gmail.com" target=3D"_blank" rel=3D"noreferrer">chmeeedalf@gmail.com<=
/a><br>
&gt; &lt;mailto:<a href=3D"mailto:chmeeedalf@gmail.com" target=3D"_blank" r=
el=3D"noreferrer">chmeeedalf@gmail.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On Wed, 26 Jun 2019 18:47:42 +0200<br>
&gt;=C2=A0 =C2=A0 =C2=A0Laurent Vivier &lt;<a href=3D"mailto:laurent@vivier=
.eu" target=3D"_blank" rel=3D"noreferrer">laurent@vivier.eu</a> &lt;mailto:=
<a href=3D"mailto:laurent@vivier.eu" target=3D"_blank" rel=3D"noreferrer">l=
aurent@vivier.eu</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Le 26/06/2019 =C3=A0 18:37, Justin Hibbits a =
=C3=A9crit=C2=A0:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; On Wed, 26 Jun 2019 18:16:36 +0200<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; Laurent Vivier &lt;<a href=3D"mailto:laur=
ent@vivier.eu" target=3D"_blank" rel=3D"noreferrer">laurent@vivier.eu</a> &=
lt;mailto:<a href=3D"mailto:laurent@vivier.eu" target=3D"_blank" rel=3D"nor=
eferrer">laurent@vivier.eu</a>&gt;&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; Le 26/06/2019 =C3=A0 18:14, Laurent V=
ivier a =C3=A9crit=C2=A0:=C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;&gt; Le 07/06/2019 =C3=A0 20:56, Justi=
n Hibbits a =C3=A9crit=C2=A0:=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;&gt;&gt; The attached very trivial pat=
ch fixes a startup bug that prevents<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;&gt;&gt; at least Qemu 3.1 and later f=
rom working on FreeBSD/powerpc64.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;&gt;&gt; - Justin<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;&gt;&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;&gt; Please don&#39;t send a patch in =
attachment but inlined in the message<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;&gt; (you may use &quot;git send-email=
&quot; for that).<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;&gt; This patch fixes &quot;util: add =
cacheinfo&quot; that has changed the type<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;&gt; from unsigned to long.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;&gt; You can add the following line in=
 the commit message:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;&gt; Fixes: b255b2c8a548 (&quot;util: =
add cacheinfo&quot;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;&gt; Reviewed-by: Laurent Vivier &lt;<=
a href=3D"mailto:laurent@vivier.eu" target=3D"_blank" rel=3D"noreferrer">la=
urent@vivier.eu</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:laurent@vivier.eu" tar=
get=3D"_blank" rel=3D"noreferrer">laurent@vivier.eu</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; CC: author of b255b2c8a548 (&quot;uti=
l: add cacheinfo&quot;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; Thanks,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; Laurent=C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; Hi Laurent,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; Sorry.=C2=A0 I had never used git send-em=
ail before, so wasn&#39;t<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; comfortable with it.=C2=A0 I just updated=
 the commit message with your<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; feedback and used git send-email to submi=
t the patch.=C2=A0 I hope<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; everything went well.=C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; It seems not. I didn&#39;t receive it.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Did you configure the SMTP server. See git-sen=
d-email(1):<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 Use gmail as the smtp server<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 To use git send-ema=
il to send your patches through the GMail<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; SMTP server, edit ~/.gitconfig to specify your=
 account settings:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [send=
email]<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 smtpEncryption =3D tls<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 smtpServer =3D <a href=3D"http://smtp.gmail.com" r=
el=3D"noreferrer noreferrer" target=3D"_blank">smtp.gmail.com</a> &lt;<a hr=
ef=3D"http://smtp.gmail.com" rel=3D"noreferrer noreferrer" target=3D"_blank=
">http://smtp.gmail.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 smtpUser =3D <a href=3D"mailto:yourname@gmail.com"=
 target=3D"_blank" rel=3D"noreferrer">yourname@gmail.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:yourname@gmail.com" ta=
rget=3D"_blank" rel=3D"noreferrer">yourname@gmail.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 smtpServerPort =3D 587<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 If you have multifa=
ctor authentication setup on your gmail<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; account, you will need to generate an app-spec=
ific password for use<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; with git send-email. Visit<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://=
security.google.com/settings/security/apppasswords" rel=3D"noreferrer noref=
errer" target=3D"_blank">https://security.google.com/settings/security/appp=
asswords</a> to<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; create it.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 Once your commits a=
re ready to be sent to the mailing list,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; run the following commands:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $ git=
 format-patch --cover-letter -M origin/master -o<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; outgoing/ $ edit outgoing/0000-*<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $ git=
 send-email outgoing/*<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 The first time you =
run it, you will be prompted for your<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; credentials. Enter the app-specific or your re=
gular password as<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; appropriate. If you have credential helper con=
figured (see<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; git-credential(1)), the password will be saved=
 in the credential<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; store so you won=E2=80=99t have to type it the=
 next time.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 Note: the following=
 perl modules are required Net::SMTP::SSL,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 MIME::Base64 and Au=
then::SASL<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Thanks,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Laurent<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Hm, you&#39;re right.=C2=A0 Even after making the c=
onfig changes and installing<br>
&gt;=C2=A0 =C2=A0 =C2=A0the necessary packages, I still have no luck with g=
it send-email.=C2=A0 Might<br>
&gt;=C2=A0 =C2=A0 =C2=A0take a bit to debug this.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0- Justin<br>
&gt; <br>
&gt; <br>
&gt; Sorry for the multiplicity, looks like Gmail forwarded it eventually,<=
br>
&gt; but not until I tried several times debugging it.<br>
<br>
Not sure, I didn&#39;t receive any of them.<br>
<br>
Thanks,<br>
Laurent<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D=
"auto">Sigh, 4 copies ended up in my Gmail spam folder, so I thought it mad=
e it through.</div><div dir=3D"auto"><br></div><div dir=3D"auto">- Justin</=
div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex"></blockquote></div></div></div>

--0000000000009f1b42058c430ff3--

