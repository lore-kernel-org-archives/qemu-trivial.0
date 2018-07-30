Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fk6ZC-0005v1-Hc
	for mharc-qemu-trivial@gnu.org; Mon, 30 Jul 2018 07:42:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47650)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjc@sifive.com>) id 1fk6Z9-0005tC-Og
	for qemu-trivial@nongnu.org; Mon, 30 Jul 2018 07:42:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjc@sifive.com>) id 1fk6Z8-0001Pe-1G
	for qemu-trivial@nongnu.org; Mon, 30 Jul 2018 07:42:19 -0400
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:42478)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <mjc@sifive.com>) id 1fk6Z7-0001PS-ND
	for qemu-trivial@nongnu.org; Mon, 30 Jul 2018 07:42:17 -0400
Received: by mail-oi0-x243.google.com with SMTP id n84-v6so20595112oib.9
	for <qemu-trivial@nongnu.org>; Mon, 30 Jul 2018 04:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=V4Bsrmf5jnj3is/EKSLXN3QYQUFukg4wKEgfC3Leivo=;
	b=lfLUMcm/MvRWtRJENAr4kUk+QKOrQoqITkH9hPCvqI8h9n2SUhmIzGXNbSf4S+4suK
	C9ImjTOREAqKK16Us7LMg3fTpQ9gRI1+Y/+OIgasPmQMxSijiOXgkTy3OG7rkL87QFp2
	VK3AtWvTE7NNIWpI76MIEXjiLT+Zoj/elaRH2AKqINPsbt51RGwOIR8kAHtJsgeBD+qo
	E7DxuA0ww832UYiVNeg2Yi6c3XAXIgFeq1OQe0keZnNhUDY+Vy5eFsidIMKm6mrDbRjH
	wimBBy5vQmML9dL3JKQFDiUMX/u3kYQOIQRGJH2hPMt4aLQRoapFBNpgPNc8+x3w/szb
	FEEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=V4Bsrmf5jnj3is/EKSLXN3QYQUFukg4wKEgfC3Leivo=;
	b=iwefbPY24dJbRdoaytKJL1xa7f3YpAZAtJ7on5i7y43mVo1TMkaf1nvoDXDyFeXeKz
	+nRdYfc4z4IEew0Ew9e5QH5frkwjE22jF4DBhBjFx9DIAz7STV4HsPnzDkPzVv71bXBM
	v7cZLGyOvg1HKmgjdeJ4d7QIu8hcWQEsuakCpQPeoazxZEqA71V+PMmW+03c668M0Jb+
	EUoaKsQceT5iJmI/pt1wcoJNQ7j6x/+kSQ8ydi+bFlLiSZHF/oEHDth78IGMg5P6EU22
	7qJA7oYCxRFsiU/NY0N1ZmII5uxG53/jciFslSk7w4i0pj+Z4gj2CTqpH6Nd6cGbwHWu
	bfmw==
X-Gm-Message-State: AOUpUlEVLWd2rdm9bvtiao+fvomXiCWlGUGbS82okmLYfK6P06byak72
	tnledaoaLva3exjPPZ9DveLuCxUtazfOhDnzYvEjKA==
X-Google-Smtp-Source: AAOMgpclegZPgShdBV7ggasZJNkgHmULxuTu4I+xMfkFbkI26GtU5xtOemfyuj6xvSpsNXJgabb9Ydx6p11Gs2F8ioc=
X-Received: by 2002:aca:90d:: with SMTP id 13-v6mr6492552oij.300.1532950936762;
	Mon, 30 Jul 2018 04:42:16 -0700 (PDT)
MIME-Version: 1.0
References: <1527229488-49822-1-git-send-email-mjc@sifive.com>
	<83728e91-de69-c376-a768-0aad501ff64e@twiddle.net>
	<CAFEAcA-hOTPOfW7ruRsSYt32Ahu707iMJtXdXkUREpLyHdFwJQ@mail.gmail.com>
In-Reply-To: <CAFEAcA-hOTPOfW7ruRsSYt32Ahu707iMJtXdXkUREpLyHdFwJQ@mail.gmail.com>
From: Michael Clark <mjc@sifive.com>
Date: Mon, 30 Jul 2018 23:42:06 +1200
Message-ID: <CAHNT7NsJnejaweD24bFR9BEZyJ+yiyabX6a9F3cmGBhqXp5Z=A@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	RISC-V Patches <patches@groups.riscv.org>,
	Richard Henderson <rth@twiddle.net>
Content-Type: multipart/alternative; boundary="0000000000000b526e057235f403"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] RISC-V: Correct typo in
 RV32 perf counters
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
X-List-Received-Date: Mon, 30 Jul 2018 11:42:21 -0000

--0000000000000b526e057235f403
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 30 Jul 2018 at 10:46 PM, Peter Maydell <peter.maydell@linaro.org>
wrote:

> On 25 May 2018 at 14:17, Richard Henderson <rth@twiddle.net> wrote:
> > On 05/24/2018 11:24 PM, Michael Clark wrote:
> >> This patch enables mhpmcounter3h through mhpmcounter31h on RV32.
> >> Previously the RV32 h versions (high 32-bits of 64-bit counters)
> >> of these counters would trap with an illegal instruction instead
> >> of returning 0 as intended.
> >>
> >> Reported-by: Richard Henderson <rth@twiddle.net>
> >> Signed-off-by: Michael Clark <mjc@sifive.com>
> >> ---
> >>  target/riscv/op_helper.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > Fixes: Coverity CID 1390849
> > Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
> Ping -- Coverity is still complaining about this -- did this
> patch get lost?


Sort of. I assumed it would go into a trivial queue.

Feel free to apply, however it=E2=80=99s going to create (another) rebase c=
onflict
against my =E2=80=98for-upstream=E2=80=99 queue as this code has gone away,=
 hence it is not
in my queue.

The bug is fixed in my tree in an alternate way as we have overhauled the
CSR system to support atomic read/modify/write CSRs, and the new code is
table driven versus using jumbo switch statements.

When we transcribed this code to the new CSR system the bug disappeared as
a consequence of the  nature of the new mechanism which matches the table
listings in the RISC-V Privileged ISA manual which makes this type of bug
much more obvious:

https://github.com/riscv/riscv-qemu/blob/qemu-for-upstream/target/riscv/csr=
.c#L912-L919

My tree is up-to-date as of 3.0-rc2, and has been rebased against
Alistair=E2=80=99s changes but I have a feeling we are still missing review=
s.

We also have additional CSR fixes (such as vectored interrupts) that depend
on the context of the new CSR system and we don=E2=80=99t have enough bandw=
idth to
maintain a backport to the old code in upstream QEMU.

I guess it is problematic going via my tree as last time I looked we didn=
=E2=80=99t
have enough reviews.

I can include this change in my pull for 3.1, along with the patches in my
tree that have Reviewed-by and fix the rebase conflicts for anything that
depends on new context (hopefully not creating new bugs during that
process).

I haven=E2=80=99t reposted the code that has not been reviewed as I=E2=80=
=99ll do that when
I have a chance to reorder and split my queue based on what has been
reviewed and what hasn=E2=80=99t.

I=E2=80=99ve deferred that because i=E2=80=99m still working on new code th=
at will be
shipping from the SiFive tree (for which i=E2=80=99m currently writing test=
 cases
for).

Michael.

--0000000000000b526e057235f403
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Mon,=
 30 Jul 2018 at 10:46 PM, Peter Maydell &lt;<a href=3D"mailto:peter.maydell=
@linaro.org">peter.maydell@linaro.org</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex">On 25 May 2018 at 14:17, Richard Henderson &lt;<a href=3D=
"mailto:rth@twiddle.net" target=3D"_blank">rth@twiddle.net</a>&gt; wrote:<b=
r>
&gt; On 05/24/2018 11:24 PM, Michael Clark wrote:<br>
&gt;&gt; This patch enables mhpmcounter3h through mhpmcounter31h on RV32.<b=
r>
&gt;&gt; Previously the RV32 h versions (high 32-bits of 64-bit counters)<b=
r>
&gt;&gt; of these counters would trap with an illegal instruction instead<b=
r>
&gt;&gt; of returning 0 as intended.<br>
&gt;&gt;<br>
&gt;&gt; Reported-by: Richard Henderson &lt;<a href=3D"mailto:rth@twiddle.n=
et" target=3D"_blank">rth@twiddle.net</a>&gt;<br>
&gt;&gt; Signed-off-by: Michael Clark &lt;<a href=3D"mailto:mjc@sifive.com"=
 target=3D"_blank">mjc@sifive.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 target/riscv/op_helper.c | 2 +-<br>
&gt;&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;<br>
&gt; Fixes: Coverity CID 1390849<br>
&gt; Reviewed-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson=
@linaro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
<br>
Ping -- Coverity is still complaining about this -- did this<br>
patch get lost?</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">S=
ort of. I assumed it would go into a trivial queue.</div><div dir=3D"auto">=
<br></div><div dir=3D"auto">Feel free to apply, however it=E2=80=99s going =
to create (another) rebase conflict against my =E2=80=98for-upstream=E2=80=
=99 queue as this code has gone away, hence it is not in my queue.</div><di=
v dir=3D"auto"><br></div><div dir=3D"auto">The bug is fixed in my tree in a=
n alternate way as we have overhauled the CSR system to support atomic read=
/modify/write CSRs, and the new code is table driven versus using jumbo swi=
tch statements.</div><div dir=3D"auto"><br></div><div dir=3D"auto">When we =
transcribed this code to the new CSR system the bug disappeared as a conseq=
uence of the =C2=A0nature of the new mechanism which matches the table list=
ings in the RISC-V Privileged ISA manual which makes this type of bug much =
more obvious:</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div><a hr=
ef=3D"https://github.com/riscv/riscv-qemu/blob/qemu-for-upstream/target/ris=
cv/csr.c#L912-L919">https://github.com/riscv/riscv-qemu/blob/qemu-for-upstr=
eam/target/riscv/csr.c#L912-L919</a></div><div dir=3D"auto"><br></div><div =
dir=3D"auto">My tree is up-to-date as of 3.0-rc2, and has been rebased agai=
nst Alistair=E2=80=99s changes but I have a feeling we are still missing re=
views.</div><div dir=3D"auto"><br></div><div dir=3D"auto">We also have addi=
tional CSR fixes (such as vectored interrupts) that depend on the context o=
f the new CSR system and we don=E2=80=99t have enough bandwidth to maintain=
 a backport to the old code in upstream QEMU.</div><div dir=3D"auto"><br></=
div><div dir=3D"auto">I guess it is problematic going via my tree as last t=
ime I looked we didn=E2=80=99t have enough reviews.</div><div dir=3D"auto">=
<br></div><div dir=3D"auto">I can include this change in my pull for 3.1, a=
long with the patches in my tree that have Reviewed-by and fix the rebase c=
onflicts for anything that depends on new context (hopefully not creating n=
ew bugs during that process).</div><div dir=3D"auto"><br></div><div dir=3D"=
auto">I haven=E2=80=99t reposted the code that has not been reviewed as I=
=E2=80=99ll do that when I have a chance to reorder and split my queue base=
d on what has been reviewed and what hasn=E2=80=99t.=C2=A0</div><div dir=3D=
"auto"><br></div><div dir=3D"auto">I=E2=80=99ve deferred that because i=E2=
=80=99m still working on new code that will be shipping from the SiFive tre=
e (for which i=E2=80=99m currently writing test cases for).</div><div dir=
=3D"auto"><br></div></div><div dir=3D"auto">Michael.</div></div></div>

--0000000000000b526e057235f403--

