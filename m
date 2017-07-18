Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dXVcI-0004Ft-Th
	for mharc-qemu-trivial@gnu.org; Tue, 18 Jul 2017 12:44:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58186)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dXVcG-0004Em-8J
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 12:44:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dXVcF-0000SW-0d
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 12:44:56 -0400
Received: from mail-io0-x241.google.com ([2607:f8b0:4001:c06::241]:32805)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dXVcE-0000Ro-Qj; Tue, 18 Jul 2017 12:44:54 -0400
Received: by mail-io0-x241.google.com with SMTP id z62so2449650ioi.0;
	Tue, 18 Jul 2017 09:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=YBVa4n4wqDuedniFPZqp75Q+iBI84VTts/0kt9LBbZA=;
	b=vVfOlgWrboCvAMEMIvaQNk2irkdH4fQx+O3lPHm+CAMbMdzbVFhd9NVNly8O8pL6Nd
	07pbaZutyjAzX5y7i9y+CibBUGSv+H61Vb6Ecq9jvoUuDfbGRE7Jra5UFhJVF+qomRWM
	TtRgymipXS/EsRYe2zuSxJjQTxl5gpTHMLAsi8e5sYTzZ8/T66fqq2TTWh2OFbWo2Dmk
	3GiSSPvEzw6rINHpv9QUudEMHi0IZN1VC+AoRpy3sn/ffGmWOR7ZGlinJBHMZdWnQhmL
	SVWAoRyIUrOI+q4Uw5ewo6BEeR0tQSZygUMO5+D5ZqZnMF3t8fwutcx/S4iKjhe60WOj
	bzWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=YBVa4n4wqDuedniFPZqp75Q+iBI84VTts/0kt9LBbZA=;
	b=b3VXorehTvKc+sBZgaJPp+xMz5Aw3cWMsNz3cM/r1HrMxsRbMQq0QSvg8qKCJEjVcl
	G0eOeEIIEl950OwY6de/mMXzCg86lOY2huR797ZRiHf5UcHYzPnEOr0r2qUXe4jVqy2t
	YUiwlfdMM1y0yzYWrCyvmYHoIvthpJ6d5au5Qlm/213i8a1uV7ruWxFC4G9QmIgq56GQ
	vZlNCwCLPuS/dBWC4KBNnQdyRDswcG+ZSWvlHLA0ErjQwPsWZsqrst0jszpRtWX4bF2V
	C1PlGCXVNOv9O2CzP3FBwGTfc7VPGD84aXIfCsRqpkx3cBl7uUcrWRXn2v5Prhi9ObOV
	4gSg==
X-Gm-Message-State: AIVw1115DcZHren6TN6kFvTpla4p2oclh/hGFl+ncsAROICX+j8ApKVC
	I+s7R9bx8GpK10l1w+IDlAang+oV/Q==
X-Received: by 10.107.200.211 with SMTP id y202mr2673645iof.16.1500396294128; 
	Tue, 18 Jul 2017 09:44:54 -0700 (PDT)
MIME-Version: 1.0
Sender: philippe.mathieu.daude@gmail.com
Received: by 10.107.152.16 with HTTP; Tue, 18 Jul 2017 09:44:53 -0700 (PDT)
Received: by 10.107.152.16 with HTTP; Tue, 18 Jul 2017 09:44:53 -0700 (PDT)
In-Reply-To: <1500395194-21455-3-git-send-email-peter.maydell@linaro.org>
References: <1500395194-21455-1-git-send-email-peter.maydell@linaro.org>
	<1500395194-21455-3-git-send-email-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Tue, 18 Jul 2017 13:44:53 -0300
X-Google-Sender-Auth: u7KOO9W7t9KdbZf3AoqkWe2eZJ8
Message-ID: <CAAdtpL4d7F+rAWQuw2hvbTK6vEwr_VDB5xn+PWTJnBWRQzzd-g@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	patches@linaro.org
Content-Type: multipart/alternative; boundary="94eb2c0b9a16224c0a05549a3cb1"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4001:c06::241
Subject: Re: [Qemu-trivial] [PATCH for-2.10 2/4] bsd-user/elfload.c: Fix
 set-but-not-used warnings
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
X-List-Received-Date: Tue, 18 Jul 2017 16:44:57 -0000

--94eb2c0b9a16224c0a05549a3cb1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Le 18 juil. 2017 1:32 PM, "Peter Maydell" <peter.maydell@linaro.org> a
=C3=A9crit :

> Fix various warnings about set-but-not-used variables on OpenBSD:
>
> bsd-user/elfload.c:1158:15: warning: variable 'mapped_addr' set but not
> used [-Wunused-but-set-variable]
> bsd-user/elfload.c:1165:9: warning: variable 'status' set but not used
> [-Wunused-but-set-variable]
> bsd-user/elfload.c:1168:15: warning: variable 'elf_stack' set but not use=
d
> [-Wunused-but-set-variable]
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  bsd-user/elfload.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
>
> diff --git a/bsd-user/elfload.c b/bsd-user/elfload.c
> index 41a1309..7cccf3e 100644
> --- a/bsd-user/elfload.c
> +++ b/bsd-user/elfload.c
> @@ -1155,21 +1155,20 @@ int load_elf_binary(struct linux_binprm * bprm,
> struct target_pt_regs * regs,
>      unsigned int interpreter_type =3D INTERPRETER_NONE;
>      unsigned char ibcs2_interpreter;
>      int i;
> -    abi_ulong mapped_addr;
>      struct elf_phdr * elf_ppnt;
>      struct elf_phdr *elf_phdata;
>      abi_ulong elf_bss, k, elf_brk;
>      int retval;
>      char * elf_interpreter;
>      abi_ulong elf_entry, interp_load_addr =3D 0;
> -    int status;
>      abi_ulong start_code, end_code, start_data, end_data;
>      abi_ulong reloc_func_desc =3D 0;
> -    abi_ulong elf_stack;
> +#ifdef LOW_ELF_STACK
> +    abi_ulong elf_stack =3D ~((abi_ulong)0UL);
> +#endif
>      char passed_fileno[6];
>
>      ibcs2_interpreter =3D 0;
> -    status =3D 0;
>      load_addr =3D 0;
>      load_bias =3D 0;
>      elf_ex =3D *((struct elfhdr *) bprm->buf);          /* exec-header *=
/
> @@ -1221,7 +1220,6 @@ int load_elf_binary(struct linux_binprm * bprm,
> struct target_pt_regs * regs,
>      elf_brk =3D 0;
>
>
> -    elf_stack =3D ~((abi_ulong)0UL);
>      elf_interpreter =3D NULL;
>      start_code =3D ~((abi_ulong)0UL);
>      end_code =3D 0;
> @@ -1546,7 +1544,7 @@ int load_elf_binary(struct linux_binprm * bprm,
> struct target_pt_regs * regs,
>                 and some applications "depend" upon this behavior.
>                 Since we do not have the power to recompile these, we
>                 emulate the SVr4 behavior.  Sigh.  */
> -            mapped_addr =3D target_mmap(0, qemu_host_page_size, PROT_REA=
D |
> PROT_EXEC,
> +            target_mmap(0, qemu_host_page_size, PROT_READ | PROT_EXEC,
>                                        MAP_FIXED | MAP_PRIVATE, -1, 0);
>      }
>
> --
> 2.7.4
>
>
>

--94eb2c0b9a16224c0a05549a3cb1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><span style=3D"font-family:sans-serif;font-size:13.696px"=
>Reviewed-by: Philippe Mathieu-Daud=C3=A9 &lt;</span><a href=3D"mailto:f4bu=
g@amsat.org" style=3D"text-decoration:none;color:rgb(66,133,244);font-famil=
y:sans-serif;font-size:13.696px">f4bug@amsat.org</a><span style=3D"font-fam=
ily:sans-serif;font-size:13.696px">&gt;</span></div><div class=3D"gmail_ext=
ra"><br><div class=3D"gmail_quote">Le=C2=A018 juil. 2017 1:32 PM, &quot;Pet=
er Maydell&quot; &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.mayd=
ell@linaro.org</a>&gt; a =C3=A9crit=C2=A0:<br type=3D"attribution"><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">Fix various warnings about set-but-not-used variable=
s on OpenBSD:<br>
<br>
bsd-user/elfload.c:1158:15: warning: variable &#39;mapped_addr&#39; set but=
 not used [-Wunused-but-set-variable]<br>
bsd-user/elfload.c:1165:9: warning: variable &#39;status&#39; set but not u=
sed [-Wunused-but-set-variable]<br>
bsd-user/elfload.c:1168:15: warning: variable &#39;elf_stack&#39; set but n=
ot used [-Wunused-but-set-variable]<br>
<br>
Signed-off-by: Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org=
">peter.maydell@linaro.org</a>&gt;<br>
---<br>
=C2=A0bsd-user/elfload.c | 10 ++++------<br>
=C2=A01 file changed, 4 insertions(+), 6 deletions(-)<br>
<br>
diff --git a/bsd-user/elfload.c b/bsd-user/elfload.c<br>
index 41a1309..7cccf3e 100644<br>
--- a/bsd-user/elfload.c<br>
+++ b/bsd-user/elfload.c<br>
@@ -1155,21 +1155,20 @@ int load_elf_binary(struct linux_binprm * bprm, str=
uct target_pt_regs * regs,<br>
=C2=A0 =C2=A0 =C2=A0unsigned int interpreter_type =3D INTERPRETER_NONE;<br>
=C2=A0 =C2=A0 =C2=A0unsigned char ibcs2_interpreter;<br>
=C2=A0 =C2=A0 =C2=A0int i;<br>
-=C2=A0 =C2=A0 abi_ulong mapped_addr;<br>
=C2=A0 =C2=A0 =C2=A0struct elf_phdr * elf_ppnt;<br>
=C2=A0 =C2=A0 =C2=A0struct elf_phdr *elf_phdata;<br>
=C2=A0 =C2=A0 =C2=A0abi_ulong elf_bss, k, elf_brk;<br>
=C2=A0 =C2=A0 =C2=A0int retval;<br>
=C2=A0 =C2=A0 =C2=A0char * elf_interpreter;<br>
=C2=A0 =C2=A0 =C2=A0abi_ulong elf_entry, interp_load_addr =3D 0;<br>
-=C2=A0 =C2=A0 int status;<br>
=C2=A0 =C2=A0 =C2=A0abi_ulong start_code, end_code, start_data, end_data;<b=
r>
=C2=A0 =C2=A0 =C2=A0abi_ulong reloc_func_desc =3D 0;<br>
-=C2=A0 =C2=A0 abi_ulong elf_stack;<br>
+#ifdef LOW_ELF_STACK<br>
+=C2=A0 =C2=A0 abi_ulong elf_stack =3D ~((abi_ulong)0UL);<br>
+#endif<br>
=C2=A0 =C2=A0 =C2=A0char passed_fileno[6];<br>
<br>
=C2=A0 =C2=A0 =C2=A0ibcs2_interpreter =3D 0;<br>
-=C2=A0 =C2=A0 status =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0load_addr =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0load_bias =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0elf_ex =3D *((struct elfhdr *) bprm-&gt;buf);=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 /* exec-header */<br>
@@ -1221,7 +1220,6 @@ int load_elf_binary(struct linux_binprm * bprm, struc=
t target_pt_regs * regs,<br>
=C2=A0 =C2=A0 =C2=A0elf_brk =3D 0;<br>
<br>
<br>
-=C2=A0 =C2=A0 elf_stack =3D ~((abi_ulong)0UL);<br>
=C2=A0 =C2=A0 =C2=A0elf_interpreter =3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0start_code =3D ~((abi_ulong)0UL);<br>
=C2=A0 =C2=A0 =C2=A0end_code =3D 0;<br>
@@ -1546,7 +1544,7 @@ int load_elf_binary(struct linux_binprm * bprm, struc=
t target_pt_regs * regs,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 and some applicatio=
ns &quot;depend&quot; upon this behavior.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Since we do not hav=
e the power to recompile these, we<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 emulate the SVr4 be=
havior.=C2=A0 Sigh.=C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mapped_addr =3D target_mmap(0, q=
emu_host_page_size, PROT_READ | PROT_EXEC,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target_mmap(0, qemu_host_page_si=
ze, PROT_READ | PROT_EXEC,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MAP_FIXED=
 | MAP_PRIVATE, -1, 0);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
--<br>
2.7.4<br>
<br>
<br>
</blockquote></div></div>

--94eb2c0b9a16224c0a05549a3cb1--

