Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i5ELX-0004Nt-Jy
	for mharc-qemu-trivial@gnu.org; Tue, 03 Sep 2019 15:20:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39575)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jkz@google.com>) id 1i5ELU-0004Mt-6x
 for qemu-trivial@nongnu.org; Tue, 03 Sep 2019 15:20:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jkz@google.com>) id 1i5ELR-0006nK-JH
 for qemu-trivial@nongnu.org; Tue, 03 Sep 2019 15:20:03 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:45093)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <jkz@google.com>) id 1i5ELR-0006km-6N
 for qemu-trivial@nongnu.org; Tue, 03 Sep 2019 15:20:01 -0400
Received: by mail-pg1-x541.google.com with SMTP id 4so6142230pgm.12
 for <qemu-trivial@nongnu.org>; Tue, 03 Sep 2019 12:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sysw8fLW7DDzf8fLwB6YRF/GnYmMtVevh6+tL8Ke2hk=;
 b=IhIPxQCFuTu9piGLEgLUeCWr2Ef77yvGAdeATb3j3RLDDEHTStO2/wqqGZxWfcVh+o
 GmvIw25fQSLDqj6wdvb5tnguEStLa8UB+GZgaMSUg23AsgmnScjckw8X5MU0CNhO985H
 Cpycw3zTkSZ0S9ZyDESFMzfUmjVQsjn5yVoUM5IhXEp3J0Dm4Ew6kwJa5Zy43nE9h+Le
 HSUMLPZiDtT6FgE3HINYo2E/Twf1p9dxoP+N0aZ5ncoBy1b3+jxTV6eWhGEsJsnEQeJ9
 7kNiDg8Aeqi59Ov0BUnoHdOQ5e3f/Ak4P4AoOOFBzmamNLk/i2z+gxOdvCrQ+byWt7Ly
 kXlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sysw8fLW7DDzf8fLwB6YRF/GnYmMtVevh6+tL8Ke2hk=;
 b=gMj/KTV8MEsiW0fw7WlBsZR5EdI2UEihaDywWLoABufq9IsLQ4Id8wrRvMz+brthy4
 tp+u5BEGs+DADFtgXPYP8AVFMREcR1JrV96vfYvMZlCVZ7ziMv3rRimKZA/Jef4cBg5J
 eoLqNat+9ExBRLmaYXecK3W7ZgZmqcOa40HcyJ2C/jkst5R0mAJmkZJ0kpMO0ba3mvSz
 BwQIJnPT4EFQXi7Eu3fXxnykUls+oDA365eSqoKg21dvOzYMmuC3pduu85dShuLuf4PE
 C+FiA8nQTCjkshuxrwIH25z2gXlh4HfAu0YU8CtztFD7+v0GFArmWUZRCVl+WImyCqlx
 Cipw==
X-Gm-Message-State: APjAAAXODuEMjFauzQwwxlvC6IQ1z39w+ySrfynmNaNGGotFPSh1zu1h
 G/H2+OdNPaKgh306UjkNdH6jh7kyKsDmXZ9r4lH7Fw==
X-Google-Smtp-Source: APXvYqwIA3pjt0E5ISpUXzGewIHPzUDf9yvXQ157wIlrjVeGAuGMxltCDPnzPUCsxXX6uREPjTBDSkugwprkDr5OGFg=
X-Received: by 2002:a65:6795:: with SMTP id e21mr21181374pgr.428.1567538396921; 
 Tue, 03 Sep 2019 12:19:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190816233422.16715-1-jkz@google.com>
 <5b4df64c-40e4-70cd-753e-f52e2b547c18@vivier.eu>
In-Reply-To: <5b4df64c-40e4-70cd-753e-f52e2b547c18@vivier.eu>
From: Josh Kunz <jkz@google.com>
Date: Tue, 3 Sep 2019 12:19:45 -0700
Message-ID: <CADgy-2tzD0FVXbKtadSL1JuMWW_TEzFP2ZD0hzA4PUnxh1Xz0g@mail.gmail.com>
To: Laurent Vivier <laurent@vivier.eu>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, 
 Riku Voipio <riku.voipio@iki.fi>
Content-Type: multipart/alternative; boundary="0000000000005261ed0591aaf9da"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::541
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] linux-user: Support gdb
 'qOffsets' query for ELF
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
X-List-Received-Date: Tue, 03 Sep 2019 19:20:05 -0000

--0000000000005261ed0591aaf9da
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The `Data` and `Code` flags in `qOffsets` are actually section offsets
rather than segment offsets. GDB relocates the symbols in those sections
relative to their location in the binary. So we have to use `load_bias`.

See here for a more detailed description:
https://sourceware.org/gdb/onlinedocs/gdb/General-Query-Packets.html#Genera=
l-Query-Packets

On Mon, Aug 26, 2019 at 1:29 AM Laurent Vivier <laurent@vivier.eu> wrote:

> Le 17/08/2019 =C3=A0 01:34, Josh Kunz via Qemu-devel a =C3=A9crit :
> > This is needed to support debugging PIE ELF binaries running under QEMU
> > user mode. Currently, `code_offset` and `data_offset` remain unset for
> > all ELF binaries, so GDB is unable to correctly locate the position of
> > the binary's text and data.
> >
> > The fields `code_offset`, and `data_offset` were originally added way
> > back in 2006 to support debugging of bFMT executables (978efd6aac6),
> > and support was just never added for ELF. Since non-PIE binaries are
> > loaded at exactly the address specified in the binary, GDB does not nee=
d
> > to relocate any symbols, so the buggy behavior is not normally observed=
.
> >
> > Buglink: https://bugs.launchpad.net/qemu/+bug/1528239
> > Signed-off-by: Josh Kunz <jkz@google.com>
> > ---
> >  linux-user/elfload.c | 2 ++
> >  1 file changed, 2 insertions(+)
>
> As it seems they are text and data segment offsets, why it's not based
> on info->start_code and info->start_data?
>
> Thanks,
> Laurent
>

--0000000000005261ed0591aaf9da
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The `Data` and `Code` flags in `qOffsets` are actually sec=
tion offsets rather than segment offsets. GDB relocates the symbols in thos=
e sections relative to their location in the binary. So we have to use `loa=
d_bias`.<div></div><div><br></div><div>See here for a more detailed descrip=
tion:=C2=A0<a href=3D"https://sourceware.org/gdb/onlinedocs/gdb/General-Que=
ry-Packets.html#General-Query-Packets">https://sourceware.org/gdb/onlinedoc=
s/gdb/General-Query-Packets.html#General-Query-Packets</a></div></div><br><=
div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Aug=
 26, 2019 at 1:29 AM Laurent Vivier &lt;<a href=3D"mailto:laurent@vivier.eu=
">laurent@vivier.eu</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">Le 17/08/2019 =C3=A0 01:34, Josh Kunz via Qemu-devel a =
=C3=A9crit=C2=A0:<br>
&gt; This is needed to support debugging PIE ELF binaries running under QEM=
U<br>
&gt; user mode. Currently, `code_offset` and `data_offset` remain unset for=
<br>
&gt; all ELF binaries, so GDB is unable to correctly locate the position of=
<br>
&gt; the binary&#39;s text and data.<br>
&gt; <br>
&gt; The fields `code_offset`, and `data_offset` were originally added way<=
br>
&gt; back in 2006 to support debugging of bFMT executables (978efd6aac6),<b=
r>
&gt; and support was just never added for ELF. Since non-PIE binaries are<b=
r>
&gt; loaded at exactly the address specified in the binary, GDB does not ne=
ed<br>
&gt; to relocate any symbols, so the buggy behavior is not normally observe=
d.<br>
&gt; <br>
&gt; Buglink: <a href=3D"https://bugs.launchpad.net/qemu/+bug/1528239" rel=
=3D"noreferrer" target=3D"_blank">https://bugs.launchpad.net/qemu/+bug/1528=
239</a><br>
&gt; Signed-off-by: Josh Kunz &lt;<a href=3D"mailto:jkz@google.com" target=
=3D"_blank">jkz@google.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 linux-user/elfload.c | 2 ++<br>
&gt;=C2=A0 1 file changed, 2 insertions(+)<br>
<br>
As it seems they are text and data segment offsets, why it&#39;s not based<=
br>
on info-&gt;start_code and info-&gt;start_data?<br>
<br>
Thanks,<br>
Laurent<br>
</blockquote></div>

--0000000000005261ed0591aaf9da--

