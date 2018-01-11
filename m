Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eZhpQ-0003xY-8N
	for mharc-qemu-trivial@gnu.org; Thu, 11 Jan 2018 13:43:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55567)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <malbarbo@gmail.com>) id 1eZhpN-0003sh-3t
	for qemu-trivial@nongnu.org; Thu, 11 Jan 2018 13:43:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <malbarbo@gmail.com>) id 1eZhpL-0005sn-V8
	for qemu-trivial@nongnu.org; Thu, 11 Jan 2018 13:43:49 -0500
Received: from mail-ot0-x231.google.com ([2607:f8b0:4003:c0f::231]:44637)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <malbarbo@gmail.com>)
	id 1eZhpL-0005rT-Oh; Thu, 11 Jan 2018 13:43:47 -0500
Received: by mail-ot0-x231.google.com with SMTP id g59so2932542otg.11;
	Thu, 11 Jan 2018 10:43:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=6c8pLPmZh9E22R6hXAgfjzfhj44Z0DdTuw5i1NcZ6zU=;
	b=sK7i67x8cisB4BMjk9x8Gd4alGd+YUoU1MNImDsO1zs2SZqhHjuVrqvpE9fyAdNNp0
	5lZAfCg3anOUycG/6kV+T85tSACC5Kogy7gkrz6iWxtJ1RjYqlMMKFjsOBX3QiHHS8c0
	ejR68Hd0HrITpYKqMTgScjuqgrr2rBloCURSWNktlRWU//dPmHLdqDMiqop9xr/bWRZQ
	m9SQS+im8A4uSIyI62CcHxfk8lX9fAdPu6eGt6yUM0wZ0SVJoA5vrlvTdtu43n6dAGTV
	WixUj4IcEKzBsiS8hT+EQLje++lbJS02iF3HY0HVvxX8ljo51lhO8mtnfOIJZS4j3pmY
	Jrfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=6c8pLPmZh9E22R6hXAgfjzfhj44Z0DdTuw5i1NcZ6zU=;
	b=lhR0HcxcpgOzvGsLZd5sj5PtNCtf4Rto6R3crF3FDP6eoPhmHSCISLOB22od5y1p+c
	0oTk1V3EY3XpNtoyL930P0IBix/brtOSXaBJX5gGypBX+CEa3AZBkxNrTSLDbZefczyj
	Rl6M7kB7zQlzKr74ulO0mHJ8l9DjDbgvAGBsynLp/qLsBZV2yTPRzuxzwX6QgA+oqp4N
	xaA2KD2DA8CxwtVtUF+csEeqkS5DPAXa5+EGDWQcfbO0ZckJifKfF9V/pLD06V5UBPB8
	6z37RES3kRuZ3fkJlQsQUwl/Zd50syR1HMNdfTzBUVYwvL01w4f2dy/4WdFsy27uM5Pg
	RYTg==
X-Gm-Message-State: AKwxytd7l/pVm+Ntbb+FS120iYeYvL6805VqarwXnNHWh9dmXNtatihK
	b29Z63SfJ+OV9oPlFG13JdSBelUIB+/C93nBtBmmoQ==
X-Google-Smtp-Source: ACJfBoucOtLR9dhS7WbIx3AM1FMqN22H8YU1fRBJPY7TYOJIyd93AVbvmXxgiq90ivu72jdDCAY5LZe3G31lkR4d59E=
X-Received: by 10.157.82.41 with SMTP id e41mr3539567oth.244.1515696226735;
	Thu, 11 Jan 2018 10:43:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.15.103 with HTTP; Thu, 11 Jan 2018 10:43:46 -0800 (PST)
In-Reply-To: <20180111183714.22834-2-malbarbo@gmail.com>
References: <20180111183714.22834-2-malbarbo@gmail.com>
From: Marco A L Barbosa <malbarbo@gmail.com>
Date: Thu, 11 Jan 2018 16:43:46 -0200
Message-ID: <CAHpsRN8fYDbVgRSZUSyjb39uHLJCQurt5=N3BXtPd6gB2bQsTg@mail.gmail.com>
To: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="f40304354c802e9ce905628487a5"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::231
Subject: Re: [Qemu-trivial] [PATCH v2] linux-user: Add AT_SECURE auxval
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
X-List-Received-Date: Thu, 11 Jan 2018 18:43:50 -0000

--f40304354c802e9ce905628487a5
Content-Type: text/plain; charset="UTF-8"

For some reason send-email didn't include my comments, sorry.

Following the Peter Maydell advice we just pass through the host AT_SECURE.

This fixes https://bugs.launchpad.net/qemu/+bug/1738771

Version 1 for reference:
https://lists.gnu.org/archive/html/qemu-devel/2017-10/msg03667.html
https://lists.gnu.org/archive/html/qemu-devel/2018-01/msg01298.html

On Thu, Jan 11, 2018 at 4:37 PM, Marco A L Barbosa <malbarbo@gmail.com>
wrote:

> ---
>  linux-user/elfload.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/linux-user/elfload.c b/linux-user/elfload.c
> index 20f3d8c2c3..32a47674e6 100644
> --- a/linux-user/elfload.c
> +++ b/linux-user/elfload.c
> @@ -1354,7 +1354,7 @@ struct exec
>                                   ~(abi_ulong)(TARGET_ELF_EXEC_
> PAGESIZE-1))
>  #define TARGET_ELF_PAGEOFFSET(_v) ((_v) & (TARGET_ELF_EXEC_PAGESIZE-1))
>
> -#define DLINFO_ITEMS 14
> +#define DLINFO_ITEMS 15
>
>  static inline void memcpy_fromfs(void * to, const void * from, unsigned
> long n)
>  {
> @@ -1786,6 +1786,7 @@ static abi_ulong create_elf_tables(abi_ulong p, int
> argc, int envc,
>      NEW_AUX_ENT(AT_HWCAP, (abi_ulong) ELF_HWCAP);
>      NEW_AUX_ENT(AT_CLKTCK, (abi_ulong) sysconf(_SC_CLK_TCK));
>      NEW_AUX_ENT(AT_RANDOM, (abi_ulong) u_rand_bytes);
> +    NEW_AUX_ENT(AT_SECURE, (abi_ulong) qemu_getauxval(AT_SECURE));
>
>  #ifdef ELF_HWCAP2
>      NEW_AUX_ENT(AT_HWCAP2, (abi_ulong) ELF_HWCAP2);
> --
> 2.11.0
>
>


-- 
Marco A L Barbosa
http://malbarbo.pro.br
--

--f40304354c802e9ce905628487a5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>For some reason send-email didn&#39;t include my=
 comments, sorry.<br><br></div>Following the Peter Maydell advice we just p=
ass through the host AT_SECURE.<br><br></div><div>This fixes <a href=3D"htt=
ps://bugs.launchpad.net/qemu/+bug/1738771">https://bugs.launchpad.net/qemu/=
+bug/1738771</a><br></div><div><br></div>Version 1 for reference:<br><a hre=
f=3D"https://lists.gnu.org/archive/html/qemu-devel/2017-10/msg03667.html">h=
ttps://lists.gnu.org/archive/html/qemu-devel/2017-10/msg03667.html</a><br><=
a href=3D"https://lists.gnu.org/archive/html/qemu-devel/2018-01/msg01298.ht=
ml">https://lists.gnu.org/archive/html/qemu-devel/2018-01/msg01298.html</a>=
<br> </div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Thu=
, Jan 11, 2018 at 4:37 PM, Marco A L Barbosa <span dir=3D"ltr">&lt;<a href=
=3D"mailto:malbarbo@gmail.com" target=3D"_blank">malbarbo@gmail.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex">---<br>
=C2=A0linux-user/elfload.c | 3 ++-<br>
=C2=A01 file changed, 2 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/linux-user/elfload.c b/linux-user/elfload.c<br>
index 20f3d8c2c3..32a47674e6 100644<br>
--- a/linux-user/elfload.c<br>
+++ b/linux-user/elfload.c<br>
@@ -1354,7 +1354,7 @@ struct exec<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ~(abi_ulong)(TARGET_ELF_EXEC_=
<wbr>PAGESIZE-1))<br>
=C2=A0#define TARGET_ELF_PAGEOFFSET(_v) ((_v) &amp; (TARGET_ELF_EXEC_PAGESI=
ZE-1))<br>
<br>
-#define DLINFO_ITEMS 14<br>
+#define DLINFO_ITEMS 15<br>
<br>
=C2=A0static inline void memcpy_fromfs(void * to, const void * from, unsign=
ed long n)<br>
=C2=A0{<br>
@@ -1786,6 +1786,7 @@ static abi_ulong create_elf_tables(abi_ulong p, int a=
rgc, int envc,<br>
=C2=A0 =C2=A0 =C2=A0NEW_AUX_ENT(AT_HWCAP, (abi_ulong) ELF_HWCAP);<br>
=C2=A0 =C2=A0 =C2=A0NEW_AUX_ENT(AT_CLKTCK, (abi_ulong) sysconf(_SC_CLK_TCK)=
);<br>
=C2=A0 =C2=A0 =C2=A0NEW_AUX_ENT(AT_RANDOM, (abi_ulong) u_rand_bytes);<br>
+=C2=A0 =C2=A0 NEW_AUX_ENT(AT_SECURE, (abi_ulong) qemu_getauxval(AT_SECURE)=
);<br>
<br>
=C2=A0#ifdef ELF_HWCAP2<br>
=C2=A0 =C2=A0 =C2=A0NEW_AUX_ENT(AT_HWCAP2, (abi_ulong) ELF_HWCAP2);<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.11.0<br>
<br>
</font></span></blockquote></div><br><br clear=3D"all"><br>-- <br><div clas=
s=3D"gmail_signature" data-smartmail=3D"gmail_signature">Marco A L Barbosa<=
br><a href=3D"http://malbarbo.pro.br" target=3D"_blank">http://malbarbo.pro=
.br</a><br>--</div>
</div>

--f40304354c802e9ce905628487a5--

