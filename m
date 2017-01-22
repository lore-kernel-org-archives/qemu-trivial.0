Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cVIeA-0000BU-6J
	for mharc-qemu-trivial@gnu.org; Sun, 22 Jan 2017 08:57:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57034)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1cVIe7-00009J-J2
	for qemu-trivial@nongnu.org; Sun, 22 Jan 2017 08:57:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1cVIe6-0005f3-Gn
	for qemu-trivial@nongnu.org; Sun, 22 Jan 2017 08:57:27 -0500
Received: from mail-yb0-x243.google.com ([2607:f8b0:4002:c09::243]:34881)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <marcandre.lureau@gmail.com>)
	id 1cVIe3-0005cf-Hh; Sun, 22 Jan 2017 08:57:23 -0500
Received: by mail-yb0-x243.google.com with SMTP id j82so4794577ybg.2;
	Sun, 22 Jan 2017 05:57:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=cXITKxe2Ie6UHBSgz+jKUsdAlTebhpNGMT+nRO7019s=;
	b=lTHSLRvzHuw9URIKMWXFtwv2z5nm/Oxxn3ItL9gp+9ZLe23a7MyscaBq+IUKJIUnly
	rAtxi6xsAF3wxZ1q5/ka5aCX7S5InDT5NxQ6n98keSDjNqz2Hx4cSEcXz0804IdGvl/w
	VJZBZXPLMDDaNGgR+T02aDHheSbG1OS7uWmXM+mOpBRlbE071a7HTxgp/pvrWShPvbVz
	hu8WZI4kqqu3VbQicfb63y6psZ7oPgoOpbLHA8EsgUjazzaDLxFCF/NGURaoy3gj72WE
	oCLA3khFz/duji8zRjYMYC71PMMLCmjmi3tyvyQj/IqHH4czEIBqwVnngBr4HYUrW4CQ
	bshQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=cXITKxe2Ie6UHBSgz+jKUsdAlTebhpNGMT+nRO7019s=;
	b=lSFa1tmZaAukdbIyeKX18dM7BxahlhRIhzZE/k7Lp926dXs7sT+f8yYE7QUsSphUol
	lThZbulZDwBlp6Nup6a8lU8f8qlmQ/hIY3EnmZqAh+UMI8ood47JvtLEnj73Eu1MMHn2
	P9ukn46iuFNP7AG4+B95c0FSqbAJyYtmaFvl8aQy+lUb/DN20Mc2eJ0WwOrZ3V3zv+1W
	Ngrz7BRMRca3Pd/QgZYuvDQl9B5yc8N5S6kAr04dDjLa4mVsEHTfOpSx85T0J+mJ5ZsF
	xi8cvn6uWDeVHamo5YrURsJQsI8dEgOeIX5DekfrGqVbgWCYqeKkV6w6ewj2sPtxTQ9u
	4h+g==
X-Gm-Message-State: AIkVDXJ+aZdHLWolPj8bLgZylJlMzGk0Qu7uwok20uqxu1fWPOB7+fwY+h3wCdSsN8x+yEVrcotTIIPQywERtw==
X-Received: by 10.37.74.2 with SMTP id x2mr18270036yba.76.1485093441279; Sun,
	22 Jan 2017 05:57:21 -0800 (PST)
MIME-Version: 1.0
References: <20170122133831.26150-1-sw@weilnetz.de>
In-Reply-To: <20170122133831.26150-1-sw@weilnetz.de>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Sun, 22 Jan 2017 13:57:10 +0000
Message-ID: <CAJ+F1CJ10iLPVV0u0DQtZwEMZcHvHm3SDkBmDTmH=huC1k2cpA@mail.gmail.com>
To: Stefan Weil <sw@weilnetz.de>, QEMU Developer <qemu-devel@nongnu.org>, 
	QEMU Trivial <qemu-trivial@nongnu.org>
Cc: Markus Armbruster <armbru@redhat.com>,
	Michael Roth <mdroth@linux.vnet.ibm.com>
Content-Type: multipart/alternative; boundary=001a113e693c06aac00546af435f
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4002:c09::243
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qapi2texi: Suppress
 unwanted commas in generated output
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
X-List-Received-Date: Sun, 22 Jan 2017 13:57:28 -0000

--001a113e693c06aac00546af435f
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi

On Sun, Jan 22, 2017 at 5:39 PM Stefan Weil <sw@weilnetz.de> wrote:

> Parts of the code use #optional followed by a comma.
>
> We don't want that comma to be part of the generated documentation,
> so remove it, too.
>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>
> I added the generated documentation to https://qemu.weilnetz.de/doc/.
>
> See https://qemu.weilnetz.de/doc/qemu-qmp-ref.html for an
> example of the output without this patch (look for ", net").
>
> We could also remove the commas from the code, but I think
> that removing them programmatically is more robust (and also
> allows people placing commas as they like).
>

Sometime there is also a - : @ipv6: #optional - force the use of ipv6

I think I would rather fix the doc. Making the parser/generator more subtle
will also be harder to document or change later on.


> Regards
> Stefan
>
>  scripts/qapi2texi.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/qapi2texi.py b/scripts/qapi2texi.py
> index 83ded95c2d..65c4aecfaf 100755
> --- a/scripts/qapi2texi.py
> +++ b/scripts/qapi2texi.py
> @@ -146,7 +146,7 @@ def texi_body(doc):
>              desc =3D str(section)
>              opt =3D ''
>              if "#optional" in desc:
> -                desc =3D desc.replace("#optional", "")
> +                desc =3D re.sub("#optional,?", "", desc)
>                  opt =3D ' (optional)'
>              body +=3D "@item @code{'%s'}%s\n%s\n" % (arg, opt,
>                                                     texi_format(desc))
> --
> 2.11.0
>
>
> --
Marc-Andr=C3=A9 Lureau

--001a113e693c06aac00546af435f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi<br><br><div class=3D"gmail_quote"><div dir=3D"ltr">On S=
un, Jan 22, 2017 at 5:39 PM Stefan Weil &lt;<a href=3D"mailto:sw@weilnetz.d=
e">sw@weilnetz.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Pa=
rts of the code use #optional followed by a comma.<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
We don&#39;t want that comma to be part of the generated documentation,<br =
class=3D"gmail_msg">
so remove it, too.<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
Signed-off-by: Stefan Weil &lt;<a href=3D"mailto:sw@weilnetz.de" class=3D"g=
mail_msg" target=3D"_blank">sw@weilnetz.de</a>&gt;<br class=3D"gmail_msg">
---<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
I added the generated documentation to <a href=3D"https://qemu.weilnetz.de/=
doc/" rel=3D"noreferrer" class=3D"gmail_msg" target=3D"_blank">https://qemu=
.weilnetz.de/doc/</a>.<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
See <a href=3D"https://qemu.weilnetz.de/doc/qemu-qmp-ref.html" rel=3D"noref=
errer" class=3D"gmail_msg" target=3D"_blank">https://qemu.weilnetz.de/doc/q=
emu-qmp-ref.html</a> for an<br class=3D"gmail_msg">
example of the output without this patch (look for &quot;, net&quot;).<br c=
lass=3D"gmail_msg">
<br class=3D"gmail_msg">
We could also remove the commas from the code, but I think<br class=3D"gmai=
l_msg">
that removing them programmatically is more robust (and also<br class=3D"gm=
ail_msg">
allows people placing commas as they like).<br class=3D"gmail_msg"></blockq=
uote><div><br></div><div>Sometime there is also a - : @ipv6: #optional - fo=
rce the use of ipv6<br><br></div><div>I think I would rather fix the doc. M=
aking the parser/generator more subtle will also be harder to document or c=
hange later on.<br></div><div><br> </div><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br class=3D"gmail_msg">
Regards<br class=3D"gmail_msg">
Stefan<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
=C2=A0scripts/qapi2texi.py | 2 +-<br class=3D"gmail_msg">
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
diff --git a/scripts/qapi2texi.py b/scripts/qapi2texi.py<br class=3D"gmail_=
msg">
index 83ded95c2d..65c4aecfaf 100755<br class=3D"gmail_msg">
--- a/scripts/qapi2texi.py<br class=3D"gmail_msg">
+++ b/scripts/qapi2texi.py<br class=3D"gmail_msg">
@@ -146,7 +146,7 @@ def texi_body(doc):<br class=3D"gmail_msg">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0desc =3D str(section)<br cl=
ass=3D"gmail_msg">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0opt =3D &#39;&#39;<br class=
=3D"gmail_msg">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if &quot;#optional&quot; in=
 desc:<br class=3D"gmail_msg">
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 desc =3D desc.repl=
ace(&quot;#optional&quot;, &quot;&quot;)<br class=3D"gmail_msg">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 desc =3D re.sub(&q=
uot;#optional,?&quot;, &quot;&quot;, desc)<br class=3D"gmail_msg">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0opt =3D &#39;=
 (optional)&#39;<br class=3D"gmail_msg">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0body +=3D &quot;@item @code=
{&#39;%s&#39;}%s\n%s\n&quot; % (arg, opt,<br class=3D"gmail_msg">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 texi_format(desc))<br class=3D"gmail_msg=
">
--<br class=3D"gmail_msg">
2.11.0<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
</blockquote></div></div><div dir=3D"ltr">-- <br></div><div data-smartmail=
=3D"gmail_signature"><div dir=3D"ltr">Marc-Andr=C3=A9 Lureau<br></div></div=
>

--001a113e693c06aac00546af435f--

