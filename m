Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eZi2A-0004sH-IZ
	for mharc-qemu-trivial@gnu.org; Thu, 11 Jan 2018 13:57:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32883)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <malbarbo@gmail.com>) id 1eZi29-0004r8-31
	for qemu-trivial@nongnu.org; Thu, 11 Jan 2018 13:57:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <malbarbo@gmail.com>) id 1eZi28-0000Kr-2c
	for qemu-trivial@nongnu.org; Thu, 11 Jan 2018 13:57:01 -0500
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:36693)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <malbarbo@gmail.com>)
	id 1eZi27-0000Js-R5; Thu, 11 Jan 2018 13:56:59 -0500
Received: by mail-oi0-x244.google.com with SMTP id w135so2325495oie.3;
	Thu, 11 Jan 2018 10:56:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Ievum0/SV5VFM77vDfUrZg/c2lg923qWEpdCb8fByS8=;
	b=du9pBbBuXL+3rguCd5HRAOvhsffgtY8ydEoiuyWmWVFUlQOQI7JVLP8+UpIBI2KoXi
	Ge+VctvjxZqUkNkfl55H52acThy45iAnOGn36Beq/0cib7n2g0O6gSqfEMmDgtQEGelS
	PgkT0/peR6ikIFZBQ2aOLaAhJhOrR8Vn7G2GdjXBLGmnZNpOp0nYejAlaKmuhqhWREua
	NkTiVoCidjiVdvDnB5zsE09vxReDYhNuSUWpQ4bt8MX9ozw/NsQvJ7WU+OBKEgUyGrzW
	o0reP2xLXT20nJzArDgd/H+CSlR+rLx4DRGRsDgFvfUjvvSbojpx0bwe839B9RQ63Xsx
	5Tzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Ievum0/SV5VFM77vDfUrZg/c2lg923qWEpdCb8fByS8=;
	b=ZqReO51Jie0K4Sg58QVOC5k8TxKlmOes30ZEZakokPSCn1CmBnveJHcgZXD/LQO3UM
	ScXP6SS2TI7dLPEM6xXipI5cN7GTZWq91mQjnNhZlwargsiDAQs+B6+TbRxx35C8gRh9
	Vcwgp3c+FZ2LBv7EwMA+yFrZQC4/6TnUDczJtHYE+MvsXV869oY/bX9tOej0yI5AkTp3
	E+S1ZmF0nNXpZeVycIPNrjlnx4TROko9kGDjqgBH4Nq9j7T76cz4pBOowcu6wEmHoMxr
	17v8HX6zTKJkiqI3NQyf9Mwnu67z98MY+648J96qEyhbLFDqoTPtoElO261ktpCk+Iqv
	QTHw==
X-Gm-Message-State: AKwxytcEeaQbOz2mOdiXCJmWtdDV8ke72clnRg55yOtyymeGhOfP3wLl
	b+FlwSUINQAKS3pVpbnOWxr00MYtgZLjePd9fdM=
X-Google-Smtp-Source: ACJfBotO/zSPX0/++LX/SGeYtcBXzrL4Fj2R8rwfLA1/yNbS0ZZSuteR2JveXR9u2eMw238iOwjD7IHRdsWG7fj1quU=
X-Received: by 10.202.71.17 with SMTP id u17mr5992574oia.288.1515697019036;
	Thu, 11 Jan 2018 10:56:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.15.103 with HTTP; Thu, 11 Jan 2018 10:56:58 -0800 (PST)
In-Reply-To: <CAFEAcA9Qo8uQ10FHP7XfuC+sgb4i8e_fxo7EvZGtVVWddqpxVA@mail.gmail.com>
References: <20180111183714.22834-2-malbarbo@gmail.com>
	<CAFEAcA9Qo8uQ10FHP7XfuC+sgb4i8e_fxo7EvZGtVVWddqpxVA@mail.gmail.com>
From: Marco A L Barbosa <malbarbo@gmail.com>
Date: Thu, 11 Jan 2018 16:56:58 -0200
Message-ID: <CAHpsRN8rkMpcNmwwjpDFD3LDogZzCUqbitH-fHHWomc+GupLKw@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>, 
	Riku Voipio <riku.voipio@iki.fi>, Laurent Vivier <Laurent@vivier.eu>
Content-Type: multipart/alternative; boundary="001a113e5118682c86056284b6a2"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] linux-user: Add
 AT_SECURE auxval
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
X-List-Received-Date: Thu, 11 Jan 2018 18:57:02 -0000

--001a113e5118682c86056284b6a2
Content-Type: text/plain; charset="UTF-8"

Thanks Peter,

Signed-off-by: Marco A L Barbosa <malbarbo@gmail.com>

On Thu, Jan 11, 2018 at 4:52 PM, Peter Maydell <peter.maydell@linaro.org>
wrote:

> On 11 January 2018 at 18:37, Marco A L Barbosa <malbarbo@gmail.com> wrote:
> > ---
> >  linux-user/elfload.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
>
> This is missing your Signed-off-by: line, which we need to be
> able to accept the patch.
>
> (I've also cc'd the linux-user maintainers.)
>
> > diff --git a/linux-user/elfload.c b/linux-user/elfload.c
> > index 20f3d8c2c3..32a47674e6 100644
> > --- a/linux-user/elfload.c
> > +++ b/linux-user/elfload.c
> > @@ -1354,7 +1354,7 @@ struct exec
> >                                   ~(abi_ulong)(TARGET_ELF_EXEC_
> PAGESIZE-1))
> >  #define TARGET_ELF_PAGEOFFSET(_v) ((_v) & (TARGET_ELF_EXEC_PAGESIZE-1))
> >
> > -#define DLINFO_ITEMS 14
> > +#define DLINFO_ITEMS 15
> >
> >  static inline void memcpy_fromfs(void * to, const void * from, unsigned
> long n)
> >  {
> > @@ -1786,6 +1786,7 @@ static abi_ulong create_elf_tables(abi_ulong p,
> int argc, int envc,
> >      NEW_AUX_ENT(AT_HWCAP, (abi_ulong) ELF_HWCAP);
> >      NEW_AUX_ENT(AT_CLKTCK, (abi_ulong) sysconf(_SC_CLK_TCK));
> >      NEW_AUX_ENT(AT_RANDOM, (abi_ulong) u_rand_bytes);
> > +    NEW_AUX_ENT(AT_SECURE, (abi_ulong) qemu_getauxval(AT_SECURE));
> >
> >  #ifdef ELF_HWCAP2
> >      NEW_AUX_ENT(AT_HWCAP2, (abi_ulong) ELF_HWCAP2);
> > --
>
> For the content, Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>
> thanks
> -- PMM
>



-- 
Marco A L Barbosa
http://malbarbo.pro.br
--

--001a113e5118682c86056284b6a2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks Peter,<br><br></div><div>Signed-off-by: Marco =
A L Barbosa &lt;<a href=3D"mailto:malbarbo@gmail.com">malbarbo@gmail.com</a=
>&gt;<br></div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Thu, Jan 11, 2018 at 4:52 PM, Peter Maydell <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:peter.maydell@linaro.org" target=3D"_blank">peter.maydell@l=
inaro.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span cl=
ass=3D"">On 11 January 2018 at 18:37, Marco A L Barbosa &lt;<a href=3D"mail=
to:malbarbo@gmail.com">malbarbo@gmail.com</a>&gt; wrote:<br>
&gt; ---<br>
&gt;=C2=A0 linux-user/elfload.c | 3 ++-<br>
&gt;=C2=A0 1 file changed, 2 insertions(+), 1 deletion(-)<br>
<br>
</span>This is missing your Signed-off-by: line, which we need to be<br>
able to accept the patch.<br>
<br>
(I&#39;ve also cc&#39;d the linux-user maintainers.)<br>
<span class=3D""><br>
&gt; diff --git a/linux-user/elfload.c b/linux-user/elfload.c<br>
&gt; index 20f3d8c2c3..32a47674e6 100644<br>
&gt; --- a/linux-user/elfload.c<br>
&gt; +++ b/linux-user/elfload.c<br>
&gt; @@ -1354,7 +1354,7 @@ struct exec<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0~(abi_ulong)(TARGET_=
ELF_EXEC_<wbr>PAGESIZE-1))<br>
&gt;=C2=A0 #define TARGET_ELF_PAGEOFFSET(_v) ((_v) &amp; (TARGET_ELF_EXEC_P=
AGESIZE-1))<br>
&gt;<br>
&gt; -#define DLINFO_ITEMS 14<br>
&gt; +#define DLINFO_ITEMS 15<br>
&gt;<br>
&gt;=C2=A0 static inline void memcpy_fromfs(void * to, const void * from, u=
nsigned long n)<br>
&gt;=C2=A0 {<br>
&gt; @@ -1786,6 +1786,7 @@ static abi_ulong create_elf_tables(abi_ulong p, =
int argc, int envc,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 NEW_AUX_ENT(AT_HWCAP, (abi_ulong) ELF_HWCAP);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 NEW_AUX_ENT(AT_CLKTCK, (abi_ulong) sysconf(_SC_CLK=
_TCK));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 NEW_AUX_ENT(AT_RANDOM, (abi_ulong) u_rand_bytes);<=
br>
&gt; +=C2=A0 =C2=A0 NEW_AUX_ENT(AT_SECURE, (abi_ulong) qemu_getauxval(AT_SE=
CURE));<br>
&gt;<br>
&gt;=C2=A0 #ifdef ELF_HWCAP2<br>
&gt;=C2=A0 =C2=A0 =C2=A0 NEW_AUX_ENT(AT_HWCAP2, (abi_ulong) ELF_HWCAP2);<br=
>
&gt; --<br>
<br>
</span>For the content, Reviewed-by: Peter Maydell &lt;<a href=3D"mailto:pe=
ter.maydell@linaro.org">peter.maydell@linaro.org</a>&gt;<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div><br><br clear=3D"all"><br>-- <br><div class=3D"gmail_sig=
nature" data-smartmail=3D"gmail_signature">Marco A L Barbosa<br><a href=3D"=
http://malbarbo.pro.br" target=3D"_blank">http://malbarbo.pro.br</a><br>--<=
/div>
</div>

--001a113e5118682c86056284b6a2--

