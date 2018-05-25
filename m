Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fMBpH-0002tc-KO
	for mharc-qemu-trivial@gnu.org; Fri, 25 May 2018 08:28:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51796)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjc@sifive.com>) id 1fM8z1-00013g-Tf
	for qemu-trivial@nongnu.org; Fri, 25 May 2018 05:26:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjc@sifive.com>) id 1fM8z0-00026e-CD
	for qemu-trivial@nongnu.org; Fri, 25 May 2018 05:25:59 -0400
Received: from mail-ot0-x243.google.com ([2607:f8b0:4003:c0f::243]:39424)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <mjc@sifive.com>) id 1fM8z0-000265-66
	for qemu-trivial@nongnu.org; Fri, 25 May 2018 05:25:58 -0400
Received: by mail-ot0-x243.google.com with SMTP id l12-v6so5339119oth.6
	for <qemu-trivial@nongnu.org>; Fri, 25 May 2018 02:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=zxODUGv71MzkPnnu+h+i9p/mCKyyUhunf1n8ieSQ+oI=;
	b=a4Zi8WHkBLTJGI0lI7bXbEkp+D/cll9nmgHLGFl+BjxGOD4wWOT3Zg2f3WOKTUBvtj
	hO8UfQDWtcbfLjJZ+g/wIorlFxPG2So1jPr1EwCXSiVdCnl9CDncbWDF/ZHUTtQhnlTI
	FDv4zCYPxuD6/DBXwtKa6NSWYJQp4ibfAY5/h/KVtCyVmAT+/XFySrjrEq+lGWevC+eJ
	1Do2naVfBjQmnRu6p/EIm41XJYqL8x6OxUOqUwonFSjHoR452pYifBVneYe7OgCEmmAa
	/NShFlWUpVSd/nHnUpdoLGSFa6MVkSNJf0l2npAUR1rzkY01V+neFJULaYFNef5VkT+e
	LpAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=zxODUGv71MzkPnnu+h+i9p/mCKyyUhunf1n8ieSQ+oI=;
	b=P4TfN2oEdx16pE7Zpb1r5Tyvmr6mCOCyCwE7Kh4wi3GRs5l93lweNsdMSYbXQaq6LG
	OGlrT2JxWu1Xn9+p4M0J/jF89KlXSr/CztIr/xTWYNZVDGU8weX7UEYKR975Mp2g4Dvu
	gvcMj4TLq0r2vAlbACIl/M4WeYmCeA4CIFiTm0y/7xn9lqNAG9tOdiIdTbShWOOg+vkj
	x1/rb5zAMrsi25bmSawDJPAgjjyci6yrkjS5RxjJ1CSgZ7J2UFjZGmnkZtE8nOY19+MV
	IIPcvst70JsI2wNVHudt8PA5qXHFJMIi4pBoUkMkSROhI8PKv4BDMwqGKDRTZAjEilpm
	9hdA==
X-Gm-Message-State: ALKqPwcjvFH5/9/OUQAUBHKAT868SqR4FGtPvzlvrM6DrynGaUALkw4X
	tNsf0GP+KWlwUe+/bPcIO5WPwyHkJoYy0G4Q0X+d3g==
X-Google-Smtp-Source: ADUXVKL9CCTpFHIBLAmcpG1vQ2U6zNVEnxe2krqPbHeVPcGQt8xOLJ98aPh8PM5Q3gY9ivAnDXmRV+d91rAiTHBqCn0=
X-Received: by 2002:a9d:2425:: with SMTP id p34-v6mr961752ota.98.1527240357509;
	Fri, 25 May 2018 02:25:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:19c3:0:0:0:0:0 with HTTP; Fri, 25 May 2018 02:25:57
	-0700 (PDT)
In-Reply-To: <4926fd94-b29b-8dad-bbdb-e19729bfa39f@vivier.eu>
References: <1527232960-51123-1-git-send-email-mjc@sifive.com>
	<4926fd94-b29b-8dad-bbdb-e19729bfa39f@vivier.eu>
From: Michael Clark <mjc@sifive.com>
Date: Fri, 25 May 2018 21:25:57 +1200
Message-ID: <CAHNT7NvTAh9iWPvJaaH+Jr8wbtyp5JOvDCaGvnMqugwHvRfy1g@mail.gmail.com>
To: Laurent Vivier <laurent@vivier.eu>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-trivial@nongnu.org, 
	RISC-V Patches <patches@groups.riscv.org>,
	Michael Tokarev <mjt@tls.msk.ru>, 
	Richard Henderson <richard.henderson@linaro.org>,
	Alistair Francis <Alistair.Francis@wdc.com>, Jim Wilson <jimw@sifive.com>
Content-Type: multipart/alternative; boundary="000000000000ff0f90056d045adf"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::243
X-Mailman-Approved-At: Fri, 25 May 2018 08:28:06 -0400
Subject: Re: [Qemu-trivial] [PATCH v2] elf: Add RISC-V PSABI ELF header
 defines
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
X-List-Received-Date: Fri, 25 May 2018 09:26:01 -0000

--000000000000ff0f90056d045adf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 25, 2018 at 7:53 PM, Laurent Vivier <laurent@vivier.eu> wrote:

> Le 25/05/2018 =C3=A0 09:22, Michael Clark a =C3=A9crit :
> > Refer to the RISC-V PSABI specification for details:
> >
> > - https://github.com/riscv/riscv-elf-psabi-doc/blob/master/riscv-elf.md
> >
> > Cc: Michael Tokarev <mjt@tls.msk.ru>
> > Cc: Laurent Vivier <laurent@vivier.eu>
> > Cc: Richard Henderson <richard.henderson@linaro.org>
> > Cc: Alistair Francis <Alistair.Francis@wdc.com>
> > Signed-off-by: Michael Clark <mjc@sifive.com>
> > ---
> >  include/elf.h | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/include/elf.h b/include/elf.h
> > index 934dbbd6b3ae..bd0493f43d19 100644
> > --- a/include/elf.h
> > +++ b/include/elf.h
> > @@ -1285,6 +1285,14 @@ typedef struct {
> >  #define R_IA64_DTPREL64LSB   0xb7    /* @dtprel(sym + add), data8 LSB =
*/
> >  #define R_IA64_LTOFF_DTPREL22        0xba    /* @ltoff(@dtprel(s+a)),
> imm22 */
> >
> > +/* RISC-V specific definitions.  */
> > +#define EF_RISCV_RVC 0x0001
> > +#define EF_RISCV_FLOAT_ABI_SINGLE 0x0002
> > +#define EF_RISCV_FLOAT_ABI_DOUBLE 0x0004
> > +#define EF_RISCV_FLOAT_ABI_QUAD 0x0006
> > +#define EF_RISCV_RVE 0x0008
> > +#define EF_RISCV_TSO 0x0010
> > +
> >  typedef struct elf32_rel {
> >    Elf32_Addr r_offset;
> >    Elf32_Word r_info;
> >
>
> from glibc (and binutils), I have:
>
>   /* RISC-V ELF Flags */
>   #define EF_RISCV_RVC                    0x0001
>   #define EF_RISCV_FLOAT_ABI              0x0006
>   #define EF_RISCV_FLOAT_ABI_SOFT         0x0000
>   #define EF_RISCV_FLOAT_ABI_SINGLE       0x0002
>   #define EF_RISCV_FLOAT_ABI_DOUBLE       0x0004
>   #define EF_RISCV_FLOAT_ABI_QUAD         0x0006
>
> Perhaps you can also define EF_RISCV_FLOAT_ABI_SOFT and EF_RISCV_FLOAT_AB=
I?
>

Will do. I'll align them also.

Anyway:
>
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
>
>
Thanks for checking glibc and binutils. I'll update to add the extra
definitions before I make a PR. Thanks!

Michael.

--000000000000ff0f90056d045adf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Fri, May 25, 2018 at 7:53 PM, Laurent Vivier <span dir=3D"ltr">&lt;<=
a href=3D"mailto:laurent@vivier.eu" target=3D"_blank">laurent@vivier.eu</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"HOEnZb">=
<div class=3D"h5">Le 25/05/2018 =C3=A0 09:22, Michael Clark a =C3=A9crit=C2=
=A0:<br>
&gt; Refer to the RISC-V PSABI specification for details:<br>
&gt; <br>
&gt; - <a href=3D"https://github.com/riscv/riscv-elf-psabi-doc/blob/master/=
riscv-elf.md" rel=3D"noreferrer" target=3D"_blank">https://github.com/riscv=
/<wbr>riscv-elf-psabi-doc/blob/<wbr>master/riscv-elf.md</a><br>
&gt; <br>
&gt; Cc: Michael Tokarev &lt;<a href=3D"mailto:mjt@tls.msk.ru">mjt@tls.msk.=
ru</a>&gt;<br>
&gt; Cc: Laurent Vivier &lt;<a href=3D"mailto:laurent@vivier.eu">laurent@vi=
vier.eu</a>&gt;<br>
&gt; Cc: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.o=
rg">richard.henderson@linaro.org</a>&gt;<br>
&gt; Cc: Alistair Francis &lt;<a href=3D"mailto:Alistair.Francis@wdc.com">A=
listair.Francis@wdc.com</a>&gt;<br>
&gt; Signed-off-by: Michael Clark &lt;<a href=3D"mailto:mjc@sifive.com">mjc=
@sifive.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 include/elf.h | 8 ++++++++<br>
&gt;=C2=A0 1 file changed, 8 insertions(+)<br>
&gt; <br>
&gt; diff --git a/include/elf.h b/include/elf.h<br>
&gt; index 934dbbd6b3ae..bd0493f43d19 100644<br>
&gt; --- a/include/elf.h<br>
&gt; +++ b/include/elf.h<br>
&gt; @@ -1285,6 +1285,14 @@ typedef struct {<br>
&gt;=C2=A0 #define R_IA64_DTPREL64LSB=C2=A0 =C2=A00xb7=C2=A0 =C2=A0 /* @dtp=
rel(sym + add), data8 LSB */<br>
&gt;=C2=A0 #define R_IA64_LTOFF_DTPREL22=C2=A0 =C2=A0 =C2=A0 =C2=A0 0xba=C2=
=A0 =C2=A0 /* @ltoff(@dtprel(s+a)), imm22 */<br>
&gt;=C2=A0 <br>
&gt; +/* RISC-V specific definitions.=C2=A0 */<br>
&gt; +#define EF_RISCV_RVC 0x0001<br>
&gt; +#define EF_RISCV_FLOAT_ABI_SINGLE 0x0002<br>
&gt; +#define EF_RISCV_FLOAT_ABI_DOUBLE 0x0004<br>
&gt; +#define EF_RISCV_FLOAT_ABI_QUAD 0x0006<br>
&gt; +#define EF_RISCV_RVE 0x0008<br>
&gt; +#define EF_RISCV_TSO 0x0010<br>
&gt; +<br>
&gt;=C2=A0 typedef struct elf32_rel {<br>
&gt;=C2=A0 =C2=A0 Elf32_Addr r_offset;<br>
&gt;=C2=A0 =C2=A0 Elf32_Word r_info;<br>
&gt; <br>
<br>
</div></div>from glibc (and binutils), I have:<br>
<br>
=C2=A0 /* RISC-V ELF Flags */<br>
=C2=A0 #define EF_RISCV_RVC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 0x0001<br>
=C2=A0 #define EF_RISCV_FLOAT_ABI=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 0x0006<br>
=C2=A0 #define EF_RISCV_FLOAT_ABI_SOFT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x0=
000<br>
=C2=A0 #define EF_RISCV_FLOAT_ABI_SINGLE=C2=A0 =C2=A0 =C2=A0 =C2=A00x0002<b=
r>
=C2=A0 #define EF_RISCV_FLOAT_ABI_DOUBLE=C2=A0 =C2=A0 =C2=A0 =C2=A00x0004<b=
r>
=C2=A0 #define EF_RISCV_FLOAT_ABI_QUAD=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x0=
006<br>
<br>
Perhaps you can also define EF_RISCV_FLOAT_ABI_SOFT and EF_RISCV_FLOAT_ABI?=
<br></blockquote><div><br></div><div>Will do. I&#39;ll align them also.</di=
v><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">
Anyway:<br>
<br>
Reviewed-by: Laurent Vivier &lt;<a href=3D"mailto:laurent@vivier.eu">lauren=
t@vivier.eu</a>&gt;<br>
<br>
</blockquote></div><br></div><div class=3D"gmail_extra">Thanks for checking=
 glibc and binutils. I&#39;ll update to=C2=A0add the extra definitions befo=
re I make a PR. Thanks!</div><div class=3D"gmail_extra"><br></div><div clas=
s=3D"gmail_extra">Michael.</div></div>

--000000000000ff0f90056d045adf--

