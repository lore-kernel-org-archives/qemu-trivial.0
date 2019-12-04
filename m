Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1icQ8F-0003FG-1u
	for mharc-qemu-trivial@gnu.org; Wed, 04 Dec 2019 03:35:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55470)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <hhan@redhat.com>) id 1icQ8A-0003DD-Ou
 for qemu-trivial@nongnu.org; Wed, 04 Dec 2019 03:35:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <hhan@redhat.com>) id 1icQ84-0002nN-Gs
 for qemu-trivial@nongnu.org; Wed, 04 Dec 2019 03:35:26 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:42769
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <hhan@redhat.com>) id 1icQ84-0002eb-AI
 for qemu-trivial@nongnu.org; Wed, 04 Dec 2019 03:35:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575448516;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wbBMQWlCfNg3+5+vsKUoU9ccb/zOqmaut5hc/RG2kCk=;
 b=DS2x9v2EFzyPOsHdG29ufxgLLV9oxrpx9CEBVcirTidrg0LG9yDNRQob6Mx7x0gdnLefJe
 XgEWV7dgYDizlkK+t9gSD3V6vSiyvdo6jwErppqw3U8bc9orgO18fuoWd5vr6DScQzO1Nr
 1Dw9V2yO6yJkVXcunJyJQxKc7VXe+ek=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-298-3F9D-AMrPu6qDAPgx9uLUw-1; Wed, 04 Dec 2019 03:35:14 -0500
Received: by mail-ot1-f72.google.com with SMTP id m26so2973982otk.12
 for <qemu-trivial@nongnu.org>; Wed, 04 Dec 2019 00:35:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FzTJIihLJ/wuPkZ3XDg1H+8rAUUBPrtKkqnrulue7O4=;
 b=lZSOaZlU+O/CjVlfjhKZAPLHsZTsEytFkCEqksiSA5aAeEEgC7fGCV/GAwI2z5dlx6
 qWdBGwqFfwxL5ReV/NGFjPrY4KTWYLV84IWFZUOi1OhzZoYvFwe+lcHTay1JtKDQN3C/
 C0PFLGarNMpn/PqMfS6EtdvAtiHH7SQSfWCqKPrunOUtZy92OB389j0k1fOB1ri3Y0lX
 2ZcnAs8uE+nSjf/iubKvAu0Zt7us0rfIirFYlOXxNk5ld1MWM1tIsbgYjLjEqwJF6L19
 5YWJFb9J2AGK4QQ9qk15Uk2zZYix7K8C6c/KpZrWF4rvv/gLvSydkb08/fKK9lg/hgP1
 i+aQ==
X-Gm-Message-State: APjAAAUlBnlErdNT8/fitQDmThmjZs/7sla11MhTOZuVo2q+DR4J6sv+
 KY52IMLZ5NCzpcpoBgeXBPC9OAfrt7ID4kHLxw7o4DYH/6kfZ9eVxDnWzjRkwmV43mFTEJZJkPN
 HC8n5z+ZaV/gWFCA5LJB4Pe2OYDk+Y9Q+4Q==
X-Received: by 2002:a9d:470a:: with SMTP id a10mr1680799otf.370.1575448513650; 
 Wed, 04 Dec 2019 00:35:13 -0800 (PST)
X-Google-Smtp-Source: APXvYqxSlpp8GygnpztP5nIfEyhk7BX391ziv+7ioplWIhMvgaAi/XIUNLoJOlmLSd0QmRanVC589ZyNrN5bnvcY2xs=
X-Received: by 2002:a9d:470a:: with SMTP id a10mr1680785otf.370.1575448513395; 
 Wed, 04 Dec 2019 00:35:13 -0800 (PST)
MIME-Version: 1.0
References: <20191113131655.307847-1-hhan@redhat.com>
 <CAHjf+S_miSm8ygAadObVnif1LKejA=j9OFae+OV5Oe-TedByyQ@mail.gmail.com>
 <CAHjf+S8LVAMjuvXNhE5MyAirpFE7NgUsn6YDHX7yLPgK4brW2g@mail.gmail.com>
 <1427d438-5d2a-7cc6-fd2c-c0fa95f229aa@redhat.com>
In-Reply-To: <1427d438-5d2a-7cc6-fd2c-c0fa95f229aa@redhat.com>
From: Han Han <hhan@redhat.com>
Date: Wed, 4 Dec 2019 16:34:20 +0800
Message-ID: <CAHjf+S-S5pU6nRFAav872wRE0rB1JOTKg5WXuJ-GN=08_E5L4Q@mail.gmail.com>
Subject: Re: [PATCH] scripts: Fix undefinited name 'file' error for python3
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, 
 Eduardo Habkost <ehabkost@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
X-MC-Unique: 3F9D-AMrPu6qDAPgx9uLUw-1
X-Mimecast-Spam-Score: 0
Content-Type: multipart/alternative; boundary="00000000000000dffd0598dcb197"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
X-List-Received-Date: Wed, 04 Dec 2019 08:35:32 -0000

--00000000000000dffd0598dcb197
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 4, 2019 at 4:23 PM Thomas Huth <thuth@redhat.com> wrote:

> On 04/12/2019 07.48, Han Han wrote:
> > Anyone help to review it?
>
>  Hi!
>
> When sending patches to the qemu-devel mailing list, please always make
> sure to put the corresponding maintainers on CC:, otherwise your mails
> might get lost in the high traffic of the mailing list. For this case,
> it would have been good to CC: the "Migration" and "Python script"
> maintainers, see the corresponding sections of the MAINTAINERS file in
> the top most directory of the QEMU sources.
>
OK. Thanks for your advice

>
> Anyway, it seems someone else ran into the same issue already, too, and
>  it got already fixed here:
>
> https://git.qemu.org/?p=3Dqemu.git;a=3Dcommitdiff;h=3De8d0ac5801edda91412=
e5
>
>   Thomas
>
>
> > On Tue, Nov 26, 2019 at 1:54 PM Han Han <hhan@redhat.com
> > <mailto:hhan@redhat.com>> wrote:
> >
> >     ping
> >
> >     On Wed, Nov 13, 2019 at 9:17 PM Han Han <hhan@redhat.com
> >     <mailto:hhan@redhat.com>> wrote:
> >
> >         In python3, 'file' is no longer a keyword for file type object.
> >         So it
> >         will can error when run the scripts by python3:
> >
> >         $ python3 ./scripts/vmstate-static-checker.py -s 4.0.json -d
> >         4.1.json
> >         Traceback (most recent call last):
> >           File "./scripts/vmstate-static-checker.py", line 431, in
> <module>
> >             sys.exit(main())
> >           File "./scripts/vmstate-static-checker.py", line 378, in main
> >             parser.add_argument('-s', '--src', type=3Dfile, required=3D=
True,
> >         NameError: name 'file' is not defined
> >
> >         Replace file type to argparse.FileType('r').
> >
> >         Signed-off-by: Han Han <hhan@redhat.com <mailto:hhan@redhat.com
> >>
> >         ---
> >          scripts/vmstate-static-checker.py | 4 ++--
> >          1 file changed, 2 insertions(+), 2 deletions(-)
> >
> >         diff --git a/scripts/vmstate-static-checker.py
> >         b/scripts/vmstate-static-checker.py
> >         index d3467288..14f199a0 100755
> >         --- a/scripts/vmstate-static-checker.py
> >         +++ b/scripts/vmstate-static-checker.py
> >         @@ -375,9 +375,9 @@ def main():
> >              help_text =3D "Parse JSON-formatted vmstate dumps from QEM=
U
> >         in files SRC and DEST.  Checks whether migration from SRC to
> >         DEST QEMU versions would break based on the VMSTATE information
> >         contained within the JSON outputs.  The JSON output is created
> >         from a QEMU invocation with the -dump-vmstate parameter and a
> >         filename argument to it.  Other parameters to QEMU do not
> >         matter, except the -M (machine type) parameter."
> >
> >              parser =3D argparse.ArgumentParser(description=3Dhelp_text=
)
> >         -    parser.add_argument('-s', '--src', type=3Dfile, required=
=3DTrue,
> >         +    parser.add_argument('-s', '--src',
> >         type=3Dargparse.FileType('r'), required=3DTrue,
> >                                  help=3D'json dump from src qemu')
> >         -    parser.add_argument('-d', '--dest', type=3Dfile,
> required=3DTrue,
> >         +    parser.add_argument('-d', '--dest',
> >         type=3Dargparse.FileType('r'), required=3DTrue,
> >                                  help=3D'json dump from dest qemu')
> >              parser.add_argument('--reverse', required=3DFalse,
> default=3DFalse,
> >                                  action=3D'store_true',
> >         --
> >         2.23.0
> >
> >
> >
> > --
> > Best regards,
> > -----------------------------------
> > Han Han
> > Quality Engineer
> > Redhat.
> >
> > Email: hhan@redhat.com <mailto:hhan@redhat.com>
> > Phone: +861065339333
>
>

--=20
Best regards,
-----------------------------------
Han Han
Quality Engineer
Redhat.

Email: hhan@redhat.com
Phone: +861065339333

--00000000000000dffd0598dcb197
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Dec 4, 2019 at 4:23 PM Thomas=
 Huth &lt;<a href=3D"mailto:thuth@redhat.com">thuth@redhat.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 04/12/2019=
 07.48, Han Han wrote:<br>
&gt; Anyone help to review it?<br>
<br>
=C2=A0Hi!<br>
<br>
When sending patches to the qemu-devel mailing list, please always make<br>
sure to put the corresponding maintainers on CC:, otherwise your mails<br>
might get lost in the high traffic of the mailing list. For this case,<br>
it would have been good to CC: the &quot;Migration&quot; and &quot;Python s=
cript&quot;<br>
maintainers, see the corresponding sections of the MAINTAINERS file in<br>
the top most directory of the QEMU sources.<br></blockquote><div>OK. Thanks=
 for your advice <br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">
<br>
Anyway, it seems someone else ran into the same issue already, too, and<br>
=C2=A0it got already fixed here:<br>
<br>
<a href=3D"https://git.qemu.org/?p=3Dqemu.git;a=3Dcommitdiff;h=3De8d0ac5801=
edda91412e5" rel=3D"noreferrer" target=3D"_blank">https://git.qemu.org/?p=
=3Dqemu.git;a=3Dcommitdiff;h=3De8d0ac5801edda91412e5</a><br>
<br>
=C2=A0 Thomas<br>
<br>
<br>
&gt; On Tue, Nov 26, 2019 at 1:54 PM Han Han &lt;<a href=3D"mailto:hhan@red=
hat.com" target=3D"_blank">hhan@redhat.com</a><br>
&gt; &lt;mailto:<a href=3D"mailto:hhan@redhat.com" target=3D"_blank">hhan@r=
edhat.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0ping<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On Wed, Nov 13, 2019 at 9:17 PM Han Han &lt;<a href=
=3D"mailto:hhan@redhat.com" target=3D"_blank">hhan@redhat.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:hhan@redhat.com" targe=
t=3D"_blank">hhan@redhat.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0In python3, &#39;file&#39; is no long=
er a keyword for file type object.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0So it<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0will can error when run the scripts b=
y python3:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$ python3 ./scripts/vmstate-static-ch=
ecker.py -s 4.0.json -d<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A04.1.json<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Traceback (most recent call last):<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 File &quot;./scripts/vmstate-s=
tatic-checker.py&quot;, line 431, in &lt;module&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 sys.exit(main())<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 File &quot;./scripts/vmstate-s=
tatic-checker.py&quot;, line 378, in main<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 parser.add_argument(&#3=
9;-s&#39;, &#39;--src&#39;, type=3Dfile, required=3DTrue,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NameError: name &#39;file&#39; is not=
 defined<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Replace file type to argparse.FileTyp=
e(&#39;r&#39;).<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Signed-off-by: Han Han &lt;<a href=3D=
"mailto:hhan@redhat.com" target=3D"_blank">hhan@redhat.com</a> &lt;mailto:<=
a href=3D"mailto:hhan@redhat.com" target=3D"_blank">hhan@redhat.com</a>&gt;=
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0---<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0scripts/vmstate-static-checker.=
py | 4 ++--<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A01 file changed, 2 insertions(+)=
, 2 deletions(-)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0diff --git a/scripts/vmstate-static-c=
hecker.py<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0b/scripts/vmstate-static-checker.py<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0index d3467288..14f199a0 100755<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--- a/scripts/vmstate-static-checker.=
py<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+++ b/scripts/vmstate-static-checker.=
py<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0@@ -375,9 +375,9 @@ def main():<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0help_text =3D &qu=
ot;Parse JSON-formatted vmstate dumps from QEMU<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0in files SRC and DEST.=C2=A0 Checks w=
hether migration from SRC to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DEST QEMU versions would break based =
on the VMSTATE information<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0contained within the JSON outputs.=C2=
=A0 The JSON output is created<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from a QEMU invocation with the -dump=
-vmstate parameter and a<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0filename argument to it.=C2=A0 Other =
parameters to QEMU do not<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0matter, except the -M (machine type) =
parameter.&quot;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0parser =3D argpar=
se.ArgumentParser(description=3Dhelp_text)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 parser.add_argument(&#=
39;-s&#39;, &#39;--src&#39;, type=3Dfile, required=3DTrue,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 parser.add_argument(&#=
39;-s&#39;, &#39;--src&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0type=3Dargparse.FileType(&#39;r&#39;)=
, required=3DTrue,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0help=3D&#39;json dum=
p from src qemu&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 parser.add_argument(&#=
39;-d&#39;, &#39;--dest&#39;, type=3Dfile, required=3DTrue,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 parser.add_argument(&#=
39;-d&#39;, &#39;--dest&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0type=3Dargparse.FileType(&#39;r&#39;)=
, required=3DTrue,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0help=3D&#39;json dum=
p from dest qemu&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0parser.add_argume=
nt(&#39;--reverse&#39;, required=3DFalse, default=3DFalse,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0action=3D&#39;store_=
true&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-- <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A02.23.0<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; -- <br>
&gt; Best regards,<br>
&gt; -----------------------------------<br>
&gt; Han Han<br>
&gt; Quality Engineer<br>
&gt; Redhat.<br>
&gt; <br>
&gt; Email: <a href=3D"mailto:hhan@redhat.com" target=3D"_blank">hhan@redha=
t.com</a> &lt;mailto:<a href=3D"mailto:hhan@redhat.com" target=3D"_blank">h=
han@redhat.com</a>&gt;<br>
&gt; Phone: +861065339333<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr=
">Best regards,</div><div dir=3D"ltr">-----------------------------------<b=
r></div><div dir=3D"ltr">Han Han<br>Quality Engineer<br>Redhat.<br><br>Emai=
l: <a href=3D"mailto:hhan@redhat.com" target=3D"_blank">hhan@redhat.com</a>=
<br>Phone: +861065339333<br></div></div></div></div></div></div></div>

--00000000000000dffd0598dcb197--


