Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hhvxx-0000Wu-Di
	for mharc-qemu-trivial@gnu.org; Mon, 01 Jul 2019 09:03:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35843)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <chmeeedalf@gmail.com>) id 1hhvxt-0000Qf-PH
 for qemu-trivial@nongnu.org; Mon, 01 Jul 2019 09:03:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <chmeeedalf@gmail.com>) id 1hhvxr-0003dd-LG
 for qemu-trivial@nongnu.org; Mon, 01 Jul 2019 09:03:25 -0400
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d]:42766)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <chmeeedalf@gmail.com>)
 id 1hhvxr-00035L-6k; Mon, 01 Jul 2019 09:03:23 -0400
Received: by mail-lf1-x12d.google.com with SMTP id x144so8741269lfa.9;
 Mon, 01 Jul 2019 06:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gYGEWTf/SWiucXWkQ4hNUOwq3//Nu83USjjeDpKHhdI=;
 b=RM4ml4tAIYaZlcZgE8Cbaj+GGfaW2HruV4wBOJZqvKUdpDur6IEnTIy0EoeubAO2q9
 Gw3guxKbqqP7biH6vfA3owqW9McPsq39BgpbYJLMzx60bd8VgZjQsLp8naKLFuJsrdCm
 gLv0DER4xjJSlE7Zl6Tq/gBsiadvwEg+KNDCEntYFMnZ2WMnlNG3RNQnenBeG9vRVUZe
 PV3L8BtUofdu98CvbwxwUCwRoHInuTTWmoqLJQISA7xGVq3LgoAbCu6uuponTmAbZte7
 YVolWqdA9jt89g7yb9GRtIpyLT988bLEsH01FkbU70zl8hBKnb+ZE9OWiifUOxqCuCwN
 2FHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gYGEWTf/SWiucXWkQ4hNUOwq3//Nu83USjjeDpKHhdI=;
 b=AYPu5WyGmDZOrXOfrZXgvApxZMBX1sFGGLGixriHs/tg3DJGcpAv70PZXPK8w2/UCE
 o0JFsivNWzRtKrr+kwdHKCedzVRsQN+55m0WVYsF1UPsi7PcW1/4/Ly2rRfWP9F6RE4K
 L2fJXkvC1Lov7Hh4feLtAXzoVuClFsN63LH+YbiUlTK7ANyyzXnRJXLpCGMWtZ+GGTuI
 srRIKXVEh8BB27aYgQfG1SBYBw5Oo+rAcBewAeCfyNwAAn6sJJcnQW4ZF4g25+aVFcE/
 x3qkv3mbQkMPMUX/t7K9Pzj41OYUbJf4kKrfZ7oCNwlGS4UddpMnhjVEHxvQN656Wpzn
 H4mw==
X-Gm-Message-State: APjAAAXmNj0Kz61qQLu1DdVhaa6xtHaG8pllJcPaOqkLmEY8Emwqgrvr
 BxLnXiOuAOE8YpLgDKSwi91XZLG0uwHvUHRFcHY=
X-Google-Smtp-Source: APXvYqwsGiKDafTLQUGTBEfeNEAtjkI6FhkirpNjYRB/KPxZ8HkSdCfUuFSniiBB/eE+THPIMJadgPEWAQeBK3Gv4sY=
X-Received: by 2002:ac2:50c4:: with SMTP id h4mr11927970lfm.61.1561986165385; 
 Mon, 01 Jul 2019 06:02:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190607135653.6ece685d@titan.knownspace>
 <8676232e-917d-44e2-1149-b25f26698a73@vivier.eu>
 <92053c9c-e7bf-76cb-9399-987f4ab31bfb@vivier.eu>
 <20190626113742.6bcd8a26@titan.knownspace>
 <d60f142d-27ef-bfe5-1eb6-cefb22640625@vivier.eu>
 <20190626130414.08940342@titan.knownspace>
 <CAHSQbTCxP09J9NtFiN4UpdXHJZHtTw_F66hfdAS2sM4=E5GHyQ@mail.gmail.com>
 <477ebe22-eddb-41ba-5811-4a70e639a89a@vivier.eu>
 <CAHSQbTCUzR5WiykWGZOH1bvBPWx15_ZA-=7b17c6AnRK4kn3yA@mail.gmail.com>
 <cd0a35ce-1f8c-6718-13d9-7a481e1eeb31@vivier.eu>
In-Reply-To: <cd0a35ce-1f8c-6718-13d9-7a481e1eeb31@vivier.eu>
From: Justin Hibbits <chmeeedalf@gmail.com>
Date: Mon, 1 Jul 2019 08:02:33 -0500
Message-ID: <CAHSQbTDMWXX978oWBvYhh1Uz7CeA1KQGz6+11rqwYv+ZOWyVOw@mail.gmail.com>
To: Laurent Vivier <laurent@vivier.eu>
Cc: qemu-trivial@nongnu.org, "Emilio G. Cota" <cota@braap.org>,
 qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000088304b058c9e3e8f"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::12d
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
X-List-Received-Date: Mon, 01 Jul 2019 13:03:28 -0000

--00000000000088304b058c9e3e8f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 1, 2019, 03:54 Laurent Vivier <laurent@vivier.eu> wrote:

> Le 27/06/2019 =C3=A0 02:15, Justin Hibbits a =C3=A9crit :
> >
> >
> > On Wed, Jun 26, 2019, 19:08 Laurent Vivier <laurent@vivier.eu
> > <mailto:laurent@vivier.eu>> wrote:
> >
> >     Le 27/06/2019 =C3=A0 02:02, Justin Hibbits a =C3=A9crit :
> >     >
> >     >
> >     > On Wed, Jun 26, 2019, 13:04 Justin Hibbits <chmeeedalf@gmail.com
> >     <mailto:chmeeedalf@gmail.com>
> >     > <mailto:chmeeedalf@gmail.com <mailto:chmeeedalf@gmail.com>>>
> wrote:
> >     >
> >     >     On Wed, 26 Jun 2019 18:47:42 +0200
> >     >     Laurent Vivier <laurent@vivier.eu <mailto:laurent@vivier.eu>
> >     <mailto:laurent@vivier.eu <mailto:laurent@vivier.eu>>> wrote:
> >     >
> >     >     > Le 26/06/2019 =C3=A0 18:37, Justin Hibbits a =C3=A9crit :
> >     >     > > On Wed, 26 Jun 2019 18:16:36 +0200
> >     >     > > Laurent Vivier <laurent@vivier.eu
> >     <mailto:laurent@vivier.eu> <mailto:laurent@vivier.eu
> >     <mailto:laurent@vivier.eu>>> wrote:
> >     >     > >
> >     >     > >> Le 26/06/2019 =C3=A0 18:14, Laurent Vivier a =C3=A9crit =
:
> >     >     > >>> Le 07/06/2019 =C3=A0 20:56, Justin Hibbits a =C3=A9crit=
 :
> >     >     > >>>> The attached very trivial patch fixes a startup bug
> >     that prevents
> >     >     > >>>> at least Qemu 3.1 and later from working on
> >     FreeBSD/powerpc64.
> >     >     > >>>>
> >     >     > >>>> - Justin
> >     >     > >>>>
> >     >     > >>>
> >     >     > >>> Please don't send a patch in attachment but inlined in
> >     the message
> >     >     > >>> (you may use "git send-email" for that).
> >     >     > >>>
> >     >     > >>> This patch fixes "util: add cacheinfo" that has changed
> >     the type
> >     >     > >>> from unsigned to long.
> >     >     > >>>
> >     >     > >>> You can add the following line in the commit message:
> >     >     > >>>
> >     >     > >>> Fixes: b255b2c8a548 ("util: add cacheinfo")
> >     >     > >>>
> >     >     > >>> Reviewed-by: Laurent Vivier <laurent@vivier.eu
> >     <mailto:laurent@vivier.eu>
> >     >     <mailto:laurent@vivier.eu <mailto:laurent@vivier.eu>>>
> >     >     > >>>
> >     >     > >>
> >     >     > >> CC: author of b255b2c8a548 ("util: add cacheinfo")
> >     >     > >>
> >     >     > >> Thanks,
> >     >     > >> Laurent
> >     >     > >
> >     >     > > Hi Laurent,
> >     >     > >
> >     >     > > Sorry.  I had never used git send-email before, so wasn't
> >     >     > > comfortable with it.  I just updated the commit message
> >     with your
> >     >     > > feedback and used git send-email to submit the patch.  I
> hope
> >     >     > > everything went well.
> >     >     >
> >     >     > It seems not. I didn't receive it.
> >     >     >
> >     >     > Did you configure the SMTP server. See git-send-email(1):
> >     >     >
> >     >     >    Use gmail as the smtp server
> >     >     >
> >     >     >        To use git send-email to send your patches through
> >     the GMail
> >     >     > SMTP server, edit ~/.gitconfig to specify your account
> settings:
> >     >     >
> >     >     >            [sendemail]
> >     >     >                    smtpEncryption =3D tls
> >     >     >                    smtpServer =3D smtp.gmail.com
> >     <http://smtp.gmail.com> <http://smtp.gmail.com>
> >     >     >                    smtpUser =3D yourname@gmail.com
> >     <mailto:yourname@gmail.com>
> >     >     <mailto:yourname@gmail.com <mailto:yourname@gmail.com>>
> >     >     >                    smtpServerPort =3D 587
> >     >     >
> >     >     >        If you have multifactor authentication setup on your
> >     gmail
> >     >     > account, you will need to generate an app-specific password
> >     for use
> >     >     > with git send-email. Visit
> >     >     >
> >     https://security.google.com/settings/security/apppasswords to
> >     >     > create it.
> >     >     >
> >     >     >        Once your commits are ready to be sent to the mailin=
g
> >     list,
> >     >     > run the following commands:
> >     >     >
> >     >     >            $ git format-patch --cover-letter -M
> origin/master -o
> >     >     > outgoing/ $ edit outgoing/0000-*
> >     >     >            $ git send-email outgoing/*
> >     >     >
> >     >     >        The first time you run it, you will be prompted for
> your
> >     >     > credentials. Enter the app-specific or your regular passwor=
d
> as
> >     >     > appropriate. If you have credential helper configured (see
> >     >     > git-credential(1)), the password will be saved in the
> credential
> >     >     > store so you won=E2=80=99t have to type it the next time.
> >     >     >
> >     >     >        Note: the following perl modules are required
> >     Net::SMTP::SSL,
> >     >     >        MIME::Base64 and Authen::SASL
> >     >     >
> >     >     > Thanks,
> >     >     > Laurent
> >     >     >
> >     >     >
> >     >
> >     >     Hm, you're right.  Even after making the config changes and
> >     installing
> >     >     the necessary packages, I still have no luck with git
> >     send-email.  Might
> >     >     take a bit to debug this.
> >     >
> >     >     - Justin
> >     >
> >     >
> >     > Sorry for the multiplicity, looks like Gmail forwarded it
> eventually,
> >     > but not until I tried several times debugging it.
> >
> >     Not sure, I didn't receive any of them.
> >
> >     Thanks,
> >     Laurent
> >
> >
> > Sigh, 4 copies ended up in my Gmail spam folder, so I thought it made i=
t
> > through.
> >
>
> Any news? Freeze is coming.
>
> Thanks,
> Laurent
>

I'll manually do it when I get home tomorrow.  Fixing git send-email will
have to wait.

--00000000000088304b058c9e3e8f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Mon, Jul 1, 2019, 03:54 Laurent Vivier &lt;<a href=
=3D"mailto:laurent@vivier.eu" target=3D"_blank" rel=3D"noreferrer">laurent@=
vivier.eu</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Le 27/06=
/2019 =C3=A0 02:15, Justin Hibbits a =C3=A9crit=C2=A0:<br>
&gt; <br>
&gt; <br>
&gt; On Wed, Jun 26, 2019, 19:08 Laurent Vivier &lt;<a href=3D"mailto:laure=
nt@vivier.eu" rel=3D"noreferrer noreferrer" target=3D"_blank">laurent@vivie=
r.eu</a><br>
&gt; &lt;mailto:<a href=3D"mailto:laurent@vivier.eu" rel=3D"noreferrer nore=
ferrer" target=3D"_blank">laurent@vivier.eu</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Le 27/06/2019 =C3=A0 02:02, Justin Hibbits a =C3=A9=
crit=C2=A0:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; On Wed, Jun 26, 2019, 13:04 Justin Hibbits &lt=
;<a href=3D"mailto:chmeeedalf@gmail.com" rel=3D"noreferrer noreferrer" targ=
et=3D"_blank">chmeeedalf@gmail.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:chmeeedalf@gmail.com" =
rel=3D"noreferrer noreferrer" target=3D"_blank">chmeeedalf@gmail.com</a>&gt=
;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &lt;mailto:<a href=3D"mailto:chmeeedalf@gmail.=
com" rel=3D"noreferrer noreferrer" target=3D"_blank">chmeeedalf@gmail.com</=
a> &lt;mailto:<a href=3D"mailto:chmeeedalf@gmail.com" rel=3D"noreferrer nor=
eferrer" target=3D"_blank">chmeeedalf@gmail.com</a>&gt;&gt;&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0On Wed, 26 Jun 2019 18:47:4=
2 +0200<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0Laurent Vivier &lt;<a href=
=3D"mailto:laurent@vivier.eu" rel=3D"noreferrer noreferrer" target=3D"_blan=
k">laurent@vivier.eu</a> &lt;mailto:<a href=3D"mailto:laurent@vivier.eu" re=
l=3D"noreferrer noreferrer" target=3D"_blank">laurent@vivier.eu</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:laurent@vivier.eu" rel=
=3D"noreferrer noreferrer" target=3D"_blank">laurent@vivier.eu</a> &lt;mail=
to:<a href=3D"mailto:laurent@vivier.eu" rel=3D"noreferrer noreferrer" targe=
t=3D"_blank">laurent@vivier.eu</a>&gt;&gt;&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; Le 26/06/2019 =C3=A0 1=
8:37, Justin Hibbits a =C3=A9crit=C2=A0:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; On Wed, 26 Jun 20=
19 18:16:36 +0200<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; Laurent Vivier &l=
t;<a href=3D"mailto:laurent@vivier.eu" rel=3D"noreferrer noreferrer" target=
=3D"_blank">laurent@vivier.eu</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:laurent@vivier.eu" rel=
=3D"noreferrer noreferrer" target=3D"_blank">laurent@vivier.eu</a>&gt; &lt;=
mailto:<a href=3D"mailto:laurent@vivier.eu" rel=3D"noreferrer noreferrer" t=
arget=3D"_blank">laurent@vivier.eu</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:laurent@vivier.eu" rel=
=3D"noreferrer noreferrer" target=3D"_blank">laurent@vivier.eu</a>&gt;&gt;&=
gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; Le 26/06/2019=
 =C3=A0 18:14, Laurent Vivier a =C3=A9crit=C2=A0:=C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;&gt; Le 07/06/=
2019 =C3=A0 20:56, Justin Hibbits a =C3=A9crit=C2=A0:=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;&gt;&gt; The a=
ttached very trivial patch fixes a startup bug<br>
&gt;=C2=A0 =C2=A0 =C2=A0that prevents<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;&gt;&gt; at le=
ast Qemu 3.1 and later from working on<br>
&gt;=C2=A0 =C2=A0 =C2=A0FreeBSD/powerpc64.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;&gt;&gt; - Jus=
tin<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;&gt;&gt;=C2=A0=
 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;&gt; Please do=
n&#39;t send a patch in attachment but inlined in<br>
&gt;=C2=A0 =C2=A0 =C2=A0the message<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;&gt; (you may =
use &quot;git send-email&quot; for that).<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;&gt; This patc=
h fixes &quot;util: add cacheinfo&quot; that has changed<br>
&gt;=C2=A0 =C2=A0 =C2=A0the type<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;&gt; from unsi=
gned to long.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;&gt; You can a=
dd the following line in the commit message:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;&gt; Fixes: b2=
55b2c8a548 (&quot;util: add cacheinfo&quot;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;&gt; Reviewed-=
by: Laurent Vivier &lt;<a href=3D"mailto:laurent@vivier.eu" rel=3D"noreferr=
er noreferrer" target=3D"_blank">laurent@vivier.eu</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:laurent@vivier.eu" rel=
=3D"noreferrer noreferrer" target=3D"_blank">laurent@vivier.eu</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailt=
o:laurent@vivier.eu" rel=3D"noreferrer noreferrer" target=3D"_blank">lauren=
t@vivier.eu</a> &lt;mailto:<a href=3D"mailto:laurent@vivier.eu" rel=3D"nore=
ferrer noreferrer" target=3D"_blank">laurent@vivier.eu</a>&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;&gt;=C2=A0 =C2=
=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; CC: author of=
 b255b2c8a548 (&quot;util: add cacheinfo&quot;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; Thanks,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; Laurent=C2=A0=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; Hi Laurent,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; Sorry.=C2=A0 I ha=
d never used git send-email before, so wasn&#39;t<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; comfortable with =
it.=C2=A0 I just updated the commit message<br>
&gt;=C2=A0 =C2=A0 =C2=A0with your<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; feedback and used=
 git send-email to submit the patch.=C2=A0 I hope<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; everything went w=
ell.=C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; It seems not. I didn&#=
39;t receive it.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; Did you configure the =
SMTP server. See git-send-email(1):<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 Use gmail=
 as the smtp server<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 To use git send-email to send your patches through<br>
&gt;=C2=A0 =C2=A0 =C2=A0the GMail<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; SMTP server, edit ~/.g=
itconfig to specify your account settings:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 [sendemail]<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 smtpEncryption =3D tls<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 smtpServer =3D <a href=3D"=
http://smtp.gmail.com" rel=3D"noreferrer noreferrer noreferrer" target=3D"_=
blank">smtp.gmail.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://smtp.gmail.com" rel=3D"norefe=
rrer noreferrer noreferrer" target=3D"_blank">http://smtp.gmail.com</a>&gt;=
 &lt;<a href=3D"http://smtp.gmail.com" rel=3D"noreferrer noreferrer norefer=
rer" target=3D"_blank">http://smtp.gmail.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 smtpUser =3D <a href=3D"ma=
ilto:yourname@gmail.com" rel=3D"noreferrer noreferrer" target=3D"_blank">yo=
urname@gmail.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:yourname@gmail.com" re=
l=3D"noreferrer noreferrer" target=3D"_blank">yourname@gmail.com</a>&gt;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailt=
o:yourname@gmail.com" rel=3D"noreferrer noreferrer" target=3D"_blank">yourn=
ame@gmail.com</a> &lt;mailto:<a href=3D"mailto:yourname@gmail.com" rel=3D"n=
oreferrer noreferrer" target=3D"_blank">yourname@gmail.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 smtpServerPort =3D 587<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 If you have multifactor authentication setup on your<br>
&gt;=C2=A0 =C2=A0 =C2=A0gmail<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; account, you will need=
 to generate an app-specific password<br>
&gt;=C2=A0 =C2=A0 =C2=A0for use<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; with git send-email. V=
isit<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://security.google.com/settings/sec=
urity/apppasswords" rel=3D"noreferrer noreferrer noreferrer" target=3D"_bla=
nk">https://security.google.com/settings/security/apppasswords</a> to<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; create it.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 Once your commits are ready to be sent to the mailing<br>
&gt;=C2=A0 =C2=A0 =C2=A0list,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; run the following comm=
ands:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 $ git format-patch --cover-letter -M origin/master -o<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; outgoing/ $ edit outgo=
ing/0000-*<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 $ git send-email outgoing/*<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 The first time you run it, you will be prompted for your<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; credentials. Enter the=
 app-specific or your regular password as<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; appropriate. If you ha=
ve credential helper configured (see<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; git-credential(1)), th=
e password will be saved in the credential<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; store so you won=E2=80=
=99t have to type it the next time.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 Note: the following perl modules are required<br>
&gt;=C2=A0 =C2=A0 =C2=A0Net::SMTP::SSL,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 MIME::Base64 and Authen::SASL<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; Thanks,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; Laurent<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0Hm, you&#39;re right.=C2=A0=
 Even after making the config changes and<br>
&gt;=C2=A0 =C2=A0 =C2=A0installing<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0the necessary packages, I s=
till have no luck with git<br>
&gt;=C2=A0 =C2=A0 =C2=A0send-email.=C2=A0 Might<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0take a bit to debug this.<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0- Justin<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Sorry for the multiplicity, looks like Gmail f=
orwarded it eventually,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; but not until I tried several times debugging =
it.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Not sure, I didn&#39;t receive any of them.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Thanks,<br>
&gt;=C2=A0 =C2=A0 =C2=A0Laurent<br>
&gt; <br>
&gt; <br>
&gt; Sigh, 4 copies ended up in my Gmail spam folder, so I thought it made =
it<br>
&gt; through.<br>
&gt; <br>
<br>
Any news? Freeze is coming.<br>
<br>
Thanks,<br>
Laurent<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D=
"auto">I&#39;ll manually do it when I get home tomorrow.=C2=A0 Fixing git s=
end-email will have to wait.</div></div>

--00000000000088304b058c9e3e8f--

