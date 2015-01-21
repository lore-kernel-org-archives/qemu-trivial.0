Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YDkNt-00009b-VJ
	for mharc-qemu-trivial@gnu.org; Tue, 20 Jan 2015 20:47:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51800)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1YDkNq-00005b-Qn
	for qemu-trivial@nongnu.org; Tue, 20 Jan 2015 20:47:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1YDkNp-0001RM-Kz
	for qemu-trivial@nongnu.org; Tue, 20 Jan 2015 20:47:02 -0500
Received: from mail-la0-x230.google.com ([2a00:1450:4010:c03::230]:60691)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>)
	id 1YDkNn-0001PC-Bz; Tue, 20 Jan 2015 20:46:59 -0500
Received: by mail-la0-f48.google.com with SMTP id gf13so37589181lab.7;
	Tue, 20 Jan 2015 17:46:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=r420NS2zb8LZyWoDn6o1Q3f/xKI5ws46CpCEZ6tAVus=;
	b=TCt6mFJTeYR3/USWM41M7xxs1fZKJCMPiUC99rdV6bQiIuLEg/nSzzkJGgBEp6Ot0b
	rdvbW1AdhcoV1H3z2EXPLfetbfDw0Xk+X6cHad8srCkWIzbKHVbQFfXe52c2LTFZDm0H
	g2NGpryGQx8qw/sXNc8ocmIM4ZqQeOfZHS3dAKRinJjJuQZzsGRGLsG3HIgsCIO0syLN
	PLb3r1BI5BIFDjcwllu9dk2FVHr9S7r6pqRQU39DHYjY67TXT1Be8RZqmbyY9kI8tFsZ
	PmkRcTImBlhceBhOh6qzwAfBELdaPWh5dcS+ejr19dmzdGO8XiKYmWtW3UxyaSWsG21r
	AshA==
MIME-Version: 1.0
X-Received: by 10.112.25.7 with SMTP id y7mr41232737lbf.94.1421804817240; Tue,
	20 Jan 2015 17:46:57 -0800 (PST)
Received: by 10.25.9.213 with HTTP; Tue, 20 Jan 2015 17:46:57 -0800 (PST)
In-Reply-To: <CAFEAcA9a3msdQYp_2VTYdzT5JGmPtReLMYxtEuFGB=HqsaAxRw@mail.gmail.com>
References: <54BD23F7.7010700@gmail.com>
	<CAFEAcA9a3msdQYp_2VTYdzT5JGmPtReLMYxtEuFGB=HqsaAxRw@mail.gmail.com>
Date: Wed, 21 Jan 2015 09:46:57 +0800
Message-ID: <CAMCqw8JDF4BamxKvNahWHJ-ZAzv8Hv9B80GdTwnD8tKJ2gmyvg@mail.gmail.com>
From: Gang Chen <gang.chen.5i5j@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary=001a11c3f1a612578a050d1fbb07
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4010:c03::230
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
	Alexander Graf <agraf@suse.de>, "rth@twiddle.net" <rth@twiddle.net>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] tcg: Use macro instead of
 hard code number 0xffffffff for tcg_target_ulong using
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
X-List-Received-Date: Wed, 21 Jan 2015 01:47:04 -0000

--001a11c3f1a612578a050d1fbb07
Content-Type: text/plain; charset=UTF-8

It is not for fixing bugs. I guess it belongs to trivial patch (not fix
bugs, not changing any working flow).

And excuse me, gmail is broken again, in China, I have to reply on web site
via my Mac book Safari (which is not a pure text).

On Mon, Jan 19, 2015 at 11:58 PM, Peter Maydell <peter.maydell@linaro.org>
wrote:

> On 19 January 2015 at 15:34, Chen Gang <gang.chen.5i5j@gmail.com> wrote:
> > For tcg_target_ulong (include TCGArg), it often uses lower 32-bit mask
> > and higher 32-bit mask, so define the related macro for it, so can let
> > code simpler, and avoid various coding styles for them.
> >
> >  - For lower, some append 'u', some append 'U', and some no 'u' or 'U'.
> >
> >  - For higher, some append 'ull', some use type cast.
> >
> >  - For lower but may be used higher bits, append 'ull'.
>
> Is this patch fixing any actual bugs? I think code-style-wise
> I prefer what we have at the moment...
>
> -- PMM
>



-- 
Chen Gang

--001a11c3f1a612578a050d1fbb07
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">It is not for fixing bugs. I guess it belongs to trivial p=
atch (not fix bugs, not changing any working flow).<div><br></div><div>And =
excuse me, gmail is broken again, in China, I have to reply on web site via=
 my Mac book Safari (which is not a pure text).</div></div><div class=3D"gm=
ail_extra"><br><div class=3D"gmail_quote">On Mon, Jan 19, 2015 at 11:58 PM,=
 Peter Maydell <span dir=3D"ltr">&lt;<a href=3D"mailto:peter.maydell@linaro=
.org" target=3D"_blank">peter.maydell@linaro.org</a>&gt;</span> wrote:<br><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex"><span class=3D"">On 19 January 2015 at 15:34,=
 Chen Gang &lt;<a href=3D"mailto:gang.chen.5i5j@gmail.com">gang.chen.5i5j@g=
mail.com</a>&gt; wrote:<br>
&gt; For tcg_target_ulong (include TCGArg), it often uses lower 32-bit mask=
<br>
&gt; and higher 32-bit mask, so define the related macro for it, so can let=
<br>
&gt; code simpler, and avoid various coding styles for them.<br>
&gt;<br>
&gt;=C2=A0 - For lower, some append &#39;u&#39;, some append &#39;U&#39;, a=
nd some no &#39;u&#39; or &#39;U&#39;.<br>
&gt;<br>
&gt;=C2=A0 - For higher, some append &#39;ull&#39;, some use type cast.<br>
&gt;<br>
&gt;=C2=A0 - For lower but may be used higher bits, append &#39;ull&#39;.<b=
r>
<br>
</span>Is this patch fixing any actual bugs? I think code-style-wise<br>
I prefer what we have at the moment...<br>
<br>
-- PMM<br>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div class=
=3D"gmail_signature"><div dir=3D"ltr">Chen Gang<br></div></div>
</div>

--001a11c3f1a612578a050d1fbb07--

