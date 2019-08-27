Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i2jpN-00041v-RC
	for mharc-qemu-trivial@gnu.org; Tue, 27 Aug 2019 18:20:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41782)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1i2jpL-0003zT-9r
 for qemu-trivial@nongnu.org; Tue, 27 Aug 2019 18:20:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1i2jpJ-00030A-Iv
 for qemu-trivial@nongnu.org; Tue, 27 Aug 2019 18:20:35 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:34175)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <aleksandar.m.mail@gmail.com>)
 id 1i2jpG-0002x7-Bg; Tue, 27 Aug 2019 18:20:30 -0400
Received: by mail-oi1-x242.google.com with SMTP id g128so552660oib.1;
 Tue, 27 Aug 2019 15:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=Ke4EP9pzyAaS8AnFudlXUGsTk9WqfGLF8sxTfnGtLQY=;
 b=f+v1F3bJDFk70UXZ5fQSofgrDNRWeAhJUcKeIxeRALX/MVsTZFynnyRxSvXgQdjhgg
 cvGEjuX+7mramp6Tpk3DvE8gIjwgJ6G/MQ2pA+IyAyYmhD0+GOrXYCsX0WbOMKARJPTo
 TbNJzX1w2hleZ75Ok4z0ksIv9sW5wqzUJYTXS2Eq5GVGUB4SvvKNMwdLUysOZUO5UoNG
 MHbK6lubADNY+HsqYX0V30HQYtWXj27iPl+CX3c6DLFODX8BSy0sEYQCjMEdgZC4PhAS
 ftl01//PbeBF2sggQEeBohD/7JJ7TjfD1kgsHdhA6jPRa0mCPj7ejyGoQkfjn7JRhsaz
 b0mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=Ke4EP9pzyAaS8AnFudlXUGsTk9WqfGLF8sxTfnGtLQY=;
 b=sv5Hqeode7XxqbPxlOOm6NrssqIvTI/xV8LOF1aoSeM9IEIJIu1LR9YdV/q74Rev9I
 wnSC6I3YL3QMa+vaj8eO4APR4CiY3Pehwp5YcxHSwCR1V2xkSk08jvNDHokOUFuZaBfz
 i8jm1onVCGFk6bikbJSATsbjIYZUJ4WAAYekx9VOlUZbLMbI9hisNOUTU9cyPRsblkAR
 edhSCYENXtNAFtZ6/+iq74OV9p7ydllKQl0nkVmwjd/TejNGL1KTA5YFtwR8Dqf1f8hB
 lsF53oR5/cuyoZ8hXnA3GJtOMDerMlX8x/FrmMLeB7jSn/U6RPEOSKzktcLkuAh1DQ+9
 wkHQ==
X-Gm-Message-State: APjAAAVTkbQpSob3s0Z0u3o/Xdx6DaiSEE58E3YNcZlF3RdgwX9cuaXU
 u//0oWMjqlPBXRfsQvRtUC5UMtG+Dj1v1aNHCKc=
X-Google-Smtp-Source: APXvYqzyFJf18MEOkp2CaVHUmose8TZKd143xiq0yy7hsei9rVza/k8hQ0QjPPCa0l8NR9PCMlBYk5mQfN7MUZlogHo=
X-Received: by 2002:a05:6808:198:: with SMTP id
 w24mr677859oic.53.1566944428409; 
 Tue, 27 Aug 2019 15:20:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6830:10d7:0:0:0:0 with HTTP; Tue, 27 Aug 2019 15:20:27
 -0700 (PDT)
Received: by 2002:a05:6830:10d7:0:0:0:0 with HTTP; Tue, 27 Aug 2019 15:20:27
 -0700 (PDT)
In-Reply-To: <fdba9c20-3ffb-7862-51c5-f78852b68238@codesourcery.com>
References: <1550008033-26540-1-git-send-email-sandra@codesourcery.com>
 <CAFEAcA8eFexmymsaur-DtgYdKcyJB0ia7dW_vp358hbySsyBDw@mail.gmail.com>
 <fdba9c20-3ffb-7862-51c5-f78852b68238@codesourcery.com>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Wed, 28 Aug 2019 00:20:27 +0200
Message-ID: <CAL1e-=iyYCiCP-kMhyvL_CUpsQQ7gKi5CjS1XivAzj55qTxpGA@mail.gmail.com>
To: Sandra Loosemore <sandra@codesourcery.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, 
 QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: multipart/alternative; boundary="00000000000009cdbb059120aef7"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] gdbstub: Send a reply to
 the vKill packet.
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
X-List-Received-Date: Tue, 27 Aug 2019 22:20:36 -0000

--00000000000009cdbb059120aef7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

14.02.2019. 19.27, "Sandra Loosemore" <sandra@codesourcery.com> =D1=98=D0=
=B5
=D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BE/=D0=BB=D0=B0:
>
> On 2/14/19 10:48 AM, Peter Maydell wrote:
>>
>> On Tue, 12 Feb 2019 at 21:52, Sandra Loosemore <sandra@codesourcery.com>
wrote:
>>>
>>>
>>> Per the GDB remote protocol documentation
>>>
>>>
https://sourceware.org/gdb/current/onlinedocs/gdb/Packets.html#index-vKill-=
packet
>>>
>>> the debug stub is expected to send a reply to the 'vKill' packet.  At
>>> least some versions of GDB crash if the gdb stub simply exits without
>>> sending a reply.  This patch fixes QEMU's gdb stub to conform to the
>>> expected behavior.
>>>
>>> Note that QEMU's existing handling of the legacy 'k' packet is
>>> correct: in that case GDB does not expect a reply, and QEMU does not
>>> send one.
>>>
>>> Signed-off-by: Sandra Loosemore <sandra@codesourcery.com>
>>
>>
>> Thanks, applied to target-arm.next.
>>
>> As an aside, do you know if there is any kind of test suite for
>> the remote protocol that implementors of a debug stub can use to
>> check that they're conforming to it?
>
>
> Well, I discovered this problem by running the GDB testsuite (using QEMU
for nios2-elf target with the other target-specific patches I recently
posted).  I'm not sure if it's designed to exhaustively test the entire
remote protocol, but it does a pretty good job of covering user-visible GDB
features that depend on the remote target doing something reasonable, even
if it's just saying "Huh?  I don't know how to do that."  :-)
>

Debugging using gdb/qemu setups is fairly frequent use case and perhaps we
should have a test module for interoperability of gdb and qemu, and also
"make check-gdb".

Thanks for pinpointing and fixing bugs in this area, Sandra!

Aleksandar

> -Sandra
>

--00000000000009cdbb059120aef7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
14.02.2019. 19.27, &quot;Sandra Loosemore&quot; &lt;<a href=3D"mailto:sandr=
a@codesourcery.com">sandra@codesourcery.com</a>&gt; =D1=98=D0=B5 =D0=BD=D0=
=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BE/=D0=BB=D0=B0:<br>
&gt;<br>
&gt; On 2/14/19 10:48 AM, Peter Maydell wrote:<br>
&gt;&gt;<br>
&gt;&gt; On Tue, 12 Feb 2019 at 21:52, Sandra Loosemore &lt;<a href=3D"mail=
to:sandra@codesourcery.com">sandra@codesourcery.com</a>&gt; wrote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Per the GDB remote protocol documentation<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; <a href=3D"https://sourceware.org/gdb/current/onlinedocs/gdb/P=
ackets.html#index-vKill-packet">https://sourceware.org/gdb/current/onlinedo=
cs/gdb/Packets.html#index-vKill-packet</a><br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; the debug stub is expected to send a reply to the &#39;vKill&#=
39; packet.=C2=A0 At<br>
&gt;&gt;&gt; least some versions of GDB crash if the gdb stub simply exits =
without<br>
&gt;&gt;&gt; sending a reply.=C2=A0 This patch fixes QEMU&#39;s gdb stub to=
 conform to the<br>
&gt;&gt;&gt; expected behavior.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Note that QEMU&#39;s existing handling of the legacy &#39;k&#3=
9; packet is<br>
&gt;&gt;&gt; correct: in that case GDB does not expect a reply, and QEMU do=
es not<br>
&gt;&gt;&gt; send one.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Signed-off-by: Sandra Loosemore &lt;<a href=3D"mailto:sandra@c=
odesourcery.com">sandra@codesourcery.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Thanks, applied to target-arm.next.<br>
&gt;&gt;<br>
&gt;&gt; As an aside, do you know if there is any kind of test suite for<br=
>
&gt;&gt; the remote protocol that implementors of a debug stub can use to<b=
r>
&gt;&gt; check that they&#39;re conforming to it?<br>
&gt;<br>
&gt;<br>
&gt; Well, I discovered this problem by running the GDB testsuite (using QE=
MU for nios2-elf target with the other target-specific patches I recently p=
osted).=C2=A0 I&#39;m not sure if it&#39;s designed to exhaustively test th=
e entire remote protocol, but it does a pretty good job of covering user-vi=
sible GDB features that depend on the remote target doing something reasona=
ble, even if it&#39;s just saying &quot;Huh?=C2=A0 I don&#39;t know how to =
do that.&quot;=C2=A0 :-)<br>
&gt;</p>
<p dir=3D"ltr">Debugging using gdb/qemu setups is fairly frequent use case =
and perhaps we should have a test module for interoperability of gdb and qe=
mu, and also &quot;make check-gdb&quot;.</p>
<p dir=3D"ltr">Thanks for pinpointing and fixing bugs in this area, Sandra!=
</p>
<p dir=3D"ltr">Aleksandar</p>
<p dir=3D"ltr">&gt; -Sandra<br>
&gt;<br>
</p>

--00000000000009cdbb059120aef7--

