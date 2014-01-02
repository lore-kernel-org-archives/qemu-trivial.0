Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Vyf3F-0003x7-PJ
	for mharc-qemu-trivial@gnu.org; Thu, 02 Jan 2014 04:58:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47528)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <keweihk@gmail.com>) id 1Vyf3C-0003tx-S0
	for qemu-trivial@nongnu.org; Thu, 02 Jan 2014 04:58:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <keweihk@gmail.com>) id 1Vyf3B-0001En-Or
	for qemu-trivial@nongnu.org; Thu, 02 Jan 2014 04:58:50 -0500
Received: from mail-wi0-x233.google.com ([2a00:1450:400c:c05::233]:48383)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <keweihk@gmail.com>)
	id 1Vyf39-0001EM-Nq; Thu, 02 Jan 2014 04:58:47 -0500
Received: by mail-wi0-f179.google.com with SMTP id z2so13785811wiv.0
	for <multiple recipients>; Thu, 02 Jan 2014 01:58:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=ZX7zT2m46HPidJjP6g/wr5LIi8ccwepnPZw6A6G14fQ=;
	b=NxujbZhWxlVzBG5mfEDXVcnaTxQl2rr2qJExBAPMh+E2WHcB9wJIRoa1sRGEtLjf5n
	tfoTkGk5/lsT45PL+iT4vzSLijft1xhnX6vCjkilrQFJxq5rJwz1xig/E/p8ccpUhutL
	CNdZZY0mepVzdqSwn6tUT9c0gq8HanJybYhN8fhKgvlPh8Afb3ODlzeVdctJRK7VFSPM
	1tyh+NO7Ldm7dgqkgNF/qgptFPET7hLjws9PcHn+94QYj3JDofHuIWJkAkJYmeLRpF0T
	sjOzhPjpcVO/cI4tF04Oiw5bxLYC8bg9i0Y6Yfu6msq/3/RWkgD5MBDDsRli6F+Mj+Is
	hpUw==
X-Received: by 10.180.76.42 with SMTP id h10mr40192448wiw.46.1388656726535;
	Thu, 02 Jan 2014 01:58:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.194.108.74 with HTTP; Thu, 2 Jan 2014 01:58:26 -0800 (PST)
In-Reply-To: <52C5203F.1030408@redhat.com>
References: <1388464944-26911-1-git-send-email-keweihk@gmail.com>
	<52C5203F.1030408@redhat.com>
From: Kewei Yu <keweihk@gmail.com>
Date: Thu, 2 Jan 2014 17:58:26 +0800
Message-ID: <CAJBZ5eNwe5zHqweVgYPu6mQK3yXZ7O+7kmDrK2jpT+XHa6cF3g@mail.gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary=f46d043890d3e6726604eef9d6b8
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::233
Cc: qemu-trivial <qemu-trivial@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH v2 1/1] qtest: Fix the bug about
 disabling vnc causes "make check" hang
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 02 Jan 2014 09:58:52 -0000

--f46d043890d3e6726604eef9d6b8
Content-Type: text/plain; charset=ISO-8859-1

The fail is caused by "-vnc none", we can't use it when disable vnc from
"./configure".


Faithfully yours
Kewei Yu


2014/1/2 Paolo Bonzini <pbonzini@redhat.com>

> Il 31/12/2013 05:42, Kewei Yu ha scritto:
> > When we disabling vnc from "./configure", the qemu can't use the vnc
> option.
> > So qtest can't use the "vnc -none ", otherwise "make check" will hang.
> >
> > Signed-off-by: Kewei Yu <keweihk@gmail.com>
> > ---
> >  v2: Consolidate VNC macro's #ifdef'ery to one central point
> (tests/libqtest.c).
>
> What happens if qtest instead uses "-display none"?
>
> Paolo
>

--f46d043890d3e6726604eef9d6b8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The fail is caused by &quot;-vnc none&quot;, we can&#39;t =
use it when disable vnc from &quot;./configure&quot;.<div><br></div><div cl=
ass=3D"gmail_extra"><br clear=3D"all"><div><div dir=3D"ltr"><font size=3D"3=
"><span style=3D"line-height:18px;font-size:12px;font-family:&#39;lucida Gr=
ande&#39;,Verdana"><div>


<span style=3D"color:rgb(51,51,51);font-family:=E5=BE=AE=E8=BD=AF=E9=9B=85=
=E9=BB=91,PMingLiU,Verdana,Arial,Helvetica,sans-serif;font-size:13px;line-h=
eight:22px;background-color:rgb(250,250,250)">Faithfully yours</span></div>=
<div><span style=3D"color:rgb(51,51,51);font-family:=E5=BE=AE=E8=BD=AF=E9=
=9B=85=E9=BB=91,PMingLiU,Verdana,Arial,Helvetica,sans-serif;font-size:13px;=
line-height:22px;background-color:rgb(250,250,250)">Kewei Yu</span></div>


</span></font></div></div>
<br><br><div class=3D"gmail_quote">2014/1/2 Paolo Bonzini <span dir=3D"ltr"=
>&lt;<a href=3D"mailto:pbonzini@redhat.com" target=3D"_blank">pbonzini@redh=
at.com</a>&gt;</span><br><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">


Il 31/12/2013 05:42, Kewei Yu ha scritto:<br>
<div>&gt; When we disabling vnc from &quot;./configure&quot;, the qemu can&=
#39;t use the vnc option.<br>
&gt; So qtest can&#39;t use the &quot;vnc -none &quot;, otherwise &quot;mak=
e check&quot; will hang.<br>
&gt;<br>
&gt; Signed-off-by: Kewei Yu &lt;<a href=3D"mailto:keweihk@gmail.com" targe=
t=3D"_blank">keweihk@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0v2: Consolidate VNC macro&#39;s #ifdef&#39;ery to one central po=
int (tests/libqtest.c).<br>
<br>
</div>What happens if qtest instead uses &quot;-display none&quot;?<br>
<span><font color=3D"#888888"><br>
Paolo<br>
</font></span></blockquote></div><br></div></div>

--f46d043890d3e6726604eef9d6b8--

