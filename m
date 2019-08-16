Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1hyn8n-0003mV-O7
	for mharc-qemu-trivial@gnu.org; Fri, 16 Aug 2019 21:04:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51107)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jkz@google.com>) id 1hylmE-0003wq-JS
 for qemu-trivial@nongnu.org; Fri, 16 Aug 2019 19:37:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jkz@google.com>) id 1hylmA-0000AJ-Kj
 for qemu-trivial@nongnu.org; Fri, 16 Aug 2019 19:36:56 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:36213)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <jkz@google.com>) id 1hylm8-00008l-6x
 for qemu-trivial@nongnu.org; Fri, 16 Aug 2019 19:36:52 -0400
Received: by mail-pl1-x643.google.com with SMTP id g4so3063015plo.3
 for <qemu-trivial@nongnu.org>; Fri, 16 Aug 2019 16:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=e4Lx6wWXbd6ffhNIOQFJiBVPGZ/9pQupzsoFMeU6VT4=;
 b=EjfiQa4yrDbtgGU+NX/IUydjWOys+8gonnpq9ObOSc7j/+5iRR9pXeBjQT3cC3cG4b
 b4mzgpnZxQrAkEU9e63Yc41AIXtlQvNjZ06PGWqdwiX0AiPRXcf/ELG6oB9/yd6Pepm6
 jO5I4n22K9TzP4aqaTOWtAFUhky5F3mzfZVNjSchXvshcfhZVwp6WOZBFR6gVAypykAO
 yy2BciFN+l3ci3YB3XNbLUpkuq4ynDkEV7jnaWg7FX+YfKkfYcfuru4GIDRqYT3QV3fK
 apqEWelkOYdgec2K+JdzoRLcqz33je7VaQNIrVWTNdFYrHpF6gGFGPruEaoCZ1wdoSIz
 dQUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e4Lx6wWXbd6ffhNIOQFJiBVPGZ/9pQupzsoFMeU6VT4=;
 b=rcWPN2++nTiLCl4rHfMUSlGkhLziMu2a1i13v54UcRYmDgutw6B3rdaLZGpMNQ7ayD
 gZ3o+bKrOIOKVTmLBK0m7BhauVH1ga8Xivz3qNMi6r6ojp2341JjsmJdOqSH3/2Io30T
 HGDilgzW7vGpFMj3D7p0qKioMVqfO8Ybkzp5mvf6hLTg0kS6Z9/49Jz1fAcCLzIyM3eC
 rKLXXkw3ngfOuidPxsYbG4xF9TyOPnlbVMRIaKj1NvoUIC7UTHGhT8MURFieV8nvV3pN
 F5oubmBd4NfYk3uC9wlqrBOfrHoJyfcR7PC3FSSYIp37tUmiSpgqRe4u7TIPrCBWElTu
 ErOw==
X-Gm-Message-State: APjAAAWLHRRPe4zY6/ChrlUd9vVOD4grD0QmFMRI73w8TG8b6dgGxWrT
 BVsdiPjfMSwgtDb/60XI8JXPz2c3pC1rl3rOx8VYfPRUMS5FAg==
X-Google-Smtp-Source: APXvYqw7f9rI8XUzdi8hN/PN6hjIyFAggNcti8AzfPjl0z/tm5nEXaRcLG9BNEXsBf/CYVUjxGQKPC1M2AsFudgvguM=
X-Received: by 2002:a17:902:e38b:: with SMTP id
 ch11mr10778799plb.275.1565998607549; 
 Fri, 16 Aug 2019 16:36:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190816233422.16715-1-jkz@google.com>
In-Reply-To: <20190816233422.16715-1-jkz@google.com>
From: Josh Kunz <jkz@google.com>
Date: Fri, 16 Aug 2019 16:36:36 -0700
Message-ID: <CADgy-2s7t-zoycYZ5yBygN2cJ4-cj1wjdnAA=D0QDUTGnTjLRw@mail.gmail.com>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu, qemu-trivial@nongnu.org, riku.voipio@iki.fi
Content-Type: multipart/alternative; boundary="000000000000b94933059044766d"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::643
X-Mailman-Approved-At: Fri, 16 Aug 2019 21:04:21 -0400
Subject: Re: [Qemu-trivial] [PATCH] linux-user: Support gdb 'qOffsets' query
 for ELF
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
X-List-Received-Date: Fri, 16 Aug 2019 23:37:03 -0000

--000000000000b94933059044766d
Content-Type: text/plain; charset="UTF-8"

+cc: riku.voipio@iki.fi, I typoed the email on the first go.

On Fri, Aug 16, 2019 at 4:34 PM Josh Kunz <jkz@google.com> wrote:

> This is needed to support debugging PIE ELF binaries running under QEMU
> user mode. Currently, `code_offset` and `data_offset` remain unset for
> all ELF binaries, so GDB is unable to correctly locate the position of
> the binary's text and data.
>
> The fields `code_offset`, and `data_offset` were originally added way
> back in 2006 to support debugging of bFMT executables (978efd6aac6),
> and support was just never added for ELF. Since non-PIE binaries are
> loaded at exactly the address specified in the binary, GDB does not need
> to relocate any symbols, so the buggy behavior is not normally observed.
>
> Buglink: https://bugs.launchpad.net/qemu/+bug/1528239
> Signed-off-by: Josh Kunz <jkz@google.com>
> ---
>  linux-user/elfload.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/linux-user/elfload.c b/linux-user/elfload.c
> index 3365e192eb..ceac035208 100644
> --- a/linux-user/elfload.c
> +++ b/linux-user/elfload.c
> @@ -2380,6 +2380,8 @@ static void load_elf_image(const char *image_name,
> int image_fd,
>      }
>
>      info->load_bias = load_bias;
> +    info->code_offset = load_bias;
> +    info->data_offset = load_bias;
>      info->load_addr = load_addr;
>      info->entry = ehdr->e_entry + load_bias;
>      info->start_code = -1;
> --
> 2.23.0.rc1.153.gdeed80330f-goog
>
>

--000000000000b94933059044766d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">+cc:=C2=A0<a href=3D"mailto:riku.voipio@iki.fi">riku.voipi=
o@iki.fi</a>, I typoed the email on the first go.</div><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Aug 16, 2019 at 4:=
34 PM Josh Kunz &lt;<a href=3D"mailto:jkz@google.com">jkz@google.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">This is=
 needed to support debugging PIE ELF binaries running under QEMU<br>
user mode. Currently, `code_offset` and `data_offset` remain unset for<br>
all ELF binaries, so GDB is unable to correctly locate the position of<br>
the binary&#39;s text and data.<br>
<br>
The fields `code_offset`, and `data_offset` were originally added way<br>
back in 2006 to support debugging of bFMT executables (978efd6aac6),<br>
and support was just never added for ELF. Since non-PIE binaries are<br>
loaded at exactly the address specified in the binary, GDB does not need<br=
>
to relocate any symbols, so the buggy behavior is not normally observed.<br=
>
<br>
Buglink: <a href=3D"https://bugs.launchpad.net/qemu/+bug/1528239" rel=3D"no=
referrer" target=3D"_blank">https://bugs.launchpad.net/qemu/+bug/1528239</a=
><br>
Signed-off-by: Josh Kunz &lt;<a href=3D"mailto:jkz@google.com" target=3D"_b=
lank">jkz@google.com</a>&gt;<br>
---<br>
=C2=A0linux-user/elfload.c | 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/linux-user/elfload.c b/linux-user/elfload.c<br>
index 3365e192eb..ceac035208 100644<br>
--- a/linux-user/elfload.c<br>
+++ b/linux-user/elfload.c<br>
@@ -2380,6 +2380,8 @@ static void load_elf_image(const char *image_name, in=
t image_fd,<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0info-&gt;load_bias =3D load_bias;<br>
+=C2=A0 =C2=A0 info-&gt;code_offset =3D load_bias;<br>
+=C2=A0 =C2=A0 info-&gt;data_offset =3D load_bias;<br>
=C2=A0 =C2=A0 =C2=A0info-&gt;load_addr =3D load_addr;<br>
=C2=A0 =C2=A0 =C2=A0info-&gt;entry =3D ehdr-&gt;e_entry + load_bias;<br>
=C2=A0 =C2=A0 =C2=A0info-&gt;start_code =3D -1;<br>
-- <br>
2.23.0.rc1.153.gdeed80330f-goog<br>
<br>
</blockquote></div>

--000000000000b94933059044766d--

