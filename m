Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XKjfU-0006rD-QX
	for mharc-qemu-trivial@gnu.org; Fri, 22 Aug 2014 03:53:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55148)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jmattsson@dius.com.au>) id 1XKjfN-0006nJ-MM
	for qemu-trivial@nongnu.org; Fri, 22 Aug 2014 03:53:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jmattsson@dius.com.au>) id 1XKjfB-0000of-Bs
	for qemu-trivial@nongnu.org; Fri, 22 Aug 2014 03:53:45 -0400
Received: from mail-oa0-f44.google.com ([209.85.219.44]:46579)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jmattsson@dius.com.au>) id 1XKjfB-0000oL-73
	for qemu-trivial@nongnu.org; Fri, 22 Aug 2014 03:53:33 -0400
Received: by mail-oa0-f44.google.com with SMTP id eb12so8413859oac.3
	for <qemu-trivial@nongnu.org>; Fri, 22 Aug 2014 00:53:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=NJYRL2OIVswn0VydZ9wk9amk6ewTrkrDpWsDqeVWits=;
	b=OOn0ixDHIyDj67vQxHLLinbT/FsC3KjBmt5D5TB3xD0nJlJ6lNiQxsg2Ztu7io3JwJ
	5elhE9YJ4QQYeQr6AOt0N3MOKhX3in/B92HmVkgzJthHnxO+N3p9V3r7BT4eDklPAFNV
	budNpjF3wFkeQ1pUb3RIY5oz/ogdZL+iu2gKO7Qt6UNHxb2rzhDFF4Iv7IdwCvtn9GqJ
	cC5zhfxCqUEL9sRZ1N8SHY5FIKA7Ufc59kLUHP8tyqNgauYuGhb0Jpgk1siLdXhJmnto
	luQAjA4Qa10tOUYzWSLAZgkRxTlLzWzQVg0P6q1mmyLytfs4jl/w1NLyg8ERn6vYOQvw
	Qwrg==
X-Gm-Message-State: ALoCoQmVt1qEoUGqI1niaSljg+LNT66wfLdhkYzLV791HJJ7P8oAUK6a24/JLLTps+2dpPjcBo22
MIME-Version: 1.0
X-Received: by 10.182.197.165 with SMTP id iv5mr3348740obc.55.1408694011860;
	Fri, 22 Aug 2014 00:53:31 -0700 (PDT)
Received: by 10.182.93.240 with HTTP; Fri, 22 Aug 2014 00:53:31 -0700 (PDT)
In-Reply-To: <87egwab2cn.fsf@blackfin.pond.sub.org>
References: <CACTyEaOFhLnoA5TDHGkDpxpP+TxVKyuTT9AL+q8Y1kaa+wxE5A@mail.gmail.com>
	<87egwab2cn.fsf@blackfin.pond.sub.org>
Date: Fri, 22 Aug 2014 17:53:31 +1000
Message-ID: <CACTyEaMmNrNvOC7zs_=piuea6jWBLzvVVwADRHJpx2x-a7y1Eg@mail.gmail.com>
From: Johny Mattsson <jmattsson@dius.com.au>
To: Markus Armbruster <armbru@redhat.com>
Content-Type: multipart/alternative; boundary=001a1134a82e2cfe7b050133226e
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.219.44
Cc: qemu-trivial@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Fix pflash_cfi01 to restore
 flash command/array state after migration
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
X-List-Received-Date: Fri, 22 Aug 2014 07:53:51 -0000

--001a1134a82e2cfe7b050133226e
Content-Type: text/plain; charset=UTF-8

On 21 August 2014 19:48, Markus Armbruster <armbru@redhat.com> wrote:
>
> Doesn't this break migration to/from unfixed versions?
>

It might. It is not something we've tried here, and I'm certainly not
familiar enough with QEMU internals myself to say one way or another. We
encountered this issue in what I can best describe as a short-and-furious
proof-of-concept project, and as part of the wrapping up of this I'm going
over our change logs to see if anything can be contributed back upstream.
It seemed like a trivial fix in the tree, but I acknowledge it may have
ramifications we didn't consider.


I suspect you need a subsection.  Initialize ->romd = 1, then let the
> subsection override it.
>

And here I'm well and truly out of my depth! If someone who actually knows
what they're doing would like to run with this, please do.

Sorry to effectively do a dump-and-run here - I hope its a net positive at
least.

Regards,
/Johny
-- 
Johny Mattsson
Senior Software Engineer

DiUS Computing Pty. Ltd.

*where ideas are engineered *

--001a1134a82e2cfe7b050133226e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On 21 August 2014 19:48, Markus Armbruster <span=
 dir=3D"ltr">&lt;<a href=3D"mailto:armbru@redhat.com" target=3D"_blank">arm=
bru@redhat.com</a>&gt;</span> wrote:<blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<div><div>Doesn&#39;t this break migration to/from unfixed versions?<br></d=
iv></div></blockquote><div><br>It might. It is not something we&#39;ve trie=
d here, and I&#39;m certainly not familiar enough with QEMU internals mysel=
f to say one way or another. We encountered this issue in what I can best d=
escribe as a short-and-furious proof-of-concept project, and as part of the=
 wrapping up of this I&#39;m going over our change logs to see if anything =
can be contributed back upstream. It seemed like a trivial fix in the tree,=
 but I acknowledge it may have ramifications we didn&#39;t consider.<br>

<br>
<br>
</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex">I suspect you need a subsection.=C2=A0=
 Initialize -&gt;romd =3D 1, then let the<br>
subsection override it.<br>
</blockquote></div><br>And here I&#39;m well and truly out of my depth! If =
someone who actually knows what they&#39;re doing would like to run with th=
is, please do.<br><br>Sorry to effectively do a dump-and-run here - I hope =
its a net positive at least.<br>
<br clear=3D"all">Regards,<br>/Johny<br>-- <br><font size=3D"1"><font><span=
 style=3D"font-size:9pt"><span style=3D"color:rgb(153,153,153)">Johny Matts=
son</span><br style=3D"color:rgb(153,153,153)">
<span style=3D"color:rgb(153,153,153)">Senior Software Engineer</span><br s=
tyle=3D"color:rgb(153,153,153)"><br style=3D"color:rgb(153,153,153)"><span =
style=3D"color:rgb(153,153,153)">
DiUS Computing Pty. Ltd.</span><br style=3D"color:rgb(153,153,153)"><span s=
tyle=3D"color:rgb(153,153,153)">
</span><i><span style=3D"color:rgb(153,153,153)">where ideas are engineered=
</span><br>
</i></span></font></font>

--001a1134a82e2cfe7b050133226e--

