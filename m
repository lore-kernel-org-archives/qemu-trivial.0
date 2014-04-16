Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WaMKB-0002J9-L2
	for mharc-qemu-trivial@gnu.org; Wed, 16 Apr 2014 05:40:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40327)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jickding@gmail.com>) id 1WaG20-0003Ib-LV
	for qemu-trivial@nongnu.org; Tue, 15 Apr 2014 22:57:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jickding@gmail.com>) id 1WaG1z-00009S-Et
	for qemu-trivial@nongnu.org; Tue, 15 Apr 2014 22:57:00 -0400
Received: from mail-oa0-x233.google.com ([2607:f8b0:4003:c02::233]:43433)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jickding@gmail.com>)
	id 1WaG1s-00008X-FQ; Tue, 15 Apr 2014 22:56:57 -0400
Received: by mail-oa0-f51.google.com with SMTP id i4so11713838oah.24
	for <multiple recipients>; Tue, 15 Apr 2014 19:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=ifOBtz1+ijjXhSEW/RRRaeR9P+mTCIlYP8sm/AduxT0=;
	b=D/ukh1hhSLBs7GemqPktGJ0tZQCU1rValC93s8ki1WCyJl13uESmadPKGadxgqwe7D
	x44CYcYaQbwRj+vjj2pV84sXGoSqg+tcW5Xv4nS64tLd8jT7rdBYa93PoMdHROuhFS29
	GI1HPVUpDj7dL4vviEp0ux8LhUtmjvl+4xgmMOzU9IfjTPywiuBt3+/oxLDBhqhL50yG
	1qc5CFxv7e6m44XyszHrdH3B78bgk+nrE3d9abTbJwsx1wjDHT6vODy9dimJaNSq5UOf
	7K/9yitzRLwsJbq/IY7zBYQTdQKJxlwK4v7z0f8C2qX/W6nK53QptPeIltuGKeEyE119
	0EfQ==
MIME-Version: 1.0
X-Received: by 10.182.66.202 with SMTP id h10mr4500867obt.38.1397617011107;
	Tue, 15 Apr 2014 19:56:51 -0700 (PDT)
Received: by 10.182.43.6 with HTTP; Tue, 15 Apr 2014 19:56:51 -0700 (PDT)
In-Reply-To: <534D1271.1000606@gmail.com>
References: <53337BEB.90305@gmail.com> <87wqfgrp83.fsf@blackfin.pond.sub.org>
	<5333F6E2.9080202@gmail.com> <53382DDD.8050001@gmail.com>
	<87fvlylf02.fsf@blackfin.pond.sub.org> <53396545.805@gmail.com>
	<CAFEAcA-GL7bnZ-Pkga9PzDq7DpwPf8Gx0Wezzkm_CCbSUB1W8A@mail.gmail.com>
	<533969AB.4010505@gmail.com>
	<CAFEAcA_w=35e9dVL_Zo84MoxZqCUH9qJ76v=Pn=XQ0FZq8g_-g@mail.gmail.com>
	<53396CE9.9090405@gmail.com>
	<CAFEAcA9dk3991gc+FK0qp9QwhWkjxO0vK=X1TxS37Y1sXD5RNw@mail.gmail.com>
	<533E7DD5.3090203@gmail.com> <5340F4FD.7040305@msgid.tls.msk.ru>
	<53414941.5040908@gmail.com> <5343E4D4.6070305@gmail.com>
	<5343E516.3020103@gmail.com> <87lhv7gemz.fsf@blackfin.pond.sub.org>
	<534D1271.1000606@gmail.com>
Date: Wed, 16 Apr 2014 10:56:51 +0800
Message-ID: <CAGoGDs74ULpvVkQnjmN5a4JhrrC5RfLg-ejF7H+F8B_gFhpdPA@mail.gmail.com>
From: liang ding <jickding@gmail.com>
To: Chen Gang <gang.chen.5i5j@gmail.com>
Content-Type: multipart/alternative; boundary=089e0160c34e7ab16d04f7201158
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:4003:c02::233
X-Mailman-Approved-At: Wed, 16 Apr 2014 05:40:09 -0400
Cc: Peter Maydell <peter.maydell@linaro.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>,
	Markus Armbruster <armbru@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Anthony Liguori <aliguori@amazon.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH trivial 1/3] vl: remove
	useless 'continue'
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
X-List-Received-Date: Wed, 16 Apr 2014 02:57:01 -0000

--089e0160c34e7ab16d04f7201158
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

=E6=88=91=E6=80=8E=E6=A0=B7=E6=89=8D=E8=83=BD=E9=80=80=E8=AE=A2=E6=AD=A4=E9=
=82=AE=E4=BB=B6=E5=88=97=E8=A1=A8
How can I unsubscribe from this mailing list


2014-04-15 19:05 GMT+08:00 Chen Gang <gang.chen.5i5j@gmail.com>:

>
>
> On 04/15/2014 04:50 PM, Markus Armbruster wrote:
> > Chen Gang <gang.chen.5i5j@gmail.com> writes:
> >
> >> Normal "if (...) {...} else {...}" is enough in "while(...) {...}", no=
t
> >> need additional useless 'continue'.
> >>
> >> Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
> >> ---
> >>  vl.c |    1 -
> >>  1 file changed, 1 deletion(-)
> >>
> >> diff --git a/vl.c b/vl.c
> >> index 9975e5a..7505002 100644
> >> --- a/vl.c
> >> +++ b/vl.c
> >> @@ -3034,7 +3034,6 @@ int main(int argc, char **argv, char **envp)
> >>          if (argv[optind][0] !=3D '-') {
> >>              /* disk image */
> >>              optind++;
> >> -            continue;
> >>          } else {
> >>              const QEMUOption *popt;
> >
> > Reviewed-by: Markus Armbruster <armbru@redhat.com>
> >
>
> OK, thanks.
>
> --
> Chen Gang
>
> Open, share, and attitude like air, water, and life which God blessed
>
>

--089e0160c34e7ab16d04f7201158
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>=E6=88=91=E6=80=8E=E6=A0=B7=E6=89=8D=E8=83=BD=E9=80=
=80=E8=AE=A2=E6=AD=A4=E9=82=AE=E4=BB=B6=E5=88=97=E8=A1=A8<br></div><span st=
yle=3D"color:rgb(102,102,102);font-family:Tahoma,Arial;font-size:12px;font-=
style:normal;font-variant:normal;font-weight:normal;letter-spacing:normal;l=
ine-height:24px;text-align:justify;text-indent:0px;text-transform:none;whit=
e-space:normal;word-spacing:0px;background-color:rgba(255,255,255,0.8);disp=
lay:inline!important;float:none">How can I unsubscribe from this mailing li=
st</span></div>
<div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">2014-04-15 19=
:05 GMT+08:00 Chen Gang <span dir=3D"ltr">&lt;<a href=3D"mailto:gang.chen.5=
i5j@gmail.com" target=3D"_blank">gang.chen.5i5j@gmail.com</a>&gt;</span>:<b=
r><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">
<div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
On 04/15/2014 04:50 PM, Markus Armbruster wrote:<br>
&gt; Chen Gang &lt;<a href=3D"mailto:gang.chen.5i5j@gmail.com">gang.chen.5i=
5j@gmail.com</a>&gt; writes:<br>
&gt;<br>
&gt;&gt; Normal &quot;if (...) {...} else {...}&quot; is enough in &quot;wh=
ile(...) {...}&quot;, not<br>
&gt;&gt; need additional useless &#39;continue&#39;.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Chen Gang &lt;<a href=3D"mailto:gang.chen.5i5j@gmai=
l.com">gang.chen.5i5j@gmail.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt; =C2=A0vl.c | =C2=A0 =C2=A01 -<br>
&gt;&gt; =C2=A01 file changed, 1 deletion(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/vl.c b/vl.c<br>
&gt;&gt; index 9975e5a..7505002 100644<br>
&gt;&gt; --- a/vl.c<br>
&gt;&gt; +++ b/vl.c<br>
&gt;&gt; @@ -3034,7 +3034,6 @@ int main(int argc, char **argv, char **envp)=
<br>
&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (argv[optind][0] !=3D &#39;-&=
#39;) {<br>
&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* disk image */<b=
r>
&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0optind++;<br>
&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;<br>
&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const QEMUOption *=
popt;<br>
&gt;<br>
&gt; Reviewed-by: Markus Armbruster &lt;<a href=3D"mailto:armbru@redhat.com=
">armbru@redhat.com</a>&gt;<br>
&gt;<br>
<br>
</div></div>OK, thanks.<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
--<br>
Chen Gang<br>
<br>
Open, share, and attitude like air, water, and life which God blessed<br>
<br>
</div></div></blockquote></div><br></div>

--089e0160c34e7ab16d04f7201158--

