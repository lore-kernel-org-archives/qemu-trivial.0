Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jAI0Q-0003iu-C6
	for mharc-qemu-trivial@gnu.org; Fri, 06 Mar 2020 13:47:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51430)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mansourweb@gmail.com>) id 1jAI0N-0003id-Pb
 for qemu-trivial@nongnu.org; Fri, 06 Mar 2020 13:47:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mansourweb@gmail.com>) id 1jAI0M-0002Wg-Kf
 for qemu-trivial@nongnu.org; Fri, 06 Mar 2020 13:47:27 -0500
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f]:35717)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <mansourweb@gmail.com>)
 id 1jAI0M-0002VG-Ad
 for qemu-trivial@nongnu.org; Fri, 06 Mar 2020 13:47:26 -0500
Received: by mail-lf1-x12f.google.com with SMTP id z9so2742982lfa.2
 for <qemu-trivial@nongnu.org>; Fri, 06 Mar 2020 10:47:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sWmMoEFW9Pp4g1cgovmjtIaZBaQtZIRZvowJkOlq1eA=;
 b=fA04K/sR21HkTmyISCwY+bXZn7qYX2PaefLUT6hpZlfvU+X/BpGi8hurkjleguRyew
 XBRypCUqfG655+A732BTTZIVdBnOMxRUzBv/dJ5JSMaivUXrcreq/pmD54Gdw+lm/teF
 TDYiW6TEpvzDE9ICjoGfG8EJP8FqA99ScioPsVD0vHFv2hW3YE40O41G0ifFto6NPB2t
 x4iNwAPk8avzg1NoEOh3AGtl0sSMRB0OK4jq5X41e7i1DiMuNU9UXSSmIW2oLXJ4URf7
 QEZnfXvxNMHyXUyzypsy3k0FSr3Eq+OsfZuh5w/XpaH6k1BslsYlVl+5B7brHEGFstBF
 bapw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sWmMoEFW9Pp4g1cgovmjtIaZBaQtZIRZvowJkOlq1eA=;
 b=DcsJFJdk76sH7l+WpT/80DBjJTfN1m1hfRaik7tr0DHJpy5C1fWECN/1mB7O09Q93K
 ikKElUVEeKZuqjwzrd5s/JKyDd2sNgEfyrvgdyo7hDuzPCAXY/pX7NOGQMj+moBClqmK
 OPTLyoQ8QSTi6iu6RJF1H7o5a2mlGhXTTm6Yf8LR/7MkEhmfSNXXoVFwddlj8lU7f26m
 crpR6GDRfaDHSt70sj9g3+dmlvustABFRt+rp8K0aM+TzHsoUoC84Aiqnkl3BP9JGqLD
 N+poGZe/zFTvXWOsMnTVAQeE6ch0iWJ9ArkLv96c7iedBiTej1Wvy5zInFla5eZoKVXH
 cLmw==
X-Gm-Message-State: ANhLgQ0jfqkUhwcVc1TiIvfV0jLpCdPP4NofatyI+Em64MbzvGA4Naw8
 SoUgMeMpaFWzB6PrDtC0d9+wo3kVdkD7ka0DIrY=
X-Google-Smtp-Source: ADFU+vvhlMtoW1r8NR0uEVMMSBZSqBZzRCRPhUzrPwUVmPumT/QmTj6Si5tAbt0qT7zeQ6oZjOR9T9j0XHu4uudZBkc=
X-Received: by 2002:a05:6512:203c:: with SMTP id
 s28mr2763257lfs.117.1583520444413; 
 Fri, 06 Mar 2020 10:47:24 -0800 (PST)
MIME-Version: 1.0
References: <CAGT9xrCF740RKCBrOFVN2LJUKMkLj25oO4pVD1LOfM=ZVKgLeQ@mail.gmail.com>
 <d2214def-4bbc-fe26-67b1-232542cd09e2@vivier.eu>
In-Reply-To: <d2214def-4bbc-fe26-67b1-232542cd09e2@vivier.eu>
From: Mansour Ahmadi <mansourweb@gmail.com>
Date: Fri, 6 Mar 2020 13:47:13 -0500
Message-ID: <CAGT9xrApmDUeFWeLtRjeQx8kiciF0B2eTXC3uVBcgV6ePDwdog@mail.gmail.com>
Subject: Re: Inconsistency - potential bug
To: Laurent Vivier <laurent@vivier.eu>
Cc: qemu-trivial@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000957b0105a03415a6"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::12f
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
X-List-Received-Date: Fri, 06 Mar 2020 18:47:29 -0000

--000000000000957b0105a03415a6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Got it, thanks!


On Fri, Mar 6, 2020 at 6:11 AM Laurent Vivier <laurent@vivier.eu> wrote:

> Le 05/03/2020 =C3=A0 22:22, Mansour Ahmadi a =C3=A9crit :
> > Hi
> >
> > It seems there is an inconsistency here:
> >
> >
> https://github.com/qemu/qemu/blob/55afdac3b29e672aad51e953412364127e54268=
b/disas/ppc.c#L996
> > if(((insn & (1<< 21)) =3D=3D 0) !=3D ((insn & (1<< 15)) =3D=3D 0))
> > *invalid =3D 1;
> >
> https://github.com/qemu/qemu/blob/55afdac3b29e672aad51e953412364127e54268=
b/disas/ppc.c#L1041
> > if(((insn & (1<< 21)) =3D=3D 0) =3D=3D ((insn & (1<< 15)) =3D=3D 0))
> > *invalid =3D 1;
> >
> > Does "=3D=3D" need to be changed to "!=3D"?
> >
> > Mansour
> >
>
> This comes from binutils 2.17:
>
>  eca8f8889ff5 ("Update ppc-dis.c from binutils 2.17")
>
> Latest binutils has kept the same lines.
>
>
> https://sourceware.org/git/gitweb.cgi?p=3Dbinutils-gdb.git;a=3Dblob;f=3Do=
pcodes/ppc-opc.c#l25
>
> extract_bdm
>
>  250       if (((insn & (1 << 21)) =3D=3D 0) !=3D ((insn & (1 << 15)) =3D=
=3D 0))
>
>
> https://sourceware.org/git/gitweb.cgi?p=3Dbinutils-gdb.git;a=3Dblob;f=3Do=
pcodes/ppc-opc.c#l289
>
> extract_bdp
>
>  295       if (((insn & (1 << 21)) =3D=3D 0) =3D=3D ((insn & (1 << 15)) =
=3D=3D 0))
>
> So if there is a bug, it has to be reported to binutils.
>
> Thanks,
> Laurent
>

--000000000000957b0105a03415a6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:garamond=
,serif;font-size:large">Got it, thanks!=C2=A0</div><br></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Mar 6, 2020 =
at 6:11 AM Laurent Vivier &lt;<a href=3D"mailto:laurent@vivier.eu">laurent@=
vivier.eu</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Le 05/03/2020 =C3=A0 22:22, Mansour Ahmadi a =C3=A9crit=C2=A0:<b=
r>
&gt; Hi<br>
&gt; <br>
&gt; It seems there is an inconsistency here:<br>
&gt; <br>
&gt; <a href=3D"https://github.com/qemu/qemu/blob/55afdac3b29e672aad51e9534=
12364127e54268b/disas/ppc.c#L996" rel=3D"noreferrer" target=3D"_blank">http=
s://github.com/qemu/qemu/blob/55afdac3b29e672aad51e953412364127e54268b/disa=
s/ppc.c#L996</a><br>
&gt; if(((insn &amp; (1&lt;&lt; 21)) =3D=3D 0) !=3D ((insn &amp; (1&lt;&lt;=
 15)) =3D=3D 0))<br>
&gt; *invalid =3D 1;<br>
&gt; <a href=3D"https://github.com/qemu/qemu/blob/55afdac3b29e672aad51e9534=
12364127e54268b/disas/ppc.c#L1041" rel=3D"noreferrer" target=3D"_blank">htt=
ps://github.com/qemu/qemu/blob/55afdac3b29e672aad51e953412364127e54268b/dis=
as/ppc.c#L1041</a><br>
&gt; if(((insn &amp; (1&lt;&lt; 21)) =3D=3D 0) =3D=3D ((insn &amp; (1&lt;&l=
t; 15)) =3D=3D 0))<br>
&gt; *invalid =3D 1;<br>
&gt; <br>
&gt; Does &quot;=3D=3D&quot; need to be changed to &quot;!=3D&quot;?<br>
&gt; <br>
&gt; Mansour<br>
&gt; <br>
<br>
This comes from binutils 2.17:<br>
<br>
=C2=A0eca8f8889ff5 (&quot;Update ppc-dis.c from binutils 2.17&quot;)<br>
<br>
Latest binutils has kept the same lines.<br>
<br>
=C2=A0<a href=3D"https://sourceware.org/git/gitweb.cgi?p=3Dbinutils-gdb.git=
;a=3Dblob;f=3Dopcodes/ppc-opc.c#l25" rel=3D"noreferrer" target=3D"_blank">h=
ttps://sourceware.org/git/gitweb.cgi?p=3Dbinutils-gdb.git;a=3Dblob;f=3Dopco=
des/ppc-opc.c#l25</a><br>
<br>
extract_bdm<br>
<br>
=C2=A0250=C2=A0 =C2=A0 =C2=A0 =C2=A0if (((insn &amp; (1 &lt;&lt; 21)) =3D=
=3D 0) !=3D ((insn &amp; (1 &lt;&lt; 15)) =3D=3D 0))<br>
<br>
<a href=3D"https://sourceware.org/git/gitweb.cgi?p=3Dbinutils-gdb.git;a=3Db=
lob;f=3Dopcodes/ppc-opc.c#l289" rel=3D"noreferrer" target=3D"_blank">https:=
//sourceware.org/git/gitweb.cgi?p=3Dbinutils-gdb.git;a=3Dblob;f=3Dopcodes/p=
pc-opc.c#l289</a><br>
<br>
extract_bdp<br>
<br>
=C2=A0295=C2=A0 =C2=A0 =C2=A0 =C2=A0if (((insn &amp; (1 &lt;&lt; 21)) =3D=
=3D 0) =3D=3D ((insn &amp; (1 &lt;&lt; 15)) =3D=3D 0))<br>
<br>
So if there is a bug, it has to be reported to binutils.<br>
<br>
Thanks,<br>
Laurent<br>
</blockquote></div>

--000000000000957b0105a03415a6--

