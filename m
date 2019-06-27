Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hgHsF-0004SJ-Ic
	for mharc-qemu-trivial@gnu.org; Wed, 26 Jun 2019 20:02:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58249)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <chmeeedalf@gmail.com>) id 1hgHsC-0004PS-Hw
 for qemu-trivial@nongnu.org; Wed, 26 Jun 2019 20:02:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <chmeeedalf@gmail.com>) id 1hgHsA-0001ls-Um
 for qemu-trivial@nongnu.org; Wed, 26 Jun 2019 20:02:44 -0400
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135]:38983)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <chmeeedalf@gmail.com>)
 id 1hgHs7-0001hs-3m; Wed, 26 Jun 2019 20:02:39 -0400
Received: by mail-lf1-x135.google.com with SMTP id p24so296204lfo.6;
 Wed, 26 Jun 2019 17:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0bD4eEcaMXQo24YPh3YpBiz6BxI/iotWsEY5N08Vs4E=;
 b=HPasXv6YmgH+VN1Xab72GajIyaMn6QCeQw4ZL2x/8JdqZT8hSz6hvfKM7YD8uq8FtP
 sHlVvYtXywl9T/OFBicVKAjPVlq6F5kGJlE4IUurHPyiQSFyN9qWVAu4fthdH0FjDbcg
 el5JaQRSvMpISqLSAU0023A/qTSPpI1tq5h8zpPH80sm/uvgxR0v0+gKAuJisfZg4Xss
 snpM/w4tefwKT929Do/8oUuvnZ/Y9M1deZKH2idcG+1/Se5JsJ/1MRVqCWb6QLm3M1hV
 9Bx+OcIxyNaIbbM2+D21xiADAnsO0A98mJs7Ntd9fb6/6b8Ps0jg4y9o1/VavBKMB1g4
 veJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0bD4eEcaMXQo24YPh3YpBiz6BxI/iotWsEY5N08Vs4E=;
 b=NpUfqZcz/2SMWlxIIgYIBcy4DNQ5+s3bGkhbQUW4bnUOpGUJjl5HEiWcqIt7fAWs68
 tS3xdMlHgrwN95RuHiCvGcwGsiOTWrz7jNpRp5rLmvHCzewqErxhVToszhasA9f3icl5
 NGI3wWs28P7HF5Xry+nPJCLxBfzhpyMOJuMmYo8Zg52DDvtIEgKV4rU+P5U5UhDHuHBH
 74Df25vCfxw9PLRE4jynHXqt3kvukZB44YPm+jd0vAokIzLTNgcb4LeKLvOsAXqJzQ2Q
 x4xj7ruJkRDlAWL7MlqrM+apiIn98meqJxsXRCgom6laLJ3tky7WIJwpi058PA6i3gh+
 LOAg==
X-Gm-Message-State: APjAAAV2dtjG4ec3kyeK5sVOsUFqcoU5IOatmuVPXcNjHBEnH5eBdd7P
 mzkdo2yUFNGhqWHOlHlkbOoEwd/T2koQ5kNDkUE=
X-Google-Smtp-Source: APXvYqyjaotHpgJO77QWwMiM5xzlO0cv/MpB076PmptxzJ5OGfA+s2vWvl+329LIyqoygFdalbSQf2xI5T/HyPsM60g=
X-Received: by 2002:a05:6512:48e:: with SMTP id
 v14mr415861lfq.130.1561593757311; 
 Wed, 26 Jun 2019 17:02:37 -0700 (PDT)
MIME-Version: 1.0
References: <20190607135653.6ece685d@titan.knownspace>
 <8676232e-917d-44e2-1149-b25f26698a73@vivier.eu>
 <92053c9c-e7bf-76cb-9399-987f4ab31bfb@vivier.eu>
 <20190626113742.6bcd8a26@titan.knownspace>
 <d60f142d-27ef-bfe5-1eb6-cefb22640625@vivier.eu>
 <20190626130414.08940342@titan.knownspace>
In-Reply-To: <20190626130414.08940342@titan.knownspace>
From: Justin Hibbits <chmeeedalf@gmail.com>
Date: Wed, 26 Jun 2019 19:02:25 -0500
Message-ID: <CAHSQbTCxP09J9NtFiN4UpdXHJZHtTw_F66hfdAS2sM4=E5GHyQ@mail.gmail.com>
To: Laurent Vivier <laurent@vivier.eu>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, 
 "Emilio G. Cota" <cota@braap.org>
Content-Type: multipart/alternative; boundary="000000000000302841058c42e101"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::135
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
X-List-Received-Date: Thu, 27 Jun 2019 00:02:46 -0000

--000000000000302841058c42e101
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 26, 2019, 13:04 Justin Hibbits <chmeeedalf@gmail.com> wrote:

> On Wed, 26 Jun 2019 18:47:42 +0200
> Laurent Vivier <laurent@vivier.eu> wrote:
>
> > Le 26/06/2019 =C3=A0 18:37, Justin Hibbits a =C3=A9crit :
> > > On Wed, 26 Jun 2019 18:16:36 +0200
> > > Laurent Vivier <laurent@vivier.eu> wrote:
> > >
> > >> Le 26/06/2019 =C3=A0 18:14, Laurent Vivier a =C3=A9crit :
> > >>> Le 07/06/2019 =C3=A0 20:56, Justin Hibbits a =C3=A9crit :
> > >>>> The attached very trivial patch fixes a startup bug that prevents
> > >>>> at least Qemu 3.1 and later from working on FreeBSD/powerpc64.
> > >>>>
> > >>>> - Justin
> > >>>>
> > >>>
> > >>> Please don't send a patch in attachment but inlined in the message
> > >>> (you may use "git send-email" for that).
> > >>>
> > >>> This patch fixes "util: add cacheinfo" that has changed the type
> > >>> from unsigned to long.
> > >>>
> > >>> You can add the following line in the commit message:
> > >>>
> > >>> Fixes: b255b2c8a548 ("util: add cacheinfo")
> > >>>
> > >>> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
> > >>>
> > >>
> > >> CC: author of b255b2c8a548 ("util: add cacheinfo")
> > >>
> > >> Thanks,
> > >> Laurent
> > >
> > > Hi Laurent,
> > >
> > > Sorry.  I had never used git send-email before, so wasn't
> > > comfortable with it.  I just updated the commit message with your
> > > feedback and used git send-email to submit the patch.  I hope
> > > everything went well.
> >
> > It seems not. I didn't receive it.
> >
> > Did you configure the SMTP server. See git-send-email(1):
> >
> >    Use gmail as the smtp server
> >
> >        To use git send-email to send your patches through the GMail
> > SMTP server, edit ~/.gitconfig to specify your account settings:
> >
> >            [sendemail]
> >                    smtpEncryption =3D tls
> >                    smtpServer =3D smtp.gmail.com
> >                    smtpUser =3D yourname@gmail.com
> >                    smtpServerPort =3D 587
> >
> >        If you have multifactor authentication setup on your gmail
> > account, you will need to generate an app-specific password for use
> > with git send-email. Visit
> >        https://security.google.com/settings/security/apppasswords to
> > create it.
> >
> >        Once your commits are ready to be sent to the mailing list,
> > run the following commands:
> >
> >            $ git format-patch --cover-letter -M origin/master -o
> > outgoing/ $ edit outgoing/0000-*
> >            $ git send-email outgoing/*
> >
> >        The first time you run it, you will be prompted for your
> > credentials. Enter the app-specific or your regular password as
> > appropriate. If you have credential helper configured (see
> > git-credential(1)), the password will be saved in the credential
> > store so you won=E2=80=99t have to type it the next time.
> >
> >        Note: the following perl modules are required Net::SMTP::SSL,
> >        MIME::Base64 and Authen::SASL
> >
> > Thanks,
> > Laurent
> >
> >
>
> Hm, you're right.  Even after making the config changes and installing
> the necessary packages, I still have no luck with git send-email.  Might
> take a bit to debug this.
>
> - Justin
>

Sorry for the multiplicity, looks like Gmail forwarded it eventually, but
not until I tried several times debugging it.

- Justin

>

--000000000000302841058c42e101
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Wed, Jun 26, 2019, 13:04 Justin Hibbits &lt;<a href=
=3D"mailto:chmeeedalf@gmail.com">chmeeedalf@gmail.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex">On Wed, 26 Jun 2019 18:47:42 +0200<br>
Laurent Vivier &lt;<a href=3D"mailto:laurent@vivier.eu" target=3D"_blank" r=
el=3D"noreferrer">laurent@vivier.eu</a>&gt; wrote:<br>
<br>
&gt; Le 26/06/2019 =C3=A0 18:37, Justin Hibbits a =C3=A9crit=C2=A0:<br>
&gt; &gt; On Wed, 26 Jun 2019 18:16:36 +0200<br>
&gt; &gt; Laurent Vivier &lt;<a href=3D"mailto:laurent@vivier.eu" target=3D=
"_blank" rel=3D"noreferrer">laurent@vivier.eu</a>&gt; wrote:<br>
&gt; &gt;=C2=A0 =C2=A0<br>
&gt; &gt;&gt; Le 26/06/2019 =C3=A0 18:14, Laurent Vivier a =C3=A9crit=C2=A0=
:=C2=A0 <br>
&gt; &gt;&gt;&gt; Le 07/06/2019 =C3=A0 20:56, Justin Hibbits a =C3=A9crit=
=C2=A0:=C2=A0 =C2=A0 <br>
&gt; &gt;&gt;&gt;&gt; The attached very trivial patch fixes a startup bug t=
hat prevents<br>
&gt; &gt;&gt;&gt;&gt; at least Qemu 3.1 and later from working on FreeBSD/p=
owerpc64.<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt; - Justin<br>
&gt; &gt;&gt;&gt;&gt;=C2=A0 =C2=A0 <br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; Please don&#39;t send a patch in attachment but inlined i=
n the message<br>
&gt; &gt;&gt;&gt; (you may use &quot;git send-email&quot; for that).<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; This patch fixes &quot;util: add cacheinfo&quot; that has=
 changed the type<br>
&gt; &gt;&gt;&gt; from unsigned to long.<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; You can add the following line in the commit message:<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; Fixes: b255b2c8a548 (&quot;util: add cacheinfo&quot;)<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; Reviewed-by: Laurent Vivier &lt;<a href=3D"mailto:laurent=
@vivier.eu" target=3D"_blank" rel=3D"noreferrer">laurent@vivier.eu</a>&gt;<=
br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; CC: author of b255b2c8a548 (&quot;util: add cacheinfo&quot;)<=
br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Thanks,<br>
&gt; &gt;&gt; Laurent=C2=A0 <br>
&gt; &gt; <br>
&gt; &gt; Hi Laurent,<br>
&gt; &gt; <br>
&gt; &gt; Sorry.=C2=A0 I had never used git send-email before, so wasn&#39;=
t<br>
&gt; &gt; comfortable with it.=C2=A0 I just updated the commit message with=
 your<br>
&gt; &gt; feedback and used git send-email to submit the patch.=C2=A0 I hop=
e<br>
&gt; &gt; everything went well.=C2=A0 <br>
&gt; <br>
&gt; It seems not. I didn&#39;t receive it.<br>
&gt; <br>
&gt; Did you configure the SMTP server. See git-send-email(1):<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 Use gmail as the smtp server<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 To use git send-email to send your patches =
through the GMail<br>
&gt; SMTP server, edit ~/.gitconfig to specify your account settings:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [sendemail]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s=
mtpEncryption =3D tls<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s=
mtpServer =3D <a href=3D"http://smtp.gmail.com" rel=3D"noreferrer noreferre=
r" target=3D"_blank">smtp.gmail.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s=
mtpUser =3D <a href=3D"mailto:yourname@gmail.com" target=3D"_blank" rel=3D"=
noreferrer">yourname@gmail.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s=
mtpServerPort =3D 587<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 If you have multifactor authentication setu=
p on your gmail<br>
&gt; account, you will need to generate an app-specific password for use<br=
>
&gt; with git send-email. Visit<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://security.google.com/sett=
ings/security/apppasswords" rel=3D"noreferrer noreferrer" target=3D"_blank"=
>https://security.google.com/settings/security/apppasswords</a> to<br>
&gt; create it.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 Once your commits are ready to be sent to t=
he mailing list,<br>
&gt; run the following commands:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $ git format-patch --cover-le=
tter -M origin/master -o<br>
&gt; outgoing/ $ edit outgoing/0000-*<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $ git send-email outgoing/*<b=
r>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 The first time you run it, you will be prom=
pted for your<br>
&gt; credentials. Enter the app-specific or your regular password as<br>
&gt; appropriate. If you have credential helper configured (see<br>
&gt; git-credential(1)), the password will be saved in the credential<br>
&gt; store so you won=E2=80=99t have to type it the next time.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 Note: the following perl modules are requir=
ed Net::SMTP::SSL,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 MIME::Base64 and Authen::SASL<br>
&gt; <br>
&gt; Thanks,<br>
&gt; Laurent<br>
&gt; <br>
&gt;=C2=A0 <br>
<br>
Hm, you&#39;re right.=C2=A0 Even after making the config changes and instal=
ling<br>
the necessary packages, I still have no luck with git send-email.=C2=A0 Mig=
ht<br>
take a bit to debug this.<br>
<br>
- Justin<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Sorry for the multiplicity, looks like Gmail forwarded it eventua=
lly, but not until I tried several times debugging it.</div><div dir=3D"aut=
o"><br></div><div dir=3D"auto">- Justin</div><div dir=3D"auto"><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">
</blockquote></div></div></div>

--000000000000302841058c42e101--

