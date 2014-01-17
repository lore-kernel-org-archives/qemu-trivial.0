Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1W42H7-00007U-RJ
	for mharc-qemu-trivial@gnu.org; Fri, 17 Jan 2014 00:47:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40240)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <keweihk@gmail.com>) id 1W42H5-00005D-Pd
	for qemu-trivial@nongnu.org; Fri, 17 Jan 2014 00:47:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <keweihk@gmail.com>) id 1W42H4-00047R-W5
	for qemu-trivial@nongnu.org; Fri, 17 Jan 2014 00:47:23 -0500
Received: from mail-wg0-x22a.google.com ([2a00:1450:400c:c00::22a]:48325)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <keweihk@gmail.com>)
	id 1W42H2-00044k-TR; Fri, 17 Jan 2014 00:47:21 -0500
Received: by mail-wg0-f42.google.com with SMTP id l18so1393476wgh.1
	for <multiple recipients>; Thu, 16 Jan 2014 21:47:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=gpbloJmejaKx2+2pohNgj7QDHh2knSAlhZz1VM+B2KI=;
	b=UE+5JaPPXdu6JetIPQxXmAGM9e6pV+VCAVovz6Wj47Y1mGecdeAGf4UzB1z7RUaSxu
	YOdBbMNvIMY+V2n+9x2+++7OufLhzTedwiFYNpIunNMOzeIcEgXo3VwuzqQMcIFjxvSJ
	zNsWdWMISrYlI1M/IjFH0c7j51Is/BYMRepF7DU5qPpa4IWoMRJKHQF9vLpb0EqbP0dE
	IgCUz5Pz5Lu269I2s6i9HHj+AcTEfkOqAItbDhTx+2GLMgGyWY19Dkp4RYx4pTPAbxZO
	se773YLwR32QKxfMT9rdgdbFQApv+x+02ZhfNwN26vLqCNzKrIB8hw1nAZYJ30sDj1z4
	tCzg==
X-Received: by 10.180.14.37 with SMTP id m5mr510552wic.46.1389937639107; Thu,
	16 Jan 2014 21:47:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.194.2.238 with HTTP; Thu, 16 Jan 2014 21:46:59 -0800 (PST)
In-Reply-To: <CAFEAcA9UNDB3zPk46uTECePb3eqqe2utk-9G5_mJc0Hq2XgwZw@mail.gmail.com>
References: <1388486168-2532-1-git-send-email-keweihk@gmail.com>
	<52D7B975.9050507@msgid.tls.msk.ru>
	<CAFEAcA9UNDB3zPk46uTECePb3eqqe2utk-9G5_mJc0Hq2XgwZw@mail.gmail.com>
From: Kewei Yu <keweihk@gmail.com>
Date: Fri, 17 Jan 2014 13:46:59 +0800
Message-ID: <CAJBZ5eNhJnG03pN12sEMPbUQiNhAx+YfvxtBxwZDYvcKzpafew@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary=f46d04138ca73d340204f024132e
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c00::22a
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/1] Add a blank space
 between the variable and '='
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
X-List-Received-Date: Fri, 17 Jan 2014 05:47:24 -0000

--f46d04138ca73d340204f024132e
Content-Type: text/plain; charset=ISO-8859-1

2014/1/16 Peter Maydell <peter.maydell@linaro.org>

> On 16 January 2014 10:50, Michael Tokarev <mjt@tls.msk.ru> wrote:
> > Thanks, applied.
>
> Can you fix the subject line in your tree to have a
> prefix indicating which area of the codebase it affects,
> please?
>
OK, Thanks for your review.
I will send it again.

>
> thanks
> -- PMM
>


Regard
Kewei

--f46d04138ca73d340204f024132e
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><div class=3D"gmail_quote">=
2014/1/16 Peter <span class=3D"" style>Maydell</span> <span dir=3D"ltr">&lt=
;<a href=3D"mailto:peter.maydell@linaro.org" target=3D"_blank">peter.<span =
class=3D"" style>maydell</span>@<span class=3D"" style>linaro</span>.org</a=
>&gt;</span><br>

<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex">On 16 January 2014 10:50, Michael Tokarev &lt;<a href=3D"m=
ailto:mjt@tls.msk.ru">mjt@tls.msk.ru</a>&gt; wrote:<br>


&gt; Thanks, applied.<br>
<br>
Can you fix the subject line in your tree to have a<br>
prefix indicating which area of the codebase it affects,<br>
please?<br></blockquote><div>OK, Thanks for your review.</div><div>I will s=
end it again.=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);bor=
der-left-style:solid;padding-left:1ex">


<br>
thanks<br>
-- PMM<br>
</blockquote></div><br class=3D""><br clear=3D"all"><div><div dir=3D"ltr"><=
font size=3D"3"><span style=3D"color:rgb(0,0,0);font-family:&#39;lucida Gra=
nde&#39;,Verdana;font-size:12px;line-height:18px"></span></font><div>Regard=
<br></div>

<div><span class=3D"" style>Kewei</span></div></div></div><br></div></div>

--f46d04138ca73d340204f024132e--

